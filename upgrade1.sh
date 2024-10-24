#!/bin/bash 
cd /app-data/miners 

rm -f startup-script.sh
rm -f a0-oc-script.sh
rm -f a1-oc-script.sh
rm -f zil-oc-script.sh 

wget https://raw.githubusercontent.com/yellow-dragon/zil/main/startup-script.sh
wget https://raw.githubusercontent.com/yellow-dragon/zil/main/a0-oc-script.sh
wget https://raw.githubusercontent.com/yellow-dragon/zil/main/a1-oc-script.sh
wget https://raw.githubusercontent.com/yellow-dragon/zil/main/zil-oc-script.sh

chmod +x startup-script.sh
chmod +x a0-oc-script.sh
chmod +x a1-oc-script.sh
chmod +x zil-oc-script.sh
