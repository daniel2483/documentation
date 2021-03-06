#!/bin/bash

############################################################################################
#       Descripcion: Script utilizado para estadisticas STP formateador de crudos          #    
#       Creador: Daniel Rodriguez Sanchez                                                  #
#       Fecha: 23-01-2012                                                                  #
#       Ultima Fecha de Actualizacion: 02-02-2012                                          #
############################################################################################


limit=$(ls /home/ericsson/test/STP_* | wc -l)
limit2=12
count=0


echo ""
echo "Number of files to process" $limit 
echo ""
echo "Reading files:"


for ((count=1; count<=$limit; count++)) 
do
archive=$(ls /home/ericsson/test/STP_* | tail -1)
archive=`echo ${archive} | cut -d/ -f5`

echo $archive

tr -d '\001' < /home/ericsson/test/$archive > /home/ericsson/test/temporal.txt

mv /home/ericsson/test/$archive /home/ericsson/test/logs_read/

fecha=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==17' | nawk '{print(substr($3,1,8))}')
hora=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==17' | nawk '{print(substr($4,1,5))}')
n_fila=40


nodo=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==40' | nawk '{print(substr($1,1,9))}')
valortx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==40' | nawk '{print(substr($6,1,5))}')
picotx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==40' | nawk '{print(substr($7,1,5))}')
valorrx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==41' | nawk '{print(substr($2,1,5))}')
picorx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==41' | nawk '{print(substr($3,1,5))}')

echo "Making new file..."
echo ""
echo "raw1"
echo "$fecha $hora $nodo $valortx $valorrx $picotx $picorx" > /home/ericsson/test/processed_$archive


nodo=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==42' | nawk '{print(substr($1,1,9))}')
valortx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==42' | nawk '{print(substr($6,1,5))}')
picotx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==42' | nawk '{print(substr($7,1,5))}')
valorrx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==43' | nawk '{print(substr($2,1,5))}')
picorx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==43' | nawk '{print(substr($3,1,5))}')

echo "raw2"
echo "$fecha $hora $nodo $valortx $valorrx $picotx $picorx" >> /home/ericsson/test/processed_$archive

nodo=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==44' | nawk '{print(substr($1,1,9))}')
valortx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==44' | nawk '{print(substr($6,1,5))}')
picotx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==44' | nawk '{print(substr($7,1,5))}')
valorrx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==45' | nawk '{print(substr($2,1,5))}')
picorx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==45' | nawk '{print(substr($3,1,5))}')

echo "raw3"
echo "$fecha $hora $nodo $valortx $valorrx $picotx $picorx" >> /home/ericsson/test/processed_$archive

nodo=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==46' | nawk '{print(substr($1,1,9))}')
valortx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==46' | nawk '{print(substr($6,1,5))}')
picotx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==46' | nawk '{print(substr($7,1,5))}')
valorrx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==47' | nawk '{print(substr($2,1,5))}')
picorx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==47' | nawk '{print(substr($3,1,5))}')

echo "raw4"
echo "$fecha $hora $nodo $valortx $valorrx $picotx $picorx" >> /home/ericsson/test/processed_$archive

nodo=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==48' | nawk '{print(substr($1,1,9))}')
valortx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==48' | nawk '{print(substr($6,1,5))}')
picotx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==48' | nawk '{print(substr($7,1,5))}')
valorrx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==49' | nawk '{print(substr($2,1,5))}')
picorx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==49' | nawk '{print(substr($3,1,5))}')

echo "raw5"
echo "$fecha $hora $nodo $valortx $valorrx $picotx $picorx" >> /home/ericsson/test/processed_$archive

nodo=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==50' | nawk '{print(substr($1,1,9))}')
valortx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==50' | nawk '{print(substr($6,1,5))}')
picotx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==50' | nawk '{print(substr($7,1,5))}')
valorrx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==51' | nawk '{print(substr($2,1,5))}')
picorx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==51' | nawk '{print(substr($3,1,5))}')

echo "raw6"
echo "$fecha $hora $nodo $valortx $valorrx $picotx $picorx" >> /home/ericsson/test/processed_$archive

nodo=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==52' | nawk '{print(substr($1,1,9))}')
valortx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==52' | nawk '{print(substr($6,1,5))}')
picotx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==52' | nawk '{print(substr($7,1,5))}')
valorrx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==53' | nawk '{print(substr($2,1,5))}')
picorx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==53' | nawk '{print(substr($3,1,5))}')

echo "raw7"
echo "$fecha $hora $nodo $valortx $valorrx $picotx $picorx" >> /home/ericsson/test/processed_$archive

nodo=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==54' | nawk '{print(substr($1,1,9))}')
valortx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==54' | nawk '{print(substr($6,1,5))}')
picotx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==54' | nawk '{print(substr($7,1,5))}')
valorrx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==55' | nawk '{print(substr($2,1,5))}')
picorx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==55' | nawk '{print(substr($3,1,5))}')

echo "raw8"
echo "$fecha $hora $nodo $valortx $valorrx $picotx $picorx" >> /home/ericsson/test/processed_$archive

nodo=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==56' | nawk '{print(substr($1,1,9))}')
valortx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==56' | nawk '{print(substr($6,1,5))}')
picotx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==56' | nawk '{print(substr($7,1,5))}')
valorrx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==57' | nawk '{print(substr($2,1,5))}')
picorx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==57' | nawk '{print(substr($3,1,5))}')

echo "raw9"
echo "$fecha $hora $nodo $valortx $valorrx $picotx $picorx" >> /home/ericsson/test/processed_$archive

nodo=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==58' | nawk '{print(substr($1,1,9))}')
valortx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==58' | nawk '{print(substr($6,1,5))}')
picotx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==58' | nawk '{print(substr($7,1,5))}')
valorrx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==59' | nawk '{print(substr($2,1,5))}')
picorx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==59' | nawk '{print(substr($3,1,5))}')

echo "raw10"
echo "$fecha $hora $nodo $valortx $valorrx $picotx $picorx" >> /home/ericsson/test/processed_$archive

nodo=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==60' | nawk '{print(substr($1,1,9))}')
valortx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==60' | nawk '{print(substr($6,1,5))}')
picotx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==60' | nawk '{print(substr($7,1,5))}')
valorrx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==61' | nawk '{print(substr($2,1,5))}')
picorx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==61' | nawk '{print(substr($3,1,5))}')

echo "raw11"
echo "$fecha $hora $nodo $valortx $valorrx $picotx $picorx" >> /home/ericsson/test/processed_$archive

nodo=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==62' | nawk '{print(substr($1,1,9))}')
valortx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==62' | nawk '{print(substr($6,1,5))}')
picotx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==62' | nawk '{print(substr($7,1,5))}')
valorrx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==63' | nawk '{print(substr($2,1,5))}')
picorx=$(cat /home/ericsson/test/temporal.txt | nawk 'NR==63' | nawk '{print(substr($3,1,5))}')

echo "raw12"
echo "$fecha $hora $nodo $valortx $valorrx $picotx $picorx" >> /home/ericsson/test/processed_$archive
done

echo ""
echo "All files has been processed..."
echo ""
