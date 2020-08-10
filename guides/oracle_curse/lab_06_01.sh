# Oracle Database 10g: Administration Workshop I
# Oracle Server Technologies - Curriculum Development
#
# ***Training purposes only***
#***Not appropriate for production use***
#
# Start this script as OS user: oracle
#   This script creates the INVENTORY schema user
#   The DROP command fails the first time you execute the script. 
#   The error can be ignored.

sqlplus / as sysdba << EOF

drop user inventory cascade;

create user inventory identified by verysecure
default tablespace inventory;

grant connect, resource to inventory;

exit;
EOF
