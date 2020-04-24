drop table worker;
create table worker(          
    id          varchar2(20)  primary key,
    pwd         varchar2(20),
    name        varchar2(40),
    phone       varchar2(20)
);

alter table member drop primary key cascade;
drop table member;
create table member(   
    id         varchar2(20)  primary key,
    pwd        varchar2(20),     
    name       varchar2(40),
    email      varchar2(40),
    zip_num    varchar2(7),
    address    varchar2(100),
    phone      varchar2(20),
    useyn      char(1)       default 'y',
    indate     date          default sysdate
);

alter table product drop primary key cascade;
drop table product;
create table product(
    pseq       number(5)     primary key,
    name       varchar2(100),
    kind       char(1),   
    price1     number(7)     default '0',
    price2     number(7)     default '0',
    price3     number(7)     default '0',
    content    varchar2(1000),
    image      varchar2(50)  default 'default.jpg',
    useyn      char(1)       default 'y',
    bestyn     char(1)       default 'n',
    indate     date          default sysdate  
);
drop sequence product_seq;
create sequence product_seq start with 1;

alter table cart drop primary key cascade;
drop table cart;
create table cart (
  cseq         number(10)    primary key,  -- ��ٱ��Ϲ�ȣ
  id           varchar(16)   references member(id),  -- �ֹ��� ���̵�(FK :��member.id) 
  pseq         number(5)     references product(pseq), -- �ֹ� ��ǰ��ȣ(FK :product.pseq) 
  quantity     number(5)     default 1,        -- �ֹ� ����
  result       char(1)       default '1',      -- 1:��ó�� 2:ó��
  indate       date          default SYSDATE   -- �ֹ���
);
drop sequence cart_seq;
create sequence cart_seq start with 1;

alter table orders drop primary key cascade;
drop table orders;
create table orders(
  oseq        number(10)    primary key,           -- �ֹ���ȣ  
  id          varchar(16)   references member(id), -- �ֹ��� ���̵�
  indate      date          default sysdate       -- �ֹ���
);
drop sequence orders_seq;
create sequence orders_seq start with 1;

alter table order_detail drop primary key cascade;
drop table order_detail;
create table order_detail(
  odseq       number(10)   primary key,        -- �ֹ��󼼹�ȣ
  oseq        number(10)   references orders(oseq),   -- �ֹ���ȣ  
  pseq        number(5)    references product(pseq),  -- ��ǰ��ȣ
  quantity    number(5)    default 1,                 -- �ֹ�����
  result      char(1)      default '1'                -- 1: ��ó�� 2: ó��     
);
drop sequence order_detail_seq;
create sequence order_detail_seq start with 1;

--Q&A �Խ����� ���� ���θ����� ��ǰ�� ���ǻ��� �Ǵ� ��۹��ǿ� ���� �������� ���׿� ���ؼ� ������ �ϰ��� �� �� ����Ѵ�. 
alter table qna drop primary key cascade;
drop table qna;
create table qna (
  qseq        number(5)    primary key,  -- �۹�ȣ 
  subject     varchar(300),            -- ����
  content     varchar(1000),          -- ���ǳ���
  reply       varchar(1000),           -- �亯����
  id          varchar(20),                 -- �ۼ���(FK : member.id) 
  rep         char(1)       default '1',        --1:�亯 ��  2:�亯 ��  
  indate      date default  sysdate     -- �ۼ���
); 
drop sequence qna_seq;
create sequence qna_seq start with 1;

-- ���� ������ �Է�
insert into worker values('admin', 'admin', 'ȫ����', '010-777-7777');
insert into worker values('pinksung', 'pinksung', '����', '010-999-9696');

insert into member(id, pwd, name, zip_num, address, phone) values
('one', '1111', '�質��', '133-110', '����ü�����������1�� 1����21ȣ', '017-777-7777');
insert into member(id, pwd, name, zip_num, address, phone) values
('two', '2222', '�̹���', '130-120', '����ü��ı����2�� ������ ����Ʈ 201�� 505ȣ', '011-123-4567');

