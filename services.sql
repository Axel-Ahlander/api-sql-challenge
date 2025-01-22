
CREATE TABLE services (
id SERIAL PRIMARY KEY,
title VARCHAR(255),
station_id INT,
CONSTRAINT station_fk FOREIGN KEY(station_id) REFERENCES stations(id)
  )
