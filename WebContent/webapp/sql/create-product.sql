create table product (
	no int not null auto_increment primary key,
	name varchar(30) not null,
	color varchar(30),
	price int not null,
	image varchar(256) not null,
	content varchar(45),
	detail text,
	category varchar(45),
	stock int
);