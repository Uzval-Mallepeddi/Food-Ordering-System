create table employee_shifts(user_id int not null, shift_day varchar(25) not null, foreign key(user_id) references users(id))
