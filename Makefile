DASM      := dasm
BUILD_DIR := build

.PHONY: all clean phase0 phase0-ntsc phase0-pal

all: phase0

# --- Phase 0 hardware-lab tests (unbanked 4K, not part of the final cartridge) ---

phase0: phase0-ntsc phase0-pal

phase0-ntsc: $(BUILD_DIR)/phase0_stable_frame_ntsc.bin $(BUILD_DIR)/phase0_asym_ntsc.bin
phase0-pal:  $(BUILD_DIR)/phase0_stable_frame_pal.bin $(BUILD_DIR)/phase0_asym_pal.bin

$(BUILD_DIR)/phase0_stable_frame_ntsc.bin: tests/phase0/stable_frame.asm src/common/vcs.h src/common/macro.h | $(BUILD_DIR)
	$(DASM) $< -DNTSC=1 -o$@ -l$(BUILD_DIR)/phase0_stable_frame_ntsc.lst -s$(BUILD_DIR)/phase0_stable_frame_ntsc.sym -f3
	@test $$(stat -c%s $@) -eq 4096 || (echo "FAIL: $@ is not exactly 4096 bytes" && exit 1)

$(BUILD_DIR)/phase0_stable_frame_pal.bin: tests/phase0/stable_frame.asm src/common/vcs.h src/common/macro.h | $(BUILD_DIR)
	$(DASM) $< -DPAL=1 -o$@ -l$(BUILD_DIR)/phase0_stable_frame_pal.lst -s$(BUILD_DIR)/phase0_stable_frame_pal.sym -f3
	@test $$(stat -c%s $@) -eq 4096 || (echo "FAIL: $@ is not exactly 4096 bytes" && exit 1)

$(BUILD_DIR)/phase0_asym_ntsc.bin: tests/phase0/asymmetric_playfield.asm src/common/vcs.h src/common/macro.h | $(BUILD_DIR)
	$(DASM) $< -DNTSC=1 -o$@ -l$(BUILD_DIR)/phase0_asym_ntsc.lst -s$(BUILD_DIR)/phase0_asym_ntsc.sym -f3
	@test $$(stat -c%s $@) -eq 4096 || (echo "FAIL: $@ is not exactly 4096 bytes" && exit 1)

$(BUILD_DIR)/phase0_asym_pal.bin: tests/phase0/asymmetric_playfield.asm src/common/vcs.h src/common/macro.h | $(BUILD_DIR)
	$(DASM) $< -DPAL=1 -o$@ -l$(BUILD_DIR)/phase0_asym_pal.lst -s$(BUILD_DIR)/phase0_asym_pal.sym -f3
	@test $$(stat -c%s $@) -eq 4096 || (echo "FAIL: $@ is not exactly 4096 bytes" && exit 1)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)
