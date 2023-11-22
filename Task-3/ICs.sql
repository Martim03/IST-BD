DROP TRIGGER IF EXISTS trigger_check_address_workplace ON workplace;
DROP TRIGGER IF EXISTS trigger_check_order_in_contains ON "order";
DROP FUNCTION IF EXISTS check_address_workplace;
DROP FUNCTION IF EXISTS check_order_in_contains;

ALTER TABLE employee
DROP CONSTRAINT IF EXISTS check_employee_age,
ADD CONSTRAINT check_employee_age CHECK(DATE_DIFF(bdate, CURRENT_DATE) >= 18);

CREATE OR REPLACE FUNCTION DATE_DIFF(start_date DATE, end_date DATE)
    RETURNS INT AS
$$
DECLARE diff_years INT;
BEGIN
    diff_years = EXTRACT(YEAR FROM end_date) - EXTRACT(YEAR FROM start_date);

    IF EXTRACT(MONTH FROM end_date) < EXTRACT(MONTH FROM start_date) OR
        (EXTRACT(MONTH FROM end_date) = EXTRACT(MONTH FROM start_date) AND
         EXTRACT(DAY FROM end_date) < EXTRACT(DAY FROM start_date)) THEN
        diff_years := diff_years - 1;
    END IF;

    RETURN diff_years;
END;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION check_address_workplace()
  RETURNS TRIGGER AS
$$
DECLARE N_OFF INT;
DECLARE N_WARE INT;
BEGIN
    SELECT COUNT(*) INTO N_OFF
    FROM office
    WHERE office.address = NEW.address;
    SELECT COUNT(*) INTO N_WARE
    FROM warehouse
    WHERE warehouse.address = NEW.address;
    IF N_OFF = 0 AND N_WARE = 0 THEN
    RAISE EXCEPTION 'address must be either in warehouse or office';
    END IF;
    IF N_OFF > 0 AND N_WARE > 0 THEN
    RAISE EXCEPTION 'address cannot be both in warehouse and office simultaneously';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;



CREATE CONSTRAINT TRIGGER trigger_check_address_workplace
AFTER INSERT ON workplace DEFERRABLE
FOR EACH ROW EXECUTE FUNCTION check_address_workplace();

CREATE OR REPLACE FUNCTION check_order_in_contains()
  RETURNS TRIGGER AS
$$
BEGIN IF NOT EXISTS (
    SELECT *
    FROM contains
    WHERE contains.order_no = NEW.order_no
    ) THEN
      RAISE EXCEPTION 'order must exist in contains';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE CONSTRAINT TRIGGER trigger_check_order_in_contains
AFTER INSERT ON "order" DEFERRABLE
FOR EACH ROW EXECUTE FUNCTION check_order_in_contains();