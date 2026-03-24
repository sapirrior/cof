# --- Project Configuration ---
OUTPUT    := cof
BUILD_DIR := build
CFLAGS    := -Wall -Wextra -O3

# --- Compiler Auto-Detection (clang -> gcc -> cc) ---
CC        := $(shell command -v clang || command -v gcc || echo cc)

# --- Path Resolution ---
MK_DIR    := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
OUT_PATH  := $(MK_DIR)$(BUILD_DIR)/$(OUTPUT)

# --- File Discovery ---
SRCS := $(shell find $(MK_DIR) -type f -name "*.c")
OBJS := $(patsubst $(MK_DIR)%.c, $(MK_DIR)$(BUILD_DIR)/%.o, $(SRCS))
DEPS := $(OBJS:.o=.d)

# --- Dependency Flags ---
DEPFLAGS := -MMD -MP

# --- Targets ---
.PHONY: all clean run

all: $(OUT_PATH)

# Compile and execute the program
run: all
	@echo "--- Running $(OUTPUT) ---"
	@$(OUT_PATH)

# Link object files into executable
$(OUT_PATH): $(OBJS)
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) $^ -o $@

# Compile .c files into .o 
$(MK_DIR)$(BUILD_DIR)/%.o: $(MK_DIR)%.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) $(DEPFLAGS) -c $< -o $@

# Include the generated dependency files
-include $(DEPS)

clean:
	rm -rf $(MK_DIR)$(BUILD_DIR)

