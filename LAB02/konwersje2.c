#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int dec2bin(int x) {
    int result = 0, base = 1;
    while (x > 0) {
        int lastDigit = x % 2;
        result += lastDigit * base;
        base *= 10;
        x /= 2;
    }
    return result;
}

int bin2dec(int x) {
    int temp = x, counter = 0, result = 0;
    while (temp > 0) {
        int rest = temp % 10;
        if (rest == 1) result += pow(2, counter);
        temp /= 10;
        counter++;
    }
    return result;
}

void dec2hex(unsigned int x) {
    if (x == 0) {
        printf("00");
        return;
    }

    char hexString[9]; // Maksymalna długość + null terminator
    int i = 0;
    while (x > 0 && i < 8) {
        int mod = x % 16;
        if (mod < 10) hexString[i++] = '0' + mod;
        else hexString[i++] = 'A' + mod - 10;
        x /= 16;
    }
    hexString[i] = '\0'; // Dodanie terminatora

    // Odwrócenie ciągu znaków
    for (int j = i - 1; j >= 0; j--) printf("%c", hexString[j]);
}

int main() {
    printf("konwersje2.c\n\n");
    
    int number;
    printf("Podaj liczbe: ");
    scanf("%d", &number);
    
    printf("Liczba w systemie binarnym: %d\n", dec2bin(number));
    printf("Liczba w systemie dziesietnym: %d\n", number);
    printf("Liczba w systemie szesnastkowym: ");
    dec2hex(number);
    printf("\n");
    
    return 0;
}
