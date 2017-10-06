#!/usr/bin/nextflow


params.ctl_file = "$baseDir/../data/paml0-3.ctl"
paml_ctl_file =  file(params.ctl_file)


process clustalOmega {

    stageInMode "copy"

    input:
    file(cluster) from Channel.fromPath('../data/cluster00*',type: "dir")

    output:
    file("$cluster") into clustal_outputs 

    """
    clustalo -i $cluster/aa.fa --guidetree-out=$cluster/aa.ph > $cluster/aa.aln
    """

}

process pal2nal {
    
    input:
    file(cluster) from clustal_outputs

    output:
    file("$cluster") into pal2nal_outputs    

 
    """
    /usr/local/pal2nal.v14/pal2nal.pl -output paml $cluster/aa.aln $cluster/nt.fa > $cluster/alignment.phy
    """
}

process codeML {

    stageInMode "copy"

    input:
    file(cluster) from pal2nal_outputs
    file ctl from paml_ctl_file

    output:
    file("tmp") into codeML_outputs

    publishDir 'paml_results'
 
    """
    cd $cluster
    echo | codeml ../$ctl
	"""
}

