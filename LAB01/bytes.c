#include <stdio.h>
#include <stdlib.h>

void bytes() {
	int number;
	printf("Podaj liczbe: ");
	scanf("%d", &number);
	
	int temp = number;
	int counter = 0;
	while (temp>0) {
		int mod = temp%256;
		
		if (mod<10) printf("[00%d] ", mod);
		if (mod>=10 && mod<100) printf("[0%d] ", mod);
		if (mod>100) printf("[%d] ", mod);
		
		temp = (temp-mod)/256;
		
		counter++;
	}
	
	int i = 0;
	for (i=counter; i<4; i++) printf("[000] ");
}

int main() {
	printf("bytes.c\n\n");

    bytes();

    return 0;
}










