DROP SCHEMA IF EXISTS exercise;
CREATE SCHEMA IF NOT EXISTS exercise;
USE exercise;

/*
### 문제: 다양한 타입과 제약조건을 활용하여 테이블 생성하기

문제 설명
새로운 데이터베이스 스키마를 설계하고 다음 요구사항을 만족하는 테이블을 생성하세요.

스키마 설명
- departments: 회사의 부서 정보를 저장하는 테이블
- employees: 부서에 소속된 직원 정보를 저장하는 테이블
- projects: 회사에서 진행 중인 프로젝트 정보를 저장하는 테이블
- assignments: 직원이 프로젝트에 배정된 정보를 저장하는 테이블

제약조건
1. 각 테이블은 기본 키(Primary Key)를 가져야 합니다.
2. 적절한 데이터 타입을 사용하고 `NOT NULL`, `UNIQUE`, `CHECK`, `DEFAULT` 등의 제약조건을 활용하세요.
3. 외래 키(Foreign Key)로 테이블 간의 관계를 설정하고 참조 옵션을 사용하세요.

요구사항
1. departments 테이블
   - dept_id: 부서 ID (자동 증가, 기본 키)
   - dept_name: 부서 이름 (고유해야 함)
   - location: 부서 위치

2. employees 테이블
   - emp_id: 직원 ID (자동 증가, 기본 키)
   - emp_name: 직원 이름 (필수)
   - hire_date: 입사 날짜 (필수)
   - salary: 급여 (필수, 양수만 허용)
   - dept_id: 부서 ID (외래 키, `ON DELETE SET NULL`, `ON UPDATE CASCADE`)

3. projects 테이블
   - project_id: 프로젝트 ID (자동 증가, 기본 키)
   - project_name: 프로젝트 이름 (필수, 고유해야 함)
   - start_date: 프로젝트 시작 날짜 (기본값은 현재 날짜)
   - end_date: 프로젝트 종료 날짜 (종료 날짜가 시작 날짜 이후여야 함)

4. assignments 테이블
   - assignment_id: 배정 ID (자동 증가, 기본 키)
   - emp_id: 직원 ID (외래 키, `ON DELETE CASCADE`, `ON UPDATE CASCADE`)
   - project_id: 프로젝트 ID (외래 키, `ON DELETE CASCADE`, `ON UPDATE CASCADE`)

모든 테이블을 생성하고 적절한 외래 키 관계를 설정한 후 각 테이블의 구조를 확인하세요.
*/

CREATE TABLE departments(
	dept_id INT AUTO_INCREMENT PRIMARY KEY ,
    dept_name VARCHAR(255) UNIQUE,
    location VARCHAR(255)
);

CREATE TABLE employees(
	emp_id INT AUTO_INCREMENT PRIMARY KEY ,
	emp_name VARCHAR(255) NOT NULL,
    hire_date DATE NOT NULL,
    salary INT CHECK(salary > 0) NOT NULL, 
    dept_id INT, -- 외래키
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
    ON DELETE SET NULL 
    ON UPDATE CASCADE
);

CREATE TABLE projects (
	project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(255) NOT NULL UNIQUE,
    start_date DATE DEFAULT (CURRENT_DATE),
    end_date DATE,
    CHECK(end_date > start_date)  -- CHECK (end_date IS NULL OR end_date > start_date)
);

CREATE TABLE assignments (
	assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT, -- 외래키 
    project_id INT, -- 외래키
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    ,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- 데이터 확인
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM projects;
SELECT * FROM assignments;

-- 테이블 구조 확인
DESCRIBE departments;
DESCRIBE employees;
DESCRIBE projects;
DESCRIBE assignments;


-- departments 테이블 데이터 삽입
INSERT INTO departments (dept_name, location)
VALUES ('개발팀', '부산'),
       ('영업팀', '서울'),
       ('마케팅팀', '창원');

-- employees 테이블 데이터 삽입
INSERT INTO employees (emp_name, hire_date, salary, dept_id)
VALUES ('홍길동', '2022-01-15', 3200000, 1),
       ('김철수', '2023-03-01', 2700000, 2),
       ('박영희', '2021-07-01', 2900000, 3);

-- projects 테이블 데이터 삽입
INSERT INTO projects (project_name, start_date, end_date)
VALUES ('웹사이트 프로젝트', '2023-01-01', '2023-06-30'),
       ('쇼핑몰 프로젝트', '2023-02-01', '2023-12-31'),
       ('마케팅 프로젝트', '2023-03-01', NULL);

-- assignments 테이블 데이터 삽입
INSERT INTO assignments (emp_id, project_id)
VALUES (1, 1),
       (1, 2),
       (2, 2),
       (3, 3);
       

-- DELETE SET NULL
DELETE FROM departments WHERE dept_id = 1;
SELECT * FROM employees;

-- UPDATE CASCADE
UPDATE projects SET project_id = 100
 WHERE (project_id = 3);
SELECT * FROM assignments;
