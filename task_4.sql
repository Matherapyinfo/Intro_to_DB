-- task_4.sql - Books table description without DESCRIBE/EXPLAIN/ANALYZE
SELECT 
    COLUMN_NAME AS 'Field',
    COLUMN_TYPE AS 'Type',
    IF(IS_NULLABLE = 'YES', 'YES', 'NO') AS 'Null',
    IF(COLUMN_KEY = 'PRI', 'PRI', 
       IF(COLUMN_KEY = 'MUL', 'MUL', '')) AS 'Key',
    COLUMN_DEFAULT AS 'Default',
    EXTRA AS 'Extra'
FROM 
    INFORMATION_SCHEMA.COLUMNS 
WHERE 
    TABLE_SCHEMA = DATABASE() 
    AND TABLE_NAME = 'books'
ORDER BY 
    ORDINAL_POSITION;