insert into product(pseq, name, kind, price1, price2, price3, content, image) values(
product_seq.nextval, 'ũ�α״��Ϻ���', '2', '40000', '50000', '10000', '�����϶� ũ�α״��Ϻ��� �Դϴ�.', 'w2.jpg');
insert into product(pseq, name, kind, price1, price2, price3, content, image, bestyn) values(
product_seq.nextval, '�պ���', '2', 40000, 50000, 10000,'������ �պ��� �Դϴ�.', 'w-28.jpg', 'n');
insert into product(pseq,  name, kind, price1, price2, price3, content, image, bestyn) values( 
product_seq.nextval, '��', '1', '10000', '12000', '2000', '���������� ��', 'w-26.jpg', 'n');
insert into product(pseq,  name, kind, price1, price2, price3, content, image, bestyn) values(
product_seq.nextval, '������', '4', '5000', '5500', '500', '����� �������Դϴ�.', 'w-25.jpg', 'y');
insert into product(pseq,  name, kind, price1, price2, price3, content, image, bestyn) values(
product_seq.nextval, 'ȸ����', '1', '10000', '12000', '2000', '���������� ��', 'w9.jpg', 'n');
insert into product(pseq,  name, kind, price1, price2, price3, content, image) values(
product_seq.nextval, '��������', '2', '12000', '18000', '6000', '������ ����', 'w4.jpg');
insert into product(pseq,  name, kind, price1, price2, price3, content, image, bestyn) values(
product_seq.nextval,  '��ũ����', '3', '5000', '5500', '500', '������� �����Դϴ�.', 'w-10.jpg', 'y');
insert into product(pseq,  name, kind, price1, price2, price3, content, image, bestyn) values(
product_seq.nextval, '������', '3', '5000', '5500', '500', '����� �������Դϴ�.', 'w11.jpg', 'y');
insert into product(pseq,  name, kind, price1, price2, price3, content, image) values(
product_seq.nextval,  '����Ŀ��', '4', '15000', '20000', '5000', 'Ȱ������ ���� ����Ŀ���Դϴ�.', 'w1.jpg');
insert into product(pseq,  name, kind, price1, price2, price3, content, image, bestyn) values(
product_seq.nextval,  '����', '3', '5000', '5500', '500', '������� �����Դϴ�.', 'w-09.jpg','n');
insert into product(pseq,  name, kind, price1, price2, price3, content, image, bestyn) values(
product_seq.nextval,  '����Ŀ��', '5', '15000', '20000', '5000', 'Ȱ������ ���� ����Ŀ���Դϴ�.', 'w-05.jpg','n');

insert into cart(cseq,id, pseq, quantity) values(cart_seq.nextval, 'one', 1, 1);

insert into orders(oseq, id) values(orders_seq.nextval, 'one');
insert into orders(oseq, id) values(orders_seq.nextval, 'one');
insert into orders(oseq, id) values(orders_seq.nextval, 'two');

insert into order_detail(odseq, oseq, pseq, quantity) 
values(order_detail_seq.nextval, 1, 1, 1);
insert into order_detail(odseq, oseq, pseq, quantity) 
values(order_detail_seq.nextval, 1, 2, 5);
insert into order_detail(odseq, oseq, pseq, quantity) 
values(order_detail_seq.nextval, 2,  4, 3);
insert into order_detail(odseq, oseq, pseq, quantity) 
values(order_detail_seq.nextval, 3, 3, 1);
insert into order_detail(odseq, oseq, pseq, quantity) 
values(order_detail_seq.nextval, 3, 2, 1);
insert into order_detail(odseq, oseq, pseq, quantity) 
values(order_detail_seq.nextval, 3, 6, 2);
insert into order_detail(odseq, oseq, pseq, quantity) 
values(order_detail_seq.nextval, 3, 1, 2);

insert into qna (qseq, subject, content, id)
values(qna_seq.nextval, '�׽�Ʈ', '��������1', 'one');
update qna SET reply='�亯����', rep='2';

insert into qna (qseq, subject, content, id)
values(qna_seq.nextval, '�׽�Ʈ2', '��������2', 'one');
commit;

create or replace view cart_view
as
select o.cseq, o.id, o.pseq, m.name mname, p.name pname, 
o.quantity, o.indate, p.price2, o.result 
from cart o, member m, product p 
where o.id = m.id and o.pseq = p.pseq
and result='1';

create or replace view order_view
as
select d.odseq, o.oseq, o.id, o.indate, d.pseq,d.quantity, m.name mname,
m.zip_num, m.address, m.phone, p.name pname, p.price2, d.result   
from orders o, order_detail d, member m, product p 
where o.oseq=d.oseq and o.id = m.id and d.pseq = p.pseq;
           
-- ����Ʈ ��ǰ
create or replace view best_pro_view
as
select pseq, name, price2, image 
from( select rownum, pseq, name, price2, image 
      from product  
      where bestyn='y' 
      order by indate desc)
where  rownum <=4;

-- �Ż�ǰ
create or replace view new_pro_view
as
select pseq, name, price2, image 
from( select rownum, pseq, name, price2, image 
      from product  
      where useyn='y' 
      order by indate desc)
where  rownum <=4;