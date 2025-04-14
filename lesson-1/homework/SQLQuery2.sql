create database lesson1
use lesson1

--task 1
create table student(
	id int,
	name varchar(50),
	age int
)

alter table student
alter column id int not null;


--task2
use lesson1
create table product(
	product_id int unique not null,
	product_name varchar(80),
	price float
)

alter table product
drop constraint UQ__product__47027DF4090FA321;


alter table product
add unique(product_id)

alter table product
add unique(product_id, product_name)


--task 3
use lesson1
drop table if exists orders
create table orders(
	order_id int,
	customer_name varchar(50),
	order_date date
	constraint pk_person primary key(order_id)
);

alter table orders
drop constraint pk_person

alter table orders
add constraint [pk_person] primary key(order_id)

--task4

drop table if exists category;
create table category(
	category_id int primary key,
	category_name varchar(255)
);

create table item(
	item_id int primary key,
	item_name varchar(255),
	category_id int foreign key references category(category_id)
)

alter table item
drop constraint FK__item__category_i__440B1D61;

alter table item
add constraint fk_item_category foreign key(category_id) references category(category_id);

--task 5

create table account(
	account_id int primary key,
	balance float(8), check (balance >=0),
	account_type varchar, check (account_type='Saving' or account_type = 'Checking')
)

alter table account 
drop constraint CK__account__account__48CFD27E

alter table account 
drop constraint CK__account__balance__47DBAE45

alter table account
add constraint ck_balance check (balance >= 0);


alter table account
add constraint ck_acc_type check (account_type='Saving' or account_type = 'Checking');


--task 6

create table customer(
	customer_id int primary key,
	name varchar ,
	city varchar default 'Unknown'
)

alter table customer
drop constraint DF__customer__city__4D94879B


alter table customer
add constraint DF__customer__city default 'Unknown' for city;

--task 7

create table invoice(
	invoice_id int primary key identity,
	amount float(8)
)

insert into invoice
values(500),
(499.8),
(48.47),
(879);

select * from invoice
--enable manual insert
set identity_insert invoice on


insert into invoice(invoice_id, amount)
values(6, 100)
--disable manual insert
set identity_insert invoice off

select * from invoice

--task 8
create table books(
	id int identity primary key,
	title varchar(255) not null,
	price float(8), check(price >=0),
	genre varchar(255) default 'Unknown'
);

--valid data
insert into books values
('Mockingjay', 200, 'Mystery')
select * from books
--invalid price 
insert into books values
('Divergent', -100, 'Dystopia') --returns error 
--without genre
insert into books(title, price) values
('Divergent', 100)

select * from books

