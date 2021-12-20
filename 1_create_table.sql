CREATE SEQUENCE BILL_NO_SEQ START WITH 1;


CREATE SEQUENCE CLINIC_SEQ START WITH 1;
create table CLINIC
(
    CLINIC_ID   NUMBER not null constraint CLINIC_ID_PK primary key,
    CLINIC_NAME VARCHAR2(100),
    LANDMARK    VARCHAR2(100),
    LOCATION    VARCHAR2(100)
);


CREATE SEQUENCE SALARY_RANGE_SEQ START WITH 1;
create table SALARY_RANGE
(
    SALARY_RANGE_ID NUMBER(11) not null
        constraint SALARY_RANGE_PK
            primary key,
    RANGE_START     NUMBER(11, 2),
    RANGE_END       NUMBER(11, 2)
)
;


CREATE SEQUENCE CUSTOMER_SEQ START WITH 1;
create table CUSTOMER
(
    CUSTOMER_ID     NUMBER(11) not null constraint CUSTOMER_PK      primary key,
    FULL_NAME       VARCHAR2(255),
    BIRTHDAY        DATE,
    SEX             CHAR,
    SALARY_RANGE_ID NUMBER(11)  constraint CUS_SALARY_R_SALARY_R_FK
            references SALARY_RANGE,
    WORK_LOCATION   VARCHAR2(100),
    SKIN_PROBLEM    VARCHAR2(255),
    CONTACT         VARCHAR2(255),
    ALLERGY         VARCHAR2(255)
)
;

CREATE SEQUENCE SPECIALIST_SEQ START WITH 1;
create table SPECIALIST
(
    SPECIALIST_ID NUMBER(11) not null
        constraint SPECIALIST_PK
            primary key,
    NAME          VARCHAR2(100)
);

CREATE SEQUENCE DOCTOR_SEQ START WITH 1;
create table DOCTOR
(
    DOCTOR_ID        NUMBER(11) not null
        constraint DOCTOR_PK
            primary key,
    DOCTOR_FULL_NAME VARCHAR2(100),
    CONTACT          VARCHAR2(255),
    SALARY           NUMBER(11),
    ADDRESS          VARCHAR2(50),
    STARTING_DATE    DATE,
    SEX              CHAR,
    AGE              NUMBER(11),
    BIRTHDAY         DATE,
    LICENSE_NUMBER   VARCHAR2(50)
)
;

CREATE SEQUENCE DOCTOR_SPECIALIST_SEQ START WITH 1;
create table DOCTOR_SPECIALIST
(
    DOCTOR_SPECIALIST_ID NUMBER not null
        constraint DOCTOR_SPECIALIST_PK
            primary key,
    DOCTOR_ID            NUMBER(11)
        constraint DOCTOR_SPECIALIST_DOCTOR_FK
            references DOCTOR,
    SPECIALIST_ID        NUMBER(11)
        constraint DOC_SPECIA_SPECIALIST_FK
            references SPECIALIST
)
;


CREATE SEQUENCE OPERATION_SEQ START WITH 1;
create table OPERATION
(
    OP_ID NUMBER(11) not null
        constraint OPERATION_PK
            primary key,
    NAME  VARCHAR2(255)
)
;


CREATE SEQUENCE PRODUCT_USE_SEQ START WITH 1;
create table PRODUCT_USE
(
    PRODUCT_ID        NUMBER(11) not null
        constraint PRODUCT_USE_PK
            primary key,
    PRODUCT_NAME      VARCHAR2(100),
    GENERIC_NAME      VARCHAR2(100),
    BRAND             VARCHAR2(100),
    PROFIT_MARGIN     NUMBER(11, 2),
    SELL_PRICE        NUMBER(11, 2),
    COST              NUMBER(11, 2),
    COUNTRY_OF_ORIGIN VARCHAR2(100),
    QTY               NUMBER(11)
)
;

CREATE SEQUENCE OPERATION_PRODUCT_SEQ START WITH 1;
create table OPERATION_PRODUCT
(
    OPERATION_PRODUCT_ID NUMBER(11) not null
        constraint OPERATION_PRODUCT_PK
            primary key,
    OP_ID                NUMBER(11)
        constraint OPER_P_OPER
            references OPERATION,
    QUANTITY             NUMBER(11),
    SALE_PRICE           NUMBER(11, 2),
    PRODUCT_ID           NUMBER(11)
        constraint OP_PRODUCT_USE_PRODUCT_ID_FK
            references PRODUCT_USE
)
;

