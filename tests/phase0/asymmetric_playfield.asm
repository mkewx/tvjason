; Phase 0 hardware-lab test: mid-scanline playfield rewrite (asymmetric playfield).
;
; The TIA's playfield is naturally only 20 bits (80 pixels) wide per scanline;
; by default the right half of the screen either repeats or mirrors that same
; 80-pixel pattern. GDD Section 9.2 requires a genuinely asymmetric 160-pixel
; mainland silhouette, which means rewriting PF0/PF1/PF2 partway through each
; visible scanline so the right half shows different bits than the left half.
;
; This test proves only the raw mechanism, deliberately as legible as
; possible: every kernel scanline sets the LEFT half fully lit (playfield
; color) and the RIGHT half fully unlit (black), with the switch timed to
; land near the horizontal midpoint. Expected result on screen: a single
; solid vertical split, amber left / black right, straight edge, no jitter,
; no diagonal shear. Real coastline data comes later, once this is proven.
;
; --- Cycle accounting (each scanline is 76 CPU cycles; visible pixels start
; around CPU cycle 23 after WSYNC, and the visible area's midpoint --
; pixel 80 of 160 -- lands around CPU cycle 23 + 80/3 = cycle 50) ---
;   sta WSYNC                     -> cycle 0 (new line begins)
;   lda #$F0 / sta PF0            -> 2+3 = 5   (cycle 5)
;   lda #$FF / sta PF1            -> 2+3 = 5   (cycle 10)
;   sta PF2                       -> 3         (cycle 13)   [left half set]
;   13 x nop                      -> 26        (cycle 39)   [delay]
;   lda #$00 / sta PF0/PF1/PF2    -> 2+3+3+3=11 (cycle 50)  [right half set]
;   dey / bne                     -> 2+3 = 5   (cycle 55, well under 76)
;
; Build with: dasm asymmetric_playfield.asm -DNTSC=1 -o build/phase0_asym_ntsc.bin
;         or: dasm asymmetric_playfield.asm -DPAL=1  -o build/phase0_asym_pal.bin

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

    SEG code
    ORG $F000

Start:
    CLEAN_START

    lda #$1E            ; bright amber playfield color (GDD 18.2)
    sta COLUPF
    lda #0
    sta COLUBK
    sta CTRLPF          ; reflect off, normal priority, no score mode

MainLoop:
    VERTICAL_SYNC

    ldx #TV_VBLANK
VBlankLoop:
    sta WSYNC
    dex
    bne VBlankLoop
    lda #0
    sta VBLANK

    ldy #TV_KERNEL
KernelLoop:
    sta WSYNC

    ; --- left half: fully lit ---
    lda #$F0
    sta PF0
    lda #$FF
    sta PF1
    sta PF2

    ; --- delay to the horizontal midpoint ---
    REPEAT 13
    nop
    REPEND

    ; --- right half: fully unlit ---
    lda #$00
    sta PF0
    sta PF1
    sta PF2

    dey
    bne KernelLoop

    lda #2
    sta VBLANK
    ldx #TV_OVERSCAN
OverscanLoop:
    sta WSYNC
    dex
    bne OverscanLoop

    jmp MainLoop

    ORG $FFFC
    .word Start
    .word Start
