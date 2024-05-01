-- 데이터베이스 생성
-- IF NOT EXISTS : 존재하지 않을 떄만 생성(오류 회피)
CREATE DATABASE test_db;
USE test_db;	-- 사용

-- 테이블 생성 문법
-- CREATE TABLE 테이블명(
-- 	컬럼명1 데이터타입 제약조건,
--     컬럼명2 데이터타입 제약조건,
--     ....
--     추가 제약조건
-- );
CREATE TABLE employees (
	employee_id INT NOT NULL,	-- 숫자, NULL 불허용
    first_name VARCHAR(50),		-- 문자, NULL 허용
    last_name VARCHAR(50),		-- 문자, NULL 허용
    PRIMARY KEY (employee_id)
);

-- 테이블 정보 확인
DESCRIBE employees;

SELECT * FROM employees;	-- 테이블 조회

-- 도메인 제약조건 위반(타입 불일치)하는 데이터를 입력했을 경우
INSERT INTO `test_db`.`employees`(`employee_id`, `first_name`, `last_name`) VALUES ('가나다', '가', '나');


-- 데이터 타입(도메인 제약조건)에 맞는 데이터를 입력하면 정상 수행
INSERT INTO `test_db`.`employees` (`employee_id`, `first_name`, `last_name`) VALUES ('1', '길동', '홍');

-- Null 허용 컬럼에 값을 입력하지 않아도 정상 수행
INSERT INTO `test_db`.`employees` (`employee_id`) VALUES ('2');



