#!/usr/bin/env cwl-runner
class: Workflow

cwlVersion: v1.0

inputs:
    file:
        type: string
    infile:
        type: File
        doc: protein files to align

outputs:
    outfile:
    type: File
    outputSource: aligments/outputs


steps:
    run_clustal:
    run: clustal.cwl
    in:
        proteinfiles:
            source: infile
    out: [alignment_file]

    paml:
    run: paml.cwl
    in:
        alignment
    out: []

    codeml:
    run: codeml.cwl
    in:
        alignment_file: alignments/alignment_file
    out: []

doc: |
   An example CWL workflow 
