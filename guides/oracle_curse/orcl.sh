#!/bin/sh

mkdir -p /u01/app/oracle/admin/orcl/adump
mkdir -p /u01/app/oracle/admin/orcl/bdump
mkdir -p /u01/app/oracle/admin/orcl/cdump
mkdir -p /u01/app/oracle/admin/orcl/dpdump
mkdir -p /u01/app/oracle/admin/orcl/pfile
mkdir -p /u01/app/oracle/admin/orcl/udump
mkdir -p /u01/app/oracle/flash_recovery_area
mkdir -p /u01/app/oracle/oradata
mkdir -p /u01/app/oracle/product/10.2.0/db_1/cfgtoollogs/dbca/orcl
mkdir -p /u01/app/oracle/product/10.2.0/db_1/dbs
ORACLE_SID=orcl; export ORACLE_SID
echo You should Add this entry in the /etc/oratab: orcl:/u01/app/oracle/product/10.2.0/db_1:Y
/u01/app/oracle/product/10.2.0/db_1/bin/sqlplus /nolog @/home/oracle/labs/orcl.sql
