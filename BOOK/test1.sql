SELECT * FROM book;

-- bookid 가 11번인 도서 삭제

DELETE FROM book
WHERE bookid = 11;

-- 서브 쿼리 (쿼리 중첩)
-- 책의 총 수량을 구하시오
SELECT COUNT(*) 총수량 FROM book;
-- 도서 중 가장 높은 가격을 찾으시오
SELECT MAX(price) 최고가격 FROM book;

-- 가장 비산 도서의 이름을 검색하시오
SELECT bookname FROM book;

SELECT MAX(price) 최고가격 FROM book;

SELECT bookname, price
FROM book
WHERE price = (SELECT MAX(price) 최고가격 FROM book);

-- 고객과 고객의 주문에 관한 데이터를 모두 검색하시오
SELECT * FROM customer;

SELECT * FROM orders;


--고객별 주문가격을 검색하시오
SELECT cus.custname, SUM(saleprice)
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
GROUP BY cus.custname
HAVING cus.custname = '김연아';
