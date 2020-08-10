# Oracle Database 10g: Administration Workshop I
# Oracle Server Technologies - Curriculum Development
#
# ***Training purposes only***
# ***Not appropriate for production use***
#
# Start this script as OS user: oracle
#   This script supports the ADDM practice 

sqlplus / as sysdba << END

drop user addm cascade;

drop tablespace tbsaddm including contents and datafiles;

drop tablespace tbsaddm2 including contents and datafiles;

exit;
END
