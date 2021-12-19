-- UPDATE EXISTING DOCTOR
MERGE into DIM_DOCTOR
USING DOCTOR
ON (DIM_DOCTOR.DOCTOR_ID = DOCTOR.DOCTOR_ID)
WHEN MATCHED THEN UPDATE SET DIM_DOCTOR.DOCTOR_FULL_NAME = DOCTOR.DOCTOR_FULL_NAME
                  WHERE DIM_DOCTOR.DOCTOR_FULL_NAME <> DOCTOR.DOCTOR_FULL_NAME;

-- insert data to DIM_DOCTOR
INSERT INTO DIM_DOCTOR(DOCTOR_ID, DOCTOR_FULL_NAME)
SELECT D.DOCTOR_ID, D.DOCTOR_FULL_NAME
    FROM DOCTOR D LEFT OUTER JOIN DIM_DOCTOR DIM ON D.DOCTOR_ID = DIM.DOCTOR_ID
WHERE DIM.DOCTOR_ID IS NULL ORDER BY D.DOCTOR_ID ASC;



-- UPDATE EXISTING CLINIC
MERGE into DIM_CLINIC
USING CLINIC
ON ( DIM_CLINIC.CLINIC_ID = CLINIC.CLINIC_ID)
WHEN MATCHED THEN UPDATE
    SET  DIM_CLINIC.CLINIC_NAME = CLINIC.CLINIC_NAME,
         DIM_CLINIC.LANDMARK = CLINIC.LANDMARK,
         DIM_CLINIC.LOCATION = CLINIC.LOCATION
    WHERE  DIM_CLINIC.CLINIC_NAME <> CLINIC.CLINIC_NAME
    OR DIM_CLINIC.LANDMARK <> CLINIC.LANDMARK
    OR DIM_CLINIC.LOCATION <> CLINIC.LOCATION;

-- insert data to DIM_CLINIC
INSERT INTO  DIM_CLINIC(CLINIC_ID, CLINIC_NAME,LANDMARK, LOCATION)
SELECT CLINIC.CLINIC_ID, CLINIC.CLINIC_NAME, CLINIC.LANDMARK, CLINIC.LOCATION
FROM CLINIC CLINIC LEFT OUTER JOIN  DIM_CLINIC DIM ON CLINIC.CLINIC_ID = DIM.CLINIC_ID
WHERE DIM.CLINIC_ID IS NULL ORDER BY CLINIC.CLINIC_ID ASC;


-- UPDATE EXISTING DIM_PRODUCT_USE
MERGE into DIM_PRODUCT_USE
USING PRODUCT_USE
ON ( DIM_PRODUCT_USE.PRODUCT_ID = PRODUCT_USE.PRODUCT_ID)
WHEN MATCHED THEN UPDATE
                  SET  DIM_PRODUCT_USE.PRODUCT_NAME = PRODUCT_USE.PRODUCT_NAME,
                       DIM_PRODUCT_USE.GENERIC_NAME = PRODUCT_USE.GENERIC_NAME,
                       DIM_PRODUCT_USE.BRAND = PRODUCT_USE.BRAND,
                       DIM_PRODUCT_USE.COUNTRY_OF_ORIGIN = PRODUCT_USE.COUNTRY_OF_ORIGIN
                  WHERE  DIM_PRODUCT_USE.PRODUCT_NAME <> PRODUCT_USE.PRODUCT_NAME
                     OR DIM_PRODUCT_USE.GENERIC_NAME <> PRODUCT_USE.GENERIC_NAME
                     OR DIM_PRODUCT_USE.BRAND <> PRODUCT_USE.BRAND
                     OR DIM_PRODUCT_USE.COUNTRY_OF_ORIGIN <> PRODUCT_USE.COUNTRY_OF_ORIGIN;

-- INSERT DATA TO DIM_PRODUCT_USE
INSERT INTO  DIM_PRODUCT_USE(PRODUCT_ID, PRODUCT_NAME,GENERIC_NAME, BRAND, COUNTRY_OF_ORIGIN)
    SELECT PRODUCT_USE.PRODUCT_ID,
        PRODUCT_USE.PRODUCT_NAME,
        PRODUCT_USE.GENERIC_NAME,
        PRODUCT_USE.BRAND,
        PRODUCT_USE.COUNTRY_OF_ORIGIN
FROM PRODUCT_USE PRODUCT_USE LEFT OUTER JOIN  DIM_PRODUCT_USE DIM ON PRODUCT_USE.PRODUCT_ID = DIM.PRODUCT_ID
WHERE DIM.PRODUCT_ID IS NULL ORDER BY PRODUCT_USE.PRODUCT_ID ASC;



