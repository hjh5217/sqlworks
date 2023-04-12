-- book ���̺�(������ȣ, �����̸�, ���ǻ�, ��������)
CREATE TABLE book (
    bookid    NUMBER PRIMARY KEY,
    bookname  VARCHAR2(50) NOT NULL,
    publisher VARCHAR2(50) NOT NULL,
    price     NUMBER NOT NULL
);

-- �̸� ����
ALTER TABLE book RENAME COLUMN price To saleprice;
-- �ڷ��� ����
ALTER TABLE book MODIFY bookname VARCHAR2(60);

-- ���� �ڷ� �Է�
INSERT INTO book VALUES (
    1,
    '�౸�� ����',
    '�½�����',
    7000
);

INSERT INTO book VALUES (
    2,
    '�౸�ƴ� ����',
    '������',
    13000
);

INSERT INTO book VALUES (
    3,
    '�౸�� ����',
    '���ѹ̵��',
    22000
);

INSERT INTO book VALUES (
    4,
    '���� ���̺�',
    '���ѹ̵��',
    25000
);

INSERT INTO book VALUES (
    5,
    '�ǰ� ����',
    '�½�����',
    8000
);

INSERT INTO book VALUES (
    6,
    '����� ����',
    '�½�����',
    6000
);

INSERT INTO book VALUES (
    7,
    '�߱��� �߾�',
    '�̻�̵��',
    20000
);

INSERT INTO book VALUES (
    8,
    '�߱��� ��Ź��',
    '�̻�̵��',
    13000
);

INSERT INTO book VALUES (
    9,
    '�ø��� �̾߱�',
    '�Ｚ��',
    7500
);

INSERT INTO book VALUES (
    10,
    'Olympic Champions',
    'Person',
    13000
);

-- �ڷ� �˻�
SELECT
    *
FROM
    book;

SELECT
    book.bookname,
    book.price
FROM
    book;

-- ���� ���̺� �ִ� ��� ���ǻ縦 �˻��Ͻÿ�(�ߺ� ����)
SELECT DISTINCT
    book.publisher
FROM
    book;

-- Ư���� ���� WHERE
SELECT
    *
FROM
    book
WHERE
    price < 20000;

-- ������ 10000�� �̻� 20000�� ������ ������ �˻��Ͻÿ�(BETWEEN ~ AND)
-- SELECT * FROM book WHERE price BETWEEN 10000 AND 20000;
SELECT
    *
FROM
    book
WHERE
        price >= 10000
    AND price <= 20000;
    
-- OR ����, IN('a','b')
-- ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��'�� ������ �˻��Ͻÿ�

SELECT
    *
FROM
    book
WHERE
    publisher IN ( '�½�����', '���ѹ̵��' );

SELECT
    *
FROM
    book
WHERE
    publisher = '�½�����'
    OR publisher = '���ѹ̵��';

--�౸�� ���縦 �Ⱓ�� ���ǻ縦 �˻��Ͻÿ�
SELECT
    publisher
FROM
    book
WHERE
    bookname LIKE '�౸�� ����';

--���� �̸��� '�౸'�� ���Ե� ���ǻ縦 �˻��Ͻÿ�
SELECT
    *
FROM
    book
WHERE
    bookname LIKE '%�౸%';
    
-- �౸�� ���� ���� �� ������ 20000�� �̻��� ������ ã���ÿ�
SELECT * FROM book WHERE bookname LIKE '%�౸%'
AND price >= 20000;

-- ������ �Ѱ����� ���Ͻÿ�
SELECT COUNT(*) �ѵ�����
FROM book;

-- ���� �� �ְ� ������ �˻��Ͻÿ�
SELECT MAX(price) �ѵ�����
FROM book;

-- ���� ����
SELECT bookname
FROM book
WHERE price = (SELECT MAX(price) FROM book);