#!/bin/bash
echo "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
killall apoolminer
killall aleominer
killall a0.sh
sleep 1
screen -S a0 -dm bash -c "/app-data/miners/a0.sh"
