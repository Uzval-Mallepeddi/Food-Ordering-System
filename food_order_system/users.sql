create table users(id int auto_increment, first_name varchar(50) NOT NULL, last_name varchar(50) NOT NULL, email varchar(25) NOT NULL, password varchar(15) NOT NULL, role enum('admin', 'employee', 'user') NOT NULL, primary key(id, email))
