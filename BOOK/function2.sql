-- function
-- NULL 값 처리하기

SELECT
    *
FROM
    customer
WHERE
    phone IN NULL;

-- NVL(칼럼값, 특정값) : 칼럼이름 NULL인 경우는 특정값을 출력, NULL이 아니면 칼럼값 출력
SELECT
    custid,
    custname,
    address,
    nvl(phone, '010-1234-5678')
FROM
    customer;

CREATE TABLE k1 (
    id  VARCHAR2(3),
    cnt NUMBER(2)
);

INSERT INTO k1 VALUES (
    '가',
    5
);

INSERT INTO k1 VALUES (
    '나',
    NULL
);

INSERT INTO k1 VALUES (
    '다',
    5
);

INSERT INTO k1 VALUES (
    '라',
    NULL
);

INSERT INTO k1 VALUES (
    '마',
    10
);

SELECT
    *
FROM
    k1;

--전체 개수, 합계, 평균, 최소값
SELECT
    COUNT(cnt)
FROM
    k1; -- 3개

--NULL을 0으로 바꿈
SELECT
    COUNT(nvl(cnt, 0)) cnt
FROM
    k1; -- 5

SELECT
    SUM(nvl(cnt, 0)) / 4 sum
FROM
    k1; -- 5

SELECT
    AVG(nvl(cnt, 0)) average
FROM
    k1; -- 4

SELECT
    MIN(nvl(cnt, 5)) average
FROM
    k1; -- 5

COMMIT;

DROP TABLE k1;


-- RANK() 함수
SELECT
    *
FROM
    employee;

SELECT
    ename,
    sal,
    RANK()
    OVER(
        ORDER BY
            sal DESC
    ) 급여_rank,
    DENSE_RANK()
    OVER(
        ORDER BY
            sal DESC
    ) 급여_dense_rank
FROM
    employee;
    
    