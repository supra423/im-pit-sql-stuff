INSERT INTO branch_offices (street, area, city, postcode, telephone, fax_number)
VALUES
    ('123 Baker Street',  'Marylebone',  'London',   'NW1 6XE', '020 7946 0001', '020 7946 0002'),
    ('45 Princes Street', 'City Centre', 'Edinburgh', 'EH2 2BY', '013 1496 0010', '013 1496 0011'),
    ('78 Sauchiehall St', 'Garnethill',  'Glasgow',   'G2 3DH',  '014 1332 0020', '014 1332 0021');

INSERT INTO staffs (first_name, last_name, street, area, city, postcode, telephone, sex, national_insurance_number, date_of_birth, job_title, salary, date_joined)
VALUES
    ('James',   'Robertson',  '12 Elm Street',       'Marylebone',   'London',    'NW1 3AB', '07700900001', 'M', 'AABBCCEED', '1978-03-15', 'Manager',    55000.00, '2010-06-01'),
    ('Sarah',   'Mitchell',   '34 Oak Avenue',       'Garnethill',   'Glasgow',   'G2 1CD',  '07700900002', 'F', 'AABBCCEED', '1985-07-22', 'Manager',    54000.00, '2012-03-15'),
    ('David',   'Thomson',    '56 Pine Road',        'City Centre',  'Edinburgh', 'EH2 3EF', '07700900003', 'M', 'AABBCCEED', '1980-11-08', 'Manager',    56000.00, '2009-09-01'),
    ('Laura',   'Henderson',  '78 Maple Lane',       'Marylebone',   'London',    'NW1 4GH', '07700900004', 'F', 'AABBCCEED', '1990-01-30', 'Supervisor', 38000.00, '2015-01-10'),
    ('Michael', 'Campbell', '90 Birch Boulevard',  'Garnethill',   'Glasgow',   'G2 2IJ',  '07700900005', 'M', 'AABBCCEED', '1988-05-14', 'Supervisor', 37000.00, '2014-07-20'),
    ('Emma',    'Watson',      '11 Cedar Close',      'City Centre',  'Edinburgh', 'EH2 4KL', '07700900006', 'F', 'AABBCCEED', '1992-09-03', 'Supervisor', 39000.00, '2016-04-05'),
    ('Robert',  'Fleming',   '22 Willow Way',       'Marylebone',   'London',    'NW1 5MN', '07700900007', 'M', 'AABBCCEED', '1995-02-18', 'Secretary',  28000.00, '2018-08-12'),
    ('Claire',  'Morrison',  '33 Ash Street',       'Garnethill',   'Glasgow',   'G2 3OP',  '07700900008', 'F', 'AABBCCEED', '1993-06-25', 'Secretary',  27500.00, '2017-11-30'),
    ('Thomas',  'Reid',      '44 Poplar Place',     'City Centre',  'Edinburgh', 'EH2 5QR', '07700900009', 'M', 'AABBCCEED', '1991-12-07', 'Secretary',  28500.00, '2019-02-14'),
    ('Angela',  'Stewart',   '55 Chestnut Court',   'Marylebone',   'London',    'NW1 6ST', '07700900010', 'F', 'AABBCCEED', '1987-04-19', 'Staff',      25000.00, '2016-05-22'),
    ('Brian',   'Murray',     '66 Hazel Hill',       'Garnethill',   'Glasgow',   'G2 4UV',  '07700900011', 'M', 'AABBCCEED', '1994-08-11', 'Staff',      24500.00, '2019-09-01'),
    ('Diana',   'Black',      '77 Rowan Road',       'City Centre',  'Edinburgh', 'EH2 6WX', '07700900012', 'F', 'AABBCCEED', '1996-03-28', 'Staff',      25500.00, '2020-01-15'),
    ('George',  'Hamilton',  '88 Sycamore Street',  'Marylebone',   'London',    'NW1 7YZ', '07700900013', 'M', 'AABBCCEED', '1983-10-05', 'Staff',      26000.00, '2013-07-08'),
    ('Helen',   'Grant',      '99 Beech Boulevard',  'Garnethill',   'Glasgow',   'G2 5AB',  '07700900014', 'F', 'AABBCCEED', '1989-07-16', 'Staff',      24000.00, '2015-03-19'),
    ('Ian',     'Douglas',      '10 Laurel Lane',      'City Centre',  'Edinburgh', 'EH2 7CD', '07700900015', 'M', 'AABBCCEED', '1997-01-23', 'Staff',      23500.00, '2021-06-30'),
    ('Janet',   'Simpson',    '21 Magnolia Mews',    'Marylebone',   'London',    'NW1 8EF', '07700900016', 'F', 'AABBCCEED', '1986-09-09', 'Staff',      25000.00, '2014-11-25'),
    ('Kevin',   'MacDonald',  '32 Acacia Avenue',    'Garnethill',   'Glasgow',   'G2 6GH',  '07700900017', 'M', 'AABBCCEED', '1998-05-31', 'Staff',      23000.00, '2022-02-07'),
    ('Linda',   'Patterson',  '43 Juniper Junction', 'City Centre',  'Edinburgh', 'EH2 8IJ', '07700900018', 'F', 'AABBCCEED', '1984-02-14', 'Staff',      26500.00, '2011-08-16'),
    ('Mark',    'Wilson',      '54 Spruce Square',    'Marylebone',   'London',    'NW1 9KL', '07700900019', 'M', 'AABBCCEED', '1999-11-20', 'Staff',      22500.00, '2023-01-03'),
    ('Nancy',   'Young',      '65 Fir Field',        'Garnethill',   'Glasgow',   'G2 7MN',  '07700900020', 'F', 'AABBCCEED', '1982-06-27', 'Staff',      27000.00, '2012-10-11');

