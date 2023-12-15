create table hrdata(age int,Attrition varchar(3),Businesstravel varchar(20),Dailyrate int,Department varchar(50),DistancefromHome int,Education varchar(4),EducationField varchar(50),
Employeecount int,EmployeeNumber varchar(50),EnvironmentSatisfaction int,Gender varchar(50),HourlyRate int,JobInvolvement int ,JobLevel int,JobRole varchar(50),JobSatisfaction int,MaritalStatus varchar(15),MonthlyIncome int,
MonthlyRate int,NumCompaniesWorked int,Over18 varchar(3),OverTime varchar(5),PercentSalaryHike int,PerformanceRating int,RelationshipSatisfaction int,StandardHours int,StockOptionLevel int,TotalWorkingYears int,
TrainingTimesLastYear int,WorkLifeBalance int,YearsAtCompany int,YearsInCurrentRole int,YearsSinceLastPromotion int,YearsWithCurrManager int);
load data infile"C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Hrdata.csv" into table hrdata
fields terminated by "," ignore 1 lines;
select * from hrdata;
#number of employees who resigned or left for any apparent reasons
select count(*) as number_of_employees_who_left from hrdata where Attrition='yes';
#number of departments under record
select distinct department from hrdata;
 select department,educationfield ,count(*) over(Partition  by educationfield) from hrdata order by department ;
# average satisfication rate for employees we opted to leave the organisation
select avg(jobsatisfaction) from hrdata where Attrition='Yes';
# number of male employees
Select count(*) males from hrdata where gender='male';
#group by department
Select department,count(*) males from hrdata where gender='male' group by department;
# number of favoured courses
select distinct educationfield from hrdata;
#pivoting employee count by educationfield;
select department,count(case when EducationField='Life sciences' then Gender else 0 end),
count(case when EducationField='other' then gender else 0 end),
count(case when EducationField='medical' then gender else 0 end),
count(case when EducationField='Marketing' then gender else 0 end),
count(case when EducationField='Technical degree' then gender else 0 end),
count(case when EducationField='Human Resources' then gender else 0 end)
 from hrdata group by Department;
 


