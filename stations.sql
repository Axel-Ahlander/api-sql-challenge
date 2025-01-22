CREATE TABLE stations (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  line_id INT,
  CONSTRAINT line_fk FOREIGN KEY(line_id) REFERENCES lines(id)
  )