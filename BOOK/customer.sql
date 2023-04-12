-- customer ���̺�()
CREATE TABLE customer(
    custid NUMBER PRIMARY KEY,
    custname VARCHAR2(40) NOT NULL,
    address VARCHAR2(50),
    phone VARCHAR2(20)
);

-- customer �ڷ� �߰�
INSERT INTO customer VALUES (1, '������','���� ��ü����','000-5000-0001');
INSERT INTO customer VALUES (2, '�迬��','���ѹα� ����','000-6000-0001');
INSERT INTO customer VALUES (3, '�Ȼ�','���ѹα� ���ֱ�����','000-7000-0001');
INSERT INTO customer VALUES (4, '������','�̱� �����',NULL);
INSERT INTO customer VALUES (5, '�����','���� ��Ʈ��','000-8000-0001');

SELECT * FROM customer;

SELECT * FROM customer WHERE phone IS NULL;

SELECT * FROM customer WHERE address LIKE '%���ѹα�%';

-- ���� �̸������� �����Ͻÿ�
SELECT * FROM customer ORDER BY custname ASC;
-- ���� ������ ���� ������ �����Ͻÿ�
-- ������ ������ ���ǻ縦 �������� �����ϱ�
SELECT * FROM book ORDER BY price DESC, publisher ASC;

COMMIT;