SELECT
    CLINIC.CLINIC_NAME , SALES_STAFF.EMP_FULL_NAME, SUM(FACT_SALE.AMOUNT) AS AMOUNT
FROM
    FACT_SALE , CLINIC , SALES_STAFF , DIM_TIME TIME
WHERE
        TIME.DATE_AT >= TO_DATE('2021/12/01', 'YYYY/MM/DD')
  AND TIME.DATE_AT <= TO_DATE('2021/12/31', 'YYYY/MM/DD')
  AND FACT_SALE.TIME_ID = TIME.TIME_ID
  AND CLINIC.CLINIC_ID = FACT_SALE.CLINIC_ID
  AND FACT_SALE.SALES_STAFF_ID = SALES_STAFF.EMP_ID
GROUP BY CLINIC.CLINIC_NAME ,  SALES_STAFF.EMP_FULL_NAME

