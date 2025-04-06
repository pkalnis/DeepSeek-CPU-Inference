#!/bin/bash --login
#SBATCH --job-name=download_r1
#SBATCH --time=24:00:00
#SBATCH --cpus-per-task=64
#SBATCH --partition=ppn


source activate download_r1

python download_r1.py
