#!/bin/bash

set -x

# export dtname=aqua
# export split=test
# export ROOT=/pscratch/sd/j/jundac/project/SelfEval-Guided-Decoding
# export EXEHOME=${ROOT}/src
# export DATAHOME=${ROOT}/data
# export OUTPUTHOME=${ROOT}/outputs/${dtname}/${split}_outputs

split=test
dtname=aqua

mkdir -p ${OUTPUTHOME}

cd ${EXEHOME}

python generate_code_llama.py \
    --dt_name ${dtname} \
    --model_name meta-llama/Llama-2-13b-hf \
    --input_file ${DATAHOME}/${dtname}_${split}.jsonl \
    --output_dir ${OUTPUTHOME} \
    --mini_n_samples 1 --mini_n_samples_eval 1 --max_tokens 50 \
    --beam_size 5 \
    --reject_sample --unbiased \
    --bs_temperature 0.0 --bs_temperature_decay 0.5 \
    --temperature 0.1 --n_samples 2 --conf_ratio 0