INSERT INTO next_of_kins (staff_id, first_name, last_name, relationship, street, area, city, postcode, telephone)
VALUES
    (1,  'Mary' , 'Robertson',   'Spouse',  '12 Elm Street',      'Marylebone',  'London',    'NW1 3AB', '07700800001'),
    (2,  'John' , 'Mitchell',    'Spouse',  '34 Oak Avenue',       'Garnethill',  'Glasgow',   'G2 1CD',  '07700800002'),
    (3,  'Patricia', 'Thomson', 'Spouse',  '56 Pine Road',        'City Centre', 'Edinburgh', 'EH2 3EF', '07700800003'),
    (4,  'George'  , 'Henderson', 'Father',  '88 Rose Street',      'Mayfair',     'London',    'NW1 2AB', '07700800004'),
    (5,  'Anne', 'Campbell',    'Mother',  '12 Thistle Lane',     'Partick',     'Glasgow',   'G2 8CD',  '07700800005'),
    (6,  'Paul', 'Watson',      'Spouse',  '45 Castle Road',      'Newington',   'Edinburgh', 'EH2 9EF', '07700800006'),
    (7,  'Susan', 'Fleming',    'Spouse',  '22 Willow Way',       'Marylebone',  'London',    'NW1 5MN', '07700800007'),
    (8,  'Peter', 'Morrison',   'Father',  '67 Broom Avenue',     'Shawlands',   'Glasgow',   'G2 5GH',  '07700800008'),
    (9,  'Karen', 'Reid',       'Spouse',  '44 Poplar Place',     'City Centre', 'Edinburgh', 'EH2 5QR', '07700800009'),
    (10, 'Daniel', 'Stewart',   'Spouse',  '99 Daisy Drive',      'Fitzrovia',   'London',    'NW1 1IJ', '07700800010'),
    (11, 'Lisa', 'Murray',      'Spouse',  '33 Bluebell Road',    'Maryhill',    'Glasgow',   'G2 9KL',  '07700800011'),
    (12, 'Steven', 'Black',     'Spouse',  '77 Rowan Road',       'City Centre', 'Edinburgh', 'EH2 6WX', '07700800012'),
    (13, 'Carol', 'Hamilton',   'Spouse',  '55 Heather Hill',     'Paddington',  'London',    'NW1 4MN', '07700800013'),
    (14, 'Frank', 'Grant',      'Spouse',  '21 Clover Close',     'Dennistoun',  'Glasgow',   'G2 3OP',  '07700800014'),
    (15, 'Ruth', 'Douglas',     'Mother',  '10 Laurel Lane',      'City Centre', 'Edinburgh', 'EH2 7CD', '07700800015'),
    (16, 'Alan', 'Simpson',     'Spouse',  '88 Violet Vale',      'Islington',   'London',    'NW1 6QR', '07700800016'),
    (17, 'Jean', 'MacDonald',   'Mother',  '14 Primrose Path',    'Pollokshaws', 'Glasgow',   'G2 2ST',  '07700800017'),
    (18, 'Charles', 'Patterson','Spouse',  '43 Juniper Junction', 'City Centre', 'Edinburgh', 'EH2 8IJ', '07700800018'),
    (19, 'Dorothy', 'Wilson',   'Mother',  '76 Orchid Avenue',    'Bloomsbury',  'London',    'NW1 8UV', '07700800019'),
    (20, 'Harry', 'Young',      'Father',  '65 Fir Field',        'Garnethill',  'Glasgow',   'G2 7MN',  '07700800020');

