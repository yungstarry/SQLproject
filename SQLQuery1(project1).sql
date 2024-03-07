

--select *
--from CovidVaccination$
--order by 3,4

--select location, date, total_cases, new_cases, total_deaths, population
--from CovidDeaths$
--order by 1,2

--looking at Total cases vs Total Deaths
--likehood of  dying if contacted in your country
--select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathsPercentage
--from CovidDeaths$
--where location like '%nigeria%'
--order by 1,2


--looking at the total case versus the population
--shwo what percentage of population got covid
--select location, date, population, total_cases, (total_cases/population)*100 as TotalCases
--from CovidDeaths$
--where location like '%nigeria%'
--order by 1,2


--country with the highest infestion rate
--select location, population, MAX(total_cases) as InfectionCount
--from CovidDeaths$
--group by location, population
--order by 2 desc


--showing countries with higest death count

--select location, MAX(cast(total_deaths as int)) as TotalDeathCount
--from CovidDeaths$
--where continent is not null
--group by location
--order by TotalDeathCount desc


--lets do continent
--select continent, MAX(cast(total_deaths as int)) as TotalDeathCount
--from CovidDeaths$
--where continent is not null
--group by continent
--order by TotalDeathCount desc

--showing continents with highest death count
--select continent, MAX(cast(total_deaths as int)) as TotalDeathCount
--from CovidDeaths$
--where continent is not null
--group by continent
--order by TotalDeathCount desc


--global number
--select date, SUM(new_cases) as TotalCases, SUM(cast (new_deaths as int))
--from CovidDeaths$
--where continent is not null
--group by date
--order by TotalCases desc


--select  dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(cast(vac.new_vaccinations as int)) over (partition by dea.location order by dea.location) as RollingPeopleVaccinated, 
--from CovidDeaths$ dea
--join CovidVaccination$ vac
--on dea.location = vac.location and dea.date = vac.date
--where dea.continent is not null

--order by 2,3


--using cte

--with PopvsVac (continent, location, date, population, New_vaccination, RollingPeopleVaccinated)
--as (
--select  dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(cast(vac.new_vaccinations as int)) over (partition by dea.location order by dea.location) as RollingPeopleVaccinated
--from CovidDeaths$ dea
--join CovidVaccination$ vac
--on dea.location = vac.location and dea.date = vac.date
--where dea.continent is not null
--)

--select *
--from PopvsVac

--Temp table

--Drop table if exists #PercentPopulationVaccinated
--Create Table #PercentPopulationVaccinated
--(
--continent nvarchar(255),
--location nvarchar(255),
--date datetime,
--population numeric,
--New_vaccinations numeric,
--RollingPeopleVaccinated numeric
--)

--insert into #PercentPopulationVaccinated
--select  dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(cast(vac.new_vaccinations as int)) over (partition by dea.location order by dea.location) as RollingPeopleVaccinated
--from CovidDeaths$ dea
--join CovidVaccination$ vac
--on dea.location = vac.location and dea.date = vac.date
--where dea.continent is not null


--select *, (RollingPeopleVaccinated/population)*100
--from #PercentPopulationVaccinated


--create view to store data for later visualization

--create view  PercentPopulationVaccinated as
--select  dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(cast(vac.new_vaccinations as int)) over (partition by dea.location order by dea.location) as RollingPeopleVaccinated
--from CovidDeaths$ dea
--join CovidVaccination$ vac
--on dea.location = vac.location and dea.date = vac.date
--where dea.continent is not null
 