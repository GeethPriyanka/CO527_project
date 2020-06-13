CREATE DATABASE warehouse_management;

USE warehouse_management;

CREATE TABLE buyers (
	buyer_ID INT NOT NULL,
	name VARCHAR(50) NOT NULL,
	type ENUM('Retail','Wholesale') NOT NULL,
	address VARCHAR(200) NOT NULL,
	PRIMARY KEY (buyer_ID)
);

CREATE TABLE order_details (
	order_ID INT NOT NULL,
	order_type ENUM('Annualy','Monthly','Onetime') NOT NULL,
	delivery_status ENUM('Delivered','Not Delivered') NOT NULL,
	delivery_date DATE NOT NULL,
	PRIMARY KEY (order_ID)
);

CREATE TABLE suppliers (
	supplier_ID INT NOT NULL,
	name VARCHAR(50) NOT NULL,
	type ENUM('Wholesalers','Distributors') NOT NULL,
	address VARCHAR(200) NOT NULL,
	PRIMARY KEY (supplier_ID)
);

CREATE TABLE warehouse (
	warehouse_ID INT NOT NULL,
	address VARCHAR(200) NOT NULL,
	coordinates VARCHAR(50) NOT NULL,
	PRIMARY KEY (warehouse_ID)
);

CREATE TABLE products (
	product_ID INT NOT NULL,
	supplier_ID INT,
	warehouse_ID INT,
	stored_date DATE NOT NULL,
	quantity INT NOT NULL,
	product_type ENUM('Plastics','Glass','Furniture','Fabrics') NOT NULL,
	brand VARCHAR(50) NOT NULL,
	PRIMARY KEY (product_ID),
	FOREIGN KEY (supplier_ID) REFERENCES suppliers(supplier_ID),
	FOREIGN KEY (warehouse_ID) REFERENCES warehouse(warehouse_ID)
);

CREATE TABLE orders (
	order_ID INT,
	buyers_ID INT,
	product_ID INT,
	quantity INT NOT NULL,
	PRIMARY KEY (order_ID),
	FOREIGN KEY (order_ID) REFERENCES order_details(order_ID),
	FOREIGN KEY (buyers_ID) REFERENCES buyers(buyer_ID),
	FOREIGN KEY (product_ID) REFERENCES products(product_ID)
);
