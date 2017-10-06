#!/usr/bin/nextflow

process runCodeML {

    input:
    file('cluster') from Channel.fromPath('../data/cluster00*',type: "dir")
    file('../data/paml0-3.ctl')


    """
    clustalo -i cluster/aa.fa --guidetree-out=cluster/aa.ph > cluster/aa.aln
    /usr/local/pal2nal.v14/pal2nal.pl -output paml cluster/aa.aln cluster/nt.fa > cluster/alignment.phy
    cd cluster
    echo | codeml ../paml0-3.ctl
    """

}

