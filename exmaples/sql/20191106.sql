SELECT phone
FROM customer
WHERE name = '�迬��';

SELECT phone
FROM customer;


SELECT *
  FROM customer;

SELECT name, phone
  FROM customer
  WHERE name='������';

-- �÷��� ��Ī �ֱ� : as ������ ��Ī�� ����.
SELECT name AS "�̸�", phone AS "��ȭ��ȣ"
  FROM customer;
-- ���̺� �̸��� ��Ī�ֱ� : ���̺� �̸� �ڿ� ������ �ְ� ��Ī�� ����
SELECT name, phone
  FROM customer t1
  WHERE name = '������';

select t1.name, t1.phone
  FROM customer t1
  WHERE name = '�迬��';
  
-- ���� ������ 10,000�� �̻��� ������ å�̸�, ���ǻ� ��ȸ�ϱ�
SELECT bookname, publisher
  FROM book
  where price >= 10000;