CREATE SEQUENCE SALES_STAFF_SEQ START WITH 1;
create table SALES_STAFF
(
    EMP_ID            NUMBER(11) not null
        constraint SALES_STAFF_PK
            primary key,
    EMP_FULL_NAME     VARCHAR2(100),
    CONTACT           VARCHAR2(255),
    SALARY            NUMBER(11),
    HOME_ADDRESS      VARCHAR2(255),
    STARTING_DATE     DATE,
    WORK_BRANCH       VARCHAR2(100),
    SEX               CHAR,
    AGE               NUMBER(11),
    BIRTH_DATE        DATE,
    SALES_PERFORMANCE NUMBER(11)
)
;



CREATE SEQUENCE SERVICE_FEEDBACK_SEQ START WITH 1;
create table SERVICE_FEEDBACK
(
    SERVICE_FEEDBACK_ID NUMBER(11) not null
        constraint SERVICE_FEEDBACK_PK
            primary key,
    RANGE               NUMBER(11),
    DETAIL              VARCHAR2(255),
    SALE_STAFF_ID       NUMBER(11)
        constraint SF__FK_SALES_STAFF_FK
            references SALES_STAFF,
    PRODUCT_ID          NUMBER(11)
        constraint SF__FK_PRODUCT_USE_FK
            references PRODUCT_USE,
    DOCTOR_ID           NUMBER(11)
        constraint SF__FK_DOCTOR_FK
            references DOCTOR,
    CLINIC_ID           NUMBER(11)
        constraint SF__FK_CLINIC_FK
            references CLINIC,
    SALE_STAFF_SCORE    NUMBER(11),
    PRODUCT_SCORE       NUMBER(11),
    DOCTOR_SCORE        NUMBER(11)
)
;



CREATE SEQUENCE BILL_SEQ START WITH 1;
create table BILL
(
    CLINIC_ID      NUMBER(11)
        constraint BILL_CLINIC_CLINIC_ID_FK
            references CLINIC,
    BILL_ID        NUMBER(11) not null
        constraint BILL_PK
            primary key,
    DOCTOR_ID      NUMBER(11)
        constraint BILL_DOCTOR_DOCTOR_ID_FK
            references DOCTOR,
    EMP_ID         NUMBER(11)
        constraint BILL_SALES_STAFF_EMP_ID_FK
            references SALES_STAFF,
    CUSTOMER_ID    NUMBER(11)
        constraint BILL_CUSTOMER_CUSTOMER_ID_FK
            references CUSTOMER,
    BILL_NUMBER    VARCHAR2(20),
    BILL_DATE      TIMESTAMP(6),
    DOCTOR_REQUEST VARCHAR2(100),
    TOTAL_AMOUNT   NUMBER(11),
    WEIGHT         NUMBER(5, 2),
    PRESSURE       NUMBER(11)
)
;

create unique index BILL_BILL_NUMBER_UINDEX
    on BILL (BILL_NUMBER)
;


CREATE SEQUENCE BILL_OPERATION_SEQ START WITH 1;
create table BILL_OPERATION
(
    BO_ID   NUMBER(11) not null
        constraint BILL_OPERATION_PK
            primary key,
    OP_ID   NUMBER(11)
        constraint BO_OPERATION_OP_ID_FK
            references OPERATION,
    BILL_ID NUMBER(11)
        constraint BILL_OPERATION_BILL_BILL_ID_FK
            references BILL
)
;



------- dimension table --------------------------------
create table DIM_CLINIC
(
    CLINIC_ID   NUMBER not null
        constraint DIM_CLINIC_ID_PK
            primary key,
    CLINIC_NAME VARCHAR2(100),
    LANDMARK    VARCHAR2(100),
    LOCATION    VARCHAR2(100)
)
;

create table DIM_DOCTOR
(
    DOCTOR_ID        NUMBER(11) not null
        constraint DIM_DOCTOR_PK
            primary key,
    DOCTOR_FULL_NAME VARCHAR2(100)
)
;

create table DIM_PRODUCT_USE
(
    PRODUCT_ID        NUMBER(11) not null
        constraint DIM_PRODUCT_USE_PK
            primary key,
    PRODUCT_NAME      VARCHAR2(100),
    GENERIC_NAME      VARCHAR2(100),
    BRAND             VARCHAR2(100),
    COUNTRY_OF_ORIGIN VARCHAR2(100)
)
;

