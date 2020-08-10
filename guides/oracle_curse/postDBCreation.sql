connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /home/oracle/labs/postDBCreation.log
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
create spfile='/u01/app/oracle/product/10.2.0/db_1/dbs/spfileorcl.ora' FROM pfile='/home/oracle/labs/init.ora';
shutdown immediate;
connect "SYS"/"&&sysPassword" as SYSDBA
startup ;
alter user SYSMAN identified by "&&sysmanPassword" account unlock;
alter user DBSNMP identified by "&&dbsnmpPassword" account unlock;
select 'utl_recomp_begin: ' || to_char(sysdate, 'HH:MI:SS') from dual;
execute utl_recomp.recomp_serial();
select 'utl_recomp_end: ' || to_char(sysdate, 'HH:MI:SS') from dual;
host /u01/app/oracle/product/10.2.0/db_1/bin/emca -config dbcontrol db -silent -DB_UNIQUE_NAME orcl -PORT 1521 -EM_HOME /u01/app/oracle/product/10.2.0/db_1 -LISTENER LISTENER -SERVICE_NAME orcl.oracle.com -SYS_PWD &&sysPassword -SID orcl -ORACLE_HOME /u01/app/oracle/product/10.2.0/db_1 -DBSNMP_PWD &&dbsnmpPassword -HOST prueba_x -LISTENER_OH /u01/app/oracle/product/10.2.0/db_1 -LOG_FILE /home/oracle/labs/emConfig.log -SYSMAN_PWD &&sysmanPassword;
spool /home/oracle/labs/postDBCreation.log
