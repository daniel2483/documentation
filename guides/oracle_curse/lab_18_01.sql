-- Oracle Database 10g: Administration Workshop I
-- Oracle Server Technologies - Curriculum Development
--
-- ***Training purposes only***
-- ***Not appropriate for production use***
--
prompt   Create HR_TEST tablespace, HR_TEST_ROLE role, the DP and HR_TEST users
prompt

spool lab_18_01.txt
set termout off
connect system/oracle
-- Drop the Dp and HR_TEST user, the HR_TEST tablespace and HR_TEST_ROLE in case they already exist

drop role hr_test_role;
drop tablespace hr_test including contents and datafiles cascade constraints;
drop user hr_test cascade;
drop user dp cascade;
set termout on

create tablespace hr_test
datafile '/u01/app/oracle/oradata/ORCL/datafile/hr_test_01.dbf' size 10M;

create user hr_test identified by hr_4test
default tablespace hr_test
temporary tablespace temp; 

create role hr_test_role;

GRANT 
  create table, 
  create procedure,    
  create sequence, 
  create trigger,
  create view,
  create any index, alter any index,
  create any indextype, alter any indextype,
  create any job,
  analyze any
  TO hr_test_role;

grant create session, hr_test_role to hr_test;

create user dp identified by dp_4test
default tablespace users
temporary tablespace temp; 

grant create session, resource, dba to dp;

ALTER TABLE INVENTORY.PRODUCT_ON_HAND
   ADD (ON_HAND_ID NUMBER(5));


prompt   You may now login as: hr_test/hr_4test
prompt   You may now login as: dp/dp_4test

spool off
exit

