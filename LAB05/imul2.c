#include <stdio.h>

int main() {
    printf("imul2.c\n\n");

    int a = -2147483647;
    int b = 2;

    long long result = (long long) a * b;

    printf("a = %d\n", a);
    printf("b = %d\n\n", b);

    printf("iloczyn = %lld", result);

    return 0;
}
