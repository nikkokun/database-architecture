DROP TABLE IF EXISTS river;
DROP TABLE IF EXISTS country;
DROP TABLE IF EXISTS mount;
DROP TABLE IF EXISTS rhold;
DROP TABLE IF EXISTS mhold;
DROP TABLE IF EXISTS slaves;

CREATE TABLE river (
    rname         varchar(20),
    outflow       varchar(30),
    len           int4,
    basin         int4,
    rate          int4
);

CREATE TABLE country (
    cname         varchar(20),
    capital       varchar(20),
    population    int4,
    gdp           int4,
    bod           real,
    fell          int4,
    increase      int4
);

CREATE TABLE mount (
    mname         varchar(20),
    msystem       varchar(30),
    elevation     int4,
    ascent        int4
);

CREATE TABLE rhold (
    rname         varchar(20),
    cname         varchar(20)
);

CREATE TABLE mhold (
    mname         varchar(20),
    cname         varchar(20)
);

CREATE TABLE gladiator(
	gladiatorname		varchar(20), -- gladiator's name
	mastername			varchar(20), -- master's name
	ismale				int4, --1 for male, 0 for female
	productivity		int4, -- productivity rated from 0 - 10
	endurance			int4, -- how long can he/she overwork from 0 - 10
	health				int4 -- health left, 0 - 100. when health is 0, gladiator should be deleted
);

INSERT INTO gladiator(gladiatorname, mastername, ismale, productivity, endurance, health)
VALUES ('Charles', 'Nikko', 1, 7, 6, 100);

INSERT INTO gladiator(gladiatorname, mastername, ismale, productivity, endurance, health)
VALUES ('Anthony', 'Nikko', 1, 8, 3, 100);

INSERT INTO gladiator(gladiatorname, mastername, ismale, productivity, endurance, health)
VALUES ('Homer', 'Nikko', 1, 3, 3, 100);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Rhine', 'North Sea', 1320, 252, 2490);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Elbe', 'North Sea', 1160, 144, 703);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Loire', 'B of Biscay', 1020, 120, 871);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Tagus', 'Atlantic O', 1010, 81, 128);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Meuse', 'North Sea', 950, 49, 269);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Oder-Warta', 'Baltic Sea', 950, 119, 560);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Ebro', 'Mediterranean Sea', 910, 85, 173);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Douro', 'Atlantic O', 890, 98, 312);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Rhone', 'Mediterranean Sea', 810, 99, 1500);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Guadiana', 'G of Cadiz of Atlantic O', 780, 68, 91);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Seine', 'English Channel', 780, 79, 272);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Weser-Werra', 'North Sea', 730, 46, 334);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Guadalquivir', 'G of Cadiz of Atlantic O', 660, 57, 182);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Gironde-Garonne', 'B of Biscay', 650, 85, 590);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Po', 'Adriatic Sea', 620, 75, 1540);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Havel-Spree', 'Elbe R', 550, 24, 90);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Moselle', 'Rhine R', 550, 28, 292);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Main', 'Rhine R', 520, 27, 100);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Marne', 'Seine R', 520, 14, 98);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Inn', 'Danube R', 510, 26, 735);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Jucar', 'Mediterranean Sea', 500, 21, 60);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Maritsa', 'Aegean Sea', 490, 35, null);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Lot', 'Garonne R', 480, 10, 128);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Saone', 'Rhone R', 480, 30, 424);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Dordogne', 'Garonne R', 470, 23, 286);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Saale', 'Elbe R', 430, 24, 105);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Scheldt', 'North Sea', 430, 20, 155);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Vardar', 'G of Salonika of Aegean Sea', 420, 28, 135);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Adige', 'Adriatic Sea', 410, 15, 262);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Tiber', 'Tyrrhenian Sea', 410, 17, 239);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Shannon', 'Atlantic O', 370, 16, 198);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Severn', 'Bristol Channel', 340, 21, 62);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Humber-Trent', 'North Sea', 330, 23, 198);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Segura', 'Mediterranean Sea', 320, 16, 6);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Thames', 'North Sea', 320, 16, 67);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Mino', 'Atlantic O', 310, 18, 276);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Aare', 'Rhine R', 290, 18, 552);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Arno', 'Ligurian Sea', 240, 8, 140);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Tay', 'North Sea', 190, 6, 156);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Gudena', 'Kattegat', 160, 3, 16);