INSERT INTO managers (staff_id, bo_id, date_appointed, car_allowance, bonus)
VALUES
    (1, 1, '2010-06-01', 5000.00, 750.00),
    (2, 2, '2012-03-15', 4800.00, 700.00),
    (3, 3, '2009-09-01', 5200.00, 800.00);

INSERT INTO groups (group_name, group_description) VALUES
('Group 1', 'Sample description'),
('Group 2', 'Sample description'),
('Group 3', 'Sample description');

SELECT * FROM groups;

INSERT INTO secretaries (staff_id, group_id, typing_speed)
VALUES
    (7, 1, 65),
    (8, 2, 72),
    (9, 3, 68);

INSERT INTO supervisors (staff_id, group_id)
VALUES
    (4, 1),
    (5, 2),
    (6, 3);

INSERT INTO staff_group_members (group_id, staff_id, date_joined) VALUES
(1, 10, '2016-06-05'),
(1, 11, '2019-09-15'),
(1, 12, '2020-02-15'),
(2, 13, '2013-10-08'),
(2, 14, '2015-03-26'),
(2, 15, '2021-07-15'),
(2, 16, '2015-01-25'),
(2, 17, '2022-02-28'),
(3, 18, '2012-02-16'),
(3, 19, '2023-01-10'),
(3, 20, '2013-02-11');

INSERT INTO staff_group_members (group_id, staff_id, date_joined) VALUES
(3, 20, '2013-02-11'),
(3, 20, '2013-02-11');

SELECT * FROM staff_group_members;


INSERT INTO users (bo_id, first_name, last_name, street, area, city, postcode, telephone, email, date_registered) VALUES
(1, 'John', 'Anderson', '123 Queen Street', 'City Centre', 'London', 'EC2V 8AS', '07700900100', 'john.anderson@email.com', '2023-01-12'),
(2, 'Mary', 'Williams', '45 Princes Street', 'City Centre', 'Edinburgh', 'EH2 2BY', '07700900101', 'mary.williams@email.com', '2023-01-13'),
(1, 'Robert', 'Brown', '78 Buchanan Street', 'Garnethill', 'Glasgow', 'G1 3HF', '07700900102', 'robert.brown@email.com', '2023-01-11'),
(3, 'Patricia', 'Jones', '22 High Street', 'Marylebone', 'London', 'NW1 6NR', '07700900103', 'patricia.jones@email.com', '2023-01-12'),
(2, 'Michael', 'Davies', '34 George Street', 'City Centre', 'Edinburgh', 'EH2 2LE', '07700900104', 'michael.davies@email.com', '2023-01-09'),
(1, 'Elizabeth', 'Wilson', '56 Sauchiehall Street', 'Garnethill', 'Glasgow', 'G2 3EX', '07700900105', 'elizabeth.wilson@email.com', '2023-01-08'),
(3, 'James', 'Taylor', '90 Oxford Street', 'Marylebone', 'London', 'W1D 1LL', '07700900106', 'james.taylor@email.com', '2023-01-12'),

