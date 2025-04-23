#!/bin/bash
#SBATCH --job-name=pycoQC
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

# load software
module load pycoQC/2.5.2

# outdir

OUTDIR=../../results/pycoQC
mkdir -p ${OUTDIR}

# data
CONTROLSUMMARY=/seqdata/CGI/ONT_Data/HasanAkbaba/2025Jan15_HasanAkbaba_SQKRNA004/2025Jan15_Hasan_controlmRNA_SQKRNA004/20250115_1324_2G_PAY96480_44f9331f/sequencing_summary_PAY96480_44f9331f_e48fa59d.txt
EXTRACTSUMMARY=/seqdata/CGI/ONT_Data/HasanAkbaba/2025Jan15_HasanAkbaba_SQKRNA004/2025Jan15_Hasan_extractedmRNA_SQKRNA004/20250115_1324_2H_PAY55366_ba061621/sequencing_summary_PAY55366_ba061621_04efe707.txt

pycoQC -f ${CONTROLSUMMARY} -o ${OUTDIR}/control.hmtl

pycoQC -f ${EXTRACTSUMMARY} -o ${OUTDIR}/extract.hmtl