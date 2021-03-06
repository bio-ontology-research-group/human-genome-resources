$namespaces:
  dx: https://www.dnanexus.com/cwl#
arguments:
- position: 0
  valueFrom: sentinel_runtime=cores,$(runtime['cores']),ram,$(runtime['ram'])
- sentinel_parallel=multi-combined
- sentinel_outputs=alignment_rec:description;resources;analysis;config__algorithm__adapters;config__algorithm__align_split_size;config__algorithm__aligner;config__algorithm__bam_clean;config__algorithm__mark_duplicates;config__algorithm__trim_reads;config__algorithm__variant_regions;files;reference__bwa__indexes;rgnames__lane;rgnames__lb;rgnames__pl;rgnames__pu;rgnames__rg;rgnames__sample;reference__fasta__base
- sentinel_inputs=files:var,analysis:var,config__algorithm__align_split_size:var,reference__fasta__base:var,rgnames__pl:var,rgnames__sample:var,rgnames__pu:var,rgnames__lane:var,rgnames__rg:var,rgnames__lb:var,reference__bwa__indexes:var,config__algorithm__aligner:var,config__algorithm__trim_reads:var,config__algorithm__adapters:var,config__algorithm__bam_clean:var,config__algorithm__variant_regions:var,config__algorithm__mark_duplicates:var,description:var,resources:var
- run_number=0
baseCommand:
- bcbio_nextgen.py
- runfn
- alignment_to_rec
- cwl
class: CommandLineTool
cwlVersion: v1.0
hints:
- class: DockerRequirement
  dockerImageId: leechuck/bcbio-vc
  dockerPull: leechuck/bcbio-vc
- class: ResourceRequirement
  coresMin: 1
  outdirMin: 158947
  ramMin: 4096
  tmpdirMin: 74354
- class: dx:InputResourceRequirement
  indirMin: 0
inputs:
- id: files
  type:
    items:
      items: File
      type: array
    type: array
- id: analysis
  type:
    items: string
    type: array
- id: config__algorithm__align_split_size
  type:
    items:
    - 'null'
    - string
    type: array
- id: reference__fasta__base
  secondaryFiles:
  - ^-resources.yaml
  - ^.dict
  - .fai
  - .gz
  - .gz.fai
  - .gz.gzi
  type:
    items: File
    type: array
- id: rgnames__pl
  type:
    items: string
    type: array
- id: rgnames__sample
  type:
    items: string
    type: array
- id: rgnames__pu
  type:
    items: string
    type: array
- id: rgnames__lane
  type:
    items: string
    type: array
- id: rgnames__rg
  type:
    items: string
    type: array
- id: rgnames__lb
  type:
    items:
    - 'null'
    - string
    type: array
- id: reference__bwa__indexes
  secondaryFiles:
  - ^.amb
  - ^.ann
  - ^.bwt
  - ^.pac
  - ^.sa
  type:
    items: File
    type: array
- id: config__algorithm__aligner
  type:
    items: string
    type: array
- id: config__algorithm__trim_reads
  type:
    items:
    - string
    - 'null'
    - boolean
    type: array
- id: config__algorithm__adapters
  type:
    items:
    - 'null'
    - items: 'null'
      type: array
    type: array
- id: config__algorithm__bam_clean
  type:
    items:
    - string
    - 'null'
    - boolean
    type: array
- id: config__algorithm__variant_regions
  type:
    items:
    - 'null'
    - string
    type: array
- id: config__algorithm__mark_duplicates
  type:
    items:
    - string
    - 'null'
    - boolean
    type: array
- id: description
  type:
    items: string
    type: array
- id: resources
  type:
    items: string
    type: array
outputs:
- id: alignment_rec
  type:
    items:
      fields:
      - name: description
        type: string
      - name: resources
        type: string
      - name: analysis
        type: string
      - name: config__algorithm__adapters
        type:
        - 'null'
        - items: 'null'
          type: array
      - name: config__algorithm__align_split_size
        type:
        - 'null'
        - string
      - name: config__algorithm__aligner
        type: string
      - name: config__algorithm__bam_clean
        type:
        - string
        - 'null'
        - boolean
      - name: config__algorithm__mark_duplicates
        type:
        - string
        - 'null'
        - boolean
      - name: config__algorithm__trim_reads
        type:
        - string
        - 'null'
        - boolean
      - name: config__algorithm__variant_regions
        type:
        - 'null'
        - string
      - name: files
        type:
          items: File
          type: array
      - name: reference__bwa__indexes
        type: File
      - name: rgnames__lane
        type: string
      - name: rgnames__lb
        type:
        - 'null'
        - string
      - name: rgnames__pl
        type: string
      - name: rgnames__pu
        type: string
      - name: rgnames__rg
        type: string
      - name: rgnames__sample
        type: string
      - name: reference__fasta__base
        type: File
      name: alignment_rec
      type: record
    type: array
requirements:
- class: InlineJavascriptRequirement
- class: InitialWorkDirRequirement
  listing:
  - entry: $(JSON.stringify(inputs))
    entryname: cwl.inputs.json
