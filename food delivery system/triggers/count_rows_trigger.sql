create or replace TRIGGER count_rows_trigger
BEFORE INSERT ON customers
FOR EACH ROW
DECLARE
  row_count NUMBER;
BEGIN
  row_count := get_table_count('customers') + 1;
  DBMS_OUTPUT.PUT_LINE('Current row count: ' || row_count);
END;
/