#!/bin/bash

qubic=0
aleo=0
qubicrun=1
nvidia-smi -pm 1
while true; do
  response=$(curl -s http://8.217.123.224:8001/api/qubic/epoch_challenge)
  if echo "$response" | grep -q "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; then
    if [ "$aleo" -eq 0 ]; then
      echo "ALEO STARTING"
      killall apoolminer
      nvidia-smi -lgc 1300
      screen -S aleo -dm bash -c "/app-data/miners/aleominer-3.0.14/aleominer -u stratum+ssl://172.65.186.4:4420 -w hoanglong.$(hostname)" 
      aleo=1
      qubic=0
    else
      if ! ps aux | grep "aleominer" | grep -v grep > /dev/null
      then
        echo "ALEO STOPED"
        screen -X -S aleo quit
        screen -S aleo -dm bash -c "/app-data/miners/aleominer-3.0.14/aleominer -u stratum+ssl://172.65.186.4:4420 -w hoanglong.$(hostname)"
      else 
        echo "ALEO RUNNING"
      fi  
    fi
  else
    if [ "$qubic" -eq 0 ]; then
      echo "QUBIC STARTING"
      killall aleominer 
      nvidia-smi -lgc 1125
      screen -S qubic -dm bash -c "/app-data/miners/apoolminer-2.7.4/apoolminer --algo qubic --account CP_e2sig0aa15 --worker $(echo $(hostname) | awk '{print substr($0, 1, 15)}') --pool 8.217.123.224:3334 --rest --port 5500 --cpu-off"
      qubic=1
      aleo=0
    else
      if ! ps aux | grep "apoolminer" | grep -v grep > /dev/null
      then
        if [ "$qubicrun" -eq 0 ]; then 
          reboot
        fi
        echo "QUBIC STOPED"
        qubicrun=0
        screen -X -S qubic quit
        screen -S qubic -dm bash -c "/app-data/miners/apoolminer-2.7.4/apoolminer --algo qubic --account CP_e2sig0aa15 --worker $(echo $(hostname) | awk '{print substr($0, 1, 15)}') --pool 8.217.123.224:3334 --rest --port 5500 --cpu-off"
      else
        echo "QUBIC RUNNING"
        qubicrun=1
      fi        
    fi
  fi

  sleep 30
done
