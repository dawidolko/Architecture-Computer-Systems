# Laboratorium 9

## [Zad. 9.1 *]()

Przeanalizuj prezentację `silnia.pps` ilustrującą analizę funkcji rekurencyjnej silnia.

## [Zad. 9.2]()

Napisz program silnia wyliczający wartość `n!` metodą dziel i zwyciężaj. 
```
0! = 1
n! = n*(n-1)!
```

- dokonaj analizy wywołania `silnia(3)`.

- narysuj graf wywołań dla `silnia(3)`.

## [Zad. 9.3 *]()

Dodaj do programu `silnia` funkcję silniap wyliczającą wartość `n!!` metodą dziel i zwyciężaj.
```
0!! = 1
1!! = 1
n!! = n*(n-2)!!
```

- dokonaj analizy wywołania `silniap(3)`.

- narysuj graf wywołań dla `silniap(3)`.

## [Zad. 9.4]()

Napisz program `r_silnia.asm` obliczający rekurencyjnie silnię dla danej liczby `n`, gdzie parametry aktualne wywołania zapamiętujemy na stosie.

- dokonaj analizy wywołania `silnia(2)`. *

## [Zad. 9.5]()

Napisz program `r_silnia2.asm` obliczający rekurencyjnie silnię dla danej liczby `n` bez zapamiętywania na stosie parametrów aktualnych wywołania.

- dokonaj analizy wywołania `silnia(2)`. *

## [Zad. 9.6 *]()

Napisz program `r_silnia3.asm` obliczający rekurencyjnie silnię dla danej liczby n z zastosowaniem metody akumulacji statycznej.

- dokonaj analizy wywołania `silnia(2)`.

## [Zad. 9.6 *]()

Napisz program `r_silniap.asm` obliczający rekurencyjnie silnię podwójną dla danej liczby n, gdzie parametry aktualne wywołania zapamiętujemy na stosie.
```
0!! = 1
1!! = 1
n!! = n*(n-2)!!
```
## [Zad. 9.7 *]()

Napisz program `r_silniap2.asm` obliczający rekurencyjnie silnię podwójną dla danej liczby `n` bez zapamiętywania na stosie parametrów aktualnych wywołania.

## [Zad. 9.8]()

Do programu `fibo` dodaj funkcję fibo3 wyliczającą wartości ciągu Fibonacciego metodą dziel i zwyciężaj. 
	
- dokonaj analizy wywołania `fibo3(4)`.

- narysuj graf wywołań dla `fibo3(4)`.

## [Zad. 9.9]()

Napisz program `FiboTree` wypisujący, jak wyglądają kolejne wywołania funkcji fibo3 razem z wartościami przez nie zwracanymi. Przykładowa sesja:
```
fibo1(4) = 5
fibo2(3) = 3
fibo3(2) = 2
fibo4(1) = 1
fibo5(0) = 1
fibo6(1) = 1
fibo7(2) = 2
fibo8(1) = 1
fibo9(0) = 1
```

- sprawdź czy drzewo wywołań z wcześniejszego zadania zostało poprawnie narysowane

## [Zad. 9.10 *]()

Do programu sequence dodaj funkcję `seq3` wyliczającą wartości ciągu {seqn} metodą dziel i zwyciężaj.

- dokonaj analizy wywołania `seq3(4)`.

- narysuj graf wywołań dla `seq3(4)`.

## [Zad. 9.11 *]()

Napisz program `SequenceTree` wypisujący, jak wyglądają kolejne wywołania funkcji seq3 razem z wartościami przez nie zwracanymi. 

## [Zad. 9.12]()

Napisz program `r_fibo.asm` obliczający n-ty wyraz ciągu Fibonacciego metodą dziel i zwyciężaj, gdzie parametry aktualne wywołania zapamiętujemy na stosie.

- dokonaj analizy wywołania `fibo(2)`.

## [Zad. 9.13 *]()

Napisz program `r_fibo2.asm` obliczający n-ty wyraz ciągu Fibonacciego metodą dziel i zwyciężaj bez zapamiętywania na stosie parametrów aktualnych wywołania.

- dokonaj analizy wywołania `fibo(2)`.
