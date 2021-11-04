#include <stdio.h>

extern void test(long long int *a,long long  int *b);

int main(void)
{
   long long int x12 = 0xffff0000ffff0000, x13 = 0x0000ffff0000ffff;
    test(&x12, &x13);

    printf("x12 -> %d\n",  x12);
    printf("x13 -> %d\n",  x13);

    return 0;
}
