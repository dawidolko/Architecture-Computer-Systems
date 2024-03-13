# Laboratorium 8

## [Zad. 8.1]()

Do programu `fibo` dodaj funkcję `fibo2` wyliczającą wartości ciągu Fibonacciego metodą programowania dynamicznego przy pomocy ramki dwuzębnej.
```
r0  r1
|---|
0   1   2   3   4   5   6    indeksy
1   1   2   3   5   8   13   wartości
|   |---|
pom r0  r1
```

Przesunięcie ramki w prawo:
```
pom = r0
r0 = r1
r1 = pom + r0
```

- ile razy należy przesunąć ramkę w prawo, aby wyznaczyć wartość n-tego wyrazu ciągu Fibonacciego w funkcji fibo2 dla `n >= 2` ?

- dokonaj analizy wywołania `fibo2(4)`.

- narysuj graf obliczeń dla `fibo2(4)`.

- która funkcja ma mniejszą złożoność obliczeniową `fibo1` czy `fibo2` ?

## [Zad. 8.2 *]()

Do programu sequence dodaj funkcję `seq2` wyliczającą wartości ciągu {seqn} metodą programowania dynamicznego przy pomocy ramki dwuzębnej. Narysuj ramkę i określ instrukcje przesuwające ramkę.

- ile razy należy przesunąć ramkę w prawo, aby wyznaczyć wartość n-tego wyrazu ciągu w funkcji seq2 dla `n >= 2` ?

- dokonaj analizy wywołania `seq2(4)`.

- narysuj graf obliczeń dla `seq2(4)`.

- która funkcja ma mniejszą złożoność obliczeniową seq1 czy `seq2` ?

## [Zad. 8.3]()

Napisz program `fibo3.asm` obliczający n-ty wyraz ciągu Fibonacciego metodą programowania dynamicznego przy pomocy ramki dwuzębnej.
```
0   1   2   3   4   5   6    indeksy

a   b
|---|
1   1   2   3   5   8   13   wartosci
|   |---|
d   a   b
```

Przesuniecie ramki:
```
d = a              ; d = 1
a = b              ; a = 1
b = a + d = b + d  ; b = 1 + 1 = 2
```

- ile razy należy przesunąć ramkę w prawo, aby wyznaczyć wartość n-tego wyrazu ciągu Fibonacciego dla `n >= 2` ?

## [Zad. 8.4 *]()

Napisz program `fibo4.asm` analogicznie do fibo3.asm z optymalizacją za pomocą jednej instrukcji test dla dwóch pierwszych wyrazów ciągu.

## [Zad. 8.5]()

Napisz program `fibo5.asm` analogicznie do fibo3.asm z optymalizacją za pomocą jednej instrukcji cmp dla dwóch pierwszych wyrazów ciągu.

## [Zad. 8.6]()

Napisz program `fibo6.asm` analogicznie do `fibo3.asm` obliczający n-ty wyraz ciągu Fibonacciego metodą programowania dynamicznego przy pomocy instrukcji xadd.
```
a   b      a+2b  
|---|   |---|
1   1   2   3   5   8   13   wartosci
    |---|   |---|
    b  a+b    2a+3b
```

Przesuniecie ramki:
```
xadd (b, a) = (a+b, b) // wynik w rejestrze b
```

Schemat obliczeń:
```
                xadd        xadd           xadd
(a, b) -> (b, a) => (a+b, b) => (a+2b, a+b) => (2a+3b, a+2b) => ...
```

- ile razy należy przesunąć ramkę w prawo, aby wyznaczyć wartość n-tego wyrazu ciągu Fibonacciego dla n >= 2 ?

## [Zad. 8.7 *]()

Napisz program `fibo7.asm` analogicznie do fibo6.asm z optymalizacją za pomocą jednej instrukcji test dla dwóch pierwszych wyrazów ciągu.

## [Zad. 8.8 *]()
	
Napisz program `fibo8.asm` analogicznie do fibo6.asm z optymalizacją za pomocą jednej instrukcji cmp dla dwóch pierwszych wyrazów ciągu.
