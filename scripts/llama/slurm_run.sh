#!/bin/bash
#SBATCH -N 1
#SBATCH -C gpu
#SBATCH -G 4
#SBATCH -t 04:00:00
#SBATCH -q regular
#SBATCH -A m4239_g

export CUDA_VISIBLE_DEVICES=${GPUS}
export dtname=gsm8k
export split=test
export ROOT=/pscratch/sd/j/jundac/project/SelfEval-Guided-Decoding
export EXEHOME=${ROOT}/src
export DATAHOME=${ROOT}/data
export OUTPUTHOME=${ROOT}/outputs/${dtname}/${split}_outputs
export BEAM_SIZE=16

echo "Activating environment..."
echo "ROOT: ${ROOT}"
echo "EXEHOME: ${EXEHOME}"
echo "DATAHOME: ${DATAHOME}"
echo "OUTPUTHOME: ${OUTPUTHOME}"
echo "dtname: ${dtname}"
echo "split: ${split}"
echo "BEAM_SIZE: ${BEAM_SIZE}"

module load cudatoolkit/12.4
mamba activate ${ROOT}/env

srun bash ${ROOT}/scripts/llama/run_generation_gsm8k.sh

wait
