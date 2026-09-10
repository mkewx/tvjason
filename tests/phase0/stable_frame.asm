; Phase 0 hardware-lab test: stable NTSC/PAL frame + horizontal amber gradient banding.
;
; Proves two things from GDD Section 23 Phase 0 and Appendix A before any real
; content is built:
;   1. A rock-stable vsync/vblank/kernel/overscan scanline count on both
;      NTSC and PAL timings (every line synced via WSYNC).
;   2. The horizontal-band gradient technique used for the national map's
;      amber perimeter (GDD 9.2, 18.3): static bands of related luminance,
;      not per-pixel shading.
;
; This is an isolated, unbanked 4K test ROM -- it is NOT part of the final
; F4-banked cartridge. Its only job is to retire risk before Phase 1.
;
; Build with: dasm stable_frame.asm -DNTSC=1 -o build/phase0_stable_frame_ntsc.bin
;         or: dasm stable_frame.asm -DPAL=1  -o build/phase0_stable_frame_pal.bin

    processor 6502
    include "src/common/vcs.h"
    include "src/common/macro.h"

    IFCONST NTSC
TV_VBLANK   = 37
TV_KERNEL   = 192
TV_OVERSCAN = 30
    ELSE
        IFCONST PAL
TV_VBLANK   = 45
TV_KERNEL   = 228
TV_OVERSCAN = 36
        ELSE
            ECHO "Define -DNTSC=1 or -DPAL=1 on the dasm command line"
            ERR
        ENDIF
    ENDIF

BAND_COUNT  = 16
BAND_HEIGHT = TV_KERNEL / BAND_COUNT

    SEG.U vars
    ORG $80
bandCounter     ds 1
colorIndex      ds 1

    SEG code
    ORG $F000

Start:
    CLEAN_START

MainLoop:
    VERTICAL_SYNC

    ; --- Vertical blank ---
    ldx #TV_VBLANK
VBlankLoop:
    sta WSYNC
    dex
    bne VBlankLoop
    lda #0
    sta VBLANK

    ; --- Visible kernel: 16-step amber gradient, held in static bands ---
    lda #BAND_HEIGHT
    sta bandCounter
    lda #0
    sta colorIndex

    ldy #TV_KERNEL
KernelLoop:
    ldx colorIndex
    lda AmberTable,x
    sta COLUBK
    sta WSYNC

    dec bandCounter
    bne .noAdvance
    lda #BAND_HEIGHT
    sta bandCounter
    ldx colorIndex
    cpx #BAND_COUNT-1
    beq .noAdvance
    inc colorIndex
.noAdvance:
    dey
    bne KernelLoop

    ; --- Overscan ---
    lda #2
    sta VBLANK
    ldx #TV_OVERSCAN
OverscanLoop:
    sta WSYNC
    dex
    bne OverscanLoop

    jmp MainLoop

; 16-step amber luminance ramp, rising then falling.
; NTSC hue $1_ and PAL hue numbering differ; exact palette tuning per
; GDD 18.2/20.11 happens later. This table only proves the banding technique.
AmberTable:
    .byte $10,$12,$14,$16,$18,$1A,$1C,$1E
    .byte $1E,$1C,$1A,$18,$16,$14,$12,$10

    ORG $FFFC
    .word Start
    .word Start
