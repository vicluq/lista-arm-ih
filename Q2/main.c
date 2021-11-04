#include <stdio.h>

extern void test(long long int *a,long long  int *b,long long  int *c, long long int *x);

int main(void)
{
   long long int a = 15, b = 7, c = 27, x;
    test(&a, &b, &c, &x);

    printf("x -> %d\n",  x);

    return 0;
}
