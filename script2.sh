#!/bin/bash

# Affichage num et nom de la région

for arg in $@; do
        if [[ $arg =~ -code=([0-9]{2})$ ]];then
                code_region=${BASH_REMATCH[1]}
        else
                echo "Argument invalide"
                exit 1
        fi

done

region_name=$(grep $code_region codes_regions | cut -d"," -f2)



echo -e "<html>\n<head>\n<title>Liste des villes pour la région $region_name</title>\n</head>\n<body>\n<h1>$code_region : $region_name</h1>\n<h2>Liste des villes</h2>" > /tmp/$code_region.html
bash script1.sh -code=$code_region | sed -E "s/,/, /g" |sed -E "s/^/<li>/g"  | sed -E "s/$/<\/li>/g" >> /tmp/$code_region.html
echo -e "</body>\n</html>" >> /tmp/$code_region.html




	
