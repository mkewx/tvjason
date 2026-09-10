# NORAD 84 (Atari 2600)

A single-player strategic-acquisition and arcade-defense game for the
Atari 2600 / Video Computer System. Full design reference:
[`docs/NORAD_84_GDD.md`](docs/NORAD_84_GDD.md).

Target: unmodified stock console, 32K **F4** bankswitched cartridge,
separate NTSC and PAL ROM builds. See GDD Section 20 for the full technical
direction and Section 20.5 for the bank plan.

## Toolchain

- **DASM** (2.20.x) -- assembler.
- **Stella** (6.7.x) -- emulator, used for interactive testing.

```
apt-get install dasm stella
```

## Building

```
make phase0        # assembles Phase 0 hardware-lab test ROMs (NTSC + PAL)
```

Output lands in `build/` (gitignored): `.bin` (ROM), `.lst` (listing),
`.sym` (symbol table). The Makefile asserts each Phase-0 ROM is exactly
4096 bytes as a basic build sanity check.

## Layout

```
src/common/      vcs.h (TIA/RIOT register equates), macro.h (shared macros)
tests/phase0/    Isolated hardware-lab tests -- NOT part of the final
                 cartridge. Each proves one risky technique in isolation
                 before it's relied on in real content (GDD Section 23,
                 Appendix A).
docs/            Design reference material.
```

## Development plan

This project follows the GDD's own gated plan (Section 23): Phase 0
(hardware laboratory) -> Phase 1 (national display proof) -> Phase 2 (air
defense proof) -> Phase 3 (maritime defense proof) -> Phase 4 (vertical
slice) -> Phase 5 (content production) -> Phase 6 (balance) -> Phase 7
(hardware/release qualification). A later phase does not start until the
current one's gate is met.

**Current status:** Phase 0, first test in progress
(`tests/phase0/stable_frame.asm` -- stable NTSC/PAL frame timing plus the
horizontal-band amber gradient technique used by the national map).

## A note on testing in this environment

DASM assembles cleanly here and ROM size/build sanity is checked
automatically. Stella's GUI could not be driven headlessly in this
sandboxed container (no working display/audio device, and attempts to run
it with a virtual framebuffer or dummy SDL driver hung rather than
rendering). Scanline timing was instead verified by hand from the
assembly listing (cycle count per line against the 76-cycle-per-line
budget).

This isn't just a workaround -- the GDD's own Project Pledges (Section 5)
already require testing "on a CRT or representative composite display, not
judged only from enlarged emulator pixels." Actually loading each ROM in
Stella (or on real hardware) and eyeballing it is a step for you to run
locally; I'll flag exactly what to look for at each gate.
