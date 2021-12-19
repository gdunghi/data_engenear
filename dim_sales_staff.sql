
CREATE SEQUENCE DIM_SALES_STAFF_SEQ START WITH 1;
create table DIM_SALES_STAFF
(
    EMP_ID            NUMBER(11) not null
        constraint DIM_SALES_STAFF_PK
        primary key,
    EMP_FULL_NAME     VARCHAR2(100),
    STARTING_DATE     DATE,
    WORK_BRANCH       VARCHAR2(100),
    SEX               CHAR,
    BIRTH_DATE        DATE
)
    /