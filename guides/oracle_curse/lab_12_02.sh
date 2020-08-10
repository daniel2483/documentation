# Oracle Database 10g: Administration Workshop I
# Oracle Server Technologies - Curriculum Development
#
# ***Training purposes only***
# ***Not appropriate for production use***
#
# Start this script as OS user: oracle
#   This script supports the ADDM practice 

sqlplus / as sysdba << END

set echo on

drop user addm cascade;

create user addm identified by addm
default tablespace tbsaddm
temporary tablespace temp;

grant connect, resource, dba to addm;

exit;
END
