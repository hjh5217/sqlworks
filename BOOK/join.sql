--조인과 서브쿼리

SELECT
    *
FROM
    customer;

SELECT
    *
FROM
    book;

SELECT
    *
FROM
    orders;
    
    
-- 고객과 고객의 주문에 관한 데이터를 모두 검색하시오
SELECT
    *
FROM
    customer,
    orders
WHERE
    customer.custid = orders.custid;

SELECT
    cus.custid,
    cus.custname,
    ord.saleprice,
    ord.orderdate
FROM
    customer cus,
    orders   ord
WHERE
        cus.custid = ord.custid
--AND cus.name = '김연아'; -- 김연아 고객의 주문내역
--AND saleprice >= 20000; -- 판매가격이 20000원 이상인 주문 내역
    AND orderdate = '2018-7-8'; -- 주문일이 2018-7-8 인 주문내역


-- 고객 이름 별로 주문한 모든 도서의 총 판매액을 구하시오
SELECT
    cus.custname,
    SUM(saleprice) 판매금액,
    RANK()
    OVER(
        ORDER BY
            SUM(saleprice) DESC
    )              순위
FROM
    customer cus,
    orders   ord
WHERE
    cus.custid = ord.custid
GROUP BY
    cus.custname;

--고객의 이름과 고객이 주문한 도서의 이름을 검색하시오
SELECT
    cus.custname,
    boo.bookname,
    ord.saleprice,
    ord.orderdate
FROM
    customer cus,
    orders   ord,
    book     boo
WHERE
        cus.custid = ord.custid
    AND boo.bookid = ord.bookid
ORDER BY
    cus.custname;

-- 가장 비싼 도서의 이름을 검색하시오
-- 오류 발생 ) SELECT bookname MAX(price) FROM book;
SELECT
    MAX(price)
FROM
    book; -- 35000

SELECT
    bookname
FROM
    book --골프바이블
WHERE
    price = 25000;

--중첩 쿼리
SELECT
    bookname,
    price
FROM
    book
WHERE
    price = (
        SELECT
            MAX(price)
        FROM
            book
    );
    
    
-- 도서를 구매한 적이 있는 고객의 이름을 검색하시오
-- 1. 주문테이블에서 고객아이디 검색
SELECT
    custid
FROM
    orders;
-- 2. 고객아이디가 있는 고객이름 검색
SELECT
    custname
FROM
    customer
WHERE
    custid IN ( 1, 2, 3, 4 );

SELECT
    custname
FROM
    customer
WHERE
    custid IN (
        SELECT
            custid
        FROM
            orders
    );
    

-- 도서를 구매한 적이 없는 고객의 이름을 검색하시오.
SELECT
    custname,
    custid
FROM
    customer
WHERE
    custid NOT IN (
        SELECT
            custid
        FROM
            orders
    );
    
--김연아 고객의 주문내역을 검색하시오
-- 1. 김연아 고객의 아이디 검색
-- 2. 김연아 고객의 아이디로 주문테이블에서 검색
    
SELECT custid
FROM customer
WHERE custname='김연아';

SELECT *
FROM orders
WHERE custid = (SELECT custid FROM customer WHERE custname='김연아');