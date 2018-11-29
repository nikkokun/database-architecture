CREATE OR REPLACE FUNCTION gis_distance(point, point)
  RETURNS double precision AS
$BODY$
SELECT 2 * R * ASIN( d / 2 / R )
FROM (
  SELECT SQRT((x1 - x2)^2 + (y1 - y2)^2 + (z1 - z2)^2) AS d, R
  FROM (
    SELECT c.R
         , c.R * COS(pi() * l1.lat/180) * COS(pi() * l1.lng/180) AS x1
         , c.R * COS(pi() * l1.lat/180) * SIN(pi() * l1.lng/180) AS y1
         , c.R * SIN(pi() * l1.lat/180)                          AS z1
         , c.R * COS(pi() * l2.lat/180) * COS(pi() * l2.lng/180) AS x2
         , c.R * COS(pi() * l2.lat/180) * SIN(pi() * l2.lng/180) AS y2
         , c.R * SIN(pi() * l2.lat/180)                          AS z2
    FROM (SELECT $1[0] AS lat, $1[1] AS lng) AS l1
       , (SELECT $2[0] AS lat, $2[1] AS lng) AS l2
       , (SELECT 6378.137 AS R) AS c
  ) trig
) sq
$BODY$
  LANGUAGE sql;

--sample table
--https://opendata.socrata.com/dataset/Country-List-ISO-3166-Codes-Latitude-Longitude/mnkm-8ram
DROP TABLE IF EXISTS cccountry;
CREATE TABLE ccountry(
    name varchar(255),
    alpha2_code varchar(10),
    alpha3_code varchar(10),
    numeric_code integer,
    location point
);
INSERT INTO cccountry VALUES('Afghanistan', 'AF', 'AFG', 4, '(33, 65)');
INSERT INTO cccountry VALUES('Albania', 'AL', 'ALB', 8, '(41, 20)');
INSERT INTO cccountry VALUES('Algeria', 'DZ', 'DZA', 12, '(28, 3)');
INSERT INTO cccountry VALUES('American Samoa', 'AS', 'ASM', 16, '(-14.3333, -170)');
INSERT INTO cccountry VALUES('Andorra', 'AD', 'AND', 20, '(42.5, 1.6)');
INSERT INTO cccountry VALUES('Angola', 'AO', 'AGO', 24, '(-12.5, 18.5)');
INSERT INTO cccountry VALUES('Anguilla', 'AI', 'AIA', 660, '(18.25, -63.1667)');
INSERT INTO cccountry VALUES('Antarctica', 'AQ', 'ATA', 10, '(-90, 0)');
INSERT INTO cccountry VALUES('Antigua and Barbuda', 'AG', 'ATG', 28, '(17.05, -61.8)');
INSERT INTO cccountry VALUES('Argentina', 'AR', 'ARG', 32, '(-34, -64)');
INSERT INTO cccountry VALUES('Armenia', 'AM', 'ARM', 51, '(40, 45)');
INSERT INTO cccountry VALUES('Aruba', 'AW', 'ABW', 533, '(12.5, -69.9667)');
INSERT INTO cccountry VALUES('Australia', 'AU', 'AUS', 36, '(-27, 133)');
INSERT INTO cccountry VALUES('Austria', 'AT', 'AUT', 40, '(47.3333, 13.3333)');
INSERT INTO cccountry VALUES('Azerbaijan', 'AZ', 'AZE', 31, '(40.5, 47.5)');
INSERT INTO cccountry VALUES('Bahamas', 'BS', 'BHS', 44, '(24.25, -76)');
INSERT INTO cccountry VALUES('Bahrain', 'BH', 'BHR', 48, '(26, 50.55)');
INSERT INTO cccountry VALUES('Bangladesh', 'BD', 'BGD', 50, '(24, 90)');
INSERT INTO cccountry VALUES('Barbados', 'BB', 'BRB', 52, '(13.1667, -59.5333)');
INSERT INTO cccountry VALUES('Belarus', 'BY', 'BLR', 112, '(53, 28)');
INSERT INTO cccountry VALUES('Belgium', 'BE', 'BEL', 56, '(50.8333, 4)');
INSERT INTO cccountry VALUES('Belize', 'BZ', 'BLZ', 84, '(17.25, -88.75)');
INSERT INTO cccountry VALUES('Benin', 'BJ', 'BEN', 204, '(9.5, 2.25)');
INSERT INTO cccountry VALUES('Bermuda', 'BM', 'BMU', 60, '(32.3333, -64.75)');
INSERT INTO cccountry VALUES('Bhutan', 'BT', 'BTN', 64, '(27.5, 90.5)');
INSERT INTO cccountry VALUES('Bolivia, Plurinational State of', 'BO', 'BOL', 68, '(-17, -65)');
INSERT INTO cccountry VALUES('Bosnia and Herzegovina', 'BA', 'BIH', 70, '(44, 18)');
INSERT INTO cccountry VALUES('Botswana', 'BW', 'BWA', 72, '(-22, 24)');
INSERT INTO cccountry VALUES('Bouvet Island', 'BV', 'BVT', 74, '(-54.4333, 3.4)');
INSERT INTO cccountry VALUES('Brazil', 'BR', 'BRA', 76, '(-10, -55)');
INSERT INTO cccountry VALUES('British Indian Ocean Territory', 'IO', 'IOT', 86, '(-6, 71.5)');
INSERT INTO cccountry VALUES('Brunei Darussalam', 'BN', 'BRN', 96, '(4.5, 114.6667)');
INSERT INTO cccountry VALUES('Bulgaria', 'BG', 'BGR', 100, '(43, 25)');
INSERT INTO cccountry VALUES('Burkina Faso', 'BF', 'BFA', 854, '(13, -2)');
INSERT INTO cccountry VALUES('Burundi', 'BI', 'BDI', 108, '(-3.5, 30)');
INSERT INTO cccountry VALUES('Cambodia', 'KH', 'KHM', 116, '(13, 105)');
INSERT INTO cccountry VALUES('Cameroon', 'CM', 'CMR', 120, '(6, 12)');
INSERT INTO cccountry VALUES('Canada', 'CA', 'CAN', 124, '(60, -95)');
INSERT INTO cccountry VALUES('Cape Verde', 'CV', 'CPV', 132, '(16, -24)');
INSERT INTO cccountry VALUES('Cayman Islands', 'KY', 'CYM', 136, '(19.5, -80.5)');
INSERT INTO cccountry VALUES('Central African Republic', 'CF', 'CAF', 140, '(7, 21)');
INSERT INTO cccountry VALUES('Chad', 'TD', 'TCD', 148, '(15, 19)');
INSERT INTO cccountry VALUES('Chile', 'CL', 'CHL', 152, '(-30, -71)');
INSERT INTO cccountry VALUES('China', 'CN', 'CHN', 156, '(35, 105)');
INSERT INTO cccountry VALUES('Christmas Island', 'CX', 'CXR', 162, '(-10.5, 105.6667)');
INSERT INTO cccountry VALUES('Cocos (Keeling) Islands', 'CC', 'CCK', 166, '(-12.5, 96.8333)');
INSERT INTO cccountry VALUES('Colombia', 'CO', 'COL', 170, '(4, -72)');
INSERT INTO cccountry VALUES('Comoros', 'KM', 'COM', 174, '(-12.1667, 44.25)');
INSERT INTO cccountry VALUES('Congo', 'CG', 'COG', 178, '(-1, 15)');
INSERT INTO cccountry VALUES('Congo, the Democratic Republic of the', 'CD', 'COD', 180, '(0, 25)');
INSERT INTO ccountry VALUES('Cook Islands', 'CK', 'COK', 184, '(-21.2333, -159.7667)');
INSERT INTO cccountry VALUES('Costa Rica', 'CR', 'CRI', 188, '(10, -84)');
INSERT INTO cccountry VALUES('Côte d''Ivoire', 'CI', 'CIV', 384, '(8, -5)');
INSERT INTO cccountry VALUES('Croatia', 'HR', 'HRV', 191, '(45.1667, 15.5)');
INSERT INTO cccountry VALUES('Cuba', 'CU', 'CUB', 192, '(21.5, -80)');
INSERT INTO cccountry VALUES('Cyprus', 'CY', 'CYP', 196, '(35, 33)');
INSERT INTO cccountry VALUES('Czech Republic', 'CZ', 'CZE', 203, '(49.75, 15.5)');
INSERT INTO cccountry VALUES('Denmark', 'DK', 'DNK', 208, '(56, 10)');
INSERT INTO cccountry VALUES('Djibouti', 'DJ', 'DJI', 262, '(11.5, 43)');
INSERT INTO cccountry VALUES('Dominica', 'DM', 'DMA', 212, '(15.4167, -61.3333)');
INSERT INTO cccountry VALUES('Dominican Republic', 'DO', 'DOM', 214, '(19, -70.6667)');
INSERT INTO cccountry VALUES('Ecuador', 'EC', 'ECU', 218, '(-2, -77.5)');
INSERT INTO cccountry VALUES('Egypt', 'EG', 'EGY', 818, '(27, 30)');
INSERT INTO cccountry VALUES('El Salvador', 'SV', 'SLV', 222, '(13.8333, -88.9167)');
INSERT INTO cccountry VALUES('Equatorial Guinea', 'GQ', 'GNQ', 226, '(2, 10)');
INSERT INTO cccountry VALUES('Eritrea', 'ER', 'ERI', 232, '(15, 39)');
INSERT INTO cccountry VALUES('Estonia', 'EE', 'EST', 233, '(59, 26)');
INSERT INTO cccountry VALUES('Ethiopia', 'ET', 'ETH', 231, '(8, 38)');
INSERT INTO cccountry VALUES('Falkland Islands (Malvinas)', 'FK', 'FLK', 238, '(-51.75, -59)');
INSERT INTO cccountry VALUES('Faroe Islands', 'FO', 'FRO', 234, '(62, -7)');
INSERT INTO cccountry VALUES('Fiji', 'FJ', 'FJI', 242, '(-18, 175)');
INSERT INTO cccountry VALUES('Finland', 'FI', 'FIN', 246, '(64, 26)');
INSERT INTO cccountry VALUES('France', 'FR', 'FRA', 250, '(46, 2)');
INSERT INTO cccountry VALUES('French Guiana', 'GF', 'GUF', 254, '(4, -53)');
INSERT INTO cccountry VALUES('French Polynesia', 'PF', 'PYF', 258, '(-15, -140)');
INSERT INTO cccountry VALUES('French Southern Territories', 'TF', 'ATF', 260, '(-43, 67)');
INSERT INTO cccountry VALUES('Gabon', 'GA', 'GAB', 266, '(-1, 11.75)');
INSERT INTO cccountry VALUES('Gambia', 'GM', 'GMB', 270, '(13.4667, -16.5667)');
INSERT INTO cccountry VALUES('Georgia', 'GE', 'GEO', 268, '(42, 43.5)');
INSERT INTO cccountry VALUES('Germany', 'DE', 'DEU', 276, '(51, 9)');
INSERT INTO cccountry VALUES('Ghana', 'GH', 'GHA', 288, '(8, -2)');
INSERT INTO cccountry VALUES('Gibraltar', 'GI', 'GIB', 292, '(36.1833, -5.3667)');
INSERT INTO ccountry VALUES('Greece', 'GR', 'GRC', 300, '(39, 22)');
INSERT INTO ccountry VALUES('Greenland', 'GL', 'GRL', 304, '(72, -40)');
INSERT INTO ccountry VALUES('Grenada', 'GD', 'GRD', 308, '(12.1167, -61.6667)');
INSERT INTO ccountry VALUES('Guadeloupe', 'GP', 'GLP', 312, '(16.25, -61.5833)');
INSERT INTO ccountry VALUES('Guam', 'GU', 'GUM', 316, '(13.4667, 144.7833)');
INSERT INTO ccountry VALUES('Guatemala', 'GT', 'GTM', 320, '(15.5, -90.25)');
INSERT INTO ccountry VALUES('Guernsey', 'GG', 'GGY', 831, '(49.5, -2.56)');
INSERT INTO ccountry VALUES('Guinea', 'GN', 'GIN', 324, '(11, -10)');
INSERT INTO ccountry VALUES('Guinea-Bissau', 'GW', 'GNB', 624, '(12, -15)');
INSERT INTO ccountry VALUES('Guyana', 'GY', 'GUY', 328, '(5, -59)');
INSERT INTO ccountry VALUES('Haiti', 'HT', 'HTI', 332, '(19, -72.4167)');
INSERT INTO ccountry VALUES('Heard Island and McDonald Islands', 'HM', 'HMD', 334, '(-53.1, 72.5167)');
INSERT INTO ccountry VALUES('Holy See (Vatican City State)', 'VA', 'VAT', 336, '(41.9, 12.45)');
INSERT INTO ccountry VALUES('Honduras', 'HN', 'HND', 340, '(15, -86.5)');
INSERT INTO ccountry VALUES('Hong Kong', 'HK', 'HKG', 344, '(22.25, 114.1667)');
INSERT INTO ccountry VALUES('Hungary', 'HU', 'HUN', 348, '(47, 20)');
INSERT INTO ccountry VALUES('Iceland', 'IS', 'ISL', 352, '(65, -18)');
INSERT INTO ccountry VALUES('India', 'IN', 'IND', 356, '(20, 77)');
INSERT INTO ccountry VALUES('Indonesia', 'ID', 'IDN', 360, '(-5, 120)');
INSERT INTO ccountry VALUES('Iran, Islamic Republic of', 'IR', 'IRN', 364, '(32, 53)');
INSERT INTO ccountry VALUES('Iraq', 'IQ', 'IRQ', 368, '(33, 44)');
INSERT INTO ccountry VALUES('Ireland', 'IE', 'IRL', 372, '(53, -8)');
INSERT INTO ccountry VALUES('Isle of Man', 'IM', 'IMN', 833, '(54.23, -4.55)');
INSERT INTO ccountry VALUES('Israel', 'IL', 'ISR', 376, '(31.5, 34.75)');
INSERT INTO ccountry VALUES('Italy', 'IT', 'ITA', 380, '(42.8333, 12.8333)');
INSERT INTO ccountry VALUES('Jamaica', 'JM', 'JAM', 388, '(18.25, -77.5)');
INSERT INTO ccountry VALUES('Japan', 'JP', 'JPN', 392, '(36, 138)');
INSERT INTO ccountry VALUES('Jersey', 'JE', 'JEY', 832, '(49.21, -2.13)');
INSERT INTO ccountry VALUES('Jordan', 'JO', 'JOR', 400, '(31, 36)');
INSERT INTO ccountry VALUES('Kazakhstan', 'KZ', 'KAZ', 398, '(48, 68)');
INSERT INTO ccountry VALUES('Kenya', 'KE', 'KEN', 404, '(1, 38)');
INSERT INTO ccountry VALUES('Kiribati', 'KI', 'KIR', 296, '(1.4167, 173)');
INSERT INTO ccountry VALUES('Korea, Democratic People''s Republic of', 'KP', 'PRK', 408, '(40, 127)');
INSERT INTO ccountry VALUES('Korea, Republic of', 'KR', 'KOR', 410, '(37, 127.5)');
INSERT INTO ccountry VALUES('Kuwait', 'KW', 'KWT', 414, '(29.3375, 47.6581)');
INSERT INTO ccountry VALUES('Kyrgyzstan', 'KG', 'KGZ', 417, '(41, 75)');
INSERT INTO ccountry VALUES('Lao People''s Democratic Republic', 'LA', 'LAO', 418, '(18, 105)');
INSERT INTO ccountry VALUES('Latvia', 'LV', 'LVA', 428, '(57, 25)');
INSERT INTO ccountry VALUES('Lebanon', 'LB', 'LBN', 422, '(33.8333, 35.8333)');
INSERT INTO ccountry VALUES('Lesotho', 'LS', 'LSO', 426, '(-29.5, 28.5)');
INSERT INTO ccountry VALUES('Liberia', 'LR', 'LBR', 430, '(6.5, -9.5)');
INSERT INTO ccountry VALUES('Libyan Arab Jamahiriya', 'LY', 'LBY', 434, '(25, 17)');
INSERT INTO ccountry VALUES('Liechtenstein', 'LI', 'LIE', 438, '(47.1667, 9.5333)');
INSERT INTO ccountry VALUES('Lithuania', 'LT', 'LTU', 440, '(56, 24)');
INSERT INTO ccountry VALUES('Luxembourg', 'LU', 'LUX', 442, '(49.75, 6.1667)');
INSERT INTO ccountry VALUES('Macao', 'MO', 'MAC', 446, '(22.1667, 113.55)');
INSERT INTO ccountry VALUES('Macedonia, the former Yugoslav Republic of', 'MK', 'MKD', 807, '(41.8333, 22)');
INSERT INTO ccountry VALUES('Madagascar', 'MG', 'MDG', 450, '(-20, 47)');
INSERT INTO ccountry VALUES('Malawi', 'MW', 'MWI', 454, '(-13.5, 34)');
INSERT INTO ccountry VALUES('Malaysia', 'MY', 'MYS', 458, '(2.5, 112.5)');
INSERT INTO ccountry VALUES('Maldives', 'MV', 'MDV', 462, '(3.25, 73)');
INSERT INTO ccountry VALUES('Mali', 'ML', 'MLI', 466, '(17, -4)');
INSERT INTO ccountry VALUES('Malta', 'MT', 'MLT', 470, '(35.8333, 14.5833)');
INSERT INTO ccountry VALUES('Marshall Islands', 'MH', 'MHL', 584, '(9, 168)');
INSERT INTO ccountry VALUES('Martinique', 'MQ', 'MTQ', 474, '(14.6667, -61)');
INSERT INTO ccountry VALUES('Mauritania', 'MR', 'MRT', 478, '(20, -12)');
INSERT INTO ccountry VALUES('Mauritius', 'MU', 'MUS', 480, '(-20.2833, 57.55)');
INSERT INTO ccountry VALUES('Mayotte', 'YT', 'MYT', 175, '(-12.8333, 45.1667)');
INSERT INTO ccountry VALUES('Mexico', 'MX', 'MEX', 484, '(23, -102)');
INSERT INTO ccountry VALUES('Micronesia, Federated States of', 'FM', 'FSM', 583, '(6.9167, 158.25)');
INSERT INTO ccountry VALUES('Moldova, Republic of', 'MD', 'MDA', 498, '(47, 29)');
INSERT INTO ccountry VALUES('Monaco', 'MC', 'MCO', 492, '(43.7333, 7.4)');
INSERT INTO ccountry VALUES('Mongolia', 'MN', 'MNG', 496, '(46, 105)');
INSERT INTO ccountry VALUES('Montenegro', 'ME', 'MNE', 499, '(42, 19)');
INSERT INTO ccountry VALUES('Montserrat', 'MS', 'MSR', 500, '(16.75, -62.2)');
INSERT INTO ccountry VALUES('Morocco', 'MA', 'MAR', 504, '(32, -5)');
INSERT INTO ccountry VALUES('Mozambique', 'MZ', 'MOZ', 508, '(-18.25, 35)');
INSERT INTO ccountry VALUES('Myanmar', 'MM', 'MMR', 104, '(22, 98)');
INSERT INTO ccountry VALUES('Namibia', 'NA', 'NAM', 516, '(-22, 17)');
INSERT INTO ccountry VALUES('Nauru', 'NR', 'NRU', 520, '(-0.5333, 166.9167)');
INSERT INTO ccountry VALUES('Nepal', 'NP', 'NPL', 524, '(28, 84)');
INSERT INTO ccountry VALUES('Netherlands', 'NL', 'NLD', 528, '(52.5, 5.75)');
INSERT INTO ccountry VALUES('Netherlands Antilles', 'AN', 'ANT', 530, '(12.25, -68.75)');
INSERT INTO ccountry VALUES('New Caledonia', 'NC', 'NCL', 540, '(-21.5, 165.5)');
INSERT INTO ccountry VALUES('New Zealand', 'NZ', 'NZL', 554, '(-41, 174)');
INSERT INTO ccountry VALUES('Nicaragua', 'NI', 'NIC', 558, '(13, -85)');
INSERT INTO ccountry VALUES('Niger', 'NE', 'NER', 562, '(16, 8)');
INSERT INTO ccountry VALUES('Nigeria', 'NG', 'NGA', 566, '(10, 8)');
INSERT INTO ccountry VALUES('Niue', 'NU', 'NIU', 570, '(-19.0333, -169.8667)');
INSERT INTO ccountry VALUES('Norfolk Island', 'NF', 'NFK', 574, '(-29.0333, 167.95)');
INSERT INTO ccountry VALUES('Northern Mariana Islands', 'MP', 'MNP', 580, '(15.2, 145.75)');
INSERT INTO ccountry VALUES('Norway', 'NO', 'NOR', 578, '(62, 10)');
INSERT INTO ccountry VALUES('Oman', 'OM', 'OMN', 512, '(21, 57)');
INSERT INTO ccountry VALUES('Pakistan', 'PK', 'PAK', 586, '(30, 70)');
INSERT INTO ccountry VALUES('Palau', 'PW', 'PLW', 585, '(7.5, 134.5)');
INSERT INTO ccountry VALUES('Palestinian Territory, Occupied', 'PS', 'PSE', 275, '(32, 35.25)');
INSERT INTO ccountry VALUES('Panama', 'PA', 'PAN', 591, '(9, -80)');
INSERT INTO ccountry VALUES('Papua New Guinea', 'PG', 'PNG', 598, '(-6, 147)');
INSERT INTO ccountry VALUES('Paraguay', 'PY', 'PRY', 600, '(-23, -58)');
INSERT INTO ccountry VALUES('Peru', 'PE', 'PER', 604, '(-10, -76)');
INSERT INTO ccountry VALUES('Philippines', 'PH', 'PHL', 608, '(13, 122)');
INSERT INTO ccountry VALUES('Pitcairn', 'PN', 'PCN', 612, '(-24.7, -127.4)');
INSERT INTO ccountry VALUES('Poland', 'PL', 'POL', 616, '(52, 20)');
INSERT INTO ccountry VALUES('Portugal', 'PT', 'PRT', 620, '(39.5, -8)');
INSERT INTO ccountry VALUES('Puerto Rico', 'PR', 'PRI', 630, '(18.25, -66.5)');
INSERT INTO ccountry VALUES('Qatar', 'QA', 'QAT', 634, '(25.5, 51.25)');
INSERT INTO ccountry VALUES('Réunion', 'RE', 'REU', 638, '(-21.1, 55.6)');
INSERT INTO ccountry VALUES('Romania', 'RO', 'ROU', 642, '(46, 25)');
INSERT INTO ccountry VALUES('Russian Federation', 'RU', 'RUS', 643, '(60, 100)');
INSERT INTO ccountry VALUES('Rwanda', 'RW', 'RWA', 646, '(-2, 30)');
INSERT INTO ccountry VALUES('Saint Helena, Ascension and Tristan da Cunha', 'SH', 'SHN', 654, '(-15.9333, -5.7)');
INSERT INTO ccountry VALUES('Saint Kitts and Nevis', 'KN', 'KNA', 659, '(17.3333, -62.75)');
INSERT INTO ccountry VALUES('Saint Lucia', 'LC', 'LCA', 662, '(13.8833, -61.1333)');
INSERT INTO ccountry VALUES('Saint Pierre and Miquelon', 'PM', 'SPM', 666, '(46.8333, -56.3333)');
INSERT INTO ccountry VALUES('Saint Vincent and the Grenadines', 'VC', 'VCT', 670, '(13.25, -61.2)');
INSERT INTO ccountry VALUES('Samoa', 'WS', 'WSM', 882, '(-13.5833, -172.3333)');
INSERT INTO ccountry VALUES('San Marino', 'SM', 'SMR', 674, '(43.7667, 12.4167)');
INSERT INTO ccountry VALUES('Sao Tome and Principe', 'ST', 'STP', 678, '(1, 7)');
INSERT INTO ccountry VALUES('Saudi Arabia', 'SA', 'SAU', 682, '(25, 45)');
INSERT INTO ccountry VALUES('Senegal', 'SN', 'SEN', 686, '(14, -14)');
INSERT INTO ccountry VALUES('Serbia', 'RS', 'SRB', 688, '(44, 21)');
INSERT INTO ccountry VALUES('Seychelles', 'SC', 'SYC', 690, '(-4.5833, 55.6667)');
INSERT INTO ccountry VALUES('Sierra Leone', 'SL', 'SLE', 694, '(8.5, -11.5)');
INSERT INTO ccountry VALUES('Singapore', 'SG', 'SGP', 702, '(1.3667, 103.8)');
INSERT INTO ccountry VALUES('Slovakia', 'SK', 'SVK', 703, '(48.6667, 19.5)');
INSERT INTO ccountry VALUES('Slovenia', 'SI', 'SVN', 705, '(46, 15)');
INSERT INTO ccountry VALUES('Solomon Islands', 'SB', 'SLB', 90, '(-8, 159)');
INSERT INTO ccountry VALUES('Somalia', 'SO', 'SOM', 706, '(10, 49)');
INSERT INTO ccountry VALUES('South Africa', 'ZA', 'ZAF', 710, '(-29, 24)');
INSERT INTO ccountry VALUES('South Georgia and the South Sandwich Islands', 'GS', 'SGS', 239, '(-54.5, -37)');
INSERT INTO ccountry VALUES('Spain', 'ES', 'ESP', 724, '(40, -4)');
INSERT INTO ccountry VALUES('Sri Lanka', 'LK', 'LKA', 144, '(7, 81)');
INSERT INTO ccountry VALUES('Sudan', 'SD', 'SDN', 736, '(15, 30)');
INSERT INTO ccountry VALUES('Suriname', 'SR', 'SUR', 740, '(4, -56)');
INSERT INTO ccountry VALUES('Svalbard and Jan Mayen', 'SJ', 'SJM', 744, '(78, 20)');
INSERT INTO ccountry VALUES('Swaziland', 'SZ', 'SWZ', 748, '(-26.5, 31.5)');
INSERT INTO ccountry VALUES('Sweden', 'SE', 'SWE', 752, '(62, 15)');
INSERT INTO ccountry VALUES('Switzerland', 'CH', 'CHE', 756, '(47, 8)');
INSERT INTO ccountry VALUES('Syrian Arab Republic', 'SY', 'SYR', 760, '(35, 38)');
INSERT INTO ccountry VALUES('Taiwan, Province of China', 'TW', 'TWN', 158, '(23.5, 121)');
INSERT INTO ccountry VALUES('Tajikistan', 'TJ', 'TJK', 762, '(39, 71)');
INSERT INTO ccountry VALUES('Tanzania, United Republic of', 'TZ', 'TZA', 834, '(-6, 35)');
INSERT INTO ccountry VALUES('Thailand', 'TH', 'THA', 764, '(15, 100)');
INSERT INTO ccountry VALUES('Timor-Leste', 'TL', 'TLS', 626, '(-8.55, 125.5167)');
INSERT INTO ccountry VALUES('Togo', 'TG', 'TGO', 768, '(8, 1.1667)');
INSERT INTO ccountry VALUES('Tokelau', 'TK', 'TKL', 772, '(-9, -172)');
INSERT INTO ccountry VALUES('Tonga', 'TO', 'TON', 776, '(-20, -175)');
INSERT INTO ccountry VALUES('Trinidad and Tobago', 'TT', 'TTO', 780, '(11, -61)');
INSERT INTO ccountry VALUES('Tunisia', 'TN', 'TUN', 788, '(34, 9)');
INSERT INTO ccountry VALUES('Turkey', 'TR', 'TUR', 792, '(39, 35)');
INSERT INTO ccountry VALUES('Turkmenistan', 'TM', 'TKM', 795, '(40, 60)');
INSERT INTO ccountry VALUES('Turks and Caicos Islands', 'TC', 'TCA', 796, '(21.75, -71.5833)');
INSERT INTO ccountry VALUES('Tuvalu', 'TV', 'TUV', 798, '(-8, 178)');
INSERT INTO ccountry VALUES('Uganda', 'UG', 'UGA', 800, '(1, 32)');
INSERT INTO ccountry VALUES('Ukraine', 'UA', 'UKR', 804, '(49, 32)');
INSERT INTO ccountry VALUES('United Arab Emirates', 'AE', 'ARE', 784, '(24, 54)');
INSERT INTO ccountry VALUES('United Kingdom', 'GB', 'GBR', 826, '(54, -2)');
INSERT INTO ccountry VALUES('United States', 'US', 'USA', 840, '(38, -97)');
INSERT INTO ccountry VALUES('United States Minor Outlying Islands', 'UM', 'UMI', 581, '(19.2833, 166.6)');
INSERT INTO ccountry VALUES('Uruguay', 'UY', 'URY', 858, '(-33, -56)');
INSERT INTO ccountry VALUES('Uzbekistan', 'UZ', 'UZB', 860, '(41, 64)');
INSERT INTO ccountry VALUES('Vanuatu', 'VU', 'VUT', 548, '(-16, 167)');
INSERT INTO ccountry VALUES('Venezuela, Bolivarian Republic of', 'VE', 'VEN', 862, '(8, -66)');
INSERT INTO ccountry VALUES('Viet Nam', 'VN', 'VNM', 704, '(16, 106)');
INSERT INTO ccountry VALUES('Virgin Islands, British', 'VG', 'VGB', 92, '(18.5, -64.5)');
INSERT INTO ccountry VALUES('Virgin Islands, U.S.', 'VI', 'VIR', 850, '(18.3333, -64.8333)');
INSERT INTO ccountry VALUES('Wallis and Futuna', 'WF', 'WLF', 876, '(-13.3, -176.2)');
INSERT INTO ccountry VALUES('Western Sahara', 'EH', 'ESH', 732, '(24.5, -13)');
INSERT INTO ccountry VALUES('Yemen', 'YE', 'YEM', 887, '(15, 48)');
INSERT INTO ccountry VALUES('Zambia', 'ZM', 'ZMB', 894, '(-15, 30)');
INSERT INTO ccountry VALUES('Zimbabwe', 'ZW', 'ZWE', 716, '(-20, 30)');

/*
SELECT c2.*, gis_distance(c1.location, c2.location) AS distance
FROM ccountry c1, ccountry c2
WHERE c1.alpha2_code = 'JP'
ORDER BY distance ASC;
*/
