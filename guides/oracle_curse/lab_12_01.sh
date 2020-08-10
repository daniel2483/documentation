# Oracle Database 10g: Administration Workshop I
# Oracle Server Technologies - Curriculum Development
#
# ***Training purposes only***
# ***Not appropriate for production use***
#
# Start this script as OS user: oracle
#   This script supports the ADDM practice 

sqlplus / as sysdba  << END

set echo on

drop tablespace tbsaddm including contents and datafiles;

CREATE SMALLFILE TABLESPACE "TBSADDM"
DATAFILE 'addm1.dbf' SIZE 50M
LOGGING
EXTENT MANAGEMENT LOCAL
SEGMENT SPACE MANAGEMENT MANUAL;

exit;
END
