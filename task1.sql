-- <TABLES>
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name TEXT NOT NULL UNIQUE CHECK ( department_name <> '' )
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    full_name TEXT NOT NULL CHECK ( full_name <> '' ),
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

-- <DATA>
INSERT INTO departments (department_name) VALUES
    ('ИТ'),
    ('Бухгалтерия'),
    ('Маркетинг');

INSERT INTO employees (full_name, department_id) VALUES
    ('Алексей Орлов', 1),
    ('Мария Кузнецова', 1),
    ('Елена Попова', 2),
    ('Павел Морозов', 3);

-- <VIEWS>
CREATE VIEW department_employees AS
SELECT e.employee_id, e.full_name AS employee_name, d.department_name
FROM employees AS e
JOIN departments AS d ON e.department_id = d.department_id;

-- <QUERIES>
SELECT e.employee_id, e.full_name AS employee_name, d.department_name
FROM employees AS e
JOIN departments AS d ON e.department_id = d.department_id
ORDER BY e.employee_id;

SELECT employee_id, employee_name, department_name
FROM department_employees
WHERE department_name = 'ИТ'
ORDER BY employee_id;

UPDATE employees SET department_id = 3 WHERE employee_id = 2;

SELECT e.employee_id, e.full_name AS employee_name, d.department_name
FROM employees AS e
JOIN departments AS d ON e.department_id = d.department_id
ORDER BY e.employee_id;
