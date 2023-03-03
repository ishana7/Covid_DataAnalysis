Select *
From PortfolioDatabase..CovidDeathss
Where continent is not null 
order by 3,4

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioDatabase..CovidDeathss
ORDER by 1,2

-- Total cases vs total deaths
SELECT location, date, total_cases , total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM PortfolioDatabase..CovidDeathss
WHERE location LIKE '%states'
ORDER by 1,2


-- Total cases vs Population
SELECT location, date, total_cases, population, total_cases/population AS deathPercentage
FROM PortfolioDatabase..CovidDeathss
WHERE location LIKE '%states'
ORDER by 1,2


-- Countries with Highest Infection Rate compared to Population

Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From PortfolioDatabase..CovidDeaths
--Where location like '%states%'
Group by Location, Population
order by PercentPopulationInfected desc


-- Countries with Highest Death Count per Population

Select Location, MAX(cast(Total_deaths as int)) as TotalDeathCount
From PortfolioDatabase..CovidDeaths
--Where location like '%states%'
Where continent is not null 
Group by Location
order by TotalDeathCount desc


-- BREAKING THINGS DOWN BY CONTINENT

-- Showing contintents with the highest death count per population

Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
From PortfolioDatabase..CovidDeathss
--Where location like '%states%'
Where continent is not null 
Group by continent
order by TotalDeathCount desc


-- For Tableau Project
Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From PortfolioDatabase..CovidDeathss
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2

-- 2. 

-- We take these out as they are not inluded in the above queries and want to stay consistent
-- European Union is part of Europe

Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From PortfolioDatabase..CovidDeathss
--Where location like '%states%'
Where continent is null 
and location not in ('World', 'European Union', 'International')
Group by location
order by TotalDeathCount desc


-- 3.

Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From PortfolioDatabase..CovidDeathss
--Where location like '%states%'
Group by Location, Population
order by PercentPopulationInfected desc


-- 4.


Select Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From PortfolioDatabase..CovidDeathss
--Where location like '%states%'
Group by Location, Population, date
order by PercentPopulationInfected desc