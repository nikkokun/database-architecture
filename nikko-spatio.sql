CREATE OR REPLACE FUNCTION gis_distance(point, point) RETURNS double PRECISION AS $BODY$
SELECT 2 * R * ASIN(d / 2 / R)
FROM
  ( SELECT SQRT((x1 - x2)^2 + (y1 - y2)^2 + (z1 - z2)^2) AS d,
           R
   FROM
     ( SELECT c.R ,
              c.R * COS(pi() * l1.lat/180) * COS(pi() * l1.lng/180) AS x1 ,
              c.R * COS(pi() * l1.lat/180) * SIN(pi() * l1.lng/180) AS y1 ,
              c.R * SIN(pi() * l1.lat/180) AS z1 ,
              c.R * COS(pi() * l2.lat/180) * COS(pi() * l2.lng/180) AS x2 ,
              c.R * COS(pi() * l2.lat/180) * SIN(pi() * l2.lng/180) AS y2 ,
              c.R * SIN(pi() * l2.lat/180) AS z2
      FROM
        (SELECT $1[0] AS lat, $1[1] AS lng) AS l1 ,

        (SELECT $2[0] AS lat, $2[1] AS lng) AS l2 ,

        (SELECT 6378.137 AS R) AS c ) trig) sq $BODY$ LANGUAGE SQL;

DROP table if exists Wards;
DROP table if exists WardHold;
DROP table if exists Establishments;
DROP table if exists ItemHold;
DROP table if exists Items;

CREATE TABLE Wards(
  wname           varchar(40),
  wlocation       point,
  population      int,
  area            float,
  density         int,
  rating          int
);

CREATE TABLE WardHold(
  ename           varchar(40),
  wname           varchar(40)
);

CREATE TABLE Establishments(
  ename               varchar(40),
  elocation           point,
  opening_time        time(2),
  closing_time        time(2),
  rating              int,
  average_price       int,
  establishment_type  varchar(40)
);

CREATE TABLE ItemHold(
  h_establishment_type    varchar(40),
  h_item_name           varchar(40)
);

CREATE TABLE Items(
  item_name             varchar(40),
  average_price         int
);

-- ===========================
-- ward tuples
-- ===========================
-- Shibuya
INSERT INTO Wards(wname, wlocation, population, area, density, rating)
VALUES('Shibuya', '(35.659212, 139.700050)', 221801, 15.11, 15080, 4);
-- Shinjuku
INSERT INTO Wards(wname, wlocation, population, area, density, rating)
VALUES('Shinjuku', '(35.689940, 139.701106)', 337556, 18.23, 18620, 4);
-- Setagaya
INSERT INTO Wards(wname, wlocation, population, area, density, rating)
VALUES('Setagaya', '(35.648361, 139.625906)', 910868, 58.05, 15690, 2);
-- Minato
INSERT INTO Wards(wname, wlocation, population, area, density, rating)
VALUES('Minato', '(35.663321, 139.731116)', 248071, 20.37, 12180, 3);
-- Taito
INSERT INTO Wards(wname, wlocation, population, area, density, rating)
VALUES('Taito', '(35.7215718, 139.7589422)', 200486, 10.11, 19830, 3);
-- Chuo
INSERT INTO Wards(wname, wlocation, population, area, density, rating)
VALUES('Chuo', '(35.6703904, 139.7583362)', 147620, 10.21, 14460, 3);
-- Chiyoda
INSERT INTO Wards(wname, wlocation, population, area, density, rating)
VALUES('Chiyoda', '(35.6868793, 139.7388539)', 59441, 11.66, 5100, 3);
-- Meguro
INSERT INTO Wards(wname, wlocation, population, area, density, rating)
VALUES('Meguro', '(35.6323599, 139.6721631)', 280283, 14.67, 19110, 3);
-- Nerima
INSERT INTO Wards(wname, wlocation, population, area, density, rating)
VALUES('Nerima', '(35.7458335, 139.587001)', 726748, 48.08, 15120, 1);
-- Ota
INSERT INTO Wards(wname, wlocation, population, area, density, rating)
VALUES('Ota', '(35.5669582, 139.6692954)', 722608, 60.66, 11910, 1);

