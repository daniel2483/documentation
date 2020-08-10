connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /home/oracle/labs/cloneDBCreation.log
Create controlfile reuse set database "orcl"
MAXINSTANCES 8
MAXLOGHISTORY 1
MAXLOGFILES 16
MAXLOGMEMBERS 3
MAXDATAFILES 100
Datafile 
'&&file0',
'&&file1',
'&&file2',
'&&file3'
LOGFILE GROUP 1  SIZE 51200K,
GROUP 2  SIZE 51200K,
GROUP 3  SIZE 51200K RESETLOGS;
select name from v$controlfile;
exec dbms_backup_restore.zerodbid(0);
shutdown immediate;
startup nomount pfile="/home/oracle/labs/initorclTemp.ora";
Create controlfile reuse set database "orcl"
MAXINSTANCES 8
MAXLOGHISTORY 1
MAXLOGFILES 16
MAXLOGMEMBERS 3
MAXDATAFILES 100
Datafile 
'&&file0',
'&&file1',
'&&file2',
'&&file3'
LOGFILE GROUP 1  SIZE 51200K,
GROUP 2  SIZE 51200K,
GROUP 3  SIZE 51200K RESETLOGS;
alter system enable restricted session;
alter database "orcl" open resetlogs;
alter database rename global_name to "orcl.oracle.com";
set linesize 2048;
column ctl_files NEW_VALUE ctl_files;
select concat('control_files=''', concat(replace(value, ', ', ''','''), '''')) ctl_files from v$parameter where name ='control_files';
host echo &ctl_files >>/home/oracle/labs/init.ora;
host echo &ctl_files >>/home/oracle/labs/initorclTemp.ora;
ALTER TABLESPACE TEMP ADD TEMPFILE SIZE 20480K AUTOEXTEND ON NEXT 640K MAXSIZE UNLIMITED;
select tablespace_name from dba_tablespaces where tablespace_name='USERS';
alter system disable restricted session;
connect "SYS"/"&&sysPassword" as SYSDBA
@/u01/app/oracle/product/10.2.0/db_1/demo/schema/mkplug.sql &&sysPassword change_on_install change_on_install change_on_install change_on_install change_on_install change_on_install /u01/app/oracle/product/10.2.0/db_1/assistants/dbca/templates/example.dmp /u01/app/oracle/product/10.2.0/db_1/assistants/dbca/templates/example01.dfb /u01/app/oracle/oradata/orcl/example01.dbf /home/oracle/labs/ "\'SYS/&&sysPassword as SYSDBA\'";
connect "SYS"/"&&sysPassword" as SYSDBA
shutdown immediate;
startup pfile="/home/oracle/labs/initorclTemp.ora";
alter system enable restricted session;
select sid, program, serial#, username from v$session;
alter database character set INTERNAL_CONVERT AL32UTF8;
alter database national character set INTERNAL_CONVERT AL16UTF16;
alter user sys identified by "&&sysPassword";
alter user system identified by "&&systemPassword";
alter system disable restricted session;
