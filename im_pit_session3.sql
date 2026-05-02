DELETE FROM property_for_rent WHERE pfr_no = 13;
DELETE FROM lease_agreement WHERE la_no = 7;

-- Link properties to owners and branches
SELECT pfr.pfr_no, pfr.street, pfr.city, pfr.monthly_rent,
po.full_name AS owner_name,
bo.city AS branch_city
FROM property_for_rent pfr
JOIN property_owner po ON pfr.po_no = po.po_no
JOIN branch_office bo ON po.bo_no = bo.bo_no;

UPDATE property_for_rent SET date_withdrawn = '2023-03-10'

SELECT * FROM branch_office;
SELECT * FROM property_owner;
SELECT * FROM property_for_rent;
SELECT * FROM lease_agreement;