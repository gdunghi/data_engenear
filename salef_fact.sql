select t.TIME_ID, b.EMP_ID, b.CLINIC_ID, b.DOCTOR_ID, b.TOTAL_AMOUNT
from
    BILL b  inner join TIME t on TRUNC(t.DATE_AT) = TRUNC(b.BILL_DATE)