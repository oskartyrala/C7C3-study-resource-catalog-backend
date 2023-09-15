import cors from "cors";
import dotenv from "dotenv";
import express from "express";
import { Client } from "pg";
import { getEnvVarOrFail } from "./support/envVarUtils";
import { setupDBClientConfig } from "./support/setupDBClientConfig";

dotenv.config(); //Read .env file lines as though they were env vars.

const dbClientConfig = setupDBClientConfig();
const client = new Client(dbClientConfig);

//Configure express routes
const app = express();

app.use(express.json()); //add JSON body parser to each following route handler
app.use(cors()); //add CORS support to each following route handler

app.get("/", async (_req, res) => {
    res.json({ msg: "Hello! There's nothing interesting for GET /" });
});

app.get("/health-check", async (_req, res) => {
    try {
        //For this to be successful, must connect to db
        await client.query("select now()");
        res.status(200).send("system ok");
    } catch (error) {
        //Recover from error rather than letting system halt
        console.error(error);
        res.status(500).send("An error occurred. Check server logs.");
    }
});

app.get("/resources", async (_req, res) => {
    try {
        const text =
            "SELECT r.*, ARRAY_AGG(t.tag) AS tags, u.name AS recommender_name FROM resources r INNER JOIN tags t ON r.id = t.resource_id INNER JOIN users u ON r.recommender_id = u.id  GROUP BY r.id, u.name ORDER BY r.date_added DESC";
        const result = await client.query(text);
        res.status(200).json(result.rows);
    } catch (error) {
        console.error(error);
        res.status(500).send("An error occurred. Check server logs.");
    }
});

app.get("/users", async (_req, res) => {
    try {
        const text = "SELECT * FROM users";
        const result = await client.query(text);
        res.status(200).json(result.rows);
    } catch (error) {
        console.error(error);
        res.status(500).send("An error occurred. Check server logs.");
    }
});

app.get("/tags", async (_req, res) => {
    try {
        const text = "SELECT tag FROM tags GROUP BY tag ORDER BY COUNT(*) DESC";
        const result = await client.query(text);
        res.status(200).json(result.rows);
    } catch (error) {
        console.error(error);
        res.status(500).send("An error occurred. Check server logs.");
    }
});

app.get("/tags/:resource_id", async (req, res) => {
    try {
        const { resource_id } = req.params;
        const text = "SELECT * FROM tags WHERE resource_id = $1";
        const values = [resource_id];
        const result = await client.query(text, values);
        res.status(200).json(result.rows);
    } catch (error) {
        console.error(error);
        res.status(500).send("An error occurred. Check server logs.");
    }
});

app.get("/study_list/:userid", async (req, res) => {
    try {
        const { userid } = req.params;
        const text =
            "select r.*, ARRAY_AGG(t.tag) as tags, u.name as recommender_name from resources r inner join tags t on r.id = t.resource_id inner join users u on r.recommender_id = u.id inner join study_list s on r.id = s.resource_id  where s.user_id = $1 group by r.id, u.name order by r.date_added desc;";
        const values = [userid];
        const result = await client.query(text, values);
        res.status(200).json(result.rows);
    } catch (error) {
        console.error(error);
        res.status(500).send("An error occurred. Check server logs.");
    }
});

app.put("/resources/like/:resourceid", async (req, res) => {
    try {
        const { resourceid } = req.params;
        const text =
            "UPDATE resources SET likes_count = likes_count + 1 WHERE id = $1 RETURNING *";
        const values = [resourceid];
        const result = await client.query(text, values);
        res.status(200).json(result.rows);
    } catch (error) {
        console.error(error);
        res.status(500).send("An error occurred. Check server logs.");
    }
});

app.put("/resources/dislike/:resourceid", async (req, res) => {
    try {
        const { resourceid } = req.params;
        const text =
            "UPDATE resources SET dislikes_count = dislikes_count + 1 WHERE id = $1 RETURNING *";
        const values = [resourceid];
        const result = await client.query(text, values);
        res.status(200).json(result.rows);
    } catch (error) {
        console.error(error);
        res.status(500).send("An error occurred. Check server logs.");
    }
});

app.post("/resources/new", async (req, res) => {
    try {
        const {
            resource_name,
            author_name,
            url,
            description,
            content_type,
            build_phase,
            recommender_id,
            recommender_comment,
            recommender_reason,
        } = req.body;
        const resourceText =
            "INSERT INTO resources (resource_name, author_name, url, description, content_type, build_phase, recommender_id, recommender_comment, recommender_reason) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING *";
        const resourceValues = [
            resource_name,
            author_name,
            url,
            description,
            content_type,
            build_phase,
            recommender_id,
            recommender_comment,
            recommender_reason,
        ];
        const result = await client.query(resourceText, resourceValues);

        // Add provided tags for the newly created resource:
        const resourceid = result.rows[0].id;
        const { tags } = req.body;
        const tagArray = tags.replace(" ", "").split(",");

        for (const tag of tagArray) {
            const tagsText = "INSERT INTO tags VALUES ($1, $2)";
            const tagsValues = [resourceid, tag];
            await client.query(tagsText, tagsValues);
        }

        res.status(200).json(result.rows);
    } catch (error) {
        console.error(error);
        // res.status(500).send("An error occurred. Check server logs.");
        res.status(500).json(error);
    }
});

app.post("/study_list/:userid/:resourceid", async (req, res) => {
    try {
        const { userid, resourceid } = req.params;
        const text = "INSERT INTO study_list VALUES ($1, $2) RETURNING *";
        const values = [userid, resourceid];
        const result = await client.query(text, values);
        res.status(200).json(result.rows);
    } catch (error) {
        console.error(error);
        res.status(500).send("An error occurred. Check server logs.");
    }
});

app.delete("/study_list/:userid/:resourceid", async (req, res) => {
    try {
        const { userid, resourceid } = req.params;
        const text =
            "DELETE FROM study_list WHERE user_id = $1 AND resource_id = $2 RETURNING *";
        const values = [userid, resourceid];
        const result = await client.query(text, values);
        res.status(200).json(result.rows);
    } catch (error) {
        console.error(error);
        res.status(500).send("An error occurred. Check server logs.");
    }
});

app.get("/user/:userid", async (req, res) => {
    try {
        const { userid } = req.params;
        const text = "SELECT name FROM users WHERE id = $1";
        const values = [userid];
        const result = await client.query(text, values);
        res.status(200).json(result.rows);
    } catch (error) {
        console.error(error);
        res.status(500).send("An error occurred. Check server logs.");
    }
});

app.delete("/resources/cypress", async (_req, res) => {
    try {
        const url =
            "https://docs.cypress.io/guides/end-to-end-testing/writing-your-first-end-to-end-test";
        const resource_id = await client.query(
            "select id from resources where url = $1",
            [url]
        );
        await client.query("delete from tags where resource_id = $1", [
            resource_id.rows[0].id,
        ]);
        const text = "DELETE FROM resources WHERE url = $1";
        const values = [url];
        const result = await client.query(text, values);
        res.status(200).json(result.rows);
    } catch (error) {
        console.error(error);
        res.status(500).send("An error occurred. Check server logs.");
    }
});

connectToDBAndStartListening();

async function connectToDBAndStartListening() {
    console.log("Attempting to connect to db");
    await client.connect();
    console.log("Connected to db!");

    const port = getEnvVarOrFail("PORT");
    app.listen(port, () => {
        console.log(
            `Server started listening for HTTP requests on port ${port}.  Let's go!`
        );
    });
}
