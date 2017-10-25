cwlVersion: cwl:draft-3
class: Workflow

cwlVersion: v1.0

inputs:


outputs:


steps:
    run_clustal:
    run: clustal.cwl
    in:
        proteinfiles:
            source: infile




doc: |
   An example CWL workflow 
