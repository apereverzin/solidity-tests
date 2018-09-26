#!/usr/bin/env bash

function solc-err-only {
    solc "$@" 2>&1 | grep -A 2 -i "Error"
}

rm ../build/*
solc-err-only --overwrite --optimize --bin --abi ./Register.sol -o ../build/
solc-err-only --overwrite --optimize --bin --abi ./TestContract.sol -o ../build/

cd ../build

wc -c Register.bin | awk '{print "Register: " $1}'
wc -c TestContract.bin | awk '{print "TestContract: " $1}'
