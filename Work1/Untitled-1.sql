
-- CREATE USER c##tpch IDENTIFIED BY tpch;

-- GRANT CREATE SESSION,
--       CREATE TABLE,
--       UNLIMITED TABLESPACE
--     TO c##tpch;

-- CREATE OR REPLACE DIRECTORY tpch_dir AS 'C:\Users\Public\data\';

-- GRANT READ ON DIRECTORY tpch_dir TO c##tpch;
-- GRANT WRITE ON DIRECTORY tpch_dir TO c##tpch;

-- 
-- 
-- DROP TABLE c##tpch.EXT_NATION CASCADE CONSTRAINTS;
-- DROP TABLE c##tpch.EXT_REGION CASCADE CONSTRAINTS;
-- DROP TABLE c##tpch.EXT_PART CASCADE CONSTRAINTS;
-- DROP TABLE c##tpch.EXT_SUPPLIER CASCADE CONSTRAINTS;
-- DROP TABLE c##tpch.EXT_PARTSUPP CASCADE CONSTRAINTS;
-- DROP TABLE c##tpch.EXT_CUSTOMER CASCADE CONSTRAINTS;
-- DROP TABLE c##tpch.EXT_LINEITEM CASCADE CONSTRAINTS;
-- DROP TABLE c##tpch.EXT_ORDERS CASCADE CONSTRAINTS;

-- BEGIN
-- EXECUTE IMMEDIATE 'COPY customer FROM ''C:/Users/guibs/Documents/GitHub/SGD/sql/data/customer.tbl'' WITH DELIMITER AS  ''|''';
-- EXECUTE IMMEDIATE 'COPY lineitem FROM ''C:/Users/guibs/Documents/GitHub/SGD/sql/data/lineitem.tbl'' WITH DELIMITER AS  ''|''';
-- EXECUTE IMMEDIATE 'COPY nation FROM ''C:/Users/guibs/Documents/GitHub/SGD/sql/data/nation.tbl'' WITH DELIMITER AS      ''|''';
-- EXECUTE IMMEDIATE 'COPY orders FROM ''C:/Users/guibs/Documents/GitHub/SGD/sql/data/orders.tbl'' WITH DELIMITER AS      ''|''';
-- EXECUTE IMMEDIATE 'COPY part FROM ''C:/Users/guibs/Documents/GitHub/SGD/sql/data/part.tbl'' WITH DELIMITER AS          ''|''';
-- EXECUTE IMMEDIATE 'COPY partsupp FROM ''C:/Users/guibs/Documents/GitHub/SGD/sql/data/partsupp.tbl'' WITH DELIMITER AS  ''|''';
-- EXECUTE IMMEDIATE 'COPY region FROM ''C:/Users/guibs/Documents/GitHub/SGD/sql/data/region.tbl'' WITH DELIMITER AS      ''|''';
-- EXECUTE IMMEDIATE 'COPY supplier FROM ''C:/Users/guibs/Documents/GitHub/SGD/sql/data/supplier.tbl'' WITH DELIMITER AS  ''|''';
-- END;