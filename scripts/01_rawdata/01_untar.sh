#!/bin/bash
#SBATCH --job-name=untar
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 2
#SBATCH --mem=15G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=first.last@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

hostname
date

# decompress data

DATADIR=/seqdata/CGI/ONT_Data/HasanAkbaba/
DATA=2025Jan15_HasanAkbaba_SQKRNA004.tar.gz

cd ${DATADIR}

tar -xvzf ${DATA}