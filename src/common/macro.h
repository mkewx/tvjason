; macro.h -- shared DASM macros for NORAD 84 (Atari 2600).

    MAC CLEAN_START
        sei
        cld
        ldx #$FF
        txs
        lda #0
.clear_loop:
        sta 0,x
        dex
        bne .clear_loop
        sta 0
    ENDM

; SLEEP n -- burn exactly n cycles (n >= 2), for cycle-exact timing.
    MAC SLEEP
        IF {1} < 2
            ECHO "SLEEP: cycle count must be >= 2"
            ERR
        ENDIF
.remaining SET {1}
        REPEAT .remaining / 2
            nop
        REPEND
        IF .remaining & 1
            bit $00
        ENDIF
    ENDM

; VERTICAL_SYNC -- standard 3-line VSYNC pulse via WSYNC.
    MAC VERTICAL_SYNC
        lda #2
        sta WSYNC
        sta VSYNC
        sta WSYNC
        sta WSYNC
        lda #0
        sta WSYNC
        sta VSYNC
    ENDM
