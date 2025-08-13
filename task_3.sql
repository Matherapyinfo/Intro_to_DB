-- task_3.sql - Lists tables with database verification

/* First ensure we're operating on the correct database */
SET @target_db = 'alx_book_store';

SELECT 
    IF(DATABASE() = @target_db, 
       CONCAT('Listing tables from correct database (', @target_db, '):'),
       CONCAT('ERROR: Not connected to ', @target_db, '! Currently using: ', IFNULL(DATABASE(), 'none'))) 
AS verification;

/* Only proceed if we're in the correct database */
SET @show_tables = CONCAT('
    IF(DATABASE() = "', @target_db, '", 
       CONCAT("Tables in ", DATABASE(), ":"), 
       "ERROR: Wrong database") AS database_status;
    SHOW TABLES;
');

PREPARE stmt FROM @show_tables;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
