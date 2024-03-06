# Laboratorium 2

## [Zad. 2.1](https://github.com/dawidolko/Architecture-Computer-Systems/blob/main/LAB02/stack.c)

Napisz program `stack` umieszczający na stosie kolejno dwie zmienne x i y typu int z wartościami 1 i 2 oraz odczytaj adresy tych zmiennych. Skopiuj poniższy schemat do komentarza w programie i wypełnij go odpowiednimi wartościami. 
```c
&var1 [ ][ ][ ][ ]   var1
&var2 [ ][ ][ ][ ]   var2
```
Czy adresy zmiennych są zgodne z mapą pamięci dla procesu?

## [Zad. 2.2 *](https://github.com/dawidolko/Architecture-Computer-Systems/blob/main/LAB02/data.c)

W programie `data` umieść w sekcji danych kolejno zmienne a, b, c, d, e, f, g, h typu int oraz odczytaj adresy tych zmiennych. Do zmiennych zainicjowanych podstaw kolejne liczby naturalne od 1 do 4. Rozpatrz następujące przypadki:

- zmienne a i b są zainicjowane
- zmienne c i d są niezainicjowane
- zmienna e jest zainicjowana i zmienna f jest niezainicjowana
- zmienna g jest niezainicjowana i zmienna h jest zainicjowana

Skopiuj poniższy schemat do komentarza w programie oraz wypełnij go odpowiednimi wartościami.
```c
&var1 [ ][ ][ ][ ]   var1
&var2 [ ][ ][ ][ ]   var2
&var3 [ ][ ][ ][ ]   var3
&var4 [ ][ ][ ][ ]   var4
                         
&var5 [ ][ ][ ][ ]   var5	
&var6 [ ][ ][ ][ ]   var6
&var7 [ ][ ][ ][ ]   var7
&var8 [ ][ ][ ][ ]   var8
```
Czy adresy zmiennych są zgodne z mapą pamięci dla procesu?

## [Zad. 2.3](https://github.com/dawidolko/Architecture-Computer-Systems/blob/main/LAB02/heap.c)

W programie `heap` umieść na stercie dwie liczby 1 i 2 typu int. Adresy tych liczb zapisz w zmiennych odpowiednio x i y. Wypisz te adresy oraz wartości, które się pod nimi znajdują. Oblicz rozmiar przydzielonego obszaru pamięci. Skopiuj poniższy schemat do komentarza w programie i wypełnij go odpowiednimi wartościami.

```c
     [ ][ ][ ][ ]
     [ ][ ][ ][ ]
     [ ][ ][ ][ ]
var1 [ ][ ][ ][ ]   *var1

     [ ][ ][ ][ ]
     [ ][ ][ ][ ]
     [ ][ ][ ][ ]
var2 [ ][ ][ ][ ]   *var2
```

Czy do wskaźnika typu void* można stosować operator wyłuskania?

Ile razy należy wywołać funkcję malloc, aby obliczyć rozmiar przydzielonego obszaru pamięci?

Czy adresy liczb są zgodne z mapą pamięci dla procesu?

Jaki najmniejszy obszar pamięci przydziela na stercie system operacyjny dla kodu 32 i 64 bitowego?

## [Zad. 2.4](https://github.com/dawidolko/Architecture-Computer-Systems/blob/main/LAB02/konwersje.txt)

W pliku `konwersje.txt` dokonaj konwersji liczb:

- dziesiętne 11 na liczbę binarną
- dziesiętne 99 na liczbę binarną *
- szesnastkowe 10AF na liczbę binarną
- szesnastkowe 3A58 na liczbę binarną *

## [Zad. 2.5](https://github.com/dawidolko/Architecture-Computer-Systems/blob/main/LAB02/konwersje.c)

Napisz program `konwersje` implementujący następujące funkcje:
```c
int dec2bin(int x);
int bin2dec(int x); // *
void dec2byte(unsigned int x); // reprezentacja little-endian *
```
- jaką maksymalną liczbę binarną można zapisać przy pomocy typu int?

- jaka jest wartość dziesiętna maksymalnej liczby binarnej, jaką można zapisać przy pomocy typu int?

- dla jakich wartości parametrów aktualnych powyższe funkcje będą działać poprawnie?

Przykładowa sesja:
```c
dec2bin(1023) = 1111111111

bin2dec(1111111111) = 1023

dec2byte(1023) = [255][003][000][000]
```
## [Zad. 2.6](https://github.com/dawidolko/Architecture-Computer-Systems/blob/main/LAB02/number.c)

Napisz program `number` wyliczający wartość liczby bez znaku na podstawie jej n bajtowej reprezentacji pod adresem p przy pomocy funkcji:

- funkcja polinomial wylicza wartość wielomianu w sposób klasyczny

`int polinomial(unsigned char *p, int n);`

- funkcja horner wylicza wartość wielomianu schematem Hornera *

`int horner(unsigned char *p, int n);`

Przetestuj funkcje dla reprezentacji jedno, dwu i czterobajtowych. Reprezentację liczby należy określić przy pomocy tablicy typu char. Wskazówka:

[link](http://www.balois.pl/java/proste/wielomiany.htm)

Przykładowa sesja:
```c
number(0061FE94, 4) = 16711680
number(0061FE94, 4) = 16711680
```
