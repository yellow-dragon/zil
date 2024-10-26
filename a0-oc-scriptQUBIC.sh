#!/bin/bash
screen -S H9 -dm bash -c "/app-data/miners/apoolminer-2.6.1/apoolminer --algo qubic --account CP_e2sig0aa15 --worker $(hostname) --pool qubic1.hk.apool.io:3334 --rest --cpu-off"
