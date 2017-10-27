cwlVersion: v1.0
class: CommandLineTool

baseCommand: [clustalo,-i,--guidetree-out]
inputs:
    proteinfile:
       type: File
       inputBinding:
            position: 1
outputs:
    alignmentfile:
        type: stdout
    stdout: alignment.aln
