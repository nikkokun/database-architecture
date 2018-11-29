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
VALUES ('hot', 8, 1, 1);
INSERT INTO keyword (word, r, g, b)
VALUES ('cool', 1, 1, 8);
INSERT INTO keyword (word, r, g, b)
VALUES ('natural', 1, 8, 1);
INSERT INTO keyword (word, r, g, b)
VALUES ('fresh', 0, 6, 4);
INSERT INTO keyword (word, r, g, b)
VALUES ('colorful', 3, 4, 4);


INSERT INTO media (mid, r, g, b)
VALUES ('http://mdbl-lecture.sfc.keio.ac.jp/lecture/images/sarthou1.gif', 1, 2, 7);
INSERT INTO media (mid, r, g, b)
VALUES ('http://mdbl-lecture.sfc.keio.ac.jp/lecture/images/hokusai4.gif', 4, 4, 2);
INSERT INTO media (mid, r, g, b)
VALUES ('http://mdbl-lecture.sfc.keio.ac.jp/lecture/images/gogh2.gif', 2, 5, 3);
INSERT INTO media (mid, r, g, b)
VALUES ('http://mdbl-lecture.sfc.keio.ac.jp/lecture/images/renoir2.gif', 1, 5, 4);
INSERT INTO media (mid, r, g, b)
VALUES ('http://mdbl-lecture.sfc.keio.ac.jp/lecture/images/renoir1.gif', 4, 4, 2);

DROP FUNCTION IF EXISTS inner_product(int4, int4, int4, int4, int4, int4);
CREATE FUNCTION inner_product(int4, int4, int4, int4, int4, int4)
RETURNS int4 AS
  'SELECT $1 * $4 + $2 * $5 + $3 * $6 AS inner_product;'
LANGUAGE 'sql';

