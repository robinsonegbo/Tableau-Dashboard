-- Queries used for the Tableau Project

-- 1. Calculate the Total Cases, Total Deaths, and Death Percentage
SELECT SUM(new_cases) AS total_cases, 
       SUM(cast(new_deaths AS int)) AS total_deaths, 
       SUM(cast(new_deaths AS int))/SUM(New_Cases)*100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL 
ORDER BY 1,2;

-- 2. Retrieve the Total Death Count by Location, excluding World, European Union, and International
SELECT location, SUM(cast(new_deaths AS int)) AS TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent IS NULL 
AND location NOT IN ('World', 'European Union', 'International')
GROUP BY location
ORDER BY TotalDeathCount DESC;

-- 3. Get the Highest Infection Count and the Percentage of Population Infected
SELECT Location, Population, 
       MAX(total_cases) AS HighestInfectionCount, 
       Max((total_cases/population))*100 AS PercentPopulationInfected
FROM PortfolioProject..CovidDeaths
GROUP BY Location, Population
ORDER BY PercentPopulationInfected DESC;

-- 4. Get the Highest Infection Count, the Percentage of Population Infected, and the Date
SELECT Location, Population, date, 
       MAX(total_cases) AS HighestInfectionCount, 
       Max((total_cases/population))*100 AS PercentPopulationInfected
FROM PortfolioProject..CovidDeaths
GROUP BY Location, Population, date
ORDER BY PercentPopulationInfected DESC;
