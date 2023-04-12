-- 부서 테이블과 사원 테이블 조인(JOIN)
-- 1개 이상의 테이블을 연결할수 있다.

SELECT
    *
FROM
    dept;

SELECT
    *
FROM
    employee;

-- 사원번호, 사원명, 부서번호, 부서명을 출력하시오
SELECT
    emp.empno,
    emp.ename,
    emp.deptno,
    dep.deptname,
    emp.sal
FROM
    employee emp,
    dept     dep
WHERE
    emp.deptno = dep.deptno;
    
-- GROUP BY 절(소속등 그룹화), 조건절 HAVING 사용
-- 부서별 급여 총액을 구하시오
SELECT
    deptno   부서,
    SUM(sal) 급여총액,
    AVG(sal) 급여평균
FROM
    employee -- 검색1순위
GROUP BY
    deptno -- 2
HAVING
    AVG(sal) >= 3000000 -- 3
ORDER BY
    AVG(sal) ASC; --4
    
    COMMIT;