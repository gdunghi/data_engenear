CREATE SEQUENCE DIM_DOCTOR_SEQ START WITH 1;

create table DIM_DOCTOR
(
    DOCTOR_ID        NUMBER(11) not null
        constraint DOCTOR_PK
        primary key,
    DOCTOR_FULL_NAME VARCHAR2(100)
)