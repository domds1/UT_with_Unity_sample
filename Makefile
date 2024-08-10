# Compiler and Flags
CC = gcc
CFLAGS = -Iinc -Itest/unity -g --coverage
LDFLAGS = --coverage

# Directories
SRC_DIR = src
TEST_DIR = test
BUILD_DIR = build

# Source files
SRC_FILES = $(SRC_DIR)/my_module.c
TEST_FILES = $(TEST_DIR)/test_my_module.c $(TEST_DIR)/unity/unity.c

# Output
TARGET = $(BUILD_DIR)/test_runner

# Build and run tests
all: $(TARGET)
	./$(TARGET)

$(TARGET): $(SRC_FILES) $(TEST_FILES)
	@if [ ! -d "$(BUILD_DIR)" ]; then \
		mkdir -p "$(BUILD_DIR)"; \
	fi
	$(CC) $(CFLAGS) -o $(TARGET) $^ $(LDFLAGS)

# Generate code coverage report
coverage: all
	lcov --capture --directory . --output-file $(BUILD_DIR)/coverage.info
	lcov --remove $(BUILD_DIR)/coverage.info '*/unity/*' --output-file $(BUILD_DIR)/coverage_filtered.info
	genhtml $(BUILD_DIR)/coverage_filtered.info --output-directory $(BUILD_DIR)/coverage

# Clean up
clean:
	rm -rf $(BUILD_DIR)/*
	rm -f *.gcda *.gcno

.PHONY: all coverage clean
