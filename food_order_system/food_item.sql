create table food_item(id int primary key auto_increment, name varchar(30) not null, description varchar(70), img_link blob, price int not null, item_type_id int not null, added_by int not null, added_at datetime not null, foreign key(item_type_id) references item_type(id), foreign key(added_by) references users(id));