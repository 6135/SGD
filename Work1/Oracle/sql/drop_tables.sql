BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE NATION CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE REGION CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE PART CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE SUPPLIER CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE PARTSUPP CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE CUSTOMER CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE LINEITEM CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE ORDERS CASCADE CONSTRAINTS';


EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
