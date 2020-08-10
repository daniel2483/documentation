# Oracle Database 10g: Administration Workshop I
# Oracle Server Technologies - Curriculum Development
#
# ***Training purposes only***
# ***Not appropriate for production use***
#
# Start this script as OS user: oracle
#   This script supports the ADDM practice 

#!/bin/ksh 
users=8
x=1
y=$users
UNPW="addm/addm"

while [ $x -le $y ]
do
    sqlplus -s $UNPW @lab_12_04.sql &
    x=`expr $x + 1`
done
