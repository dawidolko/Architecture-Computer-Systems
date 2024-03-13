# Laboratorium 10

## [Zad. 10.1]()

Napisz program `ylog2x.asm` obliczający logarytm przy podstawie 2 z liczby x.

## [Zad. 10.2 *]()

Napisz program `log2.asm` obliczający logarytm przy podstawie 2 z liczby `x` bez odczytywania wartości `y` z pamięci. 

## [Zad. 10.3 *]()

Napisz program `log10.asm` obliczający logarytm przy podstawie 10 z liczby x. 

Wskazówka:
```
log10(x) = log2(x) / log2(10)
log10(x) = log10(2) * log2(x)
```
## [Zad. 10.4 *]()

W pliku `liczba.txt` wyznacz funkcję `f(n)` wyliczającą liczbę cyfr dla dowolnej liczby całkowitej n. Wykorzystaj funkcję `log10(x)`.

## [Zad. 10.5 *]()

Napisz program `length3.asm` wyliczający liczbę cyfr podanej liczb całkowitej n przy pomocy instrukcji koprocesora arytmetycznego FPU. Liczba całkowita n jest pobierana z konsoli. 

Przykładowa sesja:
```
n = -357
length = 3
```
## [Zad. 10.6 *]()

Napisz program `liniowe2.asm` obliczający rozwiązania równania `a * x + b = 0`. Współczynniki funkcji liniowej są pobierane z konsoli. 

## [Zad. 10.7]()

Napisz program `fpu_exp_i.asm` obliczający wartość wyrażenia `a + b * c` dla zmiennych całkowitych przy pomocy koprocesora arytmetycznego FPU.

## [Zad. 10.8 *]()

Napisz program `fpu_exp_d.asm` obliczający wartość wyrażenia `a + b * c` dla zmiennych rzeczywistych przy pomocy koprocesora arytmetycznego FPU.

## [Zad. 10.9 *]()

Napisz program `fpu_exp2_i.asm` obliczający wartość wyrażenia `a * b + c * d` dla zmiennych całkowitych przy pomocy koprocesora arytmetycznego FPU.

## [Zad. 10.10 *]()

Napisz program `fpu_exp2_d.asm` obliczający wartość wyrażenia `a * b + c * d` dla zmiennych rzeczywistych przy pomocy koprocesora arytmetycznego FPU.

## [Zad. 10.11]()

Napisz program `reverse.asm` odwracający napis z wykorzystaniem bloku pamięci.
