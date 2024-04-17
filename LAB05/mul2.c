#include <stdio.h>

int main() {
    printf("mul2.c\n\n");

    unsigned int a = 4294967295;
    unsigned int b = 2;

    unsigned long long result =(unsigned long long ) a * b;

    printf("a = %u\n", a);
    printf("b = %u\n\n", b);

    printf("iloczyn = %lld", result);

    return 0;
}