(1, 'Sarah', 'Mitchell', '15 Park Lane', 'Marylebone', 'London', 'W1K 1QA', '07700100001', 'sarah.mitchell@email.com', '2023-01-12'),
(2, 'Thomas', 'Wright', '23 Victoria Street', 'City Centre', 'Edinburgh', 'EH1 2HE', '07700100002', 'thomas.wright@email.com', '2023-02-15'),
(1, 'Emma', 'Thompson', '47 Bath Street', 'Garnethill', 'Glasgow', 'G2 2HG', '07700100003', 'emma.thompson@email.com', '2023-03-20'),
(3, 'Daniel', 'White', '89 Kings Road', 'Marylebone', 'London', 'SW3 4TQ', '07700100004', 'daniel.white@email.com', '2023-04-25'),
(2, 'Laura', 'Martin', '12 Rose Street', 'City Centre', 'Edinburgh', 'EH2 2PR', '07700100005', 'laura.martin@email.com', '2023-05-30'),
(1, 'Paul', 'Harris', '34 Byres Road', 'Garnethill', 'Glasgow', 'G12 8TR', '07700100006', 'paul.harris@email.com', '2023-06-05'),
(3, 'Karen', 'Robinson', '56 Baker Street', 'Marylebone', 'London', 'W1U 6RT', '07700100007', 'karen.robinson@email.com', '2023-07-12'),
(2, 'Steven', 'Clark', '78 George IV Bridge', 'City Centre', 'Edinburgh', 'EH1 1EJ', '07700100008', 'steven.clark@email.com', '2023-08-18'),
(1, 'Rachel', 'Lewis', '90 Dumbarton Road', 'Garnethill', 'Glasgow', 'G11 6PT', '07700100009', 'rachel.lewis@email.com', '2023-09-22'),
(3, 'Andrew', 'Walker', '21 Oxford Street', 'Marylebone', 'London', 'W1D 2HT', '07700100010', 'andrew.walker@email.com', '2023-10-28'),
(2, 'Nicole', 'Allen', '43 Hanover Street', 'City Centre', 'Edinburgh', 'EH2 2DL', '07700100011', 'nicole.allen@email.com', '2023-11-15'),
(1, 'Jonathan' , 'King', '65 Byres Road', 'Garnethill', 'Glasgow', 'G12 8TJ', '07700100012', 'jonathan.king@email.com', '2023-12-01');

INSERT INTO property_owners (user_id) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7);

SELECT * FROM clients;

INSERT INTO clients (user_id) VALUES
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19);

INSERT INTO property_for_rents (po_id, staff_id, street, area, city, postcode, type_of_pfr, pfr_status, no_of_rooms, monthly_rent, date_withdrawn) VALUES
(1, 10, '55 Chestnut Court', 'Marylebone', 'London', 'NW1 6ST', 'Flat',       'rented', 2, 1200.00, NULL),
(2, 11, '66 Hazel Hill', 'Garnethill', 'Glasgow', 'G2 4UV', 'House',          'rented', 3, 950.00, NULL),
(3, 12, '77 Rowan Road', 'City Centre', 'Edinburgh', 'EH2 6WX', 'Flat',       'rented', 1, 800.00, NULL),
(1, 13, '88 Sycamore Street', 'Marylebone', 'London', 'NW1 7YZ', 'House',     'rented', 4, 1800.00, NULL),
(4, 14, '99 Beech Boulevard', 'Garnethill', 'Glasgow', 'G2 5AB', 'Flat',      'rented', 2, 1100.00, NULL),
(2, 10, '10 Laurel Lane', 'City Centre', 'Edinburgh', 'EH2 7CD', 'House',     'reserved', 2, 1300.00, NULL),
(5, 11, '21 Magnolia Mews', 'Marylebone', 'London', 'NW1 8EF', 'House',       'withdrawn', 3, 1600.00, '2024-01-20'),
(3, 12, '32 Acacia Avenue', 'Garnethill', 'Glasgow', 'G2 6GH', 'Flat',        'available', 1, 750.00, NULL),
(4, 13, '43 Juniper Junction', 'City Centre', 'Edinburgh', 'EH2 8IJ', 'House','available', 4, 2000.00, NULL),
(5, 14, '54 Spruce Square', 'Marylebone', 'London', 'NW1 9KL', 'Flat',        'withdrawn', 2, 1250.00, '2024-03-10');

