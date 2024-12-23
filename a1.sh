#!/bin/bash
echo a11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
qubic=0
aleo=0

while true; do
  response=$(curl -s http://qubic1.hk.apool.io:8001/api/qubic/epoch_challenge)
  if echo "$response" | grep -q "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; then
    if [ "$aleo" -eq 0 ]; then
	  killall apoolminer      
      screen -S aleo -dm bash -c "/app-data/miners/aleominer-3.0.10/aleominer -u stratum+ssl://aleo-asia.f2pool.com:4420 -w hoanglong.$(hostname)"
      aleo=1
	  qubic=0
    fi
  else
    if [ "$qubic" -eq 0 ]; then
	  killall aleominer 
      screen -S qubic -dm bash -c "/app-data/miners/apoolminer-2.6.1/apoolminer --algo qubic --account CP_e2sig0aa15 --worker $(hostname) --pool qubic1.hk.apool.io:3334 --rest --cpu-off"
      qubic=1
	  aleo=0
    fi
  fi

  sleep 30
done
