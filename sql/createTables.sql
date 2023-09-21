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
  resource_name VARCHAR(100) NOT NULL,
  author_name VARCHAR(30) NOT NULL,
  url VARCHAR(550) UNIQUE NOT NULL,
  description VARCHAR(550) NOT NULL,
  content_type VARCHAR(20) NOT NULL,
  build_phase INT,
  date_added TIMESTAMP DEFAULT now(),
  recommender_id INT NOT NULL,
  recommender_comment VARCHAR(100) NOT NULL,
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



