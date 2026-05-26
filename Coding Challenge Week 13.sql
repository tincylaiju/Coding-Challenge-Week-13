-- create database company3;
use company3;
CREATE TABLE Employee (
Employee_id int AUTO_INCREMENT PRIMARY KEY,
First_name VARCHAR(50),
Last_name VARCHAR(50),
Salary int,
Joining_date Date,
Departement VARCHAR(50)
);

CREATE TABLE reward (
Employee_ref_id int,
date_reward Date,
amount int,
FOREIGN KEY (Employee_ref_id) REFERENCES Employee(Employee_id)
);

INSERT INTO Employee (Employee_id, First_name, Last_name, Salary, Joining_date,
Departement) VALUES (1, 'Bob', 'Kinto', 1000000, "2019-01-20", "Finance");
INSERT INTO Employee (Employee_id, First_name, Last_name, Salary, Joining_date,
Departement) VALUES (2, 'Jerry', 'Kansxo', 6000000, "2019-01-15", "IT");
INSERT INTO Employee (Employee_id, First_name, Last_name, Salary, Joining_date,
Departement) VALUES (3, 'Philip', 'Jose', 8900000, "2019-02-05", "Banking");
INSERT INTO Employee (Employee_id, First_name, Last_name, Salary, Joining_date,
Departement) VALUES (4, 'John', 'Abraham', 2000000, "2019-02-25", "Insurance");
INSERT INTO Employee (Employee_id, First_name, Last_name, Salary, Joining_date,
Departement) VALUES (5, 'Michael', 'Mathew', 2200000, "2019-02-28", "Finance");
INSERT INTO Employee (Employee_id, First_name, Last_name, Salary, Joining_date,
Departement) VALUES (6, 'Alex', 'chreketo', 4000000, "2019-05-10", "IT");
INSERT INTO Employee (Employee_id, First_name, Last_name, Salary, Joining_date,
Departement) VALUES (7, 'Yohan', 'Soso', 1230000, "2019-06-20", "Banking");
/* table reward */
INSERT INTO reward (Employee_ref_id, date_reward, amount) VALUES (1, '2019-05-11',
'1000');
INSERT INTO reward (Employee_ref_id, date_reward, amount) VALUES (2, '2019-02-15',
'5000');
INSERT INTO reward (Employee_ref_id, date_reward, amount) VALUES (3, '2019-04-22',
'2000');
INSERT INTO reward (Employee_ref_id, date_reward, amount) VALUES (1, '2019-06-20',
'8000');

#Get the length of the text in the “First_name” column.
Select First_name,Length(First_name) as Name_Length From Employee;

#Get the employee’s first name after replacing ‘o’ with ‘#’.
Select Replace(First_name,'o','#') as modified_name From Employee;

#Get the employee’s last name and first name in a single column separated by a ‘_’.
Select concat(Last_name,'_',Last_name) as Full_name From Employee;

#Get the year, month, and day from the “Joining_date” column
Select Year(Joining_date) as Year, Month(Joining_date) as Month, Day(Joining_date) as Date From Employee;

#Get all employees in ascending order by first name.
Select * From Employee Order by First_name asc;

#Get all employees in descending order by first name.
Select * From Employee Order by First_name desc;

#Get all employees in ascending order by first name and descending order by salary.
Select * From Employee Order by First_name asc,Salary desc;

#Get employees whose first name is “Bob”.
Select * From Employee Where First_name = "Bob";

#Get employees whose first name is “Bob” or “Alex”.
Select * From Employee Where First_name IN ("Bob","Alex");

#Get employees whose first name is neither “Bob” nor “Alex”.
Select * From Employee Where First_name NOT IN ("Bob","Alex");

#Get all the details about employees whose first name begins with ‘B’.
Select * From Employee Where First_name Like 'B%';

#Get all the details about employees whose first name contains ‘o’.
Select * From Employee Where First_name Like '%o%';

#Get all the details of the employees whose first name ends with ‘n’.
Select * From Employee Where First_name Like '%n';

#Get all the details about employees whose first name ends with ‘n’ and contains 4 letters.
Select * From Employee Where First_Name Like'___n';

#Get all the details about employees whose first name begins with ‘J’ and contains 4 letters
Select * From Employee Where First_Name Like 'J___';

#Get all the details of employees whose salary is over 3,000,000.
Select * From Employee Where Salary > 3000000;

#Get all the details about employees whose salary is less than 3,000,000.
Select * From Employee Where Salary < 3000000;

#Get all the details about employees with a salary between 2,000,000 and 5,000,000
Select * From Employee Where Salary Between 2000000 And 5000000;

#Get all the details about employees whose first name is ‘Bob’ or ‘Alex’.
Select * From Employee Where First_name IN ("Bob","Alex");

#Get all the details about employees whose joining year is “2019”.
Select * From Employee Where Year(Joining_Date) = 2019;

#Get all the details on employees whose participation month (Joining_date) is “January”
Select * From Employee Where Monthname(Joining_Date) = 'January';

#Get all the details of the employees who joined before March 1, 2019
Select * From Employee Where Joining_Date < '2019-03-01';

#Get all the details on employees who joined after March 31, 2019
Select * From Employee Where Joining_Date > '2019-03-31';

#Get the date and time of the employee’s enrollment
Select Joining_Date From Employee;

#Get the date and time, including milliseconds of the employee’s membership
Select Employee_id, DATE_FORMAT(Joining_date,'%Y-%m-%d %H:%i:%s.%f') as membership_datetime From Employee;

#Get the difference between the “Joining_date” and “date_reward” column
Select E.Employee_id,DATEDIFF(R.date_reward,E.Joining_date) as Days_Difference
From Employee E Join reward R ON E.Employee_id = R.Employee_ref_id;

#Get the current date and time.
Select Now();

#Get the first names of employees who have the character ‘%’. Example: ‘Jack%’
Select First_Name From Employee Where First_Name Like '%\%%';

#Get the employee name (Last_name) after replacing the special character with white space.
Select Last_name, Replace(Last_name,'%',' ') as Modified_Last_Name From Employee;

#Get the employee’s department and total salary, grouped by department.
Select Departement, Sum(Salary) As Total_Salary From Employee Group By Departement;

