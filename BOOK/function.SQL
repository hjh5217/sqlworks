-- 숫자 타입의 함수
-- 제공된 테이블 : dual
SELECT
    abs(- 10),
    abs(10)
FROM
    dual;

SELECT
    round(3.875, 2)
FROM
    dual;

SELECT
    *
FROM
    employee;

    --반올림
SELECT
    sal                  급여,
    sal / 30             일급,
    round(sal / 30, 0)   결과1,
    round(sal / 30, 1)   결과2,
    round(sal / 30, 2)   결과3,
    round(sal / 30, - 1) 결과4
FROM
    employee;
    
    --내림
SELECT
    sal                  급여,
    sal / 30             일급,
    round(sal / 30, 0)   결과1,
    trunc(sal / 30, 1)   결과2,
    trunc(sal / 30, 2)   결과3,
    trunc(sal / 30, - 1) 결과4
FROM
    employee;

SELECT
    *
FROM
    orders;

--고객별 평균 주문 금액을 백원 단위로 반올림한 값을 구하시오
SELECT
    custid     고객번호,
    round(AVG(saleprice),
          - 2) 평균금액
FROM
    orders
GROUP BY
    custid;

SELECT
    custid         고객번호,
    COUNT(*)       주문수,
    SUM(saleprice) 총액
FROM
    orders
GROUP BY
    custid;

SELECT
    custid     고객번호,
    round(SUM(saleprice) / COUNT(*),
          - 2) 평균금액
FROM
    orders
GROUP BY
    custid;
    

--문자 타입 함수
SELECT
    lower('ABCD')
FROM
    dual;

--SUBSTR(문자, 인덱스, 글자수)
SELECT
    substr('ABC', 1, 2) result
FROM
    dual;

-- REPLACE(문자, 이전문자, 새로운문자)
SELECT
    replace('ABC', 'A', 'E') result
FROM
    dual;

-- 부서 이름에서 처음부터 시작해서 2개의 문자 출력
SELECT
    substr(deptname, 1, 2) 부서명
FROM
    dept;


-- 도서 제목에 '야구'가 포함된 도서를 '농구'로 변경하여 검색
SELECT
    replace(bookname, '야구', '농구') 책명
FROM
    book;
-- CONCAT(문자1,문자2) 문자 연결
SELECT
    concat('A', 'B') result
FROM
    dual;
-- 연결연산자 - '||
SELECT
    '안녕' || '하세요' result
FROM
    dual;
-- LPAD(문자, 문자수, 기호) 왼쪽부터 채움
SELECT
    lpad('cloud', 10, '*')
FROM
    dual;
-- RPAD 오른쪽부터
SELECT
    rpad('cloud', 10, '*')
FROM
    dual;

-- 굿스포츠에서 출판한 도서의 제목과 제목의 문자 수, 바이트 수를 검색
-- 한글 3Byte, 영어나 특수기호 1Byte
SELECT
    bookname,
    length(bookname) 문자수,
    lengthb(bookname)
FROM
    book
WHERE
    publisher = '굿스포츠';
    

-- 날짜 함수
SELECT
    sysdate - 20
FROM
    dual;

SELECT
    systimestamp
FROM
    dual;

-- 3개월 후의 날짜 출력
SELECT
    add_months(sysdate, 3) 결과
FROM
    dual;

SELECT
    add_months(sysdate, - 3) 결과
FROM
    dual;

SELECT
    add_months('2023:04:01', - 3) 결과
FROM
    dual;


--주문번호가 6에서 10사이인 도서의 주문일에 3개월을 더한 값을 구하시오.
-- 1. 주문번호가 6~10인 도서 검색
-- 2. 주문일에 3개월 더하기
SELECT
    orderid                  주문번호,
    add_months(orderdate, 3) 더하기결과
FROM
    orders
WHERE
        orderid >= 6
    AND orderid <= 10;

SELECT
    orderid                    주문번호,
    add_months(orderdate, - 3) 더하기결과
FROM
    orders
WHERE
        orderid >= 6
    AND orderid <= 10;
    

-- 주문번호가 10인 도서의 주문일로부터 오늘까지의 총 개월수를 구하시오
--MONTHS_BETWEEN(이후날짜, 이전날짜)
SELECT
    orderid                                   주문번호,
    orderdate                                 주문일,
    trunc(months_between(sysdate, orderdate)) 총개월수
FROM
    orders
WHERE
    orderid = 10;
    
-- 서점은 주문일로부터 10일후 매출을 확정한다. 각 주문의 확정일자를 구하시오.
SELECT
    orderid        주문번호,
    orderdate      주문일,
    orderdate + 10 확정일
FROM
    orders;
    
--자동 타입 변환
SELECT
    1 + '2'
FROM
    dual;

--수동 타입 변환
--문자를 숫자 형식으로 변환한다
SELECT
    TO_NUMBER('120')
FROM
    dual;

--날짜 형식
SELECT
    TO_DATE('2022-06-30', 'yy-mm-dd')
FROM
    dual;

SELECT
    to_char(sysdate, 'yyyy-mm-dd')
FROM
    dual;

SELECT
    to_char(sysdate, 'YY-MM-DD') 날짜,
    to_char(sysdate, 'YYYY')     연도,
    to_char(sysdate, 'MM')       월,
    to_char(sysdate, 'DD')       일
FROM
    dual;
    
--시간 형식 변환
SELECT
    to_char(sysdate, 'HH:MI:SS AM')            시간형식,
    to_char(sysdate, 'YYYY/MM/DD HH:MI:SS FM') 날짜와시간
FROM
    dual;
    
    
-- 고객 이름에서 같은 성을 가진 사람의 인원수를 구하시오
SELECT SUBSTR(custname,1,1) 성, COUNT(*) 인원
FROM customer
GROUP BY SUBSTR(custname,1,1);

SELECT SUBSTR(custname,1,1)
FROM customer;
