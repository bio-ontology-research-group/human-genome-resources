$namespaces:
  dx: https://www.dnanexus.com/cwl#
arguments:
- position: 0
  valueFrom: sentinel_runtime=cores,$(runtime['cores']),ram,$(runtime['ram'])
- sentinel_parallel=multi-combined
- sentinel_outputs=postprocess_alignment_rec:description;resources;config__algorithm__archive;config__algorithm__coverage_interval;config__algorithm__exclude_regions;config__algorithm__recalibrate;config__algorithm__tools_on;config__algorithm__variant_regions;genome_resources__rnaseq__gene_bed;genome_resources__variation__dbsnp;genome_resources__variation__encode_blacklist;genome_resources__variation__lcr;genome_resources__variation__polyx;reference__fasta__base;align_bam;config__algorithm__variant_regions_merged;config__algorithm__variant_regions_orig;config__algorithm__coverage;config__algorithm__coverage_merged;config__algorithm__coverage_orig;config__algorithm__seq2c_bed_ready
- sentinel_inputs=align_bam:var,config__algorithm__archive:var,config__algorithm__coverage_interval:var,config__algorithm__exclude_regions:var,config__algorithm__variant_regions:var,config__algorithm__variant_regions_merged:var,config__algorithm__variant_regions_orig:var,config__algorithm__coverage:var,config__algorithm__coverage_merged:var,config__algorithm__coverage_orig:var,config__algorithm__seq2c_bed_ready:var,config__algorithm__recalibrate:var,config__algorithm__tools_on:var,genome_resources__rnaseq__gene_bed:var,genome_resources__variation__dbsnp:var,genome_resources__variation__lcr:var,genome_resources__variation__polyx:var,genome_resources__variation__encode_blacklist:var,reference__fasta__base:var,description:var,resources:var
- run_number=0
baseCommand:
- bcbio_nextgen.py
- runfn
- postprocess_alignment_to_rec
- cwl
class: CommandLineTool
cwlVersion: v1.0
hints:
- class: DockerRequirement
  dockerImageId: leechuck/bcbio-vc
  dockerPull: leechuck/bcbio-vc
- class: ResourceRequirement
  coresMin: 1
  outdirMin: 166927
  ramMin: 4096
  tmpdirMin: 78344
- class: dx:InputResourceRequirement
  indirMin: 0
inputs:
- id: align_bam
  secondaryFiles:
  - .bai
  type:
    items:
    - File
    - 'null'
    type: array
- id: config__algorithm__archive
  type:
    items:
    - 'null'
    - string
    type: array
- id: config__algorithm__coverage_interval
  type:
    items:
    - 'null'
    - string
    type: array
- id: config__algorithm__exclude_regions
  type:
    items:
    - 'null'
    - items: 'null'
      type: array
    type: array
- id: config__algorithm__variant_regions
  type:
    items:
    - File
    - 'null'
    type: array
- id: config__algorithm__variant_regions_merged
  type:
    items:
    - File
    - 'null'
    type: array
- id: config__algorithm__variant_regions_orig
  type:
    items:
    - File
    - 'null'
    type: array
- id: config__algorithm__coverage
  type:
    items:
    - File
    - 'null'
    type: array
- id: config__algorithm__coverage_merged
  type:
    items:
    - File
    - 'null'
    type: array
- id: config__algorithm__coverage_orig
  type:
    items:
    - File
    - 'null'
    type: array
- id: config__algorithm__seq2c_bed_ready
  type:
    items:
    - File
    - 'null'
    type: array
- id: config__algorithm__recalibrate
  type:
    items:
    - string
    - 'null'
    - boolean
    type: array
- id: config__algorithm__tools_on
  type:
    items:
    - 'null'
    - items: 'null'
      type: array
    type: array
- id: genome_resources__rnaseq__gene_bed
  type:
    items: File
    type: array
- id: genome_resources__variation__dbsnp
  secondaryFiles:
  - .tbi
  type:
    items: File
    type: array
- id: genome_resources__variation__lcr
  secondaryFiles:
  - .tbi
  type:
    items: File
    type: array
- id: genome_resources__variation__polyx
  secondaryFiles:
  - .tbi
  type:
    items: File
    type: array
- id: genome_resources__variation__encode_blacklist
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
- id: description
  type:
    items: string
    type: array
- id: resources
  type:
    items: string
    type: array
outputs:
- id: postprocess_alignment_rec
  type:
    items:
      fields:
      - name: description
        type: string
      - name: resources
        type: string
      - name: config__algorithm__archive
        type:
        - 'null'
        - string
      - name: config__algorithm__coverage_interval
        type:
        - 'null'
        - string
      - name: config__algorithm__exclude_regions
        type:
        - 'null'
        - items: 'null'
          type: array
      - name: config__algorithm__recalibrate
        type:
        - string
        - 'null'
        - boolean
      - name: config__algorithm__tools_on
        type:
        - 'null'
        - items: 'null'
          type: array
      - name: config__algorithm__variant_regions
        type:
        - File
        - 'null'
      - name: genome_resources__rnaseq__gene_bed
        type: File
      - name: genome_resources__variation__dbsnp
        type: File
      - name: genome_resources__variation__encode_blacklist
        type:
        - 'null'
        - string
      - name: genome_resources__variation__lcr
        type: File
      - name: genome_resources__variation__polyx
        type: File
      - name: reference__fasta__base
        type: File
      - name: align_bam
        type:
        - File
        - 'null'
      - name: config__algorithm__variant_regions_merged
        type:
        - File
        - 'null'
      - name: config__algorithm__variant_regions_orig
        type:
        - File
        - 'null'
      - name: config__algorithm__coverage
        type:
        - File
        - 'null'
      - name: config__algorithm__coverage_merged
        type:
        - File
        - 'null'
      - name: config__algorithm__coverage_orig
        type:
        - File
        - 'null'
      - name: config__algorithm__seq2c_bed_ready
        type:
        - File
        - 'null'
      name: postprocess_alignment_rec
      type: record
    type: array
requirements:
- class: InlineJavascriptRequirement
- class: InitialWorkDirRequirement
  listing:
  - entry: $(JSON.stringify(inputs))
    entryname: cwl.inputs.json
