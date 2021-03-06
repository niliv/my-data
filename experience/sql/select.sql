-- select

-- mqsql
select * from departments where location_id=4
alter table employees add column salary float(9,2)
select last_name, salary*12+100 from employees
alter table employees add column commistion_pct float(9,2)
select salary+commistion_pct from employees  -- 空值计算返回都是空
select last_name name,salary 'salary me' FROM employees --别名 单引号双引号都可以
select CONCAT(employees_id,'#',last_name,'#',email,'#',salary,'#',commistion_pct) from employees  -- 连接使用concat
select DISTINCT dept_id from employees
SELECT * FROM employees WHERE salary<>3000
SELECT * FROM employees WHERE last_name LIKE '_2%'
select * from employees WHERE last_name not LIKE '%u%'
select * from employees WHERE salary BETWEEN 2000 AND 8000
SELECT * from employees WHERE salary in (2000,5000,8000)
SELECT * from employees WHERE commistion_pct is null
SELECT * from employees WHERE commistion_pct is not null
select * from employees ORDER BY salary DESC




-- 表达式
select EMPLOYEE_ID,FIRST_NAME, SALARY, (SALARY*12+100) as SALARY from EMPLOYEES
select EMPLOYEE_ID,FIRST_NAME, SALARY, (SALARY+100)*12 as SALARY from EMPLOYEES

-- 空值计算返回都是空
select EMPLOYEE_ID,FIRST_NAME, SALARY, (SALARY*12*COMMISSION_PCT) SALARY from EMPLOYEES 

-- 别名可以用as或者空格，小写自动转成大写
select EMPLOYEE_ID,FIRST_NAME, SALARY, COMMISSION_PCT comm from EMPLOYEES 
-- 别名有特殊符号，需要用双引号，不会自动转成大写
select EMPLOYEE_ID,FIRST_NAME, SALARY*12 "Annual Salary" from EMPLOYEES 

-- 连接符
select LAST_NAME || FIRST_NAME from EMPLOYEES 
select LAST_NAME || SALARY, LAST_NAME || 12*SALARY from EMPLOYEES
select LAST_NAME || JOB_ID as "Employee" from EMPLOYEES

-- 文字字符串 单引号
select LAST_NAME || ' is a ' || JOB_ID as "Employee Details" from EMPLOYEES
select LAST_NAME || 55 || JOB_ID as "Employee Details" from EMPLOYEES

-- 去除重复行
select DISTINCT DEPARTMENT_ID from EMPLOYEES
-- DISTINCT作用后面所有字段
select DISTINCT DEPARTMENT_ID,LAST_NAME from EMPLOYEES ORDER BY LAST_NAME

--where 约束
select LAST_NAME,JOB_ID,DEPARTMENT_ID from EMPLOYEES WHERE DEPARTMENT_ID=90
--字符串和日期 单引号 大小写敏感 DD-MON-RR 日月年  月：1月/jan
SELECT JOB_ID from EMPLOYEES where LAST_NAME='King'
select LAST_NAME,DEPARTMENT_ID,JOB_ID from EMPLOYEES where HIRE_DATE='24-jan-2006'
-- = > < <= >= <>
SELECT * from EMPLOYEES where SALARY<=3000
-- BETWEEN AND
select LAST_NAME,SALARY from EMPLOYEES WHERE SALARY BETWEEN 2500 and 3500
-- IN
select LAST_NAME,SALARY,EMPLOYEE_ID,MANAGER_ID from EMPLOYEES where MANAGER_ID IN (100,101,201)
-- LIKE 匹配符% 占位符 _  转义符 ESCAPE
SELECT	LAST_NAME FROM EMPLOYEES WHERE LAST_NAME LIKE '%A%'
SELECT	LAST_NAME FROM EMPLOYEES WHERE LAST_NAME LIKE '_a%' --第2个是a的
SELECT	LAST_NAME,HIRE_DATE FROM EMPLOYEES where HIRE_DATE like '%05'
-- SELECT LAST_NAME,JOB_ID from EMPLOYEES where JOB_ID like 'SA\_%' ESCAPE '\' --告诉sql语句\是转义符号

