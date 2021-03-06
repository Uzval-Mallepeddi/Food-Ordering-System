create table orders
(id int primary key auto_increment, 
order_by int not null, 
order_at datetime not null, 
order_status enum('ordered', 'in_progress', 'ready', 'delivered') not null, 
total_amount int not null, 
amount_paid int not null, 
foreign key(order_by) references users(id))