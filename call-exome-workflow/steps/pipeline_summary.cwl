$namespaces:
  arv: http://arvados.org/cwl#
  dx: https://www.dnanexus.com/cwl#
arguments:
- position: 0
  valueFrom: sentinel_runtime=cores,$(runtime['cores']),ram,$(runtime['ram'])
- sentinel_parallel=multi-parallel
- sentinel_outputs=qcout_rec:summary__qc;summary__metrics;description;config__algorithm__qc;config__algorithm__tools_off;config__algorithm__tools_on;genome_build;reference__versions
- sentinel_inputs=qc_rec:record
- run_number=0
baseCommand:
- bcbio_nextgen.py
- runfn
- pipeline_summary
- cwl
class: CommandLineTool
cwlVersion: v1.0
hints:
- class: DockerRequirement
  dockerImageId: leechuck/bcbio-vc
  dockerPull: leechuck/bcbio-vc
- class: ResourceRequirement
  coresMin: 16
  outdirMin: 36747
  ramMin: 131072
  tmpdirMin: 13254
- class: dx:InputResourceRequirement
  indirMin: 3256
- class: SoftwareRequirement
  packages:
  - package: bcftools
    specs:
    - https://anaconda.org/bioconda/bcftools
  - package: bedtools
    specs:
    - https://anaconda.org/bioconda/bedtools
  - package: fastqc=0.11.7=5
    specs:
    - https://anaconda.org/bioconda/fastqc=0.11.7=5
  - package: goleft
    specs:
    - https://anaconda.org/bioconda/goleft
  - package: hts-nim-tools
    specs:
    - https://anaconda.org/bioconda/hts-nim-tools
  - package: mosdepth
    specs:
    - https://anaconda.org/bioconda/mosdepth
  - package: picard
    specs:
    - https://anaconda.org/bioconda/picard
  - package: pythonpy
    specs:
    - https://anaconda.org/bioconda/pythonpy
  - package: qsignature
    specs:
    - https://anaconda.org/bioconda/qsignature
  - package: qualimap
    specs:
    - https://anaconda.org/bioconda/qualimap
  - package: sambamba
    specs:
    - https://anaconda.org/bioconda/sambamba
  - package: samtools
    specs:
    - https://anaconda.org/bioconda/samtools
  - package: preseq
    specs:
    - https://anaconda.org/bioconda/preseq
  - package: peddy;env
    specs:
    - https://anaconda.org/bioconda/peddy;env
    version:
    - python2
  - package: verifybamid2
    specs:
    - https://anaconda.org/bioconda/verifybamid2
- class: arv:RuntimeConstraints
  keep_cache: 4096
inputs:
- id: qc_rec
  type:
    fields:
    - name: description
      type: string
    - name: resources
      type: string
    - name: analysis
      type: string
    - name: config__algorithm__coverage_interval
      type:
      - string
      - 'null'
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
        items: string
        type: array
    - name: config__algorithm__variant_regions
      type:
      - File
      - 'null'
    - name: genome_build
      type: string
    - name: metadata__batch
      type: string
    - name: metadata__phenotype
      type: string
    - name: reference__versions
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
    - name: config__algorithm__coverage
      type:
      - File
      - 'null'
    - name: config__algorithm__coverage_merged
      type:
      - File
      - 'null'
    - name: depth__samtools__stats
      type:
      - File
      - 'null'
    - name: depth__samtools__idxstats
      type:
      - File
      - 'null'
    - name: depth__variant_regions__regions
      type:
      - File
      - 'null'
    - name: depth__variant_regions__dist
      type:
      - File
      - 'null'
    - name: depth__sv_regions__regions
      type:
      - File
      - 'null'
    - name: depth__sv_regions__dist
      type:
      - File
      - 'null'
    - name: depth__coverage__regions
      type:
      - File
      - 'null'
    - name: depth__coverage__dist
      type:
      - File
      - 'null'
    - name: depth__coverage__thresholds
      type:
      - File
      - 'null'
    - name: variants__samples
      type:
        items:
          items:
          - File
          - 'null'
          type: array
        type: array
    name: qc_rec
    type: record
outputs:
- id: qcout_rec
  type:
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
        items: string
        type: array
    - name: genome_build
      type: string
    - name: reference__versions
      type: File
    name: qcout_rec
    type: record
requirements:
- class: InlineJavascriptRequirement
- class: InitialWorkDirRequirement
  listing:
  - entry: $(JSON.stringify(inputs))
    entryname: cwl.inputs.json
