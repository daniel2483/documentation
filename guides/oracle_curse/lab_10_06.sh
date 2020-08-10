# Oracle Database 10g: Administration Workshop I
# Oracle Server Technologies - Curriculum Development
#
# ***Training purposes only***
#***Not appropriate for production use***
#
# Start this script as OS user: oracle
#   This script stops and restarts the database

sqlplus / as sysdba << EOF

shutdown immediate

startup

exit;
EOF
