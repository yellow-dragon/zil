#!/bin/bash

qubic=0
aleo=0

while true; do
  response=$(curl -s http://8.217.123.224:8001/api/qubic/epoch_challenge)
  if echo "$response" | grep -q "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; then
    if [ "$aleo" -eq 0 ]; then
      killall apoolminer      
      screen -S aleo -dm bash -c "/app-data/miners/aleominer-3.0.12/aleominer -u stratum+ssl://172.65.186.4:4420 -w hoanglong.$(hostname)" 
      aleo=1
      qubic=0
    else
      if ! ps aux | grep "aleominer" | grep -v grep > /dev/null
      then
        screen -S aleo -dm bash -c "/app-data/miners/aleominer-3.0.12/aleominer -u stratum+ssl://172.65.186.4:4420 -w hoanglong.$(hostname)"
      fi  
    fi
  else
    if [ "$qubic" -eq 0 ]; then
      killall aleominer 
      screen -S qubic -dm bash -c "/app-data/miners/apoolminer-2.6.5/apoolminer --algo qubic --account CP_e2sig0aa15 --worker $(echo $(hostname) | awk '{print substr($0, 1, 15)}') --pool 8.217.123.224:3334 --rest --port 5500 --cpu-off"           
      qubic=1
      aleo=0
    else
      if ! ps aux | grep "apoolminer" | grep -v grep > /dev/null
      then
        screen -S qubic -dm bash -c "/app-data/miners/apoolminer-2.6.5/apoolminer --algo qubic --account CP_e2sig0aa15 --worker $(echo $(hostname) | awk '{print substr($0, 1, 15)}') --pool 8.217.123.224:3334 --rest --port 5500 --cpu-off"
      fi        
    fi
  fi

  sleep 30
done

#if ! ps aux | grep "$PROCESS_NAME" | grep -v grep > /dev/null
