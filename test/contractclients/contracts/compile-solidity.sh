#!/usr/bin/env bash

function solc-err-only {
    solc "$@" 2>&1 | grep -A 2 -i "Error"
}

rm ../build/*
solc-err-only --overwrite --optimize --bin --abi ./Payer.sol -o ../build/
solc-err-only --overwrite --optimize --bin --abi ./Attacker.sol -o ../build/
solc-err-only --overwrite --optimize --bin --abi ./ValidContract.sol -o ../build/

cd ../build

wc -c Payer.bin | awk '{print "Payer: " $1}'
wc -c Attacker.bin | awk '{print "Attacker: " $1}'
wc -c ValidContract.bin | awk '{print "ValidContract: " $1}'
