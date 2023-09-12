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