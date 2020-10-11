#!/usr/bin/env sh

set -eu

for year in {1994..2017}; do
    for i in {1..3}; do
        wget -nc "https://pmt.physicsandmathstutor.com/download/Maths/STEP/Papers/${year}%20STEP%20$i.pdf" -O "step_${year}_$i.pdf"
    done
done
