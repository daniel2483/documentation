set verify off
PROMPT specify a password for sys as parameter 1;
DEFINE sysPassword = &1
PROMPT specify a password for system as parameter 2;
DEFINE systemPassword = &2
PROMPT specify a password for sysman as parameter 3;
DEFINE sysmanPassword = &3
PROMPT specify a password for dbsnmp as parameter 4;
DEFINE dbsnmpPassword = &4
host /u01/app/oracle/product/10.2.0/db_1/bin/orapwd file=/u01/app/oracle/product/10.2.0/db_1/dbs/orapworcl password=&&sysPassword force=y
@/home/oracle/labs/CloneRmanRestore.sql
@/home/oracle/labs/cloneDBCreation.sql
@/home/oracle/labs/postScripts.sql
@/home/oracle/labs/postDBCreation.sql
