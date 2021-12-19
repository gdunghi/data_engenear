
CREATE SEQUENCE DIM_PRODUCT_USE_SEQ START WITH 1;
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
    /



