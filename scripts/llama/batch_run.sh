export CUDA_VISIBLE_DEVICES=${GPUS}
export dtname=gsm8k
export split=test
export ROOT=/pscratch/sd/j/jundac/project/SelfEval-Guided-Decoding
export EXEHOME=${ROOT}/src
export DATAHOME=${ROOT}/data
export OUTPUTHOME=${ROOT}/outputs/${dtname}/${split}_outputs
# export BEAM_SIZE=32

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

bash ${ROOT}/scripts/llama/run_generation_gsm8k.sh
