# Oracle Database 10g: Administration Workshop I
# Oracle Server Technologies - Curriculum Development
#
# ***Training purposes only***
#***Not appropriate for production use***
#
echo This script configures the NetProperties file for listener creation.
mv $ORACLE_HOME/network/tools/NetProperties $ORACLE_HOME/network/tools/NetProperties.bak

cat $ORACLE_HOME/network/tools/NetProperties.bak | sed \
's/INSTALLEDCOMPONENTS=ORACLENET/INSTALLEDCOMPONENTS=ORACLENET,SERVER/' \
>$ORACLE_HOME/network/tools/NetProperties
echo NetProperties is configured.
