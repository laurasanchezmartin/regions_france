#!/bin/bash

for arg in $@; do
	if [[ $arg =~ -code=([0-9]{2})$ ]];then
		code_region=${BASH_REMATCH[1]}
	else
		echo "Argument invalide"
		exit 1
	fi

done

region_name=$(grep $code_region codes_regions | cut -d"," -f2)

if [ -z "$region_name" ];then
	echo "Le code de région $code_region est erroné."
	exit 1
fi


grep "$region_name" cities.csv | cut -d"," -f2,7 > /tmp/villes_departements
grep "$region_name" cities.csv | cut -d"," -f3 > /tmp/zip_codes

paste /tmp/villes_departements /tmp/zip_codes -d"," | sort
