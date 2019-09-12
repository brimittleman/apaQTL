#!/bin/bash

#source activate three-prime-env
source ~/activate_anaconda.sh
conda activate three-prime-env
snakemake \
    -kp \
    --ri \
    -j 450 \
    --rerun-incomplete \
    --max-jobs-per-second 5 \
    --latency-wait 60 \
    --configfile config.yaml \
    --cluster-config cluster.json \
    -c "sbatch \
        --mem={cluster.mem} \
        --nodes={cluster.n} \
        --tasks-per-node={cluster.tasks} \
        --partition=broadwl \
        --job-name={cluster.name} \
        --output={cluster.logfile}" \
    $*
