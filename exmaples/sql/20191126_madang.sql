-- Ʈ����� ����
set transaction name 'mytran';
insert into book values(99, '�����ͺ��̽�', '�Ѻ�', 25000);
select bookname "������" from book
where bookid =99;
savepoint a;

update book set booname = '�����ͺ��̽� ����'
where bookid = 99;
select bookname "������2" from book
where bookid =99;
savepoint b;

update book set bookname ='�����ͺ��̽� ���� �� �ǽ�'
where bookid = 99;
select bookname "������3" from book 
where bookid =99;
rollback to b;

select bookname "������4" from book 
where bookid =99;
rollback to a;

select bookname "������5" from book 
where bookid =99;
update book set bookname ='�����ͺ��̽� ���� �� �ǽ�2'
where bookid = 99;
select bookname "������6" from book 
where bookid =99;
rollback;

select bookname "������7" from book
where bookid=99;

SELECT * FROM BOOK;


-- ������ ���� �˻�
-- ���̺� ���� ��ȸ
SELECT * FROM ALL_TAB_COLUMNS WHERE TABLE_NAME='WORKS';
-- �������� ��ȸ
SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'WORKS'; 