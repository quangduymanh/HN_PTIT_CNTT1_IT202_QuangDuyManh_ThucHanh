DROP DATABASE IF EXISTS Thuchanh;
CREATE DATABASE Thuchanh;
USE Thuchanh;
create table Reader (
reader_id int primary key,
reader_name VARCHAR(100) NOT NULL,
phone VARCHAR(15) UNIQUE,
register_date DATE
);
create table Book (
book_id int primary key,
book_title VARCHAR(150) NOT NULL,
author VARCHAR(100),
publish_year INT CHECK (publish_year >= 1900)
);
create table Borrow (
reader_id INT,
book_id INT,
primary key(reader_id, book_id),
borrow_date DATE,
return_date DATE
);

alter table Reader add email VARCHAR(100) UNIQUE;
alter table Book modify author VARCHAR(150);
insert into Reader (reader_id, reader_name, phone, email, register_date)
values
(1, 'Nguyễn Văn An', '0901234567', 'an.nguyen@gmail.com', '2024-09-01'),
(2, 'Trần Thị Bình', '0912345678', 'binh.tran@gmail.com', '2024-09-05'),
(3, 'Lê Minh Châu', '0923456789', 'chau.le@gmail.com', '2024-09-10');
insert into Book (book_id, book_title, author, publish_year)
values
(101, 'Lập trình C căn bản', 'Nguyễn Văn A', 2018),
(102, 'Cơ sở dữ liệu', 'Trần Thị B', 2020),
(103, 'Lập trình Java', 'Lê Minh C', 2019),
(104, 'Hệ quản trị MySQL', 'Phạm Văn D', 2021);
insert into Borrow (reader_id, book_id, borrow_date, return_date)
values
(1, 101, '2024-09-15', NULL),
(1, 102, '2024-09-15', '2024-09-25'),
(2, 103, '2024-09-18', NULL);
-- update Borrow set return_date = '2024-10-01' where reader_id = 1;
-- update Book set publish_year = 2023 where publish_year >= 2021;
-- delete from Borrow where borrow_date < '2024-09-18' and reader_id >0;
select *from Reader;
select *from Book;
select *from Borrow;
