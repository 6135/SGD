BEGIN

EXECUTE IMMEDIATE 'CREATE OR REPLACE DIRECTORY tpch_dir AS ''C:\Users\Public\data''';
EXECUTE IMMEDIATE 'GRANT READ ON DIRECTORY tpch_dir TO c##tpch';
EXECUTE IMMEDIATE 'GRANT WRITE ON DIRECTORY tpch_dir TO c##tpch';

EXECUTE IMMEDIATE 'CREATE TABLE part
    (
        p_partkey       NUMBER(10, 0),
        p_name          VARCHAR2(55),
        p_mfgr          CHAR(25),
        p_brand         CHAR(10),
        p_type          VARCHAR2(25),
        p_size          INTEGER,
        p_container     CHAR(10),
        p_retailprice   NUMBER,
        p_comment       VARCHAR2(23)
    )';

EXECUTE IMMEDIATE    'CREATE TABLE supplier
    (
        s_suppkey     NUMBER(10, 0),
        s_name        CHAR(25),
        s_address     VARCHAR2(40),
        s_nationkey   NUMBER(10, 0),
        s_phone       CHAR(15),
        s_acctbal     NUMBER,
        s_comment     VARCHAR2(101)
    )';

EXECUTE IMMEDIATE    'CREATE TABLE partsupp
    (
        ps_partkey      NUMBER(10, 0),
        ps_suppkey      NUMBER(10, 0),
        ps_availqty     INTEGER,
        ps_supplycost   NUMBER,
        ps_comment      VARCHAR2(199)
    )';

EXECUTE IMMEDIATE    'CREATE TABLE customer
    (
        c_custkey      NUMBER(10, 0),
        c_name         VARCHAR2(25),
        c_address      VARCHAR2(40),
        c_nationkey    NUMBER(10, 0),
        c_phone        CHAR(15),
        c_acctbal      NUMBER,
        c_mktsegment   CHAR(10),
        c_comment      VARCHAR2(117)
    )';


EXECUTE IMMEDIATE    'CREATE TABLE orders
    (
        o_orderkey        NUMBER(10, 0),
        o_custkey         NUMBER(10, 0),
        o_orderstatus     CHAR(1),
        o_totalprice      NUMBER,
        o_orderdate       CHAR(10),
        o_orderpriority   CHAR(15),
        o_clerk           CHAR(15),
        o_shippriority    INTEGER,
        o_comment         VARCHAR2(79)
    )';


EXECUTE IMMEDIATE   ' CREATE TABLE lineitem
    (
        l_orderkey        NUMBER(10, 0),
        l_partkey         NUMBER(10, 0),
        l_suppkey         NUMBER(10, 0),
        l_linenumber      INTEGER,
        l_quantity        NUMBER,
        l_extendedprice   NUMBER,
        l_discount        NUMBER,
        l_tax             NUMBER,
        l_returnflag      CHAR(1),
        l_linestatus      CHAR(1),
        l_shipdate        CHAR(10),
        l_commitdate      CHAR(10),
        l_receiptdate     CHAR(10),
        l_shipinstruct    CHAR(25),
        l_shipmode        CHAR(10),
        l_comment         VARCHAR2(44)
    )';

EXECUTE IMMEDIATE   ' CREATE TABLE nation
    (
        n_nationkey   NUMBER(10, 0),
        n_name        CHAR(25),
        n_regionkey   NUMBER(10, 0),
        n_comment     VARCHAR(152)
    )';


EXECUTE IMMEDIATE   ' CREATE TABLE region
    (
        r_regionkey   NUMBER(10, 0),
        r_name        CHAR(25),
        r_comment     VARCHAR(152)
    )';
exception when others then
    if SQLCODE = -955 then null; else raise; end if;

 
END;

