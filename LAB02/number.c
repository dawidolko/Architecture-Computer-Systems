#include<stdio.h>
#include<stdlib.h>
#include<math.h>

unsigned int polynomial(unsigned char *p, int n) {
    unsigned int suma = 0;
    int i;
    for (i = 0; i < n; i++) {
        suma += *(p+i) * (unsigned int)pow(256, i);
    }
    return suma;
}

unsigned int horner(unsigned char *p, int n) {
    unsigned int suma = 0;
    int i;
    for (i = n-1; i >= 0; i--) {
        suma = *(p+i) + 256 * suma;
    }
    return suma;
}

int main() {
    unsigned char tab[] = {0x61}; // Przykładowa reprezentacja liczby w postaci 1-bajtowej

    printf("%u\n", polynomial(tab, 1)); // Wypisanie wyniku funkcji polynomial
    printf("%u\n", horner(tab, 1));     // Wypisanie wyniku funkcji horner

    unsigned char tab1[] = {0x61, 0xFE}; // Przykładowa reprezentacja liczby w postaci 2-bajtowej

    printf("%u\n", polynomial(tab1, 2)); // Wypisanie wyniku funkcji polynomial
    printf("%u\n", horner(tab1, 2));     // Wypisanie wyniku funkcji horner

    unsigned char tab2[] = {0x61, 0xFE, 0x94, 0x00}; // Przykładowa reprezentacja liczby w postaci 4-bajtowej

    printf("%u\n", polynomial(tab2, 4)); // Wypisanie wyniku funkcji polynomial
    printf("%u\n", horner(tab2, 4));     // Wypisanie wyniku funkcji horner

    return 0;
}
