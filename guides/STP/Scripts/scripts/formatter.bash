#!/bin/bash

############################################################################################
#       Descripcion: Script utilizado para estadisticas STP formateador de crudos          #    
#       Creador: Daniel Rodriguez Sanchez                                                  #
#       Fecha: 23-01-2012                                                                  #
#       Ultima Fecha de Actualizacion: 07-02-2012                                          #
############################################################################################

dir="/home/ericsson/logs/statistics/output"

limit=$(ls $dir/STP_* | wc -l)
limit2=12
count=0


echo ""
echo "Number of files to process" $limit 
echo ""
echo "Reading files:"


for ((count=1; count<=$limit; count++)) 
do
archive=$(ls $dir/STP_* | tail -1)
archive=`echo ${archive} | cut -d/ -f7`

echo $archive

tr -d '\001' < $dir/$archive > $dir/temporal.txt

#gzip $dir/$archive
mv $dir/$archive $dir/logs_read/

fecha=$(cat $dir/temporal.txt | nawk 'NR==17' | nawk '{print(substr($3,1,8))}')
hora=$(cat $dir/temporal.txt | nawk 'NR==17' | nawk '{print(substr($4,1,5))}')
n_fila=40
loop_print=12

for ((count2=1; count2<=$loop_print; count2++))
do

if(($count2==1))
then
echo "Making new file..."

	nodo=$(cat $dir/temporal.txt | nawk "NR==$n_fila" | nawk '{print(substr($1,1,7))}')
	valortx=$(cat $dir/temporal.txt | nawk "NR==$n_fila" | nawk '{print(substr($6,1,5))}')
	picotx=$(cat $dir/temporal.txt | nawk "NR==$n_fila" | nawk '{print(substr($7,1,5))}')
	n_fila=$n_fila+1
	#echo $n_fila
	valorrx=$(cat $dir/temporal.txt | nawk "NR==$n_fila" | nawk '{print(substr($2,1,5))}')
	picorx=$(cat $dir/temporal.txt | nawk "NR==$n_fila" | nawk '{print(substr($3,1,5))}')
	n_fila=$n_fila+1
	#echo $n_fila

	echo ""
	echo "raw" $count2
	echo "20$fecha $hora $nodo $valortx $valorrx $picotx $picorx" > $dir/processed_$archive

else
	nodo=$(cat $dir/temporal.txt | nawk "NR==$n_fila" | nawk '{print(substr($1,1,7))}')
	valortx=$(cat $dir/temporal.txt | nawk "NR==$n_fila" | nawk '{print(substr($6,1,5))}')
	picotx=$(cat $dir/temporal.txt | nawk "NR==$n_fila" | nawk '{print(substr($7,1,5))}')
	n_fila=$n_fila+1
	#echo $n_fila
	valorrx=$(cat $dir/temporal.txt | nawk "NR==$n_fila" | nawk '{print(substr($2,1,5))}')
	picorx=$(cat $dir/temporal.txt | nawk "NR==$n_fila" | nawk '{print(substr($3,1,5))}')
	n_fila=$n_fila+1
	#echo $n_fila

	echo "raw" $count2
	echo "20$fecha $hora $nodo $valortx $valorrx $picotx $picorx" >> $dir/processed_$archive
fi
done
done

echo ""
echo "All files has been processed..."
echo ""
