#include <stdio.h>

extern int test(char str[]);

int main(void)
{
   char str[] = "victoria";
   int result = test(str);

   printf("vowels -> %d\n", result);

   return 0;
}
