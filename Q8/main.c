#include <stdio.h>

extern long long int test(long long int num);

int main(void)
{
   long long int num = 333, result = test(num);

   printf("test -> %lld\n", result);

   return 0;
}
