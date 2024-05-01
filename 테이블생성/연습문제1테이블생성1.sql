/*
- 테이블 생성 연습문제

- 요구사항:
- products라는 이름의 새로운 테이블을 생성하십시오.

이 테이블은 다음과 같은 컬럼을 포함해야 합니다:
- product_id (INT, 기본키, NULL 불허용)
- product_name (VARCHAR(100), NULL 불허용)
- price (DECIMAL(10,2), NULL 불허용)
- stock_quantity (INT, NULL 불허용)
- supplier_id (INT, NULL 허용)

*/

use test_db;

CREATE TABLE products(
	product_id INT PRIMARY KEY NOT NULL,
	product_name VARCHAR(100) NOT NULL,
	price DECIMAL(10,2) NOT NULL,
	stock_quantity INT NOT NULL,
	supplier_id INT
);

DESC products;

SELECT * FROM products;
