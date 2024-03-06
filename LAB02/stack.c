#include <stdio.h>
#include <stdlib.h>

void stack() {
	int x = 1;
	int y = 2;
	
	printf("%p\n", &x);
	printf("%p\n", &y);
	
	/*
		&x [00][61][FE][FC] 1
		&y [00][61][FE][F8] 2
		Są zgodne.
	*/
}

int main(){
    printf("stack.c\n\n");

    stack();
    
    return 0;
}
