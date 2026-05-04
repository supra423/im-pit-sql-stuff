CREATE TABLE IF NOT EXISTS branch_offices (
    bo_id SERIAL PRIMARY KEY,
    street VARCHAR(100),
    area VARCHAR(50),
    city VARCHAR(50),
    postcode CHAR(15),
    telephone CHAR(25),
    fax_number CHAR(25)
);

CREATE TABLE IF NOT EXISTS staffs (
    staff_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    street VARCHAR(100),
    area VARCHAR(50),
    city VARCHAR(50),
    postcode CHAR(15),
    telephone CHAR(15),
    sex CHAR(1) NOT NULL,
    national_insurance_number CHAR(9),
    date_of_birth DATE,
    job_title VARCHAR(25) NOT NULL,
    salary DEC(10, 2) NOT NULL,
    date_joined DATE
);

CREATE TABLE IF NOT EXISTS staff_accounts (
    staff_id INT NOT NULL REFERENCES staffs(staff_id) ON DELETE CASCADE,
    email VARCHAR(255),
    password VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS next_of_kins (
    nok_id SERIAL PRIMARY KEY,
    staff_id INT NOT NULL REFERENCES staffs(staff_id) ON DELETE CASCADE,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    relationship VARCHAR(25) NOT NULL,
    street VARCHAR(100),
    area VARCHAR(50),
    city VARCHAR(50),
    postcode CHAR(15),
    telephone CHAR(15)
);

CREATE TABLE IF NOT EXISTS managers (
    staff_id INT PRIMARY KEY REFERENCES staffs(staff_id) ON DELETE CASCADE,
    bo_id INT REFERENCES branch_offices(bo_id) ON DELETE SET NULL,
    date_appointed DATE NOT NULL,
    car_allowance DEC(10, 2) NOT NULL,
    bonus DEC(10, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS groups (
    group_id SERIAL PRIMARY KEY,
    group_name VARCHAR(255),
    group_description TEXT
);

CREATE TABLE IF NOT EXISTS secretaries (
    staff_id INT PRIMARY KEY REFERENCES staffs(staff_id) ON DELETE CASCADE,
    group_id INT REFERENCES groups(group_id) ON DELETE SET NULL,
    typing_speed INT
);

CREATE TABLE IF NOT EXISTS supervisors (
    staff_id INT PRIMARY KEY REFERENCES staffs(staff_id) ON DELETE CASCADE,
    group_id INT REFERENCES groups(group_id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS staff_group_members (
    staff_id INT PRIMARY KEY REFERENCES staffs(staff_id) ON DELETE CASCADE,
    group_id INT NOT NULL REFERENCES groups(group_id) ON DELETE CASCADE,
    date_joined DATE DEFAULT CURRENT_DATE
);

CREATE TABLE IF NOT EXISTS users (
    user_id SERIAL PRIMARY KEY,
    bo_id INT NOT NULL REFERENCES branch_offices(bo_id) ON DELETE SET NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    street VARCHAR(100),
    area VARCHAR(50),
    city VARCHAR(50),
    postcode CHAR(15),
    telephone CHAR(15),
    email VARCHAR(100),
    date_registered DATE DEFAULT CURRENT_DATE
);

CREATE TABLE IF NOT EXISTS user_accounts (
    user_id INT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    email VARCHAR(255),
    password VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS property_owners (
    po_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS property_for_rents (
    pfr_id SERIAL PRIMARY KEY,
    po_id INT REFERENCES property_owners(po_id) ON DELETE SET NULL,
    staff_id INT REFERENCES staffs(staff_id) ON DELETE SET NULL,
    street VARCHAR(100),
    area VARCHAR(50),
    city VARCHAR(50),
    postcode CHAR(15),
    type_of_pfr VARCHAR(20) NOT NULL,
    pfr_status VARCHAR(25) NOT NULL, -- available, rented, reserved, withdrawn
    no_of_rooms INT NOT NULL,
    monthly_rent DEC(10, 2) NOT NULL,
    date_withdrawn DATE
);

SELECT * FROM property_for_rents;

CREATE TABLE IF NOT EXISTS clients (
    client_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS lease_agreements (
    la_id SERIAL PRIMARY KEY,
    staff_id INT REFERENCES staffs(staff_id) ON DELETE SET NULL,
    client_id INT REFERENCES clients(client_id) ON DELETE SET NULL,
    pfr_id INT REFERENCES property_for_rents(pfr_id) ON DELETE SET NULL,
    monthly_rent DEC(10, 2),
    payment_method VARCHAR(15),
    rent_deposit DEC(10, 2),
    deposit_status VARCHAR(6) DEFAULT 'unpaid',
    date_start DATE NOT NULL,
    date_end DATE NOT NULL,
    date_expired DATE,
    CONSTRAINT chk_dates CHECK (date_end > date_start),
    CONSTRAINT chk_duration CHECK (
        (date_end - date_start) >= 90 AND
        (date_end - date_start) <= 365
    )
);

CREATE TABLE IF NOT EXISTS property_inspections (
    pi_id SERIAL PRIMARY KEY,
    pfr_id INT NOT NULL REFERENCES property_for_rents(pfr_id) ON DELETE CASCADE,
    staff_id INT REFERENCES staffs(staff_id) ON DELETE SET NULL,
    pi_date DATE NOT NULL,
    comments TEXT
);


CREATE TABLE IF NOT EXISTS property_requirements_details (
    prd_id SERIAL PRIMARY KEY,
    client_id INT NOT NULL REFERENCES clients(client_id),
    preferred_type VARCHAR(20),
    max_rent DEC(10, 2),
    comments TEXT
);

CREATE TABLE IF NOT EXISTS newspaper_companies (
    npc_id SERIAL PRIMARY KEY,
    npc_name VARCHAR(100) NOT NULL,
    street VARCHAR(100),
    area VARCHAR(50),
    city VARCHAR(50),
    postcode CHAR(15),
    telephone CHAR(15)
);


CREATE TABLE IF NOT EXISTS advertisements (
    ad_id SERIAL PRIMARY KEY,
    pfr_id INT NOT NULL REFERENCES property_for_rents(pfr_id) ON DELETE CASCADE,
    np_id INT NOT NULL REFERENCES newspaper_companies(npc_id) ON DELETE CASCADE,
    ad_date DATE,
    cost DEC(10, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS viewings (
    viewing_id SERIAL PRIMARY KEY,
    pfr_id INT NOT NULL REFERENCES property_for_rents(pfr_id) ON DELETE CASCADE,
    client_id INT NOT NULL REFERENCES clients(client_id) ON DELETE CASCADE,
    viewing_date DATE NOT NULL,
    comments TEXT
);
DROP TABLE viewings;

SELECT * FROM viewings;
SELECT * FROM newspaper_companies;
SELECT * FROM advertisements;
SELECT * FROM property_requirements_details;
SELECT * FROM clients;
SELECT * FROM property_owners;
SELECT * FROM property_inspections;
SELECT * FROM lease_agreements;
SELECT * FROM property_for_rents;
SELECT * FROM staff_group_members;
SELECT * FROM supervisors;
SELECT * FROM secretaries;
SELECT * FROM managers;
SELECT * FROM next_of_kins;
SELECT * FROM staffs;
SELECT * FROM branch_offices;

DROP TABLE IF EXISTS branch_offices;
DROP TABLE IF EXISTS staffs;
DROP TABLE IF EXISTS staff_accounts;
DROP TABLE IF EXISTS next_of_kins;
DROP TABLE IF EXISTS managers;
DROP TABLE IF EXISTS secretaries;
DROP TABLE IF EXISTS supervisors;
DROP TABLE IF EXISTS staff_group_members;
DROP TABLE IF EXISTS property_for_rents;
DROP TABLE IF EXISTS lease_agreements;
DROP TABLE IF EXISTS property_inspections;
DROP TABLE IF EXISTS property_owners;
DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS user_accounts;
DROP TABLE IF EXISTS property_requirements_details;
DROP TABLE IF EXISTS newspaper_companies;
DROP TABLE IF EXISTS advertisements;
DROP TABLE IF EXISTS viewings;