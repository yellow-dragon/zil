killall a0.sh
killall apoolminer
killall aleominer
sleep 120
screen -S aleo -dm bash -c "/app-data/miners/a0.sh"