-- UPDATE EXISTING DIM_PRODUCT_USE
MERGE into DIM_SALES_STAFF
USING SALES_STAFF
ON ( DIM_SALES_STAFF.EMP_ID = SALES_STAFF.EMP_ID)
WHEN MATCHED THEN UPDATE
                  SET  DIM_SALES_STAFF.EMP_FULL_NAME = SALES_STAFF.EMP_FULL_NAME,
                       DIM_SALES_STAFF.STARTING_DATE = SALES_STAFF.STARTING_DATE,
                       DIM_SALES_STAFF.WORK_BRANCH = SALES_STAFF.WORK_BRANCH,
                       DIM_SALES_STAFF.SEX = SALES_STAFF.SEX,
                       DIM_SALES_STAFF.BIRTH_DATE = SALES_STAFF.BIRTH_DATE
                  WHERE  DIM_SALES_STAFF.EMP_FULL_NAME <> SALES_STAFF.EMP_FULL_NAME
                     OR DIM_SALES_STAFF.STARTING_DATE <> SALES_STAFF.STARTING_DATE
                     OR DIM_SALES_STAFF.WORK_BRANCH <> SALES_STAFF.WORK_BRANCH
                     OR DIM_SALES_STAFF.SEX <> SALES_STAFF.SEX
                     OR DIM_SALES_STAFF.BIRTH_DATE <> SALES_STAFF.BIRTH_DATE;

-- INSERT DATA TO DIM_SALES_STAFF
INSERT INTO  DIM_SALES_STAFF(EMP_ID, EMP_FULL_NAME,STARTING_DATE, WORK_BRANCH, SEX, BIRTH_DATE)
SELECT SALES_STAFF.EMP_ID,
       SALES_STAFF.EMP_FULL_NAME,
       SALES_STAFF.STARTING_DATE,
       SALES_STAFF.WORK_BRANCH,
       SALES_STAFF.SEX,
       SALES_STAFF.BIRTH_DATE
FROM SALES_STAFF LEFT OUTER JOIN  DIM_SALES_STAFF DIM ON SALES_STAFF.EMP_ID = DIM.EMP_ID
WHERE DIM.EMP_ID IS NULL ORDER BY SALES_STAFF.EMP_ID ASC;


DROP SEQUENCE DIM_TIME_SEQ;
CREATE SEQUENCE DIM_TIME_SEQ START WITH 1;

