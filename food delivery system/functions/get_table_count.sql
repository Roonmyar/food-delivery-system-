create or replace FUNCTION get_table_count(table_name IN VARCHAR2) 
RETURN NUMBER IS
  row_count NUMBER;
BEGIN
  EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM ' || table_name INTO row_count;
  RETURN row_count;
END;
/