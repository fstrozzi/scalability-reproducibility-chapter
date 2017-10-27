cwlVersion: v1.0
class: CommandLineTool

baseCommand: [clustalo,-i]
inputs:
    proteinfile:
       type: File
       inputBinding:
            position: 1
            prefix: -i

outputs:
    alignmentfile:
        type: stdout
    stdout: alignment.aln
