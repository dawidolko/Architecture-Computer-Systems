#include <stdio.h>

int main() {
    printf("scanf2.c\n\n");

    char *format1 = "a = ";

//  esp -> [format1]

    printf(format1);

//  esp -> [a]  ; zmienna a, adres format1 nie jest juz potrzebny

    int *addr_a = (int*)&format1;

//  esp -> [addr_a][a]

    char *format2 = "%d";

//  esp -> [format2][addr_a][a]

    scanf(format2, addr_a);

    char *format3 = "a = %d\n";

//  esp -> [format3][format2][addr_a][a]

    printf(format3, *addr_a);

    return 0;
}

