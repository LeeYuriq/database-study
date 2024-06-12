USE scott; 

-- count() : 행의 개수를 세는 집계함수 
SELECT * FROM emp;

-- 직원의 수 
SELECT count(*) FROM emp; -- 14
-- 직원 이름의 수  : 특정 컬럼명 지정
SELECT count(ename) FROM emp;  -- 14
-- 직원 상여금의 수 집계 : null값은 세지 않는다.
SELECT count(comm) FROM emp;  -- 4
-- 급여가 2000 이상인 직원 수 세기 (조건 명시) 
SELECT count(*) FROM emp 
WHERE sal >= 2000;  -- 6
-- 중복된 값을 제외하고 고유값의 개수만을 셀 때	
SELECT count(DISTINCT job) FROM emp; -- 5
SELECT DISTINCT job FROM emp;


-- 합계 : sum()
-- 숫자 타입의 열의 합계를 계산하는 함수

-- 모든 직원의 급여 합계
SELECT sum(sal) FROM emp ;  -- 29025
-- null 이 포함된 경우 null 제외한 합계 
SELECT sum(comm) FROM emp ; -- 2200
-- 셀렉션 : 20번 부서의 직원들 급여 합계 (조건)
SELECT sum(sal) FROM emp 
WHERE deptno = 20;	-- 10875


-- avg() : 숫자 타입의 컬럼의 평균 계산
SELECT avg(sal) FROM emp ;  -- 2073.2143


-- round() 함수 : 반올림과 함께 사용
SELECT round(avg(sal)) FROM emp ; -- 2073
SELECT round(avg(sal), 2) FROM emp ; -- 2073.21 | 소수점 2째자리 반올림
SELECT round(avg(sal), -2) FROM emp ; -- 2100 | 10의자리 반올림

-- max() : 열의 최대값을 반환 
-- 숫자 타입은 가장 큰 값
SELECT max(sal) FROM emp; -- 5000
-- 문자 타입은 문자셋 정수가 큰 값(A~Z의 경우 Z, ㄱ~ㅎ의 경우 ㅎ)
SELECT max(ename) FROM emp;  -- WARD
-- 날짜 타입은 최근 
SELECT max(hiredate) FROM emp; -- 1983-01-12

-- min() : 열의 최소값을 반환 
-- 가장 적은 수 
SELECT min(sal) FROM emp; -- 800
-- 가장 앞자리 문자 (A~Z의 경우 A, ㄱ~ㅎ의 경우 ㄱ)
SELECT min(ename) FROM emp;  -- ADAMS
-- 가장 오래된 날짜
SELECT min(hiredate) FROM emp; -- 1980-09-08

-- stddev() 표준 편차, var_samp() 분산 등 통계 함수가 있음. 
SELECT stddev(sal), var_samp(sal) FROM emp; 


-- GROUP BY 절 : 데이터를 그룹으로 묶어주는 역할
-- 지정된 열을 기준으로 그룹화하고, 집계함수를 적용

-- 부서별 직원 수 조회
SELECT deptno, count(*) FROM emp 
GROUP BY deptno ;

-- 부서별 급여 합계 조회
SELECT deptno, sum(sal) FROM emp 
GROUP BY deptno ;

-- 부서별 급여 평균 조회
SELECT deptno, avg(sal) FROM emp 
GROUP BY deptno ;

-- 부서별 최소, 최대 급여 조회
SELECT deptno, min(sal), max(sal) FROM emp 
GROUP BY deptno ;


-- HAVING 절 : GROUP BY로 그룹화된 데이터에 조건 적용시 사용 
-- 부서별 직원 수가 5명 이상인 부서 조회
SELECT deptno, count(*) FROM emp 
GROUP BY deptno 
HAVING count(*) >= 5 ;

-- 부서별 월급 합계가 10000 달러 이상인 부서 조회
SELECT deptno, sum(sal) FROM emp 
GROUP BY deptno 
HAVING sum(sal) >= 10000 ;

-- GROUP BY(그룹화) 와 HAVING(조건식)은 세트
-- WHERE 절은 데이터가 그룹화되기 전에 조건을 적용 (모든 개별 행)
-- HAVING 절은 데이터가 그룹화된 결과에 조건을 적용 (그룹별 단일 행)
SELECT deptno, sum(sal) FROM emp 
GROUP BY deptno
HAVING sum(sal) >= 10000; 

-- WHERE, HAVING 동시 사용
SELECT deptno, sum(sal) FROM emp 
WHERE sal >= 1500	-- 원래 테이블의 각 행에 조건 적용
GROUP BY deptno 
HAVING sum(sal) >= 5000; -- 그룹별 결과셋에 조건 적용


-- ROLLUP : 분류별 소합계 및 총합, 요약 정보를 얻을 때 
-- 그룹별로 데이터 분석을 하거나 요약 보고서를 작성할 때 사용
-- 결과 셋의 NULL 값은 소합계 또는 총계를 나타냄.

-- 부서별, 직업별 합계 및 전체 합계 구하기
SELECT deptno, job, sum(sal) FROM emp 
GROUP BY deptno, job 
WITH ROLLUP ; 