INSERT INTO river(rname, outflow, len, basin, rate)
VALUES ('Danube', 'Black Sea', 2860, 816, 6250);


INSERT INTO country(cname, capital, population, gdp, bod, fell, increase)
VALUES ('England', 'London', 56352, 1024460, 3.0, 6800, 15000);

INSERT INTO country(cname, capital, population, gdp, bod, fell, increase)
VALUES ('Ireland', 'Dublin', 3526, 47374, 1.5, 953, 2710);

INSERT INTO country(cname, capital, population, gdp, bod, fell, increase)
VALUES ('Portugal', 'Lisbon', 9854, 84022, 3.1, 13515, 12131);

INSERT INTO country(cname, capital, population, gdp, bod, fell, increase)
VALUES ('Spain', 'Madrid', 39434, 478579, 6.2, 11529, 24000);

INSERT INTO country(cname, capital, population, gdp, bod, fell, increase)
VALUES ('France', 'Paris', 56634, 1250671, 4.4, 54500, 76500);

INSERT INTO country(cname, capital, population, gdp, bod, fell, increase)
VALUES ('Belgium', 'Brussels', 9849, 210105, 3.2, 2800, 5000);

INSERT INTO country(cname, capital, population, gdp, bod, fell, increase)
VALUES ('Netherlands', 'Amsterdam', 13060, 309212, 2.0, 1300, 2500);

INSERT INTO country(cname, capital, population, gdp, bod, fell, increase)
VALUES ('Italy', 'Rome', 59104, 985067, 4.2, 9383, 11667);

INSERT INTO country(cname, capital, population, gdp, bod, fell, increase)
VALUES ('Denmark', 'Copenhagen', 5124, 134670, 3.5, 2018, 2851);

INSERT INTO country(cname, capital, population, gdp, bod, fell, increase)
VALUES ('Germany', 'Berlin', 81187, 1834915, 3.8, 75021, 42000);

INSERT INTO country(cname, capital, population, gdp, bod, fell, increase)
VALUES ('Austria', 'Vienna', 7555, 182067, 4.0, 18852, 24000);

INSERT INTO country(cname, capital, population, gdp, bod, fell, increase)
VALUES ('Switzerland', 'Bern', 6874, 232133, null, 6300, 6200);

INSERT INTO country(cname, capital, population, gdp, bod, fell, increase)
VALUES ('Greece', 'Athens', 10269, 73110, null, 2320, 5278);

INSERT INTO country(cname, capital, population, gdp, bod, fell, increase)
VALUES ('Nikkolandia', 'Nikkotopia', 100000, 1000000000, null, 10000, 1000);


INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Blanc', 'Alps', 4810, 1786);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Dufour', 'Alps', 4630, 1855);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Grenz', 'Alps', 4630, 1851);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Nordend', 'Alps', 4610, 1861);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Zumstein', 'Alps', 4570, 1820);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Signal', 'Alps', 4560, 1842);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Dom', 'Alps', 4540, 1858);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Lyskamm', 'Alps', 4540, 1861);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Weiss', 'Alps', 4500, 1861);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Tasch', 'Alps', 4490, 1862);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Matter', 'Alps', 4480, 1865);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Maudit', 'Alps', 4470, 1878);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Blanche', 'Alps', 4360, 1862);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Finsteraar', 'Alps', 4270, 1812);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Aletsch', 'Alps', 4190, 1859);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Jungfrau', 'Alps', 4160, 1811);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Monch', 'Alps', 4100, 1857);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Eiger', 'Alps', 3970, 1858);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Grossglockner', 'Alps', 3800, 1800);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Mulhacen', 'Nevada', 3480, 1840);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Aneto', 'Pyrenees', 3400, 1842);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Etna', null, 3280, null);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Zug', 'Alps', 2960, 1820);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Mytikas', 'Olympus', 2920, 1913);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Corno Grande', 'Apennines', 2910, 1794);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Cinto', null, 2710, null);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Cerredo', 'Cantabrian', 2650, 1892);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Parnassus', null, 2460, null);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Ponta do Pico', null, 2350, null);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Estrela', 'Estrela', 1990, null);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Sancy', 'Auvergne', 1890, null);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Nevis', 'Grampian', 1340, null);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Vesuvius', null, 1280, null);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Fichtel', 'Erz', 1210, null);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Carrantuohill', 'Macgillicuddys Reeks', 1040, null);

