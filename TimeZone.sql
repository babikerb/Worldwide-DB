USE world;
DROP TABLE IF EXISTS CountryTimeZone;
DROP TABLE IF EXISTS TimeZone;
CREATE TABLE TimeZone (
	Offset VARCHAR(6) NOT NULL PRIMARY KEY -- e.g., "+05:30", "UTC", "-08:00"
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE CountryTimeZone (
    CountryCode CHAR(3) NOT NULL, -- Country code
    Offset VARCHAR(6) NOT NULL,  -- Time zone offset
    PRIMARY KEY (CountryCode, Offset), -- Composite primary key
    FOREIGN KEY (CountryCode) REFERENCES Country(Code) ON DELETE CASCADE,
    FOREIGN KEY (Offset) REFERENCES TimeZone(Offset) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

START TRANSACTION;
-- Insert data into TimeZone table
INSERT INTO TimeZone (Offset) VALUES
('UTC'),       -- Coordinated Universal Time
('+01:00'),    -- Central European Time
('+02:00'),    -- Eastern European Time
('+03:00'),    -- Moscow Time
('+03:30'),    -- Iran Standard Time
('+04:00'),    -- Gulf Standard Time
('+04:30'),    -- Afghanistan Time
('+05:00'),    -- Pakistan Standard Time
('+05:30'),    -- India Standard Time
('+05:45'),    -- Nepal Time
('+06:00'),    -- Bangladesh Standard Time
('+06:30'),    -- Myanmar Time
('+07:00'),    -- Indochina Time
('+08:00'),    -- China Standard Time
('+09:00'),    -- Japan Standard Time
('+09:30'),    -- Central Australia Time
('+10:00'),    -- Australian Eastern Standard Time
('+11:00'),    -- Micronesia Time
('+12:00'),    -- New Zealand Standard Time
('+13:00'),    -- Tonga Time
('-01:00'),    -- Cape Verde Time
('-02:00'),    -- South Georgia Time
('-03:00'),    -- Brazil Time
('-04:00'),    -- Atlantic Time
('-05:00'),    -- Eastern Standard Time
('-06:00'),    -- Central Standard Time
('-07:00'),    -- Mountain Standard Time
('-08:00'),    -- Pacific Standard Time
('-09:00'),    -- Alaska Time
('-10:00'),    -- Hawaii-Aleutian Time
('-11:00'),    -- Samoa Time
('-12:00');    -- Baker Island Time
COMMIT;




START TRANSACTION;
-- Insert data into CountryTimeZone table
INSERT INTO CountryTimeZone (CountryCode, Offset) VALUES
('AFG', '+04:30'),
('ALB', '+01:00'),
('DZA', '+01:00'),
('ASM', '-11:00'),
('AND', '+01:00'),
('AGO', '+01:00'),
('AIA', '-04:00'),
('ARG', '-03:00'),
('ARM', '+04:00'),
('ABW', '-04:00'),
('AUS', '+10:00'), -- Eastern Australia
('AUS', '+09:30'), -- Central Australia
('AUS', '+08:00'), -- Western Australia
('AUT', '+01:00'),
('AZE', '+04:00'),
('BHS', '-05:00'),
('BHR', '+03:00'),
('BGD', '+06:00'),
('BRB', '-04:00'),
('BLR', '+03:00'),
('BEL', '+01:00'),
('BLZ', '-06:00'),
('BEN', '+01:00'),
('BTN', '+06:00'),
('BOL', '-04:00'),
('BIH', '+01:00'),
('BWA', '+02:00'),
('BRA', '-03:00'), -- Brasilia
('BRA', '-04:00'), -- Amazon region
('BRA', '-02:00'), -- Atlantic islands
('BRN', '+08:00'),
('BGR', '+02:00'),
('BFA', 'UTC'),
('BDI', '+02:00'),
('CPV', '-01:00'),
('KHM', '+07:00'),
('CMR', '+01:00'),
('CAN', '-08:00'), -- Pacific Time
('CAN', '-07:00'), -- Mountain Time
('CAN', '-06:00'), -- Central Time
('CAN', '-05:00'), -- Eastern Time
('CAN', '-04:00'), -- Atlantic Time
('TCD', '+01:00'),
('CHL', '-03:00'), -- Santiago
('CHL', '-05:00'), -- Easter Island
('CHN', '+08:00'),
('COL', '-05:00'),
('COM', '+03:00'),
('COG', '+01:00'),
('CRI', '-06:00'),
('HRV', '+01:00'),
('CUB', '-05:00'),
('CYP', '+02:00'),
('CZE', '+01:00'),
('DNK', '+01:00'),
('DJI', '+03:00'),
('DMA', '-04:00'),
('DOM', '-04:00'),
('ECU', '-05:00'),
('EGY', '+02:00'),
('SLV', '-06:00'),
('GNQ', '+01:00'),
('ERI', '+03:00'),
('EST', '+02:00'),
('ETH', '+03:00'),
('FJI', '+12:00'),
('FIN', '+02:00'),
('FRA', '+01:00'),
('GAB', '+01:00'),
('GEO', '+04:00'),
('DEU', '+01:00'),
('GHA', 'UTC'),
('GRC', '+02:00'),
('GRD', '-04:00'),
('GTM', '-06:00'),
('GIN', 'UTC'),
('GUY', '-04:00'),
('HTI', '-05:00'),
('HND', '-06:00'),
('HKG', '+08:00'),
('HUN', '+01:00'),
('ISL', 'UTC'),
('IND', '+05:30'),
('IDN', '+07:00'), -- West Indonesia
('IDN', '+08:00'), -- Central Indonesia
('IDN', '+09:00'), -- East Indonesia
('IRN', '+03:30'),
('IRQ', '+03:00'),
('IRL', 'UTC'),
('ISR', '+02:00'),
('ITA', '+01:00'),
('JPN', '+09:00'),
('JOR', '+03:00'),
('KAZ', '+05:00'), -- Western Kazakhstan
('KAZ', '+06:00'), -- Eastern Kazakhstan
('KEN', '+03:00'),
('KIR', '+12:00'),
('PRK', '+09:00'),
('KOR', '+09:00'),
('KWT', '+03:00'),
('KGZ', '+06:00'),
('LAO', '+07:00'),
('LVA', '+02:00'),
('LBN', '+02:00'),
('LSO', '+02:00'),
('LBR', 'UTC'),
('LBY', '+02:00'),
('LIE', '+01:00'),
('LTU', '+02:00'),
('LUX', '+01:00'),
('MAC', '+08:00'),
('MDG', '+03:00'),
('MWI', '+02:00'),
('MYS', '+08:00'),
('MDV', '+05:00'),
('MLI', 'UTC'),
('MLT', '+01:00'),
('MHL', '+12:00'),
('MTQ', '-04:00'),
('MRT', 'UTC'),
('MUS', '+04:00'),
('MEX', '-06:00'), -- Central Time
('MEX', '-07:00'), -- Mountain Time
('MEX', '-08:00'), -- Pacific Time
('FSM', '+11:00'), -- Western FSM
('FSM', '+10:00'), -- Eastern FSM
('MDA', '+02:00'),
('MCO', '+01:00'),
('MNG', '+08:00'), -- Western Mongolia
('MNG', '+09:00'), -- Eastern Mongolia
('MAR', 'UTC'),
('MOZ', '+02:00'),
('MMR', '+06:30'),
('NAM', '+02:00'),
('NRU', '+12:00'),
('NPL', '+05:45'),
('NLD', '+01:00'),
('NZL', '+12:00'),
('NIC', '-06:00'),
('NER', '+01:00'),
('NGA', '+01:00'),
('PRY', '-04:00'),
('PER', '-05:00'),
('PHL', '+08:00'),
('POL', '+01:00'),
('PRT', 'UTC'),
('QAT', '+03:00'),
-- ('ROU', '+02:00'),
('RUS', '+03:00'), -- Moscow
('RUS', '+04:00'), -- Samara
('RUS', '+05:00'), -- Yekaterinburg
('RUS', '+06:00'), -- Omsk
('RUS', '+07:00'), -- Krasnoyarsk
('RUS', '+08:00'), -- Irkutsk
('RUS', '+09:00'), -- Yakutsk
('RUS', '+10:00'), -- Vladivostok
('RUS', '+11:00'), -- Magadan
('RUS', '+12:00'), -- Kamchatka
('RWA', '+02:00'),
('SAU', '+03:00'),
-- ('SRB', '+01:00'),
('SYC', '+04:00'),
('SGP', '+08:00'),
('SVK', '+01:00'),
('SVN', '+01:00'),
('ZAF', '+02:00'),
('ESP', '+01:00'),
('LKA', '+05:30'),
('SDN', '+02:00'),
('SUR', '-03:00'),
('SWZ', '+02:00'),
('SWE', '+01:00'),
('CHE', '+01:00'),
('SYR', '+02:00'),
('TWN', '+08:00'),
('TJK', '+05:00'),
('TZA', '+03:00'),
('THA', '+07:00'),
-- ('TLS', '+09:00'),
('TGO', 'UTC'),
('TON', '+13:00'),
('TTO', '-04:00'),
('TUN', '+01:00'),
('TUR', '+03:00'),
('TKM', '+05:00'),
('UGA', '+03:00'),
('UKR', '+02:00'),
('ARE', '+04:00'),
('GBR', 'UTC'),
('USA', '-05:00'), -- Eastern Time
('USA', '-06:00'), -- Central Time
('USA', '-07:00'), -- Mountain Time
('USA', '-08:00'), -- Pacific Time
('USA', '-09:00'), -- Alaska Time
('USA', '-10:00'), -- Hawaii-Aleutian Time
('URY', '-03:00'),
('UZB', '+05:00'),
('VUT', '+11:00'),
('VAT', '+01:00'),
('VEN', '-04:00'),
('VNM', '+07:00'),
('YEM', '+03:00'),
('ZMB', '+02:00'),
('ZWE', '+02:00');
COMMIT;
