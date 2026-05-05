DELETE FROM property_for_rent WHERE pfr_id = 13;
DELETE FROM lease_agreement WHERE la_id = 7;

-- Link properties to owners and branches
SELECT pfr.pfr_id, pfr.street, pfr.city, pfr.monthly_rent,
u.first_name, u.last_name,
bo.city AS branch_city
FROM property_for_rents pfr
JOIN property_owners po ON pfr.po_id = po.po_id
JOIN users u ON u.user_id = po.user_id
JOIN branch_offices bo ON u.bo_id = bo.bo_id;

UPDATE property_for_rent SET date_withdrawn = '2023-03-10'

SELECT * FROM branch_office;
SELECT * FROM property_owner;
SELECT * FROM property_for_rent;
SELECT * FROM lease_agreement;