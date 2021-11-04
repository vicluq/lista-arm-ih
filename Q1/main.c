#include <stdio.h>

extern void test(long long int *a,long long  int *b,long long  int *m);

int main(void)
{
   long long int a = 15, b = 7, m = 7;

    printf("BEFORE:\n");
    printf("a -> %lld\n", a);
    printf("b -> %lld\n", b);
    printf("m -> %lld\n\n", m);

    test(&a, &b, &m);

    printf("a -> %d\n",  a);
    printf("b -> %d\n",  b);
    printf("m -> %d\n",  m);

    return 0;
}
