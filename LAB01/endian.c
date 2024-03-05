#include <stdio.h>

void endian() {
	int i = 1;
	char *c = (char*)&i;
	if (*c == 1) printf("Procesor pracuje w little-endian.");
	else printf("Procesor pracuje w big-endian.");
}

int main() {
    endian();
    return 0;
}











