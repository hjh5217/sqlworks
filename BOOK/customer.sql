-- customer 테이블()
CREATE TABLE customer(
    custid NUMBER PRIMARY KEY,
    custname VARCHAR2(40) NOT NULL,
    address VARCHAR2(50),
    phone VARCHAR2(20)
);

-- customer 자료 추가
INSERT INTO customer VALUES (1, '박지성','영국 맨체스터','000-5000-0001');
INSERT INTO customer VALUES (2, '김연아','대한민국 서울','000-6000-0001');
INSERT INTO customer VALUES (3, '안산','대한민국 광주광역시','000-7000-0001');
INSERT INTO customer VALUES (4, '류현진','미국 토론토',NULL);
INSERT INTO customer VALUES (5, '손흥민','영국 토트넘','000-8000-0001');

SELECT * FROM customer;

SELECT * FROM customer WHERE phone IS NULL;

SELECT * FROM customer WHERE address LIKE '%대한민국%';

-- 고객을 이름순으로 정렬하시오
SELECT * FROM customer ORDER BY custname ASC;
-- 도서 가격이 높은 순으로 정렬하시오
-- 가격이 같으면 출판사를 오름차순 정렬하기
SELECT * FROM book ORDER BY price DESC, publisher ASC;

COMMIT;