CREATE SEQUENCE SALES_STAFF_seq START WITH 1;


INSERT INTO COM11.SALES_STAFF (EMP_ID, EMP_FULL_NAME, CONTACT, SALARY, HOME_ADDRESS, STARTING_DATE, WORK_BRANCH, SEX, AGE, BIRTH_DATE, SALES_PERFORMANCE) VALUES (SALES_STAFF_SEQ.nextval, 'มั่นใจ  ดีมาก', '012312322', 12000, 'ลาดพร้าว', TO_DATE('2021-12-06 23:32:23', 'YYYY-MM-DD HH24:MI:SS'), 'ลาดพร้าว', 'M', 40, TO_DATE('1988-12-06 23:32:37', 'YYYY-MM-DD HH24:MI:SS'), null);