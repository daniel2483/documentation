-- Oracle Database 10g: Administration Workshop I
-- Oracle Server Technologies - Curriculum Development
--
-- ***Training purposes only***
-- ***Not appropriate for production use***
--

prompt Inserting row in first transaction.
insert into hr.departments2 values(280,'DUMMY1','','');
commit;

prompt Inserting row in second transaction.
insert into hr.departments2 values(290,'DUMMY2','','');
commit;

prompt Inserting row in third transaction. 
insert into hr.departments2 values(300,'DUMMY3','','');
commit;

prompt These three rows have been inserted in separate transactions:
set echo on
select * from hr.departments2 where department_id >= 280;
