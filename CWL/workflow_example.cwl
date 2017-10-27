cwlVersion: v1.0
class: Workflow
label: minimal cwl example

inputs:
    infile:
        type:   File

outputs:
    alignmentfile:
        type: File
        outputSource:   alignments
    guidetree:
        type:   File
        outputSource:   alignments

steps:
    align:
        run:    clustal.cwl
        in:
            proteinfile:
                source: infile
    out: [alignment,guidetreefile]

doc: |
   An example CWL workflow 
