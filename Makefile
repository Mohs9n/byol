# Compiler
CC := clang

# Compiler flags
CFLAGS := -Wall -Wextra -g -std=c99 -lm -leditline

# Directories
SRC_DIR := .
BUILD_DIR := build
TARGET := lisp

# Source files
SRCS := $(wildcard $(SRC_DIR)/*.c) mpc/mpc.c

# Object files
OBJS := $(SRCS:$(SRC_DIR)/%.c=$(BUILD_DIR)/%.o)

# Header files
INCS := -I$(SRC_DIR)

# Rule to build the executable
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(INCS) $^ -o $@

# Rule to compile object files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) $(INCS) -c $< -o $@

# Rule to create build directory if it doesn't exist
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Phony target to clean up generated files
.PHONY: clean
clean:
	rm -rf $(BUILD_DIR) $(TARGET)
