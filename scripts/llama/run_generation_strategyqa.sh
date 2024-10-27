#!/bin/bash

set -x

export dtname=strategyqa
export split=test
export ROOT=/pscratch/sd/j/jundac/project/SelfEval-Guided-Decoding
export EXEHOME=${ROOT}/src
export DATAHOME=${ROOT}/data
export OUTPUTHOME=${ROOT}/outputs/${dtname}/${split}_outputs

module load cudatoolkit/12.4

mkdir -p ${OUTPUTHOME}

cd ${EXEHOME}

python generate_code_llama.py --verbal \
    --dt_name ${dtname} \
    --model_name meta-llama/Llama-2-13b-hf \
    --input_file ${DATAHOME}/${dtname}_${split}.jsonl \
    --output_dir ${OUTPUTHOME} \
    --mini_n_samples 2 --mini_n_samples_eval 2 --max_tokens 50 \
    --beam_size 5 \
    --reject_sample --bs_min_score 0.4 --unbiased \
    --bs_temperature 0.0 --bs_temperature_decay 0.5 \
    --temperature 1.0 --n_samples 2 --conf_ratio 0