-- INSERT DATA TO DIM_TIME
INSERT INTO DIM_TIME (TIME_ID, DATE_AT, MONTH, YEAR) VALUES (DIM_TIME_SEQ.NEXTVAL, TO_DATE('2021-12-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 2021);
INSERT INTO DIM_TIME (TIME_ID, DATE_AT, MONTH, YEAR) VALUES (DIM_TIME_SEQ.NEXTVAL, TO_DATE('2021-12-02 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 2021);
INSERT INTO DIM_TIME (TIME_ID, DATE_AT, MONTH, YEAR) VALUES (DIM_TIME_SEQ.NEXTVAL, TO_DATE('2021-12-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 2021);
INSERT INTO DIM_TIME (TIME_ID, DATE_AT, MONTH, YEAR) VALUES (DIM_TIME_SEQ.NEXTVAL, TO_DATE('2021-12-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 2021);
INSERT INTO DIM_TIME (TIME_ID, DATE_AT, MONTH, YEAR) VALUES (DIM_TIME_SEQ.NEXTVAL, TO_DATE('2021-12-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 2021);
INSERT INTO DIM_TIME (TIME_ID, DATE_AT, MONTH, YEAR) VALUES (DIM_TIME_SEQ.NEXTVAL, TO_DATE('2021-12-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 2021);
INSERT INTO DIM_TIME (TIME_ID, DATE_AT, MONTH, YEAR) VALUES (DIM_TIME_SEQ.NEXTVAL, TO_DATE('2021-12-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 2021);
INSERT INTO DIM_TIME (TIME_ID, DATE_AT, MONTH, YEAR) VALUES (DIM_TIME_SEQ.NEXTVAL, TO_DATE('2021-12-08 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 2021);
INSERT INTO DIM_TIME (TIME_ID, DATE_AT, MONTH, YEAR) VALUES (DIM_TIME_SEQ.NEXTVAL, TO_DATE('2021-12-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 2021);
INSERT INTO DIM_TIME (TIME_ID, DATE_AT, MONTH, YEAR) VALUES (DIM_TIME_SEQ.NEXTVAL, TO_DATE('2021-12-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 2021);
INSERT INTO DIM_TIME (TIME_ID, DATE_AT, MONTH, YEAR) VALUES (DIM_TIME_SEQ.NEXTVAL, TO_DATE('2021-12-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 2021);
INSERT INTO DIM_TIME (TIME_ID, DATE_AT, MONTH, YEAR) VALUES (DIM_TIME_SEQ.NEXTVAL, TO_DATE('2021-12-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 2021);
INSERT INTO DIM_TIME (TIME_ID, DATE_AT, MONTH, YEAR) VALUES (DIM_TIME_SEQ.NEXTVAL, TO_DATE('2021-12-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 2021);
INSERT INTO DIM_TIME (TIME_ID, DATE_AT, MONTH, YEAR) VALUES (DIM_TIME_SEQ.NEXTVAL, TO_DATE('2021-12-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 2021);
INSERT INTO DIM_TIME (TIME_ID, DATE_AT, MONTH, YEAR) VALUES (DIM_TIME_SEQ.NEXTVAL, TO_DATE('2021-12-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 2021);
INSERT INTO DIM_TIME (TIME_ID, DATE_AT, MONTH, YEAR) VALUES (DIM_TIME_SEQ.NEXTVAL, TO_DATE('2021-12-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 2021);
INSERT INTO DIM_TIME (TIME_ID, DATE_AT, MONTH, YEAR) VALUES (DIM_TIME_SEQ.NEXTVAL, TO_DATE('2021-12-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 2021);
INSERT INTO DIM_TIME (TIME_ID, DATE_AT, MONTH, YEAR) VALUES (DIM_TIME_SEQ.NEXTVAL, TO_DATE('2021-12-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 2021);
INSERT INTO DIM_TIME (TIME_ID, DATE_AT, MONTH, YEAR) VALUES (DIM_TIME_SEQ.NEXTVAL, TO_DATE('2021-12-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 2021);
INSERT INTO DIM_TIME (TIME_ID, DATE_AT, MONTH, YEAR) VALUES (DIM_TIME_SEQ.NEXTVAL, TO_DATE('2021-12-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 2021);
INSERT INTO DIM_TIME (TIME_ID, DATE_AT, MONTH, YEAR) VALUES (DIM_TIME_SEQ.NEXTVAL, TO_DATE('2021-12-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 2021);
INSERT INTO DIM_TIME (TIME_ID, DATE_AT, MONTH, YEAR) VALUES (DIM_TIME_SEQ.NEXTVAL, TO_DATE('2021-12-22 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 2021);
INSERT INTO DIM_TIME (TIME_ID, DATE_AT, MONTH, YEAR) VALUES (DIM_TIME_SEQ.NEXTVAL, TO_DATE('2021-12-23 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 2021);
INSERT INTO DIM_TIME (TIME_ID, DATE_AT, MONTH, YEAR) VALUES (DIM_TIME_SEQ.NEXTVAL, TO_DATE('2021-12-24 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 2021);
INSERT INTO DIM_TIME (TIME_ID, DATE_AT, MONTH, YEAR) VALUES (DIM_TIME_SEQ.NEXTVAL, TO_DATE('2021-12-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 2021);
INSERT INTO DIM_TIME (TIME_ID, DATE_AT, MONTH, YEAR) VALUES (DIM_TIME_SEQ.NEXTVAL, TO_DATE('2021-12-26 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 2021);
INSERT INTO DIM_TIME (TIME_ID, DATE_AT, MONTH, YEAR) VALUES (DIM_TIME_SEQ.NEXTVAL, TO_DATE('2021-12-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 2021);
INSERT INTO DIM_TIME (TIME_ID, DATE_AT, MONTH, YEAR) VALUES (DIM_TIME_SEQ.NEXTVAL, TO_DATE('2021-12-29 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 2021);
INSERT INTO DIM_TIME (TIME_ID, DATE_AT, MONTH, YEAR) VALUES (DIM_TIME_SEQ.NEXTVAL, TO_DATE('2021-12-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 2021);
INSERT INTO DIM_TIME (TIME_ID, DATE_AT, MONTH, YEAR) VALUES (DIM_TIME_SEQ.NEXTVAL, TO_DATE('2021-12-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 2021);


INSERT INTO DIM_SALARY_RANGE (SALARY_RANGE_ID, RANGE_START, RANGE_END) SELECT SALARY_RANGE_ID, RANGE_START, RANGE_END FROM SALARY_RANGE;
