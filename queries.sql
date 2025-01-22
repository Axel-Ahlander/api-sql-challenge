
--inserting into line 
INSERT INTO lines (name)
VALUES ('Bakerloo Line')

--Inserting stations - same for all of them
INSERT INTO stations (name, line_id)
VALUES ('Harrow & Wealdstone', 2)

--Adding services
INSERT INTO services (title, station_id)
VALUES ('Network Rail', 25)

--Set Maida Vale to be closed ----- I Assume that if you are part of the services you are closed because there is maintanance ongoing ----
INSERT INTO services (title, station_id)
VALUES ('Maida Vale Closed', 12)

--All open stations
SELECT lines.name, stations.name FROM lines
INNER JOIN stations ON stations.line_id = lines.id
LEFT JOIN services ON stations.id = services.station_id
WHERE services.station_id IS NULL

--Closed stations from Marylebone to Piccadilly Circus
SELECT lines.name, stations.name FROM lines
INNER JOIN stations ON stations.line_id = lines.id
INNER JOIN services ON services.station_id = stations.id
WHERE stations.id >= 16 AND stations.id <= 20

--Stations with railroad services 
SELECT lines.name, stations.name FROM lines
INNER JOIN stations ON stations.line_id = lines.id
INNER JOIN services ON services.station_id = stations.id
WHERE services.title = 'Network Rail'

--From Lambeth North to Kensal Green
SELECT lines.name, stations.name FROM lines
INNER JOIN stations ON stations.line_id = lines.id
WHERE stations.id > 9 AND stations.id < 24
ORDER BY stations.id DESC



--Function to add zone to Name
CREATE OR REPLACE FUNCTION zonez(nam VARCHAR)
RETURNS VARCHAR AS $$
DECLARE
    zone INT; 
BEGIN
    SELECT stations.zone INTO zone
    FROM stations
    WHERE name = nam;
    RETURN nam || ' (ZONE ' || zone || ')';
END;
$$ LANGUAGE plpgsql;