-- is NULL
SELECT LAST_NAME,JOB_ID,COMMISSION_PCT from EMPLOYEES where COMMISSION_PCT is NOT NULL
-- AND OR NOT
SELECT EMPLOYEE_ID,JOB_ID,SALARY FROM EMPLOYEES WHERE JOB_ID LIKE '%MAN%' and SALARY>=10000
SELECT EMPLOYEE_ID,JOB_ID,SALARY FROM EMPLOYEES WHERE JOB_ID LIKE '%MAN%' or SALARY>=10000
SELECT LAST_NAME,JOB_ID from EMPLOYEES where JOB_ID not in ('IT_PROG','ST_CLERK','SA_REP')
-- 优先级从高到低
-- 算术 连字 比较 (is null like in)  BETWEEN not and or
select LAST_NAME,JOB_ID,SALARY from EMPLOYEES where JOB_ID='SA_REP' or JOB_ID='AD_PRES' AND SALARY>15000
select LAST_NAME,JOB_ID,SALARY from EMPLOYEES where (JOB_ID='SA_REP' or JOB_ID='AD_PRES') AND SALARY>15000

-- ORDER BY 默认 升序 ASC 降序 DESC 可以指定没有投影的字段
-- 字符值顺序 A-Z
-- ASC 空值在最后 DESC 空值在开始
SELECT LAST_NAME from EMPLOYEES ORDER BY SALARY ASC
SELECT LAST_NAME,HIRE_DATE,SALARY,COMMISSION_PCT from EMPLOYEES order by HIRE_DATE
-- 别名排序
SELECT LAST_NAME as name,HIRE_DATE,SALARY,COMMISSION_PCT from EMPLOYEES order by name
-- 两个列排序 先排第一个，中间用第二个，单个列表可以加asc或desc
SELECT HIRE_DATE, SALARY from EMPLOYEES ORDER BY HIRE_DATE,SALARY
SELECT HIRE_DATE, SALARY from EMPLOYEES ORDER BY HIRE_DATE,SALARY desc

-- 练习
SELECT LAST_NAME from EMPLOYEES where EMPLOYEE_ID=176
SELECT LAST_NAME,SALARY from EMPLOYEES where SALARY NOT BETWEEN 5000 and 12000

select LAST_NAME,JOB_ID,HIRE_DATE from EMPLOYEES where HIRE_DATE BETWEEN '22-feb-02' and '01-may-07' ORDER BY HIRE_DATE

select LAST_NAME,DEPARTMENT_ID from EMPLOYEES where DEPARTMENT_ID IN (20,50) ORDER BY LAST_NAME

select LAST_NAME as Employee,SALARY as "Monthly Salary" from EMPLOYEES where (SALARY BETWEEN 5000 and 12000) and DEPARTMENT_ID in (20,50)

SELECT LAST_NAME,HIRE_DATE from EMPLOYEES WHERE HIRE_DATE like '%04'

select LAST_NAME,JOB_ID from EMPLOYEES WHERE MANAGER_ID is NULL

SELECT LAST_NAME,SALARY,COMMISSION_PCT from EMPLOYEES WHERE COMMISSION_PCT is NOT null ORDER BY SALARY DESC,COMMISSION_PCT DESC

SELECT LAST_NAME from EMPLOYEES WHERE LAST_NAME like '__a%'

select LAST_NAME from EMPLOYEES WHERE LAST_NAME LIKE '%a%' and LAST_NAME LIKE '%e%'

SELECT LAST_NAME,JOB_ID,SALARY from EMPLOYEES WHERE JOB_ID in ('SA_REP','ST_CLERK') and SALARY not in (2500,3500,7000)

SELECT LAST_NAME,SALARY,COMMISSION_PCT from EMPLOYEES where COMMISSION_PCT = .2
















