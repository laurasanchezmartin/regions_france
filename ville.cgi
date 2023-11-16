#!/bin/bash
echo "content-type: text/html"
echo ""

echo "<meta charset=utf-8>"

# Affichage num et nom de la région

code_region=$code
region_name=$(grep $code_region codes_regions | cut -d"," -f2)



echo -e "<html>\n<head>\n<title>Liste des villes pour la région $region_name</title>\n</head>\n<body>\n<h1>$code_region : $region_name</h1>\n<h2>Liste des villes</h2>" > /tmp/$code_region.html
bash script1.sh -code=$code_region | sed -E "s/,/, /g" |sed -E "s/^/<li>/g"  | sed -E "s/$/<\/li>/g" >> /tmp/$code_region.html
echo -e "</body>\n</html>" >> /tmp/$code_region.html

cat /tmp/$code_region.html


	
