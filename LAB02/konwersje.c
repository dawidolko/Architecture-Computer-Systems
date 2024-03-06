#include <stdio.h>
#include <stdlib.h>

/*
11 / 2 = 5   r0 = 1
5  / 2 = 2   r1 = 1
2  / 2 = 1   r2 = 0
1  / 2 = 0   r3 = 1

     3210
11 = 1011 = 1*2^0 + 1*2^1 + 0*2^2 + 1*2^3
*/

int dec2bin(int x) {
	unsigned int suma = 0;
	unsigned int pow = 1;
	
	while (x > 0) 
	{
		suma = suma + x % 2 * pow;
		
		x /= 2;
	
		pow = pow * 10;	
	}

	return suma;
}

int main() {
	printf("konwersje.c\n\n");
	
	unsigned int dec = 1023;
	
	unsigned int bin = dec2bin(dec);
	
	printf("dec = %u\n", dec);
	printf("bin = %u\n", bin);
	
	return 0;
}

/*
    1. Jaką maksymalną liczbę binarną można zapisać przy pomocy typu int?

    UBIN_MAX = 1111111111 

    2. Jaka jest wartość dziesiętna maksymalnej liczby binarnej, jaką można zapisać przy pomocy typu int?

    UINT_MAX = 4294967295    

    3. Dla jakich wartości parametrów aktualnych powyższe funkcje będą działać poprawnie?

*/