#!/bin/bash

set -x

split=test
dtname=tabmwp

mkdir -p ${OUTPUTHOME}

cd ${EXEHOME}

python generate_code_baseline.py --verbal \
    --chatgpt \
    --greedy \
    --dt_name ${dtname} \
    --input_file ${DATAHOME}/${dtname}_${split}.jsonl \
    --output_dir ${OUTPUTHOME} \
    --sleep_time 0 \
    --max_tokens 600
    
# --temperature 0.5 \
# --n_samples 20 --use_mini_n --mini_n_samples 5 \


    export dtname=tabmwp
    export split=test
    export ROOT=/pscratch/sd/j/jundac/project/SelfEval-Guided-Decoding
    export EXEHOME=${ROOT}/src
    export DATAHOME=${ROOT}/data
    export OUTPUTHOME=${ROOT}/outputs/${dtname}/${split}_outputs