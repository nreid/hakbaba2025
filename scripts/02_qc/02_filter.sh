#!/bin/bash
#SBATCH --job-name=filter
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 6
#SBATCH --mem=15G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=first.last@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

hostname
date

# load software

module load seqkit/2.8.1
module load pigz

# input/output

CONTROL=/seqdata/CGI/ONT_Data/HasanAkbaba/2025Jan15_HasanAkbaba_SQKRNA004/2025Jan15_Hasan_controlmRNA_SQKRNA004/20250115_1324_2G_PAY96480_44f9331f/
EXTRACT=/seqdata/CGI/ONT_Data/HasanAkbaba/2025Jan15_HasanAkbaba_SQKRNA004/2025Jan15_Hasan_extractedmRNA_SQKRNA004/20250115_1324_2H_PAY55366_ba061621/

OUTDIR=../../results/filtered_fastq
mkdir -p ${OUTDIR}

# filter sequences for mean Q > 8.5 and length > 1000

# filter control

for file in $(find ${CONTROL} -name "*fastq.gz" | sort)
do cat $file
done | seqkit seq --threads 4 --min-len 1000 --min-qual 8.5 | pigz -p 4 >${OUTDIR}/control.fastq.gz

# filter extract

for file in $(find ${EXTRACT} -name "*fastq.gz" | sort)
do cat $file
done | seqkit seq --threads 4 --min-len 1000 --min-qual 8.5 | pigz -p 4 >${OUTDIR}/extract.fastq.gz