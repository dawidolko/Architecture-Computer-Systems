#include <stdio.h>
#include <stdlib.h>

void endian2() {
	int i = 1;
    char *c = (char*)&i;
    if (*c == 1) printf("little-endian architecture");
	else printf("big-endian architecture");
}

int main() {
    printf("endian2.c\n\n");

    endian2();

    return 0;
}  