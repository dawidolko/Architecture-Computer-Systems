# Laboratorium 7

## [Zad. 7.1]()

Napisz program `length.asm` wyliczający liczbę cyfr podanej nieujemnej liczby całkowitej n. Liczbę n podajemy jako stałą, a liczba cyfr ma być wypisana na konsoli.

## [Zad. 7.2 *]()

Napisz program `length2.asm` wyliczający liczbę cyfr podanej liczby całkowitej n. Liczbę n podajemy jako stałą, a liczba cyfr ma być wypisana na konsoli.

## [Zad. 7.3]()

W pliku `fibo.txt` podaj słowną oraz rekurencyjną definicję ciągu Fibonacciego.
```
0   1   2   3   4   5   6    indeksy
1   1   2   3   5   8   13   wartosci
```
## [Zad. 7.4]()

Napisz program fibo z funkcją fibo1 wyliczający wartości ciągu Fibonacciego metodą programowania dynamicznego przy pomocy ramki trójzębnej.
```
r0  r1  r2
|---|---|       
0   1   2   3   4   5   6    indeksy
1   1   2   3   5   8   13   wartości
    |---|---|
    r0  r1  r2
```

Przesunięcie ramki w prawo:
```
r0 = r1
r1 = r2
r2 = r1 + r0
```

- ile razy należy przesunąć ramkę w prawo, aby wyznaczyć wartość n-tego wyrazu ciągu Fibonacciego w funkcji `fibo1` dla `n >= 3` ?

- dokonaj analizy wywołania `fibo1(4)`.

- narysuj graf obliczeń dla `fibo1(4)`.

## [Zad. 7.5 *]()

Napisz program sequence z funkcją `seq1` wyliczający wartości ciągu {seqn} metodą programowania dynamicznego przy pomocy ramki trójzębnej. Narysuj ramkę i określ instrukcje przesuwające ramkę. Ciąg {seqn} zdefiniowany jest rekurencyjnie:
```
seq(1) = 3
seq(2) = 4
seq(n) = 0.5*seq(n-1) + 2*seq(n-2)  dla  n > 2
```

- ile razy należy przesunąć ramkę w prawo, aby wyznaczyć wartość n-tego wyrazu ciągu w funkcji `seq` dla `n >= 3` ?

- dokonaj analizy wywołania `seq1(4)`.

- narysuj graf obliczeń dla `seq1(4)`.

## [Zad. 7.6]()

Rejestry `b` i `d` przyjmują wartości początkowe odpowiednio `1` i `2`. Napisz program `shift.asm` realizujący na tych rejestrach poniższe operacje. Dokonaj analizy fragmentu kodu, który wykonuje te  operacje.
```
a = b
b = d
d = a + b
```
## [Zad. 7.7]()

Napisz program `fibo.asm` obliczający n-ty wyraz ciągu Fibonacciego metodą programowania dynamicznego przy pomocy ramki trójzębnej.

```
0   1   2   3   4   5   6    indeksy

a   b   d
|---|---|
1   1   2   3   5   8   13   wartosci
    |---|---|
    a   b   d
```

Przesuniecie ramki:
```
a = b      ; a = 1
b = d      ; b = 2
d = a + b  ; d = 1 + 2 = 3
```

- ile razy należy przesunąć ramkę w prawo, aby wyznaczyć wartość n-tego wyrazu ciągu Fibonacciego dla `n >= 3` ?

## [Zad. 7.8 *]()

Rejestry `b` i `d` przyjmują wartości początkowe odpowiednio `1` i `2`. Napisz program `shift2.asm` realizujący na tych rejestrach poniższe operacje. Dokonaj optymalizacji i analizy fragmentu kodu, który wykonuje te operacje.
```
a = b
b = d
d = a + b = d + a
```
## [Zad. 7.9 *]()

Napisz program `fibo2.asm` obliczający n-ty wyraz ciągu Fibonacciego metodą programowania dynamicznego przy pomocy ramki trójzębnej z optymalizacją przesunięcia ramki. 

```
0   1   2   3   4   5   6    indeksy
	
a   b   d
|---|---|
1   1   2   3   5   8   13   wartosci
    |---|---|
    a   b   d
```

Przesuniecie ramki:
```
a = b              ; a = 1
b = d              ; b = 2
d = a + b = d + a  ; d = 2 + 1 = 3
```
