CREATE TABLE SALARIES(
ID NUMBER(*,0) primary key,
EMPLOYEE_ID NUMBER(*,0) NOT NULL,
PROJECT_ID NUMBER(*,0),
SALARY NUMBER(10,2) NOT NULL
);

CREATE TABLE EMPLOYEES(
ID NUMBER(*,0) primary key,
MANAGER_ID NUMBER(*,0),
DATE_OF_JOINING DATE NOT NULL,
FULL_NAME VARCHAR2(255 BYTE) NOT NULL
);

CREATE TABLE PROJECTS(
ID NUMBER(*,0) primary key,
CODE VARCHAR2(255 BYTE) NOT NULL,
MANAGER_ID NUMBER(*,0),
BUDGET NUMBER(10,2) NOT NULL,
DATE_OF_BEGINNING DATE,
DATE_OF_ENDING DATE
);

ALTER TABLE SALARIES
ADD CONSTRAINT FK_SALARY_EMPLOYEE
FOREIGN KEY (EMPLOYEE_ID)
REFERENCES EMPLOYEES(id);

ALTER TABLE SALARIES
ADD CONSTRAINT FK_SALARY_PROJECT
FOREIGN KEY (PROJECT_ID)
REFERENCES PROJECTS(ID);

ALTER TABLE PROJECTS
ADD CONSTRAINT FK_MANAGER_PROJECT
FOREIGN KEY (MANAGER_ID)
REFERENCES EMPLOYEES(ID);

ALTER TABLE EMPLOYEES
ADD CONSTRAINT FK_MANAGER
FOREIGN KEY (MANAGER_ID)
REFERENCES EMPLOYEES(ID);

ALTER TABLE SALARIES
    ADD CONSTRAINT ACCEP_SALARY CHECK (SALARY>500);
    
    SELECT * FROM EMPLOYEES;
     SELECT * FROM SALARIES;
      SELECT * FROM PROJECTS;
    
--Write a SQL query to count the number of employees working in project '48205501099'



SELECT e.FULL_NAME FROM SALARIES sa 
INNER JOIN EMPLOYEES e ON e.ID=sa.EMPLOYEE_ID
INNER JOIN PROJECTS pr ON pr.ID=sa.PROJECT_ID
WHERE pr.CODE='44905736599';


--Write a SQL query to fetch employee names (one column, don't change the alias)
--having salary greater than or equal to 2500 and less than or equal 3000.

SELECT em.FULL_NAME FROM EMPLOYEES em
INNER JOIN SALARIES sa ON em.ID=sa.EMPLOYEE_ID
WHERE sal.SALARY>=1000 AND sal.SALARY<=2500;
--Write a SQL query to fetch project code and count of employees (code, counter) sorted by counter in ascending order. example 48205501099, 4

-- Write a query to fetch employee names of those who are not assigned to any project




-- Write a SQL query to fetch all the Employees who are also managers from employees table
--Write a SQL query to fetch each employee with the name of his/her boss in one column named "employee_boss" separated by ' - ' (don't forget the spaces). Example: "Drew Rosario - Holmes Manning", "Emery Kelley - Holmes Manning" (employee name - manager name)
--Write a SQL query to fetch all the employees which first name is Kermit
