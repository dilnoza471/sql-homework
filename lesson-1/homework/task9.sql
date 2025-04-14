--create database library_management;
use library_management;

--books table

create table books(
	book_id int identity primary key,
	title varchar(50) not null,
	author varchar(50),
	published_year int
);

--members table

create table members(
	member_id int identity primary key,
	name varchar(50) not null,
	email varchar(50),
	phone_number varchar(50)
);

--loans table

create table loan(
	loan_id int identity primary Key,
	book_id int Foreign Key References books(book_id),
	member_id int Foreign Key References members(member_id),
	loan_date Date,
	return_date Date
)

-- Insert sample books
insert into books (title, author, published_year) values
('To Kill a Mockingbird', 'Harper Lee', 1960),
('1984', 'George Orwell', 1949),
('The Great Gatsby', 'F. Scott Fitzgerald', 1925);

-- Insert sample members
insert into Members (name, email, phone_number) values
('Alice Johnson', 'alice@example.com', '123-456-7890'),
('Bob Smith', 'bob@example.com', '987-654-3210'),
('Charlie Brown', 'charlie@example.com', '555-555-5555');

-- Insert sample loans
insert into loan (book_id, member_id, loan_date, return_date) values
(1, 1, '2025-04-01', '2025-04-10'),  -- Alice borrowed 'To Kill a Mockingbird'
(2, 2, '2025-04-05', NULL),         -- Bob borrowed '1984' and hasn't returned it yet
(3, 1, '2025-03-20', '2025-03-30'); -- Alice borrowed 'The Great Gatsby'

select * from books
select * from members
select * from loan