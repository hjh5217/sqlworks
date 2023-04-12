-- 사원 테이블
CREATE TABLE emp (
-- 칼럼 이름  자료형 
    empno      NUMBER(3) PRIMARY KEY, -- 사원번호
    ename      VARCHAR2(20) NOT NULL, -- 사원이름
    sal        NUMBER(10),            -- 급여
    createdate DATE DEFAULT sysdate  -- 등록일
);

-- 사원의 성별 칼럼 추가 ( ALTER ~ ADD 칼럼이름 자료형)
ALTER TABLE emp ADD gender VARCHAR2(4);

-- 사원의 성별 자료형을 변경 -> MODIFY VARCHAR2(10)
ALTER TABLE emp MODIFY
    gender VARCHAR2(10);

-- 성별이 '여' 인 사원을 '여자' 로 변경
SELECT
    *
FROM
    emp
WHERE
    empno = 104;

UPDATE emp
SET
    gender = '여자'
WHERE
    empno = 104;

DESC emp;

-- 사원 추가
INSERT INTO emp VALUES (
    100,
    '이강',
    2500000,
    sysdate
);

INSERT INTO emp VALUES (
    101,
    '김산',
    3000000,
    sysdate
);

INSERT INTO emp VALUES (
    102,
    '오상식',
    5000000,
    sysdate
);

INSERT INTO emp VALUES (
    103,
    '박신입',
    '',
    sysdate
);

INSERT INTO emp VALUES (
    104,
    '서울시',
    1500000,
    sysdate,
    '여'
);

SELECT
    empno AS 사번,
    ename AS 사원명,
    sal   AS 급여
FROM
    emp;
    
-- 급여가 없는 사원을 검색하시오
-- NULL 이 아닌경우 IS NOT NULL
SELECT
    *
FROM
    emp
WHERE
    sal IS NULL;

-- 급여가 300만원 이하인 사원을 검색하시오
SELECT
    *
FROM
    emp
WHERE
    sal <= 3000000
ORDER BY
    sal DESC;

-- 급여가 많은 순으로 정렬
SELECT
    *
FROM
    emp
ORDER BY
    sal DESC;

-- 사원의 수를 구하시오
SELECT
    COUNT(*) AS 사원수
FROM
    emp;

-- 사원 급여의 합계와 평균

SELECT
    SUM(sal) 급여합계,
    AVG(sal) 급여평균
FROM
    emp;

-- 이름이 서울시 인 사원 삭제
DELETE FROM emp WHERE ename = '서울시';

ROLLBACK;

COMMIT;