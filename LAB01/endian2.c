#include <stdio.h>

void endian2() {
	int i = 1;
    char *c = (char*)&i;
    if (*c == 1) printf("little-endian architecture");
	else printf("big-endian architecture");
}

int main() {
    endian2();
    return 0;
}  