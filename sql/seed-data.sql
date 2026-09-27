-- Distributed PostgreSQL Lab
-- Initial seed data

INSERT INTO customers (full_name, email)
VALUES
    ('John Banda', 'john.banda@example.com'),
    ('Mary Phiri', 'mary.phiri@example.com'),
    ('Peter Mbewe', 'peter.mbewe@example.com'),
    ('Grace Chirwa', 'grace.chirwa@example.com'),
    ('David Kamanga', 'david.kamanga@example.com'),
    ('Agnes Zulu', 'agnes.zulu@example.com'),
    ('Brian Nyirenda', 'brian.nyirenda@example.com'),
    ('Linda Gondwe', 'linda.gondwe@example.com'),
    ('Charles Tembo', 'charles.tembo@example.com'),
    ('Ruth Mwale', 'ruth.mwale@example.com');


INSERT INTO products (product_name, price, stock_quantity)
VALUES
    ('Laptop', 850.00, 25),
    ('Desktop Computer', 650.00, 20),
    ('Network Switch', 120.00, 40),
    ('Wireless Router', 75.00, 50),
    ('Keyboard', 25.00, 100),
    ('Mouse', 15.00, 120),
    ('Monitor', 180.00, 35),
    ('USB Drive', 12.50, 200),
    ('Ethernet Cable', 8.00, 250),
    ('UPS', 150.00, 30);


INSERT INTO orders (customer_id, product_id, quantity, total_amount, order_status)
VALUES
    (1, 1, 1, 850.00, 'completed'),
    (2, 3, 2, 240.00, 'completed'),
    (3, 5, 2, 50.00, 'pending'),
    (4, 7, 1, 180.00, 'completed'),
    (5, 2, 1, 650.00, 'processing'),
    (6, 6, 3, 45.00, 'completed'),
    (7, 4, 1, 75.00, 'pending'),
    (8, 8, 5, 62.50, 'completed'),
    (9, 9, 10, 80.00, 'completed'),
    (10, 10, 1, 150.00, 'processing'),
    (1, 3, 1, 120.00, 'completed'),
    (2, 6, 2, 30.00, 'completed'),
    (3, 8, 3, 37.50, 'pending'),
    (4, 9, 5, 40.00, 'completed'),
    (5, 5, 1, 25.00, 'processing'),
    (6, 7, 2, 360.00, 'completed'),
    (7, 1, 1, 850.00, 'pending'),
    (8, 4, 2, 150.00, 'completed'),
    (9, 2, 1, 650.00, 'processing'),
    (10, 10, 2, 300.00, 'completed');
