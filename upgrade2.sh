#!/bin/bash 
cd /app-data/miners 

rm -f startup.sh
rm -f a0.sh
rm -f a1.sh
rm -f zil.sh 

wget https://raw.githubusercontent.com/yellow-dragon/zil/main/startup.sh
wget https://raw.githubusercontent.com/yellow-dragon/zil/main/a0.sh
wget https://raw.githubusercontent.com/yellow-dragon/zil/main/a1.sh
wget https://raw.githubusercontent.com/yellow-dragon/zil/main/zil.sh

chmod +x startup.sh
chmod +x a0.sh
chmod +x a1.sh
chmod +x zil.sh
