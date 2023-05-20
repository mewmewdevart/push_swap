#include <stdio.h>
#include "minunit.h" //  Contém as definições e macros necessárias para escrever testes com o Minunit

// Create one function
size_t ft_strlen(const char *str)
{
	int i;

	i = 0;
	while(str[i] != '\0')
		i++;
	return (i);
}

MU_TEST(test_the_size_in_one_string)
{
    mu_assert(ft_strlen("larissa") == 7, "Length should be 7");
}

MU_TEST_SUITE(test_suite)
{
	MU_RUN_TEST(test_the_size_in_one_string);
}

int main()
{
	printf("\n\t\t\t◇  Minunit Tester  ◇");
	printf("\n \t\t\t ------------------\n");

	MU_RUN_SUITE(test_suite);
	MU_REPORT();

	return MU_EXIT_CODE;
}
