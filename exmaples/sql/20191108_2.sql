--1���缭���� ���� �䱸�ϴ� ���� ������ ���� SQL �����ۼ��Ͻÿ�.

--  (1)������ȣ�� 1�ε����� �̸�
SELECT  bookname
FROM    book
WHERE   bookid = '1';

--  (2)������ 20,000���̻��� ������ �̸�
SELECT  bookname
FROM    book
WHERE   price >= 20000;

--  (3)�������� �ѱ��ž�(�������ǰ���ȣ�� 1�����γ��� �ۼ�)
SELECT  SUM(saleprice)
FROM    orders
WHERE   custid = '1';

--  (4)�������� �����ѵ����� ��(�������ǰ���ȣ�� 1�����γ��� �ۼ�)
SELECT  COUNT(*)
FROM    orders
WHERE   custid = '1';
  

--2���缭���� ��ڿ� �濵�ڰ� �䱸�ϴ� ���� ������ ���� SQL �����ۼ��Ͻÿ�.
--  (1) ���缭�������� �� ����
SELECT  COUNT(*)
FROM    book;
--  (2) ���缭���������� ����ϴ� ���ǻ��� �� ����
SELECT  COUNT(DISTINCT publisher)
FROM    book;
--  (3) ������ �̸�, �ּ�
SELECT  name, address
FROM    customer;
--  (4) 2014�� 7��4��~7��7�ϻ��̿� �ֹ����������� �ֹ���ȣ
SELECT  bookid
FROM    orders
where   orderdate between 
--  (5) 2014�� 7��4��~7��7�ϻ��̿� �ֹ����������� ������ ������ �ֹ���ȣ

--  (6) ���̡��衯 ���� ���� �̸��� �ּ�

--  (7) ���̡��衯 ���̰� �̸��� ���ơ��� ������ ���� �̸��� �ּ�

