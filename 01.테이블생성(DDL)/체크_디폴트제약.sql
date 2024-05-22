-- 체크 제약조건
-- 해당 속성(컬럼, 열)에서 입력될 수 있는 데이터 범위를 제한
-- 조건에 만족하는 데이터만 입력 가능

use test_db;
CREATE TABLE adults (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT,
    CHECK (age >= 19)
    -- age 속성에 값이 들어올 때 19세 이상인지 확인
);

DESC adults;		-- 체크제약조건 확인 안됨

SELECT * FROM adults;

-- 속성 값 해당 조건(19세 이상)이 아닌 경우 체크 제약조건 위배
INSERT INTO `test_db`.`adults` (`id`, `name`, `age`) VALUES ('2', '미성년', '15');


-- Default 제약조건
-- 해당 속성에 대한 기본 값을 설정
-- 만약 값이 명시되지 않으면(null), 지정된 기본 값이 자동으로 입력
CREATE TABLE member(
	id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    status  VARCHAR(50) DEFAULT '활동중',		-- 회원의 활동여부 기본값 "활동중"
    join_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP 	-- 가입일 기본값
);

DESC member;

SELECT * FROM member;

-- 값을 지정하지 않아도 설정된 기본값 입력
INSERT INTO member (id, name) VALUES (2, "김철수");

--  Auto Increment (AI)
 -- MySQL에서 사용되는 제약조건
 -- 기본 키에 주로 사용되는, 새로운 행이 추가될 떄마다 자동으로 숫자가 증가되는 제약조건
 
CREATE TABLE persons (
    person_id INT AUTO_INCREMENT PRIMARY KEY,  -- 자동 증가하는 기본키
    person_name VARCHAR(50)
);
DESC persons;
 
SELECT * FROM persons;

-- AI의 해당 컬럼을 생략해도 자동으로 값이 1씩 증가하며 채워진다.
INSERT INTO person_name VALUES ('김철수');
INSERT INTO person_name VALUES ('김영희');
INSERT INTO person_name VALUES ('홍길동');