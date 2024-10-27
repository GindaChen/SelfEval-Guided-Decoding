#!/bin/bash

set -x

split=test
dtname=gsm8k


# export dtname=gsm8k
# export split=test
export ROOT=/pscratch/sd/j/jundac/project/SelfEval-Guided-Decoding
export EXEHOME=${ROOT}/src
export DATAHOME=${ROOT}/data
export OUTPUTHOME=${ROOT}/outputs/${dtname}/${split}_outputs

mkdir -p ${OUTPUTHOME}

cd ${EXEHOME}


python -m pdb -c continue generate_code.py --verbal \
    --dt_name ${dtname} \
    --input_file ${DATAHOME}/${dtname}_${split}.jsonl \
    --output_dir ${OUTPUTHOME} \
    --use_mini_n --mini_n_samples 16 --max_tokens 256 \
    --sleep_time 0 \
    --reject_sample --bs_min_score 0.6 --unbiased \
    --bs_temperature 0.5 --bs_temperature_decay 1.0 \
    --temperature 1.0 --n_samples 16 --conf_ratio 0 \
    --beam_size 5 \
    --parallel \
    --n_jobs 16
    ;

