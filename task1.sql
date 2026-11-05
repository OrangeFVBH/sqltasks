CREATE TABLE employees (
    employee_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL
);

CREATE TABLE access_cards (
    card_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    card_number VARCHAR(30) NOT NULL,
    employee_id INTEGER NOT NULL,
    CONSTRAINT uq_access_card_number UNIQUE (card_number),
    CONSTRAINT uq_access_card_employee UNIQUE (employee_id),
    CONSTRAINT fk_access_card_employee
        FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
        ON DELETE RESTRICT
);

INSERT INTO employees (full_name) VALUES
    ('Иван Петров'),
    ('Анна Смирнова'),
    ('Олег Соколов');

INSERT INTO access_cards (card_number, employee_id) VALUES
    ('CARD-001', 1),
    ('CARD-002', 2);

SELECT e.full_name AS employee_name, ac.card_number
FROM employees AS e
INNER JOIN access_cards AS ac ON ac.employee_id = e.employee_id
ORDER BY e.employee_id;

CREATE VIEW employee_access_cards AS
SELECT e.full_name AS employee_name, ac.card_number
FROM employees AS e
INNER JOIN access_cards AS ac ON ac.employee_id = e.employee_id;

SELECT employee_name, card_number
FROM employee_access_cards
ORDER BY card_number;