INSERT INTO property_for_rents (po_id, staff_id, street, area, city, postcode, type_of_pfr, pfr_status, no_of_rooms, monthly_rent, date_withdrawn) VALUES
(1, 10, '55 Chestnut Court', 'Marylebone', 'London', 'NW1 6ST', 'Flat',       'available', 2, 1200.00, NULL),
(1, 10, '55 Chestnut Court', 'Marylebone', 'London', 'NW1 6ST', 'Flat',       'available', 2, 1200.00, NULL),
(1, 10, '55 Chestnut Court', 'Marylebone', 'London', 'NW1 6ST', 'Flat',       'available', 2, 1200.00, NULL),
(1, 10, '55 Chestnut Court', 'Marylebone', 'London', 'NW1 6ST', 'Flat',       'available', 2, 1200.00, NULL),
(1, 10, '55 Chestnut Court', 'Marylebone', 'London', 'NW1 6ST', 'Flat',       'available', 2, 1200.00, NULL),
(1, 10, '55 Chestnut Court', 'Marylebone', 'London', 'NW1 6ST', 'Flat',       'available', 2, 1200.00, NULL),
(1, 10, '55 Chestnut Court', 'Marylebone', 'London', 'NW1 6ST', 'Flat',       'available', 2, 1200.00, NULL),
(1, 10, '55 Chestnut Court', 'Marylebone', 'London', 'NW1 6ST', 'Flat',       'available', 2, 1200.00, NULL),
(1, 10, '55 Chestnut Court', 'Marylebone', 'London', 'NW1 6ST', 'Flat',       'available', 2, 1200.00, NULL),
(1, 10, '55 Chestnut Court', 'Marylebone', 'London', 'NW1 6ST', 'Flat',       'available', 2, 1200.00, NULL);

SELECT * FROM property_for_rents;

INSERT INTO property_for_rents (po_id, staff_id, street, area, city, postcode, type_of_pfr, pfr_status, no_of_rooms, monthly_rent, date_withdrawn) VALUES
(1, 10, '55 Chestnut Court', 'Marylebone', 'London', 'NW1 6ST', 'Flat',       'available', 2, 1200.00, NULL);


INSERT INTO lease_agreements (staff_id, client_id, pfr_id, monthly_rent, payment_method, rent_deposit, deposit_status, date_start, date_end, date_expired) VALUES
(10, 1, 1, 1200.00, 'Bank Transfer', 1200.00, 'paid', '2024-01-15', '2024-10-15', NULL),
(11, 2, 2, 950.00, 'Credit Card', 950.00, 'paid', '2024-02-01', '2024-11-01', NULL),
(12, 3, 3, 800.00, 'Cash', 800.00, 'unpaid', '2023-03-10', '2023-12-10', '2023-12-10'),
(13, 4, 4, 1800.00, 'Bank Transfer', 1800.00, 'paid', '2024-03-20', '2024-12-20', NULL),
(10, 5, 5, 1100.00, 'Credit Card', 1100.00, 'unpaid', '2024-04-05', '2025-01-05', NULL);

SELECT * FROM lease_agreements;
DELETE FROM lease_agreements WHERE la_id = 7;

INSERT INTO lease_agreements (staff_id, client_id, pfr_id, monthly_rent, payment_method, rent_deposit, deposit_status, date_start, date_end, date_expired) VALUES
(10, 1, 1, 1200.00, 'Bank Transfer', 1200.00, 'paid', '2024-01-15', '2024-10-15', '2023-05-05');

