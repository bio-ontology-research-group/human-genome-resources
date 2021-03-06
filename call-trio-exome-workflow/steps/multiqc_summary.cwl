$namespaces:
  dx: https://www.dnanexus.com/cwl#
arguments:
- position: 0
  valueFrom: sentinel_runtime=cores,$(runtime['cores']),ram,$(runtime['ram'])
- sentinel_parallel=multi-combined
- sentinel_outputs=summary__multiqc,versions__tools,versions__data
- sentinel_inputs=qcout_rec:record
- run_number=0
baseCommand:
- bcbio_nextgen.py
- runfn
- multiqc_summary
- cwl
class: CommandLineTool
cwlVersion: v1.0
hints:
- class: DockerRequirement
  dockerImageId: leechuck/bcbio-vc
  dockerPull: leechuck/bcbio-vc
- class: ResourceRequirement
  coresMin: 1
  outdirMin: 219156
  ramMin: 4096
  tmpdirMin: 104458
- class: dx:InputResourceRequirement
  indirMin: 1
- class: SoftwareRequirement
  packages:
  - package: multiqc
    specs:
    - https://anaconda.org/bioconda/multiqc
  - package: multiqc-bcbio
    specs:
    - https://anaconda.org/bioconda/multiqc-bcbio
inputs:
- id: qcout_rec
  type:
    items:
      fields:
      - name: summary__qc
        type:
        - File
        - 'null'
      - name: summary__metrics
        type:
        - string
        - 'null'
      - name: description
        type: string
      - name: config__algorithm__qc
        type:
          items: string
          type: array
      - name: config__algorithm__tools_off
        type:
        - 'null'
        - items: 'null'
          type: array
      - name: config__algorithm__tools_on
        type:
        - 'null'
        - items: 'null'
          type: array
      - name: genome_build
        type: string
      - name: reference__versions
        type: File
      name: qcout_rec
      type: record
    type: array
outputs:
- id: summary__multiqc
  type:
    items:
    - File
    - 'null'
    type: array
- id: versions__tools
  type:
    items:
    - File
    - 'null'
    type: array
- id: versions__data
  type:
    items:
    - File
    - 'null'
    type: array
requirements:
- class: InlineJavascriptRequirement
- class: InitialWorkDirRequirement
  listing:
  - entry: $(JSON.stringify(inputs))
    entryname: cwl.inputs.json
