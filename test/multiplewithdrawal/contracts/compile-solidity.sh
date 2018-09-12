#!/usr/bin/env bash

function solc-err-only {
    solc "$@" 2>&1 | grep -A 2 -i "Error"
}

rm ../build/*
solc-err-only --overwrite --optimize --bin --abi ./TestContract.sol -o ../build/
solc-err-only --overwrite --optimize --bin --abi ./SuccessfulAttacker.sol -o ../build/
solc-err-only --overwrite --optimize --bin --abi ./UnsuccessfulAttacker.sol -o ../build/
solc-err-only --overwrite --optimize --bin --abi ./Payer.sol -o ../build/

cd ../build

wc -c TestContract.bin | awk '{print "TestContract: " $1}'
wc -c SuccessfulAttacker.bin | awk '{print "SuccessfulAttacker: " $1}'
wc -c UnsuccessfulAttacker.bin | awk '{print "UnsuccessfulAttacker: " $1}'
wc -c Payer.bin | awk '{print "Payer: " $1}'
