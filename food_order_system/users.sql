create table users(id int auto_increment primary key, first_name varchar(50) NOT NULL, last_name varchar(50) NOT NULL, email varchar(25) NOT NULL UNIQUE, password varchar(15) NOT NULL, role enum('admin', 'employee', 'user') NOT NULL)

create table users(id int auto_increment primary key, first_name varchar(50) NOT NULL, last_name varchar(50) NOT NULL, username varchar(25) NOT NULL UNIQUE, password varchar(15) NOT NULL, role varchar(50) NOT NULL)

create table authorities(id int auto_increment primary key, authority varchar(50), UNIQUE KEY `authorities_idx_i`(`authority`))

create table user_authority(user_id int NOT NULL, authority_id int NOT NULL, FOREIGN KEY(user_id) references users(id), FOREIGN KEY(authority_id) references authorities(id));