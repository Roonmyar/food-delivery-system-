create or replace TRIGGER check_menu_description_length
BEFORE INSERT OR UPDATE ON menu
FOR EACH ROW
DECLARE
  description_length INTEGER;
  invalid_length EXCEPTION;
BEGIN
  description_length := LENGTH(:NEW.description);
  IF description_length < 5 THEN
    RAISE invalid_length;
  END IF;
EXCEPTION
  WHEN invalid_length THEN
    raise_application_error(-20001, 'Description must be at least 5 characters long');
END;
/