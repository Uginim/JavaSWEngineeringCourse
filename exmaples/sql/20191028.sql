--���ڵ�� ��ȸ
select * from book;
-- 9���� ��ȸ
select * from book where bookid = '9';

select * from book where price >= 10000;
--���ڵ�, �� ����
insert into book values(11, '�����ͺ��̽�', '�Ѻ����ǻ�', 30000);
--���ڵ�, �� ����
update book set price=25000 where bookid = 11;
--���ڵ�, �� ����
delete from book where bookid = 11;