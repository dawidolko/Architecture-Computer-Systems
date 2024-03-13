# Laboratorium 6

## [Zad. 6.1]()

Napisz program `div.asm` ilustrujący operację dzielenia bez znaku. Program wykonuje obliczenia dla dzielnej 4 bajtowej. Dane wejściowe podajemy jako stałe, a iloraz i reszta mają być wypisane na konsoli.

- w jakim przypadki instrukcja div wyrzuca błąd `#DE` ?

## [Zad. 6.2]()

Napisz program `div` ilustrujący dzielenie dwóch liczb typu int bez znaku z wynikiem typu int bez znaku. Przeprowadź testy porównawcze z programem `div.asm`. 

Przykładowa sesja:
```
a = 4294967295
b = 4

iloraz = 1073741823
reszta = 3
```
## [Zad. 6.3]()

Napisz program `div2.asm` ilustrujący operację dzielenia bez znaku. Program wykonuje obliczenia dla dzielnej 8 bajtowej. Dane wejściowe podajemy jako stałe, a iloczyn ma być wypisany na konsoli.

## [Zad. 6.4 *]()

Napisz program `div2` ilustrujący operację dzielenia bez znaku. Program wykonuje obliczenia dla dzielnej 8 bajtowej. Przeprowadź testy porównawcze z programem `div2.asm`. 

Przykładowa sesja:
```
a = 4294967296
b = 3

iloraz = 1431655765
reszta = 1
```
## [Zad. 6.5]()

Napisz program `idiv.asm` ilustrujący operację dzielenia ze znakiem. Program wykonuje obliczenia dla dzielnej 4 bajtowej. Dane wejściowe podajemy jako stałe, a iloraz i reszta mają być wypisane na konsoli.

## [Zad. 6.6]()

Napisz program `idiv` ilustrujący dzielenie dwóch liczb typu int ze znakiem z wynikiem typu int ze znakiem. Przeprowadź testy porównawcze z programem `idiv.asm`. 

Przykładowa sesja:
```
a = -2147483648
b = -3

iloraz = 715827882
reszta = -2
```
## [Zad. 6.7 *]()

Napisz program `idiv2.asm` ilustrujący operację dzielenia ze znakiem. Program wykonuje obliczenia dla dzielnej 8 bajtowej. Dane wejściowe podajemy jako stałe, a iloczyn ma być wypisany na konsoli.

## [Zad. 6.8 *]()

Napisz program `idiv2` ilustrujący operację dzielenia ze znakiem. Program wykonuje obliczenia dla dzielnej 8 bajtowej. Przeprowadź testy porównawcze z programem `idiv2.asm`. Przykładowa sesja:
```
a = -2147483650
b = -3

iloraz = 715827883
reszta = -1
```
## [Zad. 6.9]()

Napisz program `loop.asm` implementujący pętlę przy pomocy instrukcji skoku. 

Przykładowa sesja:
```
i = 3
i = 2
i = 1
```
## [Zad. 6.10]()

Napisz program `loop2.asm` implementujący pętlę przy pomocy instrukcji loop.

## [Zad. 6.11 *]()

Napisz program `loop3.asm` analogicznie do loop.asm dekrementujący wartość licznika bezpośrednio na stosie. 

## [Zad. 6.12]()

Napisz program silnia.asm obliczający silnię dla danej liczby n z wynikiem typu int. Liczbę n podajemy jako stałą, a silnia ma być wypisana na konsoli.
```
0! = 1
n! = n*(n-1)!
```
## [Zad. 6.13 *]()

Napisz program `silnia2.asm` obliczający silnię dla danej liczby n z wynikiem 8 bajtowym. Liczbę n podajemy jako stałą, a silnia ma być wypisana na konsoli.
```
0! = 1
n! = n*(n-1)!
```
## [Zad. 6.14 *]()

Napisz program `silnia3.asm` obliczający silnię podwójną dla danej liczby n. Liczbę n podajemy jako stałą, a silnia podwójna ma być wypisana na konsoli.
```
0!! = 1
1!! = 1
n!! = n*(n-2)!!
```
## [Zad. 6.15 *]()

Napisz program `suma.asm` obliczający sumę n początkowych liczb naturalnych. Liczbę n podajemy jako stałą, a suma ma być wypisana na konsoli.
```
suma(1) = 1
suma(2) = 1 + 2
suma(n) = 1 + 2 + … + n
```