create table DIM_SALES_STAFF
(
    EMP_ID        NUMBER(11) not null
        constraint DIM_SALES_STAFF_PK
            primary key,
    EMP_FULL_NAME VARCHAR2(100),
    WORK_BRANCH   VARCHAR2(100),
    SEX           CHAR
)
;

CREATE SEQUENCE DIM_TIME_SEQ START WITH 1;
create table DIM_TIME
(
    TIME_ID NUMBER(11) not null
        constraint DIM_TIME_PK
            primary key,
    DATE_AT DATE,
    MONTH   NUMBER(11),
    YEAR    NUMBER(11)
)
;

create unique index DIM_TIME_UINDEX
    on DIM_TIME (DATE_AT, MONTH, YEAR)
;


create table DIM_SALARY_RANGE
(
    SALARY_RANGE_ID NUMBER(11) not null
        constraint DIM_SALARY_RANGE_PK
            primary key,
    RANGE_START     NUMBER(11, 2),
    RANGE_END       NUMBER(11, 2)
)
;


--------------------------- FACT TABLES --------------------------------
create table FACT_FEEDBACK
(
    TIME_ID           NUMBER(11) not null,
    CLINIC_ID         NUMBER(11) not null,
    SALES_STAFF_ID    NUMBER(11) not null,
    DOCTOR_ID         NUMBER(11) not null,
    PRODUCT_ID        NUMBER(11) not null,
    CLINIC_SCORE      NUMBER(11),
    FEEDBACK_SCORE    NUMBER(11),
    SALES_STAFF_SCORE NUMBER(11),
    DOCTOR_SCORE      NUMBER(11),
    PRODUCT_SCORE     NUMBER(11),
    FEEDBACK_FACT_ID  NUMBER(11) not null
        constraint FEEDBACK_FACT_PK
            primary key
)
;

alter table FACT_FEEDBACK
    add constraint FF_DIM_TIME_FK
        foreign key (TIME_ID) references DIM_TIME
;

alter table FACT_FEEDBACK
    add constraint FF_DIM_CLINIC_FK
        foreign key (CLINIC_ID) references DIM_CLINIC
;


alter table FACT_FEEDBACK
    add constraint FF_DIM_SALES_STAFF_FK
        foreign key (SALES_STAFF_ID) references DIM_SALES_STAFF
;


alter table FACT_FEEDBACK
    add constraint FF_DIM_DOCTOR_FK
        foreign key (DOCTOR_ID) references DIM_DOCTOR
;

alter table FACT_FEEDBACK
    add constraint FF_DIM_PRODUCT_USE_FK
        foreign key (PRODUCT_ID) references DIM_PRODUCT_USE
;


create table FACT_CUSTOMER_GROUP
(
    TIME_ID        NUMBER(11) not null,
    SALARY_RANK_ID NUMBER(11) not null,
    TOTAL          NUMBER(11),
    constraint CUSTOMER_GROUP_FACT_PK
        primary key (TIME_ID, SALARY_RANK_ID)
)
;


alter table FACT_CUSTOMER_GROUP
    add constraint FCG_DIM_SALARY_RANGE_FK
        foreign key (SALARY_RANK_ID) references DIM_SALARY_RANGE
;

alter table FACT_CUSTOMER_GROUP
    add constraint FCG_DIM_TIME_FK
        foreign key (TIME_ID) references DIM_TIME
;



create table FACT_SALE
(
    TIME_ID        NUMBER(11)
        constraint FACT_SALE_DIM_TIME_FK
            references DIM_TIME,
    SALES_STAFF_ID NUMBER(11)
        constraint FACT_SALE_DIM_SALES_STAFF_FK
            references DIM_SALES_STAFF,
    CLINIC_ID      NUMBER(11)
        constraint FACT_SALE_DIM_CLINIC_FK
            references DIM_CLINIC,
    DOCTOR_ID      NUMBER(11)
        constraint FACT_SALE_DIM_DOCTOR_FK
            references DIM_DOCTOR,
    AMOUNT         NUMBER(16, 2),
    constraint SALE_FACT_PK
        unique (SALES_STAFF_ID, TIME_ID, CLINIC_ID, DOCTOR_ID)
);


