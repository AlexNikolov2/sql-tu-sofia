create table clients (
    id INT AUTO_INCREMENT primary key,
    name VARCHAR(100) not null,
    phone VARCHAR(20) not null,
    email VARCHAR(100),
    address TEXT
);

CREATE TABLE cars (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    brand VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year YEAR NOT NULL,
    license_plate VARCHAR(15) UNIQUE NOT NULL,
    vin VARCHAR(17) UNIQUE NOT NULL,
    FOREIGN KEY (client_id) REFERENCES clients(id) ON DELETE CASCADE
);

CREATE TABLE services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    duration_minutes INT NOT NULL
);

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    salary DECIMAL(10,2) NOT NULL
);

CREATE TABLE repairs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    car_id INT NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_cost DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (car_id) REFERENCES cars(id) ON DELETE CASCADE
);

CREATE TABLE repair_services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    repair_id INT NOT NULL,
    service_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    FOREIGN KEY (repair_id) REFERENCES repairs(id) ON DELETE CASCADE,
    FOREIGN KEY (service_id) REFERENCES services(id) ON DELETE CASCADE
);

CREATE TABLE repair_employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    repair_id INT NOT NULL,
    employee_id INT NOT NULL,
    FOREIGN KEY (repair_id) REFERENCES repairs(id) ON DELETE CASCADE,
    FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE
);

INSERT INTO clients (name, phone, email, address) 
VALUES ('Иван Петров', '0888123456', 'ivan.petrov@email.com', 'София, ул. Витоша 12');
INSERT INTO cars (client_id, brand, model, year, license_plate, vin) 
VALUES (1, 'Toyota', 'Corolla', 2018, 'CB1234AB', 'JTNB1234567890123');
INSERT INTO services (name, price, duration_minutes) 
VALUES ('Смяна на масло', 50.00, 30);
INSERT INTO repairs (car_id, total_cost) 
VALUES (1, 120.00);
INSERT INTO repair_services (repair_id, service_id, quantity) 
VALUES (1, 1, 1);
INSERT INTO repair_employees (repair_id, employee_id) 
VALUES (1, 2);

