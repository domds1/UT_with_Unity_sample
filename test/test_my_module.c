

#include "unity.h"
#include "my_module.h"

void setUp(void)
{
    // Set up code, if needed
}

void tearDown(void)
{
    // Clean up code, if needed
}

void test_add_should_return_sum_of_two_numbers(void)
{
    TEST_ASSERT_EQUAL(5, add(2, 3));
    TEST_ASSERT_EQUAL(-1, add(-2, 1));
    TEST_ASSERT_EQUAL(0, add(0, 0));
}

#ifdef FAILED_EXAMPLE
void test_add_should_fail(void)
{
    TEST_ASSERT_EQUAL(4, add(2, 3));
    TEST_ASSERT_EQUAL(0, add(-2, 1));
    TEST_ASSERT_EQUAL(5, add(0, 0));
}
#endif

int main(void)
{
    UNITY_BEGIN();

    // This test shall pass
    RUN_TEST(test_add_should_return_sum_of_two_numbers);
#ifdef FAILED_EXAMPLE
    // This test shall fail
    RUN_TEST(test_add_should_fail);
#endif

    return UNITY_END();
}

