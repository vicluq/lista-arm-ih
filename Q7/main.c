#include <stdio.h>

extern long long int test(char string[]);

int main(void)
{
   char word[] = "VICK";
   long long int result = test(word);

   printf("result -> %lld\n", result);

   return 0;
}
