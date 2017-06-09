#!/bin/bash

echo "*********** [INSTALLING] Doke ***********"
echo "*********** [INSTALLING] in $(pwd) ***********"

DOWNLOAD_URL=https://raw.githubusercontent.com/jmarcos-cano/Doke/master/downloads
TAR_FILE=doke.tar.gz

DEPENDENCIES='curl tar'

for DEP in ${DEPENDENCIES};do
	if ! location="$(type -p "${DEP}")" || [ -z "$location" ]; then
	  echo "Missing dependency: ${DEP}, please make sure to install it"
	  exit 1
	fi   
done


curl -k -s "${DOWNLOAD_URL}/${TAR_FILE}" | tar -xvz
rm -f install.sh
echo "*********** [INSTALLING] OK ***********"
