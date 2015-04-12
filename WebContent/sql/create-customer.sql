create table customer (
	id varchar(30) primary key, 
	password varchar(32) not null,
	name varchar(30) not null,
	email varchar(45) not null,
	phone varchar(13) not null,
	address varchar(45)
);