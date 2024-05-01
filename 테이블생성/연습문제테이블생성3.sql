/*
테이블 생성 연습문제 3

- `customer_accounts`라는 이름의 새로운 테이블을 생성하십시오.

- 이 테이블은 고객 계정 정보를 저장하며, 다음과 같은 컬럼을 포함해야 합니다:
  - `account_id` (INT, 기본키, NULL 불허용)
  - `customer_name` (VARCHAR(100), NULL 불허용)
  - `email` (VARCHAR(100), NULL 불허용, 유니크 제약조건)
  - `phone_number` (VARCHAR(15), 유니크 제약조건, NULL 허용)

*/

use test_db;

CREATE TABLE customer_accounts (
	account_id INT PRIMARY KEY NOT NULL,
	customer_name VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL UNIQUE,
	phone_number VARCHAR(15) UNIQUE
);

DESC customer_accounts;

SELECT * FROM customer_accounts;