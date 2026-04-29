CREATE TABLE IF NOT EXISTS branch_office (
    bo_no SERIAL PRIMARY KEY,
    street VARCHAR(100),
    area VARCHAR(50),
    city VARCHAR(50),
    postcode CHAR(15),
    telephone CHAR(25),
    fax_number CHAR(25)
);

CREATE TABLE IF NOT EXISTS staff (
    staff_no SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    street VARCHAR(100),
    area VARCHAR(50),
    city VARCHAR(50),
    postcode CHAR(15),
    telephone CHAR(15),
    sex CHAR(1) NOT NULL,
    date_of_birth DATE,
    job_title VARCHAR(25) NOT NULL,
    salary DEC(10, 2) NOT NULL,
    date_joined DATE
);

CREATE TABLE IF NOT EXISTS next_of_kin (
    nok_no SERIAL PRIMARY KEY,
    staff_no INT NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    relationship VARCHAR(25) NOT NULL,
    street VARCHAR(100),
    area VARCHAR(50),
    city VARCHAR(50),
    postcode CHAR(15),
    telephone CHAR(15),
    FOREIGN KEY (staff_no) REFERENCES staff(staff_no)
);

CREATE TABLE IF NOT EXISTS manager (
    staff_no INT PRIMARY KEY,
    bo_no INT NOT NULL,
    date_appointed DATE NOT NULL,
    car_allowance DEC(10, 2) NOT NULL,
    bonus DEC(10, 2) NOT NULL,
    FOREIGN KEY (staff_no) REFERENCES staff(staff_no),
    FOREIGN KEY (bo_no) REFERENCES branch_office(bo_no)
);

CREATE TABLE IF NOT EXISTS secretary (
    staff_no INT PRIMARY KEY,
    typing_speed INT,
    FOREIGN KEY (staff_no) REFERENCES staff(staff_no)
);

CREATE TABLE IF NOT EXISTS supervisor (
    staff_no INT PRIMARY KEY,
    group_no INT NOT NULL UNIQUE,
    secretary_no INT NOT NULL,
    FOREIGN KEY (staff_no) REFERENCES staff(staff_no),
    FOREIGN KEY (secretary) REFERENCES secretary(staff_no)
);

CREATE TABLE IF NOT EXISTS staff_group_member (
    sgm_no SERIAL PRIMARY KEY,
    group_no INT NOT NULL,
    staff_no INT NOT NULL,
    date_joined DATE,
    FOREIGN KEY (group_no) REFERENCES supervisor(group_no),
    FOREIGN KEY (staff_no) REFERENCES staff(staff_no)
);

CREATE TABLE IF NOT EXISTS property_for_rent (
    pfr_no SERIAL PRIMARY KEY,
    po_no INT NOT NULL,
    staff_no INT NOT NULL,
    street VARCHAR(100),
    area VARCHAR(50),
    city VARCHAR(50),
    postcode CHAR(15),
    type_of_prf VARCHAR(20) NOT NULL,
    no_of_rooms INT NOT NULL,
    monthly_rent DEC(10, 2) NOT NULL,
    date_withdrawn DATE,
    FOREIGN KEY (po_no) REFERENCES property_owner(po_no),
    FOREIGN KEY (staff_no) REFERENCES staff(staff_no)
);

CREATE TABLE IF NOT EXISTS lease_agreement (
    la_no SERIAL PRIMARY KEY,
    staff_no INT NOT NULL,
    client_no INT NOT NULL,
    pfr_no INT NOT NULL,
    monthly_rent DEC(10, 2),
    payment_method VARCHAR(15),
    rent_deposit DEC(10, 2),
    deposit_status VARCHAR(6) DEFAULT 'unpaid',
    date_start DATE NOT NULL,
    date_end DATE NOT NULL,
    date_expired DATE,
    FOREIGN KEY (staff_no) REFERENCES staff(staff_no),
    FOREIGN KEY (client_no) REFERENCES client(client_no),
    FOREIGN KEY (pfr_no) REFERENCES property_for_rent(pfr_no),
    CONSTRAINT chk_dates CHECK (date_end > date_start),
    CONSTRAINT chk_duration CHECK (
        (date_end - date_start) >= 90 AND
        (date_end - date_start) <= 365
    )
);

CREATE TABLE IF NOT EXISTS property_inspection (
    pi_no SERIAL PRIMARY KEY,
    pfr_no INT NOT NULL,
    staff_no INT NOT NULL,
    pi_date DATE NOT NULL,
    comments TEXT,
    FOREIGN KEY (pfr_no) REFERENCES property_for_rent(pfr_no),
    FOREIGN KEY (staff_no) REFERENCES staff(staff_no)
);

CREATE TABLE IF NOT EXISTS property_owner (
    po_no SERIAL PRIMARY KEY,
    bo_no INT NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    street VARCHAR(100),
    area VARCHAR(50),
    city VARCHAR(50),
    postcode CHAR(15),
    telephone CHAR(15),
    email VARCHAR(100),    
    FOREIGN KEY (bo_no) REFERENCES branch_office(bo_no)
);

CREATE TABLE IF NOT EXISTS client (
    client_no SERIAL PRIMARY KEY,
    bo_no INT NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    street VARCHAR(100),
    area VARCHAR(50),
    city VARCHAR(50),
    postcode CHAR(15),
    telephone CHAR(15),
    email VARCHAR(100),
    date_registered DATE NOT NULL,
    FOREIGN KEY (bo_no) REFERENCES branch_office(bo_no)
);

CREATE TABLE IF NOT EXISTS property_requirements_detail (
    prd_no SERIAL PRIMARY KEY,
    client_no INT NOT NULL,
    
    preferred_type VARCHAR(20),
    max_rent DEC(10, 2),
    comments TEXT,
    FOREIGN KEY (client_no) REFERENCES client(client_no)
);

CREATE TABLE IF NOT EXISTS advertisement (
    ad_no SERIAL PRIMARY KEY,
    pfr_no INT NOT NULL,
    np_no INT NOT NULL,
    ad_date DATE,
    cost DEC(10, 2) NOT NULL,
    FOREIGN KEY (pfr_no) REFERENCES property_for_rent(pfr_no),
    FOREIGN KEY (np_no) REFERENCES newspaper_company(npc_no)
);

CREATE TABLE IF NOT EXISTS newspaper_company (
    npc_no SERIAL PRIMARY KEY,
    npc_name VARCHAR(100) NOT NULL,
    street VARCHAR(100),
    area VARCHAR(50),
    city VARCHAR(50),
    postcode CHAR(15),
    telephone CHAR(15)
);

CREATE TABLE IF NOT EXISTS viewing (
    viewing_no SERIAL PRIMARY KEY,
    pfr_no INT NOT NULL,
    client_no INT NOT NULL,
    viewing_date DATE NOT NULL,
    comments TEXT,
    FOREIGN KEY (pfr_no) REFERENCES property_for_rent(pfr_no),
    FOREIGN KEY (client_no) REFERENCES client(client_no)
);

SELECT * FROM viewing;
SELECT * FROM newspaper_company;
SELECT * FROM advertisement;
SELECT * FROM property_requirements_detail;
SELECT * FROM client;
SELECT * FROM property_owner;
SELECT * FROM property_inspection;
SELECT * FROM lease_agreement;
SELECT * FROM property_for_rent;
SELECT * FROM staff_group_member;
SELECT * FROM supervisor;
SELECT * FROM secretary;
SELECT * FROM manager;
SELECT * FROM next_of_kin;
SELECT * FROM staff;
SELECT * FROM branch_office;