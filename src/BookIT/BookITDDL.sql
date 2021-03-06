/* 
 *DDL FOR THE BOOKIT DATABASE
 */
/**
 * Author:  Trenton
 * Created: Jun 20, 2017
 */

CREATE TABLE EMPLOYEES
(   
    EMP_ID              INTEGER,
    FNAME               VARCHAR(50),
    LNAME               VARCHAR(50),
    STREET              VARCHAR(50),
    CITY                VARCHAR(50),
    STATE               CHAR(2),
    ZIPCODE             INTEGER,
    CELL                VARCHAR(13),
    USERNAME            VARCHAR(50) NOT NULL,
    PASSWORD            VARCHAR(50) NOT NULL,
    PRIMARY KEY         (EMP_ID)
);

CREATE TABLE STORES
(
    STORE_ID            INTEGER,
    STREET              VARCHAR(50),
    CITY                VARCHAR(50),
    ZIPCODE             INTEGER,
    PRIMARY KEY         (STORE_ID)
);

CREATE TABLE EXPENSES
(
    INVOICE_NUMBER      INTEGER,
    EXPENSE_TYPE        VARCHAR(25),
    EXPENSE_DATE        DATE,
    EXPENSE_COST        NUMBER(7,2),
    EXPENSE_DESC        VARCHAR(250),
    STORE_ID            INTEGER,
    PRIMARY KEY         (INVOICE_NUMBER),
    FOREIGN KEY         (STORE_ID) REFERENCES STORES
);

CREATE TABLE HUMAN_RESOURCES
(
    EMP_ID              INTEGER,
    STORE_ID            INTEGER,
    EMP_TYPE            VARCHAR(50),
    PRIMARY KEY         (EMP_ID, STORE_ID),
    FOREIGN KEY         (EMP_ID) REFERENCES EMPLOYEES,
    FOREIGN KEY         (STORE_ID) REFERENCES STORES
);

CREATE TABLE PAYROLL
(
    DATE                DATE,
    HOURS               INTEGER NOT NULL,
    WAGE                NUMBER(7,2) NOT NULL,
    OT_HOURS            INTEGER,
    OT_WAGE             NUMBER(7,2),
    EMP_ID              INTEGER,
    STORE_ID            INTEGER,
    PRIMARY KEY         (DATE),
    FOREIGN KEY         (EMP_ID) REFERENCES HUMAN_RESOURCES,
    FOREIGN KEY         (STORE_ID) REFERENCES HUMAN_RESOURCES
);

CREATE TABLE MANAGER
(
    MANAGER_ID          INTEGER,
    EMP_ID              INTEGER,
    STORE_ID            INTEGER,
    PRIMARY KEY         (MANAGER_ID),
    FOREIGN KEY         (EMP_ID) REFERENCES EMPLOYEES,
    FOREIGN KEY         (STORE_ID) REFERENCES STORES
);

CREATE TABLE MEMBERS
(
    MEMBER_ID           INTEGER,
    FNAME               VARCHAR(50),
    LNAME               VARCHAR(50),
    STREET              VARCHAR(50),
    CITY                VARCHAR(50),
    STATE               CHAR(2),
    ZIP                 INTEGER,
    CELL                VARCHAR(13),
    EMAIL               VARCHAR(50),
    USERNAME            VARCHAR(50) NOT NULL,
    PASSWORD            VARCHAR9(50) NOT NULL,
    PRIMARY KEY         (MEMBER_ID)
);

CREATE TABLE MEMBERSHIP
(
    CUST_ID             INTEGER,
    STORE_ID            INTEGER,
    POINTS              INTEGER,
    STATUS              VARCHAR(25),
    PRIMARY KEY         (MEMBER_ID, STORE_ID),
    FOREIGN KEY         (MEMBER_ID) REFERENCES MEMBERS,
    FOREIGN KEY         (STORE_ID) REFERENCES STORES
);

CREATE TABLE INVENTORY
(
    INV_ID              INTEGER,
    ITEM_NAME           VARCHAR(25),
    ITEM_DESC           VARCHAR(50),
    ITEM_QUANTITY       INTEGER,
    PRIMARY KEY         (INV_ID)
);

CREATE TABLE SALES
(
    INV_ID              INTEGER,
    STORE_ID            INTEGER,
    QIS                 INTEGER,
    PRICE               NUMBER(7,2),
    PRIMARY KEY         (INV_ID, STORE_ID),
    FOREIGN KEY         (INV_ID) REFERENCES INVENTORY,
    FOREIGN KEY         (STORE_ID REFERENCES STORES
);

CREATE TABLE SUPPLIERS
(
    SUPPLIER_ID         INTEGER,
    NAME                VARCHAR(50),
    STREET              VARCHAR(50),
    CITY                VARCHAR(50),
    STATE               CHAR(2),
    ZIP                 VARCHAR(50),
    CELL                VARCHAR(50)
);

CREATE TABLE PURCHASE_ORDERS
(
    SUPPLIER_ID         INTEGER,
    INV_ID              INTEGER,
    QUANTITY            INTEGER,
    PRIMARY KEY         (SUPPLIER_ID, INV_ID),
    FOREIGN KEY         (SUPPLIER_ID) REFERENCES SUPPLIERS,
    FOREIGN KEY         (INV_ID)    REFERENCES INVENTORY
);



