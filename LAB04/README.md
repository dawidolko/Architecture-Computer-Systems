# Laboratorium 4

## [Zad. 4.1]()

Napisz program ascii.asm, który dla znaku odczytanego z konsoli wypisze jego kod ASCII. 

Przykładowa sesja:
```
znak = H
ascii = 48
```
## [Zad. 4.2]()

Przepisz programy `scanf` i `scanf2` oraz przeanalizuj działanie tych programów.

## [Zad. 4.3]()

Napisz program `scanf.asm` ilustrujący wywołanie funkcji `scanf` z asmloader api dla liczb całkowitych. 

Przykładowa sesja:
```
a = 5
a = 5
```
## [Zad. 4.4 *]()

Napisz program `scanf2.asm` ilustrujący wywołanie funkcji `scanf` z biblioteki msvcrt.

## [Zad. 4.5 *]()

Napisz program `scanf3.asm` analogicznie do `scanf2.asm`, ale tym razem zmienną `a` umieść w sekcji danych niezainicjowanych.

## [Zad. 4.6]()

Napisz program `xadd.asm` ilustrujący działanie instrukcji xadd. Dane wejściowe podajemy jako stałe, a efekt działania instrukcji ma być wypisany na konsoli. 

Przykładowa sesja:
```
(eax, ebx) = (3, 5)
(eax, ebx) = (8, 3)
```
## [Zad. 4.7 *]()

Napisz program `xchg.asm` ilustrujący działanie instrukcji xchg. Dane wejściowe podajemy jako stałe, a efekt działania instrukcji ma być wypisany na konsoli. 

Przykładowa sesja:
```
(esi, edi) = (3, 5)
(esi, edi) = (5, 3)
```
## [Zad. 4.8]()

Napisz program modul.asm obliczający moduł liczby. Liczbę podajemy jako stałą, a moduł ma być wypisany na konsoli. Przykładowa sesja:

```
liczba = -5
modul = 5
```
## [Zad. 4.9 *]()

Napisz program modul2.asm obliczający moduł liczby z wykorzystaniem instrukcji test. Liczbę podajemy jako stałą, a moduł ma być wypisany na konsoli.

## [Zad. 4.10 *]()

Napisz program `modul3.asm` obliczający moduł liczby. W tym przypadku liczbę odczytujemy z konsoli.

## [Zad. 4.11 *]()

Napisz program relokowalny `modul4.asm` obliczający moduł liczby. W tym przypadku liczbę odczytujemy z konsoli.

## [Zad. 4.12 *]()

Napisz program `okno.asm` sprawdzający, czy liczba x należy do przedziału `[a,b]`. Dane wejściowe podajemy jako stałe. 

Przykładowe dwie sesje:
```
25 nalezy do [18, 99]

-6 nie nalezy do [18, 99]
```
## [Zad. 4.13 *]()

Napisz program `okna.asm` sprawdzający, czy liczba x należy do przedziału `(a,b)` lub `(c,d)`. Dane wejściowe podajemy jako stałe. 

Przykładowe dwie sesje:
```
15 nalezy do (5, 19)
15 nalezy do (12, 24)

3 nie nalezy do (5, 19) i (12, 24)
```
