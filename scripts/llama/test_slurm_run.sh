#!/bin/bash

#SBATCH -A m4239_g
#SBATCH -C gpu
#SBATCH -N 1
#SBATCH -t 5
#SBATCH --ntasks-per-node=4

srun --exact -u -n 1 --gpus-per-task 1 -c 1 --mem-per-cpu=4G bash -c 'date +%M:%S; sleep 15; date +%M:%S' &
srun --exact -u -n 1 --gpus-per-task 1 -c 1 --mem-per-cpu=4G bash -c 'date +%M:%S; sleep 15; date +%M:%S' &
srun --exact -u -n 1 --gpus-per-task 1 -c 1 --mem-per-cpu=4G bash -c 'date +%M:%S; sleep 15; date +%M:%S' &
srun --exact -u -n 1 --gpus-per-task 1 -c 1 --mem-per-cpu=4G bash -c 'date +%M:%S; sleep 15; date +%M:%S' &

wait