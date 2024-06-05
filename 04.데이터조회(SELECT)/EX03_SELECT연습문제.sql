USE world ;

-- 문제 1: COUNT()와 GROUP BY 사용
-- 1. country 테이블에서 대륙(Continent)별 나라의 수를 구하세요.
SELECT * FROM country; 

SELECT Continent, count(Name)
FROM country 
GROUP BY Continent
ORDER BY count(Name) DESC;


-- 문제 2: SUM()와 GROUP BY 사용
-- 2. country 테이블에서 대륙(Continent)별 전체 인구(Population)의 합계를 구하세요.
SELECT Continent, sum(Population) AS 대륙별인구
FROM country 
GROUP BY Continent
ORDER BY sum(Population) DESC;


-- 문제 3: AVG()와 GROUP BY 사용
-- 3. country 테이블에서 대륙(Continent)별 평균 인구(Population)를 구하세요.
SELECT Continent, round(avg(Population))
FROM country 
GROUP BY Continent
ORDER BY round(avg(Population)) DESC;


-- 문제 4: MAX()와 GROUP BY 사용
-- 4. country 테이블에서 대륙(Continent)별 최대 인구(Population)를 구하세요.
SELECT Continent, max(Population)
FROM country 
GROUP BY Continent
ORDER BY max(Population) DESC;


-- 문제 5: MIN()와 GROUP BY 사용
-- 5. country 테이블에서 대륙(Continent)별 최소 인구(Population)를 구하세요.
SELECT Continent, min(Population)
FROM country 
GROUP BY Continent
ORDER BY min(Population);


-- 문제 6: COUNT(DISTINCT)와 GROUP BY 사용
-- 6. countrylanguage 테이블에서 각 나라(CountryCode)별 사용되는 고유 언어(Language)의 수를 구하세요.
SELECT * FROM countrylanguage;

SELECT CountryCode, count(DISTINCT Language) AS 나라별사용고유언어수
FROM countrylanguage 
GROUP BY CountryCode
ORDER BY count(DISTINCT Language); 


-- 문제 7: GROUP BY와 HAVING 사용
-- 7. country 테이블에서 대륙(Continent)별 나라의 수가 10개 이상인 대륙의 이름과 나라의 수를 구하세요.
SELECT * FROM country; 

SELECT Continent, count(Name)
FROM country 
GROUP BY Continent
HAVING count(NAME) >=10 
ORDER BY count(Name); 


-- 문제 8: WHERE, 집계 함수, GROUP BY, ORDER BY 사용
-- 8. city 테이블에서 인구가 100만 이상인 도시들만을 대상으로 각 국가(CountryCode)별 도시의 수를 구하고,
--    도시의 수가 많은 순서대로 정렬하세요.
SELECT * FROM city; 

SELECT CountryCode, count(CountryCode) AS 국가별도시수
FROM city
WHERE Population >= 1000000
GROUP BY CountryCode
ORDER BY count(CountryCode) DESC; 


-- 문제 9: ROLLUP, 집계 함수, GROUP BY
-- 9. country 테이블에서 각 대륙(Continent)별, 지역(Region)별 총 인구(Population)를 구하세요.
--    ROLLUP을 사용하여 대륙별 총계와 전체 총계를 포함하세요.
SELECT * FROM country; 

SELECT Continent, Region, sum(Population) AS 총인구
FROM country 
GROUP BY Continent, Region
WITH ROLLUP; 
