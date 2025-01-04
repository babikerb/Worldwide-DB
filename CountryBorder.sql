USE world;
DROP TABLE IF EXISTS CountryBorder;
CREATE TABLE CountryBorder (
	Country1Code CHAR(3) NOT NULL DEFAULT '',
    Country2Code CHAR(3) NOT NULL DEFAULT '',
    BorderLength INT,
    PRIMARY KEY (Country1Code, Country2Code),
    FOREIGN KEY (Country1Code) REFERENCES Country(Code),
    FOREIGN KEY (Country2Code) REFERENCES Country(Code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Insert sample data into CountryBorder with BorderLength
START TRANSACTION; 
INSERT INTO CountryBorder (Country1Code, Country2Code, BorderLength) VALUES
('AFG', 'PAK', 2670), -- Afghanistan and Pakistan
('AFG', 'IRN', 921),  -- Afghanistan and Iran
('AFG', 'TJK', 1206), -- Afghanistan and Tajikistan
-- ('ALB', 'MNE', 172),  -- Albania and Montenegro
('ALB', 'GRC', 212),  -- Albania and Greece
('ARE', 'OMN', 609),  -- United Arab Emirates and Oman
('ARE', 'SAU', 457),  -- United Arab Emirates and Saudi Arabia
('ARG', 'BOL', 942),  -- Argentina and Bolivia
('ARG', 'CHL', 5300), -- Argentina and Chile
('ARG', 'BRA', 1224), -- Argentina and Brazil
('ARM', 'AZE', 996),  -- Armenia and Azerbaijan
('ARM', 'GEO', 164),  -- Armenia and Georgia
('AUS', 'NZL', 2150), -- Australia and New Zealand (maritime border)
('AUT', 'DEU', 784),  -- Austria and Germany
('AUT', 'CZE', 402),  -- Austria and Czech Republic
('AUT', 'ITA', 430),  -- Austria and Italy
('AUT', 'HUN', 366),  -- Austria and Hungary
('AZE', 'IRN', 689),  -- Azerbaijan and Iran
('AZE', 'RUS', 284),  -- Azerbaijan and Russia
('BEL', 'FRA', 620),  -- Belgium and France
('BEL', 'NLD', 450),  -- Belgium and Netherlands
('BEL', 'DEU', 167),  -- Belgium and Germany
('BFA', 'CIV', 584),  -- Burkina Faso and Ivory Coast
('BFA', 'MLI', 1325), -- Burkina Faso and Mali
('BFA', 'NER', 622),  -- Burkina Faso and Niger
('BOL', 'BRA', 3423), -- Bolivia and Brazil
('BOL', 'CHL', 860),  -- Bolivia and Chile
('BRA', 'GUY', 1608), -- Brazil and Guyana
('BRA', 'SUR', 593),  -- Brazil and Suriname
('BRA', 'VEN', 2200), -- Brazil and Venezuela
('CAN', 'USA', 8891), -- Canada and United States
('CHN', 'RUS', 4165), -- China and Russia
('CHN', 'KAZ', 1782), -- China and Kazakhstan
('CHN', 'MNG', 4677), -- China and Mongolia
('CHN', 'IND', 3488), -- China and India
('CHL', 'PER', 168),  -- Chile and Peru
('COD', 'RWA', 221),  -- Congo (DRC) and Rwanda
('COD', 'UGA', 765),  -- Congo (DRC) and Uganda
('COL', 'PAN', 225),  -- Colombia and Panama
('COL', 'VEN', 2219), -- Colombia and Venezuela
('DEU', 'POL', 467),  -- Germany and Poland
('DEU', 'CZE', 646),  -- Germany and Czech Republic
('DEU', 'DNK', 68),   -- Germany and Denmark
('DJI', 'SOM', 58),   -- Djibouti and Somalia
('DJI', 'ETH', 342),  -- Djibouti and Ethiopia
('EGY', 'SDN', 1273), -- Egypt and Sudan
('EGY', 'ISR', 266),  -- Egypt and Israel
('ESP', 'PRT', 1214), -- Spain and Portugal
('ESP', 'FRA', 623),  -- Spain and France
('EST', 'RUS', 294),  -- Estonia and Russia
('EST', 'LVA', 343),  -- Estonia and Latvia
('FIN', 'RUS', 1340), -- Finland and Russia
('FIN', 'SWE', 614),  -- Finland and Sweden
('FRA', 'ITA', 488),  -- France and Italy
('FRA', 'CHE', 573),  -- France and Switzerland
('GEO', 'RUS', 894),  -- Georgia and Russia
('GEO', 'TUR', 252),  -- Georgia and Turkey
('GRC', 'TUR', 206),  -- Greece and Turkey
-- ('HUN', 'ROU', 443),  -- Hungary and Romania
-- ('HUN', 'SRB', 174),  -- Hungary and Serbia
('IDN', 'MYS', 1881), -- Indonesia and Malaysia
-- ('IDN', 'TLS', 228),  -- Indonesia and Timor-Leste
('IND', 'PAK', 3323), -- India and Pakistan
('IND', 'BGD', 4096), -- India and Bangladesh
('IND', 'NPL', 1751), -- India and Nepal
('IRN', 'IRQ', 1458), -- Iran and Iraq
('IRN', 'TUR', 534),  -- Iran and Turkey
('IRQ', 'SYR', 605),  -- Iraq and Syria
('ITA', 'SVN', 199),  -- Italy and Slovenia
('JPN', 'RUS', 194),  -- Japan and Russia (maritime)
('KEN', 'TZA', 769),  -- Kenya and Tanzania
('KEN', 'UGA', 933),  -- Kenya and Uganda
('KOR', 'PRK', 238),  -- South Korea and North Korea
('MEX', 'USA', 3141), -- Mexico and United States
('MNG', 'RUS', 3485), -- Mongolia and Russia
('MNG', 'CHN', 4677), -- Mongolia and China
('NGA', 'CMR', 1975), -- Nigeria and Cameroon
('NGA', 'NER', 1497), -- Nigeria and Niger
('POL', 'UKR', 535),  -- Poland and Ukraine
('POL', 'SVK', 541),  -- Poland and Slovakia
('PRT', 'ESP', 1214), -- Portugal and Spain
('RUS', 'UKR', 2295), -- Russia and Ukraine
('RUS', 'KAZ', 6846), -- Russia and Kazakhstan
('SAU', 'IRQ', 811),  -- Saudi Arabia and Iraq
('SAU', 'JOR', 744),  -- Saudi Arabia and Jordan
('SDN', 'ETH', 723),  -- Sudan and Ethiopia
('SDN', 'SOM', 682),  -- Sudan and Somalia
('USA', 'MEX', 3141); -- United States and Mexico
COMMIT;
