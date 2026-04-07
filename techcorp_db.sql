create database techcorp;

USE techcorp;


create table Products (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  category VARCHAR(50),
  price DECIMAL(10,2),
  stock_quantity INT,
  discount DECIMAL(5,2)
);

create table Customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE,
  phone VARCHAR(20),
  address VARCHAR(200)
);


create table Employees (
  employee_id INT AUTO_INCREMENT PRIMARY KEY,  
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE,
  phone VARCHAR(20),
  hire_date DATE,
  department VARCHAR(50)
);

create table SupportTickets (
ticket_id INT auto_increment primary key,
customer_id INT,
employee_id INT,
issue text,
status varchar(20),
created_at datetime,
resolved_at datetime,
foreign key (customer_id) references Customers(customer_id),
foreign key (employee_id) references Employees(employee_id)
);

