#include <stdio.h>
#include <stdlib.h>

void heap() {
	
	int *miejsce1 = malloc(sizeof(int));
	int *miejsce2 = malloc(sizeof(int));
	int *miejsce3 = malloc(sizeof(int));
	int *x = 1;
	int *miejsce4 = malloc(sizeof(int));
	int *miejsce5 = malloc(sizeof(int));
	int *miejsce6 = malloc(sizeof(int));
	int *y = 2;
	
	printf("Miejsce 1: %p\n", &miejsce1);
	printf("Miejsce 2: %p\n", &miejsce2);
	printf("Miejsce 3: %p\n", &miejsce3);
	printf("Adres x: %p i jego wartosc: %d\n", &x, x);
	printf("Miejsce 4: %p\n", &miejsce4);
	printf("Miejsce 5: %p\n", &miejsce5);
	printf("Miejsce 6: %p\n", &miejsce6);
	printf("Adres y: %p i jego wartosc: %d\n", &y, y);
	
	
	free(miejsce1);
	free(miejsce2);
	free(miejsce3);
	free(miejsce4);
	free(miejsce5);
	free(miejsce6);
	
	/*
		[00][61][FE][FC]
		[00][61][FE][F8]
		[00][61][FE][F4]
		&x [00][61][FE][F0] *var1 = 1
		[00][61][FE][EC]
		[00][61][FE][E8]
		[00][61][FE][E4]
		&y [00][61][FE][E0] *var2 = 2
	*/
}
// 1. Można zastosować taki operator.
// 2. Co do drugiego pytania, to najmniejszy obszar pamięci przydzielany na stercie przez system operacyjny zależy od sposobu alokacji pamięci.
// 3. Są zgodne.
// 4. W przypadku kodu 32-bitowego jest to zazwyczaj 32 bity, a w przypadku kodu 64-bitowego 64 bity.

int main(){
    printf("heap.c\n\n");

    heap();
    
    return 0;
}