INSERT INTO property_inspections (pfr_id, staff_id, pi_date, comments) VALUES
(1, 10, '2024-01-20', 'Property in good condition, minor wear and tear'),
(2, 11, '2024-02-15', 'Boiler needs servicing, otherwise fine'),
(1, 14, '2024-03-10', 'Tenant keeping property clean'),
(6, 12, '2023-06-01', 'Property needs repainting'),
(4, 13, '2024-01-25', 'Excellent condition, new appliances'),
(2, 11, '2024-04-05', 'Garden needs maintenance'),
(5, 10, '2024-02-28', 'Damp issue in bathroom'),
(6, 15, '2023-09-15', 'Vacant property, ready for new tenant'),
(4, 16, '2024-03-20', 'Leaking tap in kitchen repaired');
SELECT * FROM property_inspections;

SELECT * FROM property_for_rents;
INSERT INTO property_inspections (pfr_id, staff_id, pi_date, comments) VALUES
(7, 10, '2024-01-20', 'Property in good condition, minor wear and tear');


INSERT INTO property_inspections (pfr_id, staff_id, pi_date, comments) VALUES
(8, 10, '2026-03-05', 'Excellent condition.');

SELECT * FROM property_inspections;

INSERT INTO property_requirements_details (client_id, preferred_type, max_rent, comments) VALUES
(1, 'Flat', 1300.00, 'Prefer ground floor, near tube station'),
(2, 'House', 1000.00, 'Need garden, pet friendly'),
(3, 'Flat', 850.00, 'Studio acceptable, bills included'),
(4, 'House', 2000.00, 'Minimum 3 bedrooms, parking required'),
(5, 'Flat', 1200.00, 'Modern finish, dishwasher essential'),
(6, 'Maisonette', 1400.00, 'Two bathrooms minimum'),
(7, 'House', 1700.00, 'Close to school, family area'),
(8, 'Flat', 900.00, 'Student friendly, shared allowed'),
(9, 'House', 2100.00, 'Executive area, secure parking'),
(10, 'Flat', 1100.00, 'Short term lease preferred'),
(11, 'Maisonette', 1500.00, 'Recently renovated'),
(12, 'House', 1950.00, 'Home office space needed');

INSERT INTO newspaper_companies (npc_name, street, area, city, postcode, telephone) VALUES
('Daily Herald', '123 Fleet Street', 'City Centre', 'London', 'EC4A 2BB', '02079460001'),
('The Scotsman', '108 Holyrood Road', 'City Centre', 'Edinburgh', 'EH8 8AS', '01316220001'),
('Glasgow Chronicle', '67 Hope Street', 'Garnethill', 'Glasgow', 'G2 6AE', '01415550001');

INSERT INTO advertisements (pfr_id, np_id, ad_date, cost) VALUES
(1, 1, '2024-01-10', 250.00),
(2, 2, '2024-02-01', 200.00),
(3, 3, '2023-03-05', 300.00),
(4, 1, '2024-03-15', 350.00),
(5, 2, '2024-04-01', 225.00),
(6, 3, '2024-04-10', 275.00),
(7, 1, '2024-01-15', 400.00),
(8, 2, '2024-02-20', 180.00),
(9, 3, '2024-03-25', 320.00),
(10, 1, '2024-04-05', 260.00);

INSERT INTO viewings (pfr_id, client_id, viewing_date, comments) VALUES
(1, 1, '2024-01-18', 'Client liked the property, considering offer'),
(2, 2, '2024-02-10', 'Too small for family, will continue search'),
(3, 3, '2023-05-20', 'Perfect location, submitted application'),
(4, 4, '2024-03-25', 'Excellent condition, very interested'),
(5, 5, '2024-04-08', 'Needs renovation, client not interested'),
(1, 6, '2024-01-22', 'Second viewing, ready to sign lease'),
(6, 7, '2024-04-12', 'Good value for money, considering'),
(7, 8, '2024-01-20', 'Loved the garden, will proceed'),
(8, 9, '2024-03-28', 'Too far from transport links, declined');


SELECT * FROM viewings;
