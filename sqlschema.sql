create table "departments"(
    "dept_no" VARCHAR NOT NULL,
    "dept_name" VARCHAR NOT NULL
);
SELECT * FROM "departments";

create table "dept_emp"(
    "emp_no" INT NOT NULL,
    "dept_no" VARCHAR NOT NULL,
    "from_date" DATE NOT NULL,
    "to_date" DATE NOT NULL
);
SELECT * FROM "dept_emp";

create table "dept_manager"(
    "dept_no" VARCHAR NOT NULL,
    "emp_no" INT NOT NULL,
    "from_date" DATE NOT NULL,
    "to_date" DATE NOT NULL
);
SELECT * FROM "dept_manager";

create table "employees"(
    "emp_no" INT NOT NULL,
    "birth_date" DATE NOT NULL,
    "first_name" VARCHAR NOT NULL,
    "last_name" VARCHAR NOT NULL,
    "gender" VARCHAR NOT NULL,
    "hire_date" DATE NOT NULL
);
SELECT * FROM "employees";

create table "salaries"(
    "emp_no" INT NOT NULL,
    "salary" INT NOT NULL,
    "from_date" DATE NOT NULL,
    "to_date" DATE NOT NULL
);
SELECT * FROM "salaries";

create table "titles"(
    "emp_no" INT NOT NULL,
    "title" VARCHAR NOT NULL,
    "from_date" DATE NOT NULL,
    "to_date" DATE NOT NULL
);
SELECT * FROM "titles";

-- analysis 1
SELECT 
	"employees"."emp_no",
    "employees"."first_name",
    "employees"."last_name",
    "employees"."gender",
	"salaries"."salary"
FROM "employees"
INNER JOIN "salaries" ON ("employees"."emp_no" = "salaries"."emp_no")

-- analysis 2
SELECT 
	"employees"."emp_no",
	"employees"."first_name",
    "employees"."last_name",
    "salaries"."from_date"
FROM "employees"
INNER JOIN "salaries" ON ("employees"."emp_no" = "salaries"."emp_no")
WHERE "salaries"."from_date" BETWEEN '1986-01-01' AND '1986-12-13'

-- analysis 3
SELECT 
	"dept_manager"."dept_no",
	"departments"."dept_name",
	"dept_manager"."emp_no",
    "employees"."last_name",
	"employees"."first_name",
	"dept_manager"."from_date",
	"dept_manager"."to_date"
FROM "dept_manager"
JOIN "employees" ON ("dept_manager"."emp_no" = "employees"."emp_no")
JOIN "departments" ON ("dept_manager"."dept_no" = "departments"."dept_no")

-- analysis 4
SELECT
	"employees"."emp_no",
	"employees"."first_name",
    "employees"."last_name",
	"departments"."dept_name"
FROM "employees"
JOIN "dept_emp" ON ("employees"."emp_no" = "dept_emp"."emp_no")
JOIN "departments" ON ("dept_emp"."dept_no" = "departments"."dept_no")

-- analysis 5
SELECT * FROM "employees"
WHERE "first_name" = 'Hercules' AND "last_name" LIKE 'B%'

-- analysis 6
SELECT
	"employees"."first_name",
    "employees"."last_name",
	"departments"."dept_name"
FROM "employees"
JOIN "dept_emp" ON ("employees"."emp_no" = "dept_emp"."emp_no")
JOIN "departments" ON ("dept_emp"."dept_no" = "departments"."dept_no")
WHERE "departments"."dept_name" = 'Sales'

-- analysis 7
SELECT
	"employees"."first_name",
    "employees"."last_name",
	"departments"."dept_name"
FROM "employees"
JOIN "dept_emp" ON ("employees"."emp_no" = "dept_emp"."emp_no")
JOIN "departments" ON ("dept_emp"."dept_no" = "departments"."dept_no")
WHERE "departments"."dept_name" = 'Sales' OR "departments"."dept_name" = 'Development'

-- analysis 8
SELECT
	"employees"."last_name",
	COUNT (*) "last_name"
FROM 
	"employees"
GROUP BY
	"last_name"
ORDER BY
	"employees"."last_name" DESC;