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
	PRIMARY KEY (product_ID)
);

CREATE TABLE orders (
	order_ID INT,
	buyers_ID INT,
	product_ID INT,
	quantity INT NOT NULL,
	PRIMARY KEY (order_ID)
);

CREATE TABLE employee (
	employee_ID INT NOT NULL,
	warehouse_ID INT,
	name VARCHAR(50) NOT NULL,
	date_of_birth DATE NOT NULL,
	salary DECIMAL(13,2) NOT NULL,
	title ENUM('Managers','Keepers','workers','Cleaners','Security') NOT NULL,
	start_date DATE NOT NULL,
	PRIMARY KEY (employee_ID)
);

CREATE TABLE section (
	section_ID INT NOT NULL,
	warehouse_ID INT,
	coordinates VARCHAR(50) NOT NULL,
	PRIMARY KEY (section_ID)
);

CREATE TABLE rack (
	rack_ID INT NOT NULL,
	row_number INT NOT NULL,
	Section_ID INT,
	PRIMARY KEY (rack_ID)
);



LOAD DATA INFILE "F:\\work\\Onedrive\\Academic_work\\8th_SEM\\CO527\\project\\latest\\CO527_project\\database_scripts\\data_source\\buyers.csv" INTO TABLE buyers FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA INFILE "F:\\work\\Onedrive\\Academic_work\\8th_SEM\\CO527\\project\\latest\\CO527_project\\database_scripts\\data_source\\orders.csv" INTO TABLE orders FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA INFILE "F:\\work\\Onedrive\\Academic_work\\8th_SEM\\CO527\\project\\latest\\CO527_project\\database_scripts\\data_source\\order_details.csv" INTO TABLE order_details FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA INFILE "F:\\work\\Onedrive\\Academic_work\\8th_SEM\\CO527\\project\\latest\\CO527_project\\database_scripts\\data_source\\products.csv" INTO TABLE products FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA INFILE "F:\\work\\Onedrive\\Academic_work\\8th_SEM\\CO527\\project\\latest\\CO527_project\\database_scripts\\data_source\\suppliers.csv" INTO TABLE suppliers FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA INFILE "F:\\work\\Onedrive\\Academic_work\\8th_SEM\\CO527\\project\\latest\\CO527_project\\database_scripts\\data_source\\warehouse.csv" INTO TABLE warehouse FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA INFILE "F:\\work\\Onedrive\\Academic_work\\8th_SEM\\CO527\\project\\latest\\CO527_project\\database_scripts\\data_source\\section.csv" INTO TABLE section FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA INFILE "F:\\work\\Onedrive\\Academic_work\\8th_SEM\\CO527\\project\\latest\\CO527_project\\database_scripts\\data_source\\rack.csv" INTO TABLE rack FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';
LOAD DATA INFILE "F:\\work\\Onedrive\\Academic_work\\8th_SEM\\CO527\\project\\latest\\CO527_project\\database_scripts\\data_source\\employee.csv" INTO TABLE employee FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';



ALTER TABLE products ADD FOREIGN KEY (supplier_ID) REFERENCES suppliers(supplier_ID);
ALTER TABLE orders ADD FOREIGN KEY (order_ID) REFERENCES order_details(order_ID);
ALTER TABLE orders ADD FOREIGN KEY (buyers_ID) REFERENCES buyers(buyer_ID);
ALTER TABLE products ADD FOREIGN KEY (warehouse_ID) REFERENCES warehouse(warehouse_ID);
ALTER TABLE orders ADD FOREIGN KEY (product_ID) REFERENCES products(product_ID);
ALTER TABLE employee ADD FOREIGN KEY (warehouse_ID) REFERENCES warehouse(warehouse_ID);
ALTER TABLE section ADD FOREIGN KEY (warehouse_ID) REFERENCES warehouse(warehouse_ID);
ALTER TABLE rack ADD FOREIGN KEY (Section_ID) REFERENCES section(section_ID);
