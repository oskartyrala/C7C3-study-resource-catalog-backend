DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS study_list;
DROP TABLE IF EXISTS resources;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  is_faculty BOOLEAN NOT NULL
  );

CREATE TABLE resources (
  id SERIAL PRIMARY KEY,
  resource_name VARCHAR(50) NOT NULL,
  author_name VARCHAR(30) NOT NULL,
  url VARCHAR(550) UNIQUE NOT NULL,
  description VARCHAR(550) NOT NULL,
  content_type VARCHAR(20) NOT NULL,
  build_phase INT,
  date_added TIMESTAMP DEFAULT now(),
  recommender_id INT NOT NULL,
  recommender_comment VARCHAR(50) NOT NULL,
  recommender_reason VARCHAR(550),
  likes_count INT DEFAULT 0,
  dislikes_count INT DEFAULT 0,
  FOREIGN KEY (recommender_id) REFERENCES users(id)
  );
  
CREATE TABLE study_list (
  user_id INT NOT NULL,
  resource_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (resource_id) REFERENCES resources(id)
);

CREATE TABLE tags (
  resource_id INT NOT NULL,
  tag VARCHAR(20) NOT NULL,
  FOREIGN KEY (resource_id) REFERENCES resources(id)
);	

INSERT INTO users (name, is_faculty) VALUES ('Beth', false);
INSERT INTO users (name, is_faculty) VALUES ('Tomasz', false);
INSERT INTO users (name, is_faculty) VALUES ('Oskar', false);
INSERT INTO users (name, is_faculty) VALUES ('Ana', false);
INSERT INTO users (name, is_faculty) VALUES ('Silviu', false);
INSERT INTO users (name, is_faculty) VALUES ('Julieta', false);
INSERT INTO users (name, is_faculty) VALUES ('Viki', false);
INSERT INTO users (name, is_faculty) VALUES ('Lucja', false);
INSERT INTO users (name, is_faculty) VALUES ('Dani', false);
INSERT INTO users (name, is_faculty) VALUES ('Tom', false);
INSERT INTO users (name, is_faculty) VALUES ('Rosie', false);
INSERT INTO users (name, is_faculty) VALUES ('Laura', false);
INSERT INTO users (name, is_faculty) VALUES ('Adil', false);
INSERT INTO users (name, is_faculty) VALUES ('Cynthia', false);
INSERT INTO users (name, is_faculty) VALUES ('Steph', false);
INSERT INTO users (name, is_faculty) VALUES ('HoKei', false);
INSERT INTO users (name, is_faculty) VALUES ('Henry', false);
INSERT INTO users (name, is_faculty) VALUES ('Carlton', false);

INSERT INTO users (name, is_faculty) VALUES ('Neill', true);
INSERT INTO users (name, is_faculty) VALUES ('Katie', true);
INSERT INTO users (name, is_faculty) VALUES ('Nico', true);
INSERT INTO users (name, is_faculty) VALUES ('Marta', true);
INSERT INTO users (name, is_faculty) VALUES ('Lauren', true);

INSERT INTO resources (resource_name, author_name, url, description, content_type, build_phase, recommender_id, recommender_comment, recommender_reason) 
VALUES ('useReducer video tutorial', 'Web Dev Simplified', 'https://www.youtube.com/watch?v=kK_Wqx3RnHk', 'In this video I cover everything you need to know about the useReducer hook. I go over all the main use cases for useReducer as well as many common mistakes that developers make. This is part of a series of React videos where I cover all the important hooks in React.', 
        'video', 12, 10, 'I recommend this resource after having used it.', 'This YTer has some nice tutorials on React and I found his useReducer one (with the article in description) helped me get to grips with it.');

INSERT INTO tags VALUES (1, 'React');

INSERT INTO study_list VALUES (1, 1);

SELECT name FROM users WHERE id = 1;

SELECT r.*, ARRAY_AGG(t.tag) AS tags FROM resources r INNER JOIN tags t ON r.id = t.resource_id GROUP BY r.id;

SELECT r.*, ARRAY_AGG(t.tag) AS tags, u.name AS recommender_name FROM resources r INNER JOIN tags t ON r.id = t.resource_id INNER JOIN 
users u ON r.recommender_id = u.id  GROUP BY r.id, u.name ORDER BY r.date_added DESC;

select r.*, ARRAY_AGG(t.tag) as tags, u.name as recommender_name from resources r inner join tags t on r.id = t.resource_id inner join 
users u on r.recommender_id = u.id  where r.id in (81, 86, 72) group by r.id, u.name order by r.date_added desc;

select r.*, ARRAY_AGG(t.tag) as tags, u.name as recommender_name from resources r inner join tags t on r.id = t.resource_id inner join 
users u on r.recommender_id = u.id inner join  study_list s on r.id = s.resource_id  where s.user_id = 1 
group by r.id, u.name order by r.date_added desc;