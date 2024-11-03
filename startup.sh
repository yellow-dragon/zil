#!/bin/bash
echo "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
killall apoolminer
killall aleominer
killall a0.sh
sleep 1
screen -dmS a0 "/app-data/miners/a0.sh"
