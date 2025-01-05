SELECT ID,
		FirstName,
		LastName,
		Country
FROM training.dbo.employee
----------------------------------------------------
-- Types of Removing duplicates from a Table
-----------------------------------------------
Select 
		FirstName,
		LastName,
		Country,
		count(*)
FROM training.dbo.employee
group by 
		FirstName,
		LastName,
		Country
HAVING COUNT(*)>1
-----------------------------
--(Optional)-------------
Select DISTINCT
		FirstName,
		LastName,
		Country
FROM training.dbo.employee 

----------------------------------------
--You can use cte instead of subquery--
----------------------------------------
SELECT *
		from 
	(Select 	FirstName,
			LastName,
			Country,
			RANK() OVER(Partition By FirstName,
			LastName,
			Country 
			order by ID)ran
	FROM training.dbo.employee )b
WHERE b.ran<>1

--------------------------------
	SELECT 
		FirstName,
		LastName,
		Country
	FROM training.dbo.employee 
	Where Id NOT IN (
		Select MAX(ID) FROM training.dbo.employee 
		GROUP BY FirstName,
		LastName,
		Country
		)
---------------------------------------------
--In SSIS, we can use SORT component to remove duplicate records
--(Open sort component and select check box that is present in down left hand side)
-------------------------------------------
--Insert new records
-------------------------------------------
INSERT INTO employee(Firstname,LastName,Country)
	SELECT b.* FROM
		(
			Select 'Raj'as FirstName, 'Gupta' as LastName, 'India' as Country
			union
			Select 'James'as FirstName, 'Barry' as LastName, 'UK' as Country
		)b
	LEFT JOIN employee c
	ON b.FirstName=c.FirstName
	AND b.LastName=c.LastName
	AND b.Country=c.Country
	WHERE C.FirstName IS NULL


--------------------------------------------------------------------------------

select max(id) from training.dbo.employee where id not in (select max(id) from training.dbo.employee)

-----------------------------------------------------------------------------
 ---whose salary is greater than avg of salary---

select empid
FROM emp
where salary> (select avg(salary) from emp )
option (recompile)
select * from emp

UPDATE STATISTICS emp
--------------------------------------------------------------------------------
SELECT @@SPID



