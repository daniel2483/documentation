connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /home/oracle/labs/CloneRmanRestore.log
startup nomount pfile="/home/oracle/labs/initorclTempOMF.ora";
ALTER DATABASE MOUNT;
execute dbms_backup_restore.resetCfileSection(dbms_backup_restore.RTYP_DFILE_COPY);
@/home/oracle/labs/rmanRestoreDatafiles.sql;
column file0 NEW_VALUE file0;
select NAME file0 FROM V$DATAFILE_COPY where file# = 1;
column file1 NEW_VALUE file1;
select NAME file1 FROM V$DATAFILE_COPY where file# = 2;
column file2 NEW_VALUE file2;
select NAME file2 FROM V$DATAFILE_COPY where file# = 3;
column file3 NEW_VALUE file3;
select NAME file3 FROM V$DATAFILE_COPY where file# = 4;
shutdown abort;
startup nomount pfile="/home/oracle/labs/init.ora";
