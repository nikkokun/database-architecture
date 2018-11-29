DROP TABLE IF EXISTS media;
CREATE TABLE media (
       mid text,
       r     real,
       g     real,
       b     real
);


DROP TABLE IF EXISTS keyword;
CREATE TABLE keyword (
       word text,
       r     real,
       g     real,
       b     real
);

INSERT INTO keyword (word, r, g, b)
VALUES ('hot', 8.5, 1.0, 1.0);
INSERT INTO keyword (word, r, g, b)
VALUES ('cool', 1.0, 1.0, 8.0);
INSERT INTO keyword (word, r, g, b)
VALUES ('natural', 1.0, 8.0, 1.0);
INSERT INTO keyword (word, r, g, b)
VALUES ('fresh', 0.0, 6.0, 4.0);
INSERT INTO keyword (word, r, g, b)
VALUES ('colorful', 3.0, 4.0, 4.0);


INSERT INTO media (mid, r, g, b)
VALUES ('http://mdbl-lecture.sfc.keio.ac.jp/lecture/images/sarthou1.gif', 1.0, 2.0, 7.0);
INSERT INTO media (mid, r, g, b)
VALUES ('http://mdbl-lecture.sfc.keio.ac.jp/lecture/images/hokusai4.gif', 4.0, 4.0, 2.0);
INSERT INTO media (mid, r, g, b)
VALUES ('http://mdbl-lecture.sfc.keio.ac.jp/lecture/images/gogh2.gif', 2.0, 5.0, 3.0);
INSERT INTO media (mid, r, g, b)
VALUES ('http://mdbl-lecture.sfc.keio.ac.jp/lecture/images/renoir2.gif', 1.0, 5.0, 4.0);
INSERT INTO media (mid, r, g, b)
VALUES ('http://mdbl-lecture.sfc.keio.ac.jp/lecture/images/renoir1.gif', 4.0, 4.0, 2.0);

DROP FUNCTION IF EXISTS inner_product(float, float, float, float, float, float);
CREATE FUNCTION inner_product(float, float, float, float, float, float)
RETURNS float AS
  'SELECT $1 * $4 + $2 * $5 + $3 * $6 AS inner_product;'
LANGUAGE 'sql';

