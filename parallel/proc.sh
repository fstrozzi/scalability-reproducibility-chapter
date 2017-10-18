#!/bin/sh

cluster=$1
echo "Processing ${cluster}..."
clustalo -i ${cluster}/aa.fa --guidetree-out=${cluster}/aa.ph > ${cluster}/aa.aln
pal2nal.pl -output paml ${cluster}/aa.aln ${cluster}/nt.fa > ${cluster}/alignment.phy
cd ${cluster}
echo | codeml ../paml0-3.ctl
