DROP DATABASE IF EXISTS bamazon_DB;
CREATE DATABASE bamazon_DB;

USE bamazon_DB;

CREATE TABLE Products(
  id INT NOT NULL AUTO_INCREMENT,
  item_id VARCHAR(100) NOT NULL,
  product_name VARCHAR(50) NOT NULL,
  department_name VARCHAR(30) NOT NULL,
  price DECIMAL(10,2) NULL,
  quantity INT NULL,
  PRIMARY KEY (id)
);



INSERT INTO products (item_id, product_name, department_name, price, quantity)
VALUES ("1", "hotwheel", "toys", 0.98, 25);

INSERT INTO products (item_id, product_name, department_name, price, quantity)
VALUES ("2", "bicycle", "sports", 350.00, 4);

INSERT INTO products (item_id, product_name, department_name, price, quantity)
VALUES ("3", "toothbrush", "personal", 6.58, 12);

INSERT INTO products (item_id, product_name, department_name, price, quantity)
VALUES ("4", "jeans", "clothing", 30.75, 20);

INSERT INTO products (item_id, product_name, department_name, price, quantity)
VALUES ("5", "monopoly", "games", 21.50, 30);

INSERT INTO products (item_id, product_name, department_name, price, quantity)
VALUES ("6", "laptop", "electronics", 750.00, 25);

INSERT INTO products (item_id, product_name, department_name, price, quantity)
VALUES ("7", "tv", "electronics", 1200.87, 6);

INSERT INTO products (item_id, product_name, department_name, price, quantity)
VALUES ("8", "grill", "outdoors", 230.95, 2);

INSERT INTO products (item_id, product_name, department_name, price, quantity)
VALUES ("9", "sawzall", "tools", 48.67, 15);

INSERT INTO products (item_id, product_name, department_name, price, quantity)
VALUES ("10", "bondo", "automotive", 12.38, 2);
