#!/bin/bash
set -e

DIR=$(dirname $(realpath "$0")) 	# locate folder where this sh-script is located in

# PARAMETER
DIR_RDA="../../../data/Rdata/"
DIR_CSV="../../../data/csv/"
DIR_GDT="../../../data/gdt/"
GRETL_SCRIPT="rda2csv2gdt.inp"

cd $DIR
echo "Switched to ${DIR}"

# Create directories
echo "Create folder for storing csv file"
mkdir -p ${DIR_CSV}
echo "Create folder for storing gdt file"
mkdir -p ${DIR_GDT}


for file in $DIR_RDA*
do

	FILE_RDA=${file} \
	DIR_RDA=${DIR_RDA} \
	DIR_CSV=${DIR_CSV} \
	DIR_GDT=${DIR_GDT} \
	gretlcli -e -b -q ${GRETL_SCRIPT}

	if [ $? -eq 0 ]
	then
	  echo "Finished storing '$file'."
	else
	  echo "Failed to store '$file'. Ignore."
	fi

done


exit 0

