#include <stdio.h>

extern void test(long long int *a);

int main(void)
{
   long long int num = 0b101100110011;
    test(&num);

    printf("num -> %d\n",  num);

    return 0;
}
