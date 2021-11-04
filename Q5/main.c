// a) Do formato CB (branching) pois tem endereçamento para desvios e registrador em seu opcode

#include <stdio.h>

extern void test(long long int *a);

int main(void)
{
   long long int num = 10;
    test(&num);

    printf("num -> %d\n",  num);

    return 0;
}
