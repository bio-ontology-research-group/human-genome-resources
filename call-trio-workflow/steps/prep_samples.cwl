$namespaces:
  dx: https://www.dnanexus.com/cwl#
arguments:
- position: 0
  valueFrom: sentinel_runtime=cores,$(runtime['cores']),ram,$(runtime['ram'])
- sentinel_parallel=multi-parallel
- sentinel_outputs=rgnames__sample,config__algorithm__variant_regions,config__algorithm__variant_regions_merged,config__algorithm__variant_regions_orig,config__algorithm__coverage,config__algorithm__coverage_merged,config__algorithm__coverage_orig,config__algorithm__seq2c_bed_ready
- sentinel_inputs=prep_samples_rec:record
- run_number=0
baseCommand:
- bcbio_nextgen.py
- runfn
- prep_samples
- cwl
class: CommandLineTool
cwlVersion: v1.0
hints:
- class: DockerRequirement
  dockerImageId: leechuck/bcbio-vc
  dockerPull: leechuck/bcbio-vc
- class: ResourceRequirement
  coresMin: 1
  outdirMin: 62469
  ramMin: 4096
  tmpdirMin: 26115
- class: dx:InputResourceRequirement
  indirMin: 3113
- class: SoftwareRequirement
  packages:
  - package: htslib
    specs:
    - https://anaconda.org/bioconda/htslib
  - package: bedtools
    specs:
    - https://anaconda.org/bioconda/bedtools
  - package: pythonpy
    specs:
    - https://anaconda.org/bioconda/pythonpy
inputs:
- id: prep_samples_rec
  type:
    fields:
    - name: description
      type: string
    - name: resources
      type: string
    - name: config__algorithm__svcaller
      type:
      - 'null'
      - items: 'null'
        type: array
    - name: config__algorithm__variant_regions
      type:
      - 'null'
      - string
    - name: rgnames__sample
      type: string
    - name: reference__fasta__base
      type: File
    name: prep_samples_rec
    type: record
outputs:
- id: rgnames__sample
  type: string
- id: config__algorithm__variant_regions
  type:
  - File
  - 'null'
- id: config__algorithm__variant_regions_merged
  type:
  - File
  - 'null'
- id: config__algorithm__variant_regions_orig
  type:
  - File
  - 'null'
- id: config__algorithm__coverage
  type:
  - File
  - 'null'
- id: config__algorithm__coverage_merged
  type:
  - File
  - 'null'
- id: config__algorithm__coverage_orig
  type:
  - File
  - 'null'
- id: config__algorithm__seq2c_bed_ready
  type:
  - File
  - 'null'
requirements:
- class: InlineJavascriptRequirement
- class: InitialWorkDirRequirement
  listing:
  - entry: $(JSON.stringify(inputs))
    entryname: cwl.inputs.json
