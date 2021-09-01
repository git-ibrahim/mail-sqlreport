set colsep ,
set feedback on
set trimspool on
set linesize 4000
set pagesize 500
set heading on

spool script.out;

select bc.WORK_UNIT_ID,bc.STATUS_ID,bs.status_description from abc bc , xyz bs
where bc.last_processed_date > to_date((SELECT TO_CHAR(sysdate,'dd-Mon-yyyy')  FROM dual)) and bc.status_id =11 and bc.status_id= bs.status_id;

select bc.WORK_UNIT_ID,bc.STATUS_ID,bs.status_description from abc bc , xyz bs
where bc.last_processed_date > to_date((SELECT TO_CHAR(sysdate,'dd-Mon-yyyy')  FROM dual)) and bc.status_id =2 and bc.status_id= bs.status_id;

exit;