INSERT INTO mount(mname, msystem, elevation, ascent)
VALUES ('Stromboli', null, 930, null);


INSERT INTO rhold(rname, cname)
VALUES('Rhine', 'Netherlands');

INSERT INTO rhold(rname, cname)
VALUES('Elbe', 'Germany');

INSERT INTO rhold(rname, cname)
VALUES('Loire', 'France');

INSERT INTO rhold(rname, cname)
VALUES('Tagus', 'Portugal');

INSERT INTO rhold(rname, cname)
VALUES('Meuse', 'Netherlands');

INSERT INTO rhold(rname, cname)
VALUES('Meuse', 'Belgium');

INSERT INTO rhold(rname, cname)
VALUES('Oder-Warta', 'Germany');

INSERT INTO rhold(rname, cname)
VALUES('Ebro', 'Spain');

INSERT INTO rhold(rname, cname)
VALUES('Douro', 'Portugal');

INSERT INTO rhold(rname, cname)
VALUES('Rhone', 'France');

INSERT INTO rhold(rname, cname)
VALUES('Guadiana', 'Spain');

INSERT INTO rhold(rname, cname)
VALUES('Guadiana', 'Portugal');

INSERT INTO rhold(rname, cname)
VALUES('Seine', 'France');

INSERT INTO rhold(rname, cname)
VALUES('Weser-Werra', 'Germany');

INSERT INTO rhold(rname, cname)
VALUES('Guadalquivir', 'Spain');

INSERT INTO rhold(rname, cname)
VALUES('Gironde-Garonne', 'France');

INSERT INTO rhold(rname, cname)
VALUES('Po', 'Italy');

INSERT INTO rhold(rname, cname)
VALUES('Havel-Spree', 'Germany');

INSERT INTO rhold(rname, cname)
VALUES('Moselle', 'Germany');

INSERT INTO rhold(rname, cname)
VALUES('Main', 'Germany');

INSERT INTO rhold(rname, cname)
VALUES('Marne', 'France');

INSERT INTO rhold(rname, cname)
VALUES('Inn', 'Germany');

INSERT INTO rhold(rname, cname)
VALUES('Jucar', 'Spain');

INSERT INTO rhold(rname, cname)
VALUES('Maritsa', 'Greece');

INSERT INTO rhold(rname, cname)
VALUES('Lot', 'France');

INSERT INTO rhold(rname, cname)
VALUES('Saone', 'France');

INSERT INTO rhold(rname, cname)
VALUES('Dordogne', 'France');

INSERT INTO rhold(rname, cname)
VALUES('Saale', 'Germany');

INSERT INTO rhold(rname, cname)
VALUES('Scheldt', 'Netherlands');

INSERT INTO rhold(rname, cname)
VALUES('Vardar', 'Greece');

INSERT INTO rhold(rname, cname)
VALUES('Adige', 'Italy');

INSERT INTO rhold(rname, cname)
VALUES('Tiber', 'Italy');

INSERT INTO rhold(rname, cname)
VALUES('Shannon', 'Ireland');

INSERT INTO rhold(rname, cname)
VALUES('Severn', 'England');

INSERT INTO rhold(rname, cname)
VALUES('Humber-Trent', 'England');

INSERT INTO rhold(rname, cname)
VALUES('Segura', 'Spain');

INSERT INTO rhold(rname, cname)
VALUES('Thames', 'England');

INSERT INTO rhold(rname, cname)
VALUES('Mino', 'Portugal');

INSERT INTO rhold(rname, cname)
VALUES('Mino', 'Spain');

INSERT INTO rhold(rname, cname)
VALUES('Aare', 'Switzerland');

INSERT INTO rhold(rname, cname)
VALUES('Arno', 'Italy');

INSERT INTO rhold(rname, cname)
VALUES('Tay', 'England');

INSERT INTO rhold(rname, cname)
VALUES('Gudena', 'Denmark');

