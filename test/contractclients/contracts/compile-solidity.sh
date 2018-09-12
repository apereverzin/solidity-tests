#!/usr/bin/env bash

function solc-err-only {
    solc "$@" 2>&1 | grep -A 2 -i "Error"
}

rm ../build/*
solc-err-only --overwrite --optimize --bin --abi ./Payer.sol -o ../build/

cd ../build

wc -c Payer.bin | awk '{print "Payer: " $1}'
