# Include the Unity library and the inc directory
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/unity)
include_directories(${CMAKE_SOURCE_DIR}/inc)

# Add the Unity source file
add_library(unity STATIC unity/unity.c)

# Add the test executable with coverage flags
add_executable(run_tests test_my_module.c)

# Link the test executable against Unity, the module being tested, and coverage
target_link_libraries(run_tests unity my_module gcov)

# Add a custom command to run tests
add_custom_target(tests
    COMMAND run_tests
	COMMENT "Capturing code coverage data with gcovr and generating report..."
 	COMMAND gcovr -r .. -e ../test/unity/ --html --html-details -o test/my-module-coverage.html
    DEPENDS run_tests
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
)

# Capture coverage data using lcov
add_custom_target(coverage
    COMMENT "Capturing code coverage data with lcov and generating report..."
    COMMAND lcov --directory . --capture --output-file coverage.info
    COMMAND lcov --remove coverage.info '*/unity/*' --output-file coverage_filtered.info
    COMMAND genhtml coverage_filtered.info --output-directory coverage_report
    DEPENDS tests
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
)
