;/********************************************************************************
; File:boot.asm
; Description:Bootloader
;
;********************************************************************************/
[BITS 16]

ORG  0x7C00

;================================================================================
; BIOS parameter blocks(FAT12)
;================================================================================
JMP BOOT ; BS_jmpBoot
BS_jmpBoot2     DB  0x90
BS_OEMName      DB  "MyOS    "
BPB_BytesPerSec DW  0x0200 ; BytesPerSector
BPB_SecPerClus  DB  0x01   ; SectorPerCluster
BPB_RsvdSecCnt  DW  0x0001    ;ReservedSectors
BPB_NumFATs     DB  0x02    ;TotalFATs
BPB_RootEntCnt  DW  0x00E0    ;MaxRootEntries
BPB_TotSec16    DW  0x0B40    ;TotalSectors
BPB_Media       DB  0xF0    ;MediaDescriptor
BPB_FATSz16     DW  0x0009    ;SectorsPerFAT
BPB_SecPerTrk   DW  0x0012    ;SectorsPerTrack
BPB_NumHeads    DW  0x0002    ;NumHeads
BPB_HiddSec     DD  0x00000000  ;HiddenSector
BPB_TotSec32    DD  0x00000000  ;TotalSectors

BS_DrvNum     DB  0x00    ;DriveNumber
BS_Reserved1  DB  0x00    ;Reserved
BS_BootSig    DB  0x29    ;BootSignature
BS_VolID      DD  0x20120627  ;VolumeSerialNumber 日付を入れました
BS_VolLab     DB  "MyOS       "  ;VolumeLabel
BS_FilSysType DB  "FAT12   "  ;FileSystemType

;/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
;
; BOOT
;
;/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
BOOT:
  CLI
  HLT

TIMES 510 - ($ - $$) DB 0

DW 0xAA55
