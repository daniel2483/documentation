connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /home/oracle/labs/postScripts.log
@/u01/app/oracle/product/10.2.0/db_1/rdbms/admin/dbmssml.sql;
execute dbms_datapump_utl.replace_default_dir;
commit;
connect "SYS"/"&&sysPassword" as SYSDBA
alter session set current_schema=ORDSYS;
@/u01/app/oracle/product/10.2.0/db_1/ord/im/admin/ordlib.sql;
alter session set current_schema=SYS;
connect "SYS"/"&&sysPassword" as SYSDBA
connect "SYS"/"&&sysPassword" as SYSDBA
execute dbms_swrf_internal.cleanup_database(cleanup_local => FALSE);
commit;
spool off
