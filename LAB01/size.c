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
    
    printf("\n");
    
    printf("Rozmiar unsigned char: %d\n", sizeof(unsigned char));
    printf("Rozmiar unsigned short: %d\n", sizeof(unsigned short));
    printf("Rozmiar unsigned int: %d\n", sizeof(unsigned int));
    printf("Rozmiar unsigned long: %d\n", sizeof(unsigned long));
    printf("Rozmiar unsigned long int: %d\n", sizeof(unsigned long int));
    printf("Rozmiar unsigned long long: %d\n", sizeof(unsigned long long));
    
    printf("\n");
    
    
    
    return 0;
}
