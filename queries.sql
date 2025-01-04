USE world;

-- Find the cities with the highest population in each country
SELECT 
    City.Name AS CityName,
    City.Population,
    Country.Name AS CountryName
FROM 
    City
JOIN 
    Country
ON 
    City.CountryCode = Country.Code
WHERE 
    City.Population = (
        SELECT MAX(Population) 
        FROM City AS SubCity 
        WHERE SubCity.CountryCode = City.CountryCode
    );

-- List countries with more than one official language
SELECT 
    Country.Name AS CountryName,
    (SELECT COUNT(*) 
     FROM CountryLanguage AS SubLang 
     WHERE SubLang.CountryCode = Country.Code 
     AND SubLang.IsOfficial = 'T') AS OfficialLanguageCount
FROM 
    Country
WHERE 
    (SELECT COUNT(*) 
     FROM CountryLanguage AS SubLang 
     WHERE SubLang.CountryCode = Country.Code 
     AND SubLang.IsOfficial = 'T') > 1;

-- Find countries where the average city population is greater than 1 million
SELECT 
    Country.Name AS CountryName,
    (SELECT AVG(Population) 
     FROM City AS SubCity 
     WHERE SubCity.CountryCode = Country.Code) AS AvgCityPopulation
FROM 
    Country
WHERE 
    (SELECT AVG(Population) 
     FROM City AS SubCity 
     WHERE SubCity.CountryCode = Country.Code) > 1000000;

-- List countries and their total population for those with at least one city having a population over 5 million
SELECT 
    Country.Name AS CountryName,
    Country.Population AS TotalPopulation
FROM 
    Country
WHERE 
    EXISTS (
        SELECT 1 
        FROM City 
        WHERE City.CountryCode = Country.Code 
        AND City.Population > 5000000
    );

--  Find countries with a time zone offset of "UTC" and their capital city

SELECT 
    Country.Name AS CountryName,
    (SELECT City.Name 
     FROM City 
     WHERE City.ID = Country.Capital) AS CapitalCity,
    CountryTimeZone.Offset
FROM 
    Country
JOIN 
    CountryTimeZone
ON 
    Country.Code = CountryTimeZone.CountryCode
WHERE 
    CountryTimeZone.Offset = 'UTC';

-- Countries that use USD

SELECT 
    Country.Name AS CountryName,
    Currency.CurrencyName
FROM 
    Country
JOIN 
    CurrencyCountry
ON 
    Country.Code = CurrencyCountry.CountryCode
JOIN 
    Currency
ON 
    CurrencyCountry.CurrencyCode = Currency.CurrencyCode
WHERE 
    Currency.CurrencyCode = 'USD';
    
-- Countries that share border and language

SELECT DISTINCT
    c1.Name AS Country1,
    c2.Name AS Country2,
    cl1.language AS SharedLanguage
FROM 
    CountryBorder cb
JOIN 
    Country c1 ON cb.country1Code = c1.Code
JOIN 
    Country c2 ON cb.country2Code = c2.Code
JOIN 
    CountryLanguage cl1 ON c1.Code = cl1.countryCode AND cl1.isOfficial = TRUE
JOIN 
    CountryLanguage cl2 ON c2.Code = cl2.countryCode AND cl2.isOfficial = TRUE
  AND cl1.language = cl2.language
ORDER BY 
    c1.Name, c2.Name;
    
-- Countries which share borders but have different time zones    

SELECT DISTINCT
    LEAST(c1.Name, c2.Name) AS Country1,
    GREATEST(c1.Name, c2.Name) AS Country2
FROM 
    CountryBorder cb
JOIN 
    Country c1 ON cb.country1Code = c1.Code
JOIN 
    Country c2 ON cb.country2Code = c2.Code
WHERE 
    NOT EXISTS (
        SELECT 1
        FROM CountryTimeZone t1
        JOIN CountryTimeZone t2 
            ON t1.countryCode = c1.Code AND t2.countryCode = c2.Code
        WHERE t1.offset = t2.offset
    )
ORDER BY 
    Country1, Country2;
    
-- List the time zones of countries along with the head of state
SELECT 
    City.Name AS CityName,
    Country.Name AS CountryName,
    City.Population AS CityPopulation
FROM 
    City
JOIN 
    Country
ON 
    City.CountryCode = Country.Code
WHERE 
    City.Population > 1000000;
    
-- Find the cities and countries that have populations greater than 1 million
SELECT 
    City.Name AS CityName,
    Country.Name AS CountryName,
    City.Population AS CityPopulation
FROM 
    City
JOIN 
    Country
ON 
    City.CountryCode = Country.Code
WHERE 
    City.Population > 1000000;

-- List country names for each border
SELECT
    c1.Name AS Country1,
    c2.Name AS Country2,
    cb.BorderLength
FROM
    CountryBorder cb
    JOIN Country c1 ON cb.Country1Code = c1.Code
    JOIN Country c2 ON cb.Country2Code = c2.Code;
    
-- Find the names of countries that share a border with more than two countries.

SELECT c.Name AS CountryName
FROM Country c
WHERE c.Code IN (
    SELECT cb.Country1Code
    FROM CountryBorder cb
    GROUP BY cb.Country1Code
    HAVING COUNT(cb.Country2Code) > 2
);

-- List all countries that have a border longer than 1000 km.
SELECT DISTINCT c.Name AS CountryName
FROM Country c
WHERE c.Code IN (
    SELECT cb.Country1Code
    FROM CountryBorder cb
    WHERE cb.BorderLength > 1000
);

-- Identify countries with cities where the population is greater than 10% of the country's total population.
SELECT Name AS CountryName
FROM Country
WHERE Code IN (
    SELECT ci.CountryCode
    FROM City ci
    WHERE ci.Population > (
        SELECT Population * 0.1
        FROM Country c
        WHERE c.Code = ci.CountryCode
    )
);

-- Find countries where at least one official language has a percentage greater than 50%.
SELECT Name AS CountryName
FROM Country
WHERE Code IN (
    SELECT CountryCode
    FROM CountryLanguage
    WHERE IsOfficial = 'T' AND Percentage > 50
);

--  Find the name of the currency used by countries in the 'Middle East' region.
SELECT DISTINCT cu.CurrencyName
FROM Currency cu
WHERE cu.CurrencyCode IN (
    SELECT cc.CurrencyCode
    FROM CurrencyCountry cc
    WHERE cc.CountryCode IN (
        SELECT c.Code
        FROM Country c
        WHERE c.Region = 'Middle East'
    )
);

-- List all cities in the City table.
SELECT Name AS CityName
FROM City;

--  Find the total number of countries in the world.
SELECT COUNT(*) AS TotalCountries
FROM Country;

-- Retrieve the names of all continents.
SELECT DISTINCT Continent
FROM Country;

-- List all countries in Asia.
SELECT Name AS CountryName
FROM Country
WHERE Continent = 'Asia';
