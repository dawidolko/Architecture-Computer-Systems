#include <stdio.h>
#include <stdlib.h>

void data() {
	int a = 1, b = 2, c, d, e = 3, f, g, h = 4;
	
	printf("Adres a: %p\n", &a);
	printf("Adres b: %p\n", &b);
	printf("Adres c: %p\n", &c);
	printf("Adres d: %p\n", &d);
	printf("Adres e: %p\n", &e);
	printf("Adres f: %p\n", &f);
	printf("Adres g: %p\n", &g);
	printf("Adres h: %p\n", &h);

	/*
		&a [00][61][FE][FC]
		&b [00][61][FE][F8]
		&c [00][61][FE][F4]
		&d [00][61][FE][F0]
		&e [00][61][FE][EC]
		&f [00][61][FE][E8]
		&g [00][61][FE][E4]
		&h [00][61][FE][E0]
		Są zgodne.
	*/
}

int main(){
    printf("data.c\n\n");

    data();
    
    return 0;
}
