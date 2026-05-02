CREATE OR REPLACE FUNCTION check_withdrawal_period()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.date_withdrawn IS NULL OR
        OLD.date_withdrawn > CURRENT_DATE - INTERVAL '3 years' THEN
        RAISE EXCEPTION 'Property % cannot be deleted — 3 year retention period has not elapsed.', OLD.pfr_no;
    END IF;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER enforce_retention_period
BEFORE DELETE ON property_for_rent
FOR EACH ROW EXECUTE FUNCTION check_withdrawal_period();

CREATE OR REPLACE FUNCTION check_group_size()
RETURNS TRIGGER AS $$
DECLARE
    member_count INT;
BEGIN
    SELECT COUNT(*) INTO member_count
    FROM staff_group_members
    WHERE group_no = NEW.group_no;

    IF member_count >= 10 THEN
        RAISE EXCEPTION 'Group % already has 10 members (maximum reached).', NEW.group_no;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER enforce_max_group_size
BEFORE INSERT ON staff_group_member
FOR EACH ROW EXECUTE FUNCTION check_group_size();

CREATE OR REPLACE FUNCTION check_lease_retention()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.date_expired IS NULL OR
        OLD.date_expired > CURRENT_DATE - INTERVAL '3 years' THEN
        RAISE EXCEPTION 'Lease % cannot be deleted — 3 year retention period has not elapsed.', OLD.la_no;
    END IF;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER enforce_lease_retention
BEFORE DELETE ON lease_agreement
FOR EACH ROW EXECUTE FUNCTION check_lease_retention();
    

CREATE OR REPLACE FUNCTION check_property_inspectable()
RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT date_withdrawn FROM property_for_rent 
        WHERE pfr_no = NEW.pfr_no) IS NOT NULL THEN
        RAISE EXCEPTION 'Property % is withdrawn and cannot be inspected.', NEW.pfr_no;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER enforce_inspectable_property
BEFORE INSERT ON property_inspection
FOR EACH ROW EXECUTE FUNCTION check_property_inspectable();
