CREATE SEQUENCE DIM_CLINIC_SEQ START WITH 1;
create table DIM_CLINIC
(
    CLINIC_ID   NUMBER not null
        constraint DIM_CLINIC_ID_PK
        primary key,
    CLINIC_NAME VARCHAR2(100),
    LANDMARK    VARCHAR2(100),
    LOCATION    VARCHAR2(100)
)
    /
