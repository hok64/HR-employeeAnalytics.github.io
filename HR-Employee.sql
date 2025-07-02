SELECT TOP (1000) [Age]
      ,[Attrition]
      ,[BusinessTravel]
      ,[DailyRate]
      ,[Department]
      ,[DistanceFromHome]
      ,[Education]
      ,[EducationField]
      ,[EmployeeCount]
      ,[EmployeeNumber]
      ,[EnvironmentSatisfaction]
      ,[Gender]
      ,[HourlyRate]
      ,[JobInvolvement]
      ,[JobLevel]
      ,[JobRole]
      ,[JobSatisfaction]
      ,[MaritalStatus]
      ,[MonthlyIncome]
      ,[MonthlyRate]
      ,[NumCompaniesWorked]
      ,[Over18]
      ,[OverTime]
      ,[PercentSalaryHike]
      ,[PerformanceRating]
      ,[RelationshipSatisfaction]
      ,[StandardHours]
      ,[StockOptionLevel]
      ,[TotalWorkingYears]
      ,[TrainingTimesLastYear]
      ,[WorkLifeBalance]
      ,[YearsAtCompany]
      ,[YearsInCurrentRole]
      ,[YearsSinceLastPromotion]
      ,[YearsWithCurrManager]
  FROM [HR_Analystic].[dbo].['HR-Employee-Attrition$']

  -- TOTAL EMPLOYEES

SELECT COUNT(EmployeeNumber) AS TotalEmployees
FROM ['HR-Employee-Attrition$'];

-- TOTAL ATTRITION

SELECT COUNT(EmployeeNumber) AS EmployeesLeft
FROM ['HR-Employee-Attrition$']
WHERE Attrition = 'Yes';

-- TURNOVER RATE

SELECT 
  (COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0) / COUNT(*) AS TurnoverRate
FROM ['HR-Employee-Attrition$'];


-- AVERAGE MONTHLY INCOME

SELECT AVG(MonthlyIncome) AS AvgMonthlyIncome
FROM ['HR-Employee-Attrition$'];


-- TURNOVER BY DEPARTMENT

SELECT Department,
       COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS LeftEmployees,
       COUNT(*) AS TotalEmployees,
       (COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0) / COUNT(*) AS TurnoverRate
FROM ['HR-Employee-Attrition$']
GROUP BY Department;


-- AVERAGE PERFORMENCE BY JOBROLE

SELECT JobRole,
       AVG(PerformanceRating) AS AvgPerformance
FROM ['HR-Employee-Attrition$']
GROUP BY JobRole;

