#!/bin/bash

set -x

split=${split:-test}
dtname=${dtname:-gsm8k}
BEAM_SIZE=${BEAM_SIZE:-5}

mkdir -p ${OUTPUTHOME}

cd ${EXEHOME}

python generate_code_llama.py --verbal \
    --dt_name ${dtname} \
    --model_name meta-llama/Llama-2-7b-hf \
    --input_file ${DATAHOME}/${dtname}_${split}.jsonl \
    --output_dir ${OUTPUTHOME} \
    --mini_n_samples 2 --mini_n_samples_eval 2 --max_tokens 52 \
    --beam_size ${BEAM_SIZE} \
    --reject_sample --unbiased \
    --bs_temperature 0.0 --bs_temperature_decay 0.5 \
    --temperature 0.5 --n_samples 2 --conf_ratio 0