-- ===========================
-- ward hold tuples
-- ===========================
INSERT INTO WardHold(ename, wname)
VALUES('Blue Bottle Coffee, Aoyama Cafe', 'Shibuya');
INSERT INTO WardHold(ename, wname)
VALUES('Brasserie VIRON Shibuya', 'Shibuya');
INSERT INTO WardHold(ename, wname)
VALUES('Onitsuka Tiger Shinjuku', 'Shinjuku');
INSERT INTO WardHold(ename, wname)
VALUES('Village Vanguard Shimokitazawa', 'Setagaya');
INSERT INTO WardHold(ename, wname)
VALUES('Tokyu Hands Ginza Store', 'Chuo');
INSERT INTO WardHold(ename, wname)
VALUES('Yodobashi Camera AKIBA', 'Taito');
INSERT INTO WardHold(ename, wname)
VALUES('Maison Kayser', 'Minato');

-- ===========================
-- establishment tuples
-- ===========================
INSERT INTO Establishments(ename, elocation, opening_time, closing_time, rating, average_price, establishment_type)
VALUES('The Roastery by Nozy Coffee', '(35.6655724,139.7047658)', '10:00:00', '22:00:00', 9, 800, 'cafe');

INSERT INTO Establishments(ename, elocation, opening_time, closing_time, rating_, average_price, establishment_type)
VALUES('Brasserie VIRON Shibuya', '(35.6608958, 139.6946324)', '09:00:00', '17:00:00', 7, 800, 'cafe');

INSERT INTO Establishments(ename, elocation, opening_time, closing_time, rating, average_price, establishment_type)
VALUES('Onitsuka Tiger Shinjuku', '(35.6882889,139.7026154)', '11:00:00', '21:00:00', 7, 8000, 'apparel');

INSERT INTO Establishments(ename, elocation, opening_time, closing_time, rating, average_price, establishment_type)
VALUES('Village Vanguard Shimokitazawa', '(35.6615617, 139.6686687)', '10:00:00', '23:00:00', 8, 2000, 'book store');

INSERT INTO Establishments(ename, elocation, opening_time, closing_time, rating, average_price, establishment_type)
VALUES('Tokyu Hands Ginza Store', '(35.6743084, 139.765344)', '11:00:00', '21:00:00', 5, 200, 'stationery');

INSERT INTO Establishments(ename, elocation, opening_time, closing_time, rating, average_price, establishment_type)
VALUES('Yodobashi Camera AKIBA', '(35.6987131, 139.7747612)', '09:30:00', '22:00:00', 7, 2000, 'electronics');

INSERT INTO Establishments(ename, elocation, opening_time, closing_time, rating, average_price, establishment_type)
VALUES('Maison Kayser', '(35.6661719, 139.7303723)', '11:00:00', '21:00:00', 5, 200, 'bakery');

-- ===========================
-- item hold tuples
-- ===========================
INSERT INTO ItemHold(h_establishment_type, h_item_name)
VALUES('cafe', 'coffee');
INSERT INTO ItemHold(h_establishment_type, h_item_name)
VALUES('restaurant', 'coffee');
INSERT INTO ItemHold(h_establishment_type, h_item_name)
VALUES('cafe', 'cake');
INSERT INTO ItemHold(h_establishment_type, h_item_name)
VALUES('restaurant', 'cake');
INSERT INTO ItemHold(h_establishment_type, h_item_name)
VALUES('apparel', 'shoes');
INSERT INTO ItemHold(h_establishment_type, h_item_name)
VALUES('book store', 'book');
INSERT INTO ItemHold(h_establishment_type, h_item_name)
VALUES('stationery', 'pen');
INSERT INTO ItemHold(h_establishment_type, h_item_name)
VALUES('electronics', 'charger');
INSERT INTO ItemHold(h_establishment_type, h_item_name)
VALUES('bakery', 'bread');
-- ===========================
-- item tuples
-- ===========================
INSERT INTO Items(item_name, average_price)
VALUES('coffee', 500);

INSERT INTO Items(item_name, average_price)
VALUES('cake', 500);

INSERT INTO Items(item_name, average_price)
VALUES('shoes', 6000);

INSERT INTO Items(item_name, average_price)
VALUES('book', 2000);

INSERT INTO Items(item_name, average_price)
VALUES('pen', 200);

INSERT INTO Items(item_name, average_price)
VALUES('charger', 1500);

INSERT INTO Items(item_name, average_price)
VALUES('bread', 150);