INSERT INTO rhold(rname, cname)
VALUES('Danube', 'Austria');


INSERT INTO mhold(mname, cname)
VALUES('Blanc', 'France');

INSERT INTO mhold(mname, cname)
VALUES('Blanc', 'Italy');

INSERT INTO mhold(mname, cname)
VALUES('Dufour', 'Italy');

INSERT INTO mhold(mname, cname)
VALUES('Dufour', 'Switzerland');

INSERT INTO mhold(mname, cname)
VALUES('Grenz', 'Italy');

INSERT INTO mhold(mname, cname)
VALUES('Grenz', 'Switzerland');

INSERT INTO mhold(mname, cname)
VALUES('Nordend', 'Italy');

INSERT INTO mhold(mname, cname)
VALUES('Nordend', 'Switzerland');

INSERT INTO mhold(mname, cname)
VALUES('Zumstein', 'Italy');

INSERT INTO mhold(mname, cname)
VALUES('Zumstein', 'Switzerland');

INSERT INTO mhold(mname, cname)
VALUES('Signal', 'Italy');

INSERT INTO mhold(mname, cname)
VALUES('Signal', 'Switzerland');

INSERT INTO mhold(mname, cname)
VALUES('Dom', 'Switzerland');

INSERT INTO mhold(mname, cname)
VALUES('Lyskamm', 'Italy');

INSERT INTO mhold(mname, cname)
VALUES('Lyskamm', 'Switzerland');

INSERT INTO mhold(mname, cname)
VALUES('Weiss', 'Switzerland');

INSERT INTO mhold(mname, cname)
VALUES('Tasch', 'Switzerland');

INSERT INTO mhold(mname, cname)
VALUES('Matter', 'Italy');

INSERT INTO mhold(mname, cname)
VALUES('Matter', 'Switzerland');

INSERT INTO mhold(mname, cname)
VALUES('Maudit', 'France');

INSERT INTO mhold(mname, cname)
VALUES('Maudit', 'Italy');

INSERT INTO mhold(mname, cname)
VALUES('Blanche', 'Switzerland');

INSERT INTO mhold(mname, cname)
VALUES('Finsteraar', 'Switzerland');

INSERT INTO mhold(mname, cname)
VALUES('Aletsch', 'Switzerland');

INSERT INTO mhold(mname, cname)
VALUES('Jungfrau', 'Switzerland');

INSERT INTO mhold(mname, cname)
VALUES('Monch', 'Switzerland');

INSERT INTO mhold(mname, cname)
VALUES('Eiger', 'Switzerland');

INSERT INTO mhold(mname, cname)
VALUES('Grossglockner', 'Austria');

INSERT INTO mhold(mname, cname)
VALUES('Mulhacen', 'Spain');

INSERT INTO mhold(mname, cname)
VALUES('Aneto', 'Spain');

INSERT INTO mhold(mname, cname)
VALUES('Etna', 'Italy');

INSERT INTO mhold(mname, cname)
VALUES('Zug', 'Austria');

INSERT INTO mhold(mname, cname)
VALUES('Zug', 'Germany');

INSERT INTO mhold(mname, cname)
VALUES('Mytikas', 'Greece');

INSERT INTO mhold(mname, cname)
VALUES('Corno Grande', 'Italy');

INSERT INTO mhold(mname, cname)
VALUES('Cinto', 'France');

INSERT INTO mhold(mname, cname)
VALUES('Cerredo', 'Spain');

INSERT INTO mhold(mname, cname)
VALUES('Parnassus', 'Greece');

INSERT INTO mhold(mname, cname)
VALUES('Ponta do Pico', 'Portugal');

INSERT INTO mhold(mname, cname)
VALUES('Estrela', 'Portugal');

INSERT INTO mhold(mname, cname)
VALUES('Sancy', 'France');

INSERT INTO mhold(mname, cname)
VALUES('Nevis', 'England');

INSERT INTO mhold(mname, cname)
VALUES('Vesuvius', 'Italy');

INSERT INTO mhold(mname, cname)
VALUES('Fichtel', 'Germany');

INSERT INTO mhold(mname, cname)
VALUES('Carrantuohill', 'Ireland');

INSERT INTO mhold(mname, cname)
VALUES('Stromboli', 'Italy');

