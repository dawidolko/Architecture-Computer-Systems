#include <stdio.h>
#include <stdlib.h>

int main(){
    printf("size.c\n\n");
    
    printf("Rozmiar char: %d\n", sizeof(char));
    printf("Rozmiar short: %d\n", sizeof(short));
    printf("Rozmiar int: %d\n", sizeof(int));
    printf("Rozmiar long: %d\n", sizeof(long));
    printf("Rozmiar long int: %d\n", sizeof(long int));
    printf("Rozmiar long long: %d\n", sizeof(long long));
    
    printf("\n");
    
    printf("Rozmiar float: %d\n", sizeof(float));
    printf("Rozmiar double: %d\n", sizeof(double));
    printf("Rozmiar long double: %d\n", sizeof(long double));
    
    return 0;
}
