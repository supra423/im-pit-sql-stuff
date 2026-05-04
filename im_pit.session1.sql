-- retain property_for_rents record for 3 years CHECKED
CREATE OR REPLACE FUNCTION check_withdrawal_period()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.date_withdrawn IS NULL OR
        OLD.date_withdrawn > CURRENT_DATE - INTERVAL '3 years' THEN
        RAISE EXCEPTION 'Property % cannot be deleted, 3 year retention period has not elapsed.', OLD.pfr_id;
    END IF;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER enforce_retention_period
BEFORE DELETE ON property_for_rents
FOR EACH ROW EXECUTE FUNCTION check_withdrawal_period();
    
-- check min group size before delete to staff_group_members CHECKED
CREATE OR REPLACE FUNCTION check_group_size_min()
RETURNS TRIGGER AS $$
DECLARE
    member_count INT;
BEGIN
    SELECT COUNT(*) INTO member_count
    FROM staff_group_members
    WHERE group_id = OLD.group_id;

    IF member_count <= 5 THEN
        RAISE EXCEPTION 'Cannot remove member from group %, minimum of 5 members required (minimum reached).', OLD.group_id;
    END IF;

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER enforce_min_group_size
BEFORE DELETE ON staff_group_members
FOR EACH ROW EXECUTE FUNCTION check_group_size_min();

-- check max group size before insert to staff_group_members CHECKED
CREATE OR REPLACE FUNCTION check_group_size_max()
RETURNS TRIGGER AS $$
DECLARE
    member_count INT;
BEGIN
    SELECT COUNT(*) INTO member_count
    FROM staff_group_members
    WHERE group_id = NEW.group_id;

    IF member_count >= 10 THEN
        RAISE EXCEPTION 'Group % already has 10 members (maximum reached).', NEW.group_id;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER enforce_max_group_size
BEFORE INSERT ON staff_group_members
FOR EACH ROW EXECUTE FUNCTION check_group_size_max();

-- retain lease_agreements record for 3 years CHECKED
CREATE OR REPLACE FUNCTION check_lease_retention()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.date_expired IS NULL OR
        OLD.date_expired > CURRENT_DATE - INTERVAL '3 years' THEN
        RAISE EXCEPTION 'Lease % cannot be deleted, 3 year retention period has not elapsed.', OLD.la_id;
    END IF;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER enforce_lease_retention
BEFORE DELETE ON lease_agreements
FOR EACH ROW EXECUTE FUNCTION check_lease_retention();
    
-- check if property is withdrawn CHECKED
CREATE OR REPLACE FUNCTION check_property_inspectable()
RETURNS TRIGGER AS $$
DECLARE
pfr_status VARCHAR(25);
BEGIN
    SELECT property_for_rents.pfr_status INTO pfr_status
    FROM property_for_rents
    WHERE property_for_rents.pfr_id = NEW.pfr_id;
    
    IF pfr_status = 'withdrawn' THEN
        RAISE EXCEPTION 'Property % is withdrawn and cannot be inspected.', NEW.pfr_id;
    END IF;
    RETURN NEW;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER enforce_inspectable_property
BEFORE INSERT ON property_inspections
FOR EACH ROW EXECUTE FUNCTION check_property_inspectable();


-- check if staff handles 20 properties CHECKED
CREATE OR REPLACE FUNCTION check_properties_handled_by_staff()
RETURNS TRIGGER AS $$
DECLARE
property_count INT;
BEGIN
    SELECT COUNT(*) INTO property_count
    FROM property_for_rents
    WHERE staff_id = NEW.staff_id
    AND pfr_status != 'withdrawn';
    
    IF property_count >= 20 THEN
        RAISE EXCEPTION 'Staff % is already handling 20 properties (Maximum reached)', NEW.staff_id;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER enforce_properties_handled_limit_by_staff
BEFORE INSERT ON property_for_rents
FOR EACH ROW EXECUTE FUNCTION check_properties_handled_by_staff();