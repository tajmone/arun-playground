﻿; "acode-datatypes.pbi" v0.2.2 | 2022/10/19 | PureBASIC 6.00 LTS | ALAN 3.0beta8
; ==============================================================================
;-                                 ACode Types
; ==============================================================================

; Aaddr     -> u32 -> ACODE address in Amemory
; Abool     -> u32 -> ACODE Boolean value
; Aid       -> u32 -> ACODE Instance Id value
; Aint      -> i32 -> ACODE Integer value
; Aset      -> u32 -> ACODE Set value
; Aword     -> u32 -> ACODE word
; CodeValue -> i32 -> Definition for the packing process

; NOTE: Here's the major 32->64bit problem: Aptrs are 32 bit to fit into the
;       32-bit structure of the Amachine, but sometimes this is used to store
;       a *real* pointer value, which on 64-bit machines are 64-bit.
;       So an Aptr is a symbolic value for the actual address and has to be
;       translated through fromAptr() in memory.c

; ==============================================================================
;-                                 ACode Header
; ==============================================================================

Structure ACodeHeader Align #PB_Structure_AlignC

  ; /// Important info ///
  tag.b[4]      ; "ALAN"
  version.b[4]  ; Version of compiler
  uid.l         ; [Aword] Unique id of the compiled game
  size.l        ; [Aword] Size of ACD-file in Awords

  ; /// Options ///
  pack.l          ; [Abool] Is the text packed and encoded ?
  stringOffset.l  ; [Aword] Offset to string data in game file
  pageLength.l    ; [Aword] Length of a displayed page
  pageWidth.l     ; [Aword] and width
  Debug.l         ; [Aword] Option: debug

  ; /// Data structures ///
  classTableAddress.l     ; [Aaddr]
  classMax.l              ; [Aword]
  entityClassId.l         ; [Aword]
  thingClassId.l          ; [Aword]
  objectClassId.l         ; [Aword]
  locationClassId.l       ; [Aword]
  actorClassId.l          ; [Aword]
  literalClassId.l        ; [Aword]
  integerClassId.l        ; [Aword]
  stringClassId.l         ; [Aword]
  instanceTableAddress.l  ; [Aaddr] Instance table
  instanceMax.l           ; [Aword] Highest number of an instance
  theHero.l               ; [Aword] The hero instance code (id)
  containerTableAddress.l ; [Aaddr]
  containerMax.l          ; [Aword]
  scriptTableAddress.l    ; [Aaddr]
  scriptMax.l             ; [Aword]
  eventTableAddress.l     ; [Aaddr]
  eventMax.l              ; [Aword]
  syntaxTableAddress.l    ; [Aaddr]
  parameterMapAddress.l   ; [Aaddr]
  syntaxMax.l             ; [Aword]
  dictionary.l            ; [Aaddr]
  verbTableAddress.l      ; [Aaddr]
  ruleTableAddress.l      ; [Aaddr]
  messageTableAddress.l   ; [Aaddr]

  ; [Aaddr] /// Miscellaneous ///
  attributesAreaSize.l ; [Aint]  Size of attribute data area in Awords
  maxParameters.l      ; [Aint]  Maximum number of parameters in any syntax
  stringInitTable.l    ; [Aaddr] String init table address
  setInitTable.l       ; [Aaddr] Set init table address
  start.l              ; [Aaddr] Address to Start code
  maximumScore.l       ; [Aword] Maximum score
  scores.l             ; [Aaddr] Score table
  scoreCount.l         ; [Aint]  Max index into scores table
  sourceFileTable.l    ; [Aaddr] Table of fpos/len for source filenames
  sourceLineTable.l    ; [Aaddr] Table of available source lines to break on
  freq.l               ; [Aaddr] Address to Char freq's for coding
  acdcrc.l             ; [Aword] Checksum for acd code (excl. hdr)
  txtcrc.l             ; [Aword] Checksum for text data file
  ifids.l              ; [Aaddr] Address to IFIDS
  prompt.l             ; [Aaddr]
EndStructure

; ==============================================================================
;-                            AMachine Word Classes
; ==============================================================================

;- Word Classes -> constants
Enumeration
  #SYNONYM_WORD
  #ADJECTIVE_WORD
  #ALL_WORD
  #EXCEPT_WORD
  #CONJUNCTION_WORD
  #PREPOSITION_WORD
  #DIRECTION_WORD
  #IT_WORD
  #NOISE_WORD
  #NOUN_WORD
  #THEM_WORD
  #VERB_WORD
  #PRONOUN_WORD
  #WRD_CLASSES
EndEnumeration

;- Word Classes -> bit positions
EnumerationBinary
  #SYNONYM_BIT
  #ADJECTIVE_BIT
  #ALL_BIT
  #EXCEPT_BIT
  #CONJUNCTION_BIT
  #PREPOSITION_BIT
  #DIRECTION_BIT
  #IT_BIT
  #NOISE_BIT
  #NOUN_BIT
  #THEM_BIT
  #VERB_BIT
  #PRONOUN_BIT
EndEnumeration

; ==============================================================================
;-                          AMachine Table Entry Types
; ==============================================================================

;-/// Dictionary

Structure DictionaryEntry Align #PB_Structure_AlignC
  string.l        ; [Aaddr] ACode address to string
  classBits.l     ; [Aword] Word class
  code.l          ; [Aword]
  adjectiveRefs.l ; [Aaddr] Address to reference list
  nounRefs.l      ; [Aaddr] Address to reference list
  pronounRefs.l   ; [Aaddr] Address to reference list
EndStructure


; /// EOF ///
