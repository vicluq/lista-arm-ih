#include <stdio.h>

extern long long int test(char word[], char set[]);

int main(void)
{
   char word[] = "leg", letterSet[] = "grnrclszemskvbgcluwtgyvieip";
   long long int result = test(word, letterSet);

   printf("result -> %lld\n", result);

   return 0;
}
