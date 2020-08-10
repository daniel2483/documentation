# Oracle Database 10g: Administration Workshop I
# Oracle Server Technologies - Curriculum Development
#
# ***Training purposes only***
# ***Not appropriate for production use***
#
# This script calls netca in silent mode to create a listener
# If you use OUI to create your first database,
#  OUI starts the network configuration assistant and performs this task for you.

$ORACLE_HOME/bin/netca /silent /responsefile /home/oracle/labs/netca.rsp
