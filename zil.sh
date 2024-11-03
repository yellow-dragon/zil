killall a0.sh
killall apoolminer
killall aleominer
sleep 120
screen -S a0 -dm bash -c "/app-data/miners/a0.sh"
