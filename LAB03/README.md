# Laboratorium 3

## [Zad. 3.1]()

1. Zainstaluj program `Embarcadero_Dev-Cpp_6.3_TDM-GCC 9.2_Setup.exe`

2. Uruchom jako administrator program `nasm-2.16.02rc5-installer-x64.exe`

3. Zainstaluj program `ConTEXTv0_986.exe`

4. Do folderu `C:\Program Files (x86)\ConTEXT\Highlighters` skopiuj plik `NASM.chl`

5. Uruchom plik rejestru `context.reg` i potwierdź zmiany

6. W folderze do zajęć z ASK do folderu lab3 skopiuj pliki `asmloader.exe` i `char.asm`

7. W edytorze ConTEXT otwórz plik `char.asm` i przetestuj kolejno:

`F9`	–  kompilacja

`F10`	–  uruchomienie

`F11`	–  deasemblacja

`F12`	–  debugger

W debuggerze wpisz kolejno komendy:
```
file asmloader
run char
q
```
## [Zad. 3.2]()

Prześledź wynik uruchomienia programu char.asm. 

Przykładowa sesja: 
```
Simplified Assembly Loader v.0.0.1 by gynvael.coldwind//vx
Code loaded at 0x002c0100 (12 bytes)
H
```

- pod jaki adres logiczny został załadowany ten program? `0x00140100`

- ile bajtów zajmuje ten addres logiczny? `32-bitowym, jakim jest tutaj sugerowany ([bits 32]), zajmuje 4 bajty.`

- ile bajtów w pamięci zajmuje ten program?  `12 bajtów` `"Code loaded at 0x002c0100 (12 bytes)".` 

- jaki jest wynik działania tego programu?
```
Program wykonuje następujące czynności:

push 'H': Na stos wrzucany jest znak 'H' (zapisany jako 32-bitowa wartość z 'H' na najmniej znaczącym bajcie i zerami na pozostałych bajtach).
call [ebx+1*4]: Wywołuje funkcję putchar (dostępną pod drugim indeksem tablicy API, co wynika z ebx+4), która wypisuje znak 'H' na standardowe wyjście.
add esp, 4: Zdejmuje wartość ze stosu, korygując wskaźnik stosu esp o 4 bajty w górę, aby usunąć przekazany argument.
push 0 i call [ebx+0*4]: Wywołuje funkcję exit z argumentem 0, kończąc działanie programu z kodem powrotu 0.
Wynik działania tego programu to wyświetlenie znaku 'H' na ekranie, a następnie zakończenie pracy z kodem wyjścia 0.
```

## [Zad. 3.3]()

Prześledź wynik działania deasemblera dla programu char.asm.
```
00000000  6A48              push byte +0x48
00000002  FF5304            call [ebx+0x4]
00000005  83C404            add esp,byte +0x4
00000008  6A00              push byte +0x0
0000000A  FF13              call [ebx]
```

- co przechowuje pierwsza, druga i trzecia kolumna w powyższym listingu?
```
Pierwsza kolumna to adres offsetu instrukcji względem początku segmentu kodu. W rzeczywistości jest to liczba heksadecymalna reprezentująca, gdzie w pamięci zaczyna się dana instrukcja.
Druga kolumna to kod maszynowy instrukcji – ciąg bajtów, które procesor interpretuje jako konkretną operację do wykonania.
Trzecia kolumna to mnemonik instrukcji wraz z jej operandami, czyli bardziej zrozumiała reprezentacja kodu maszynowego dla programisty.
```

- jaki adres ma instrukcja push 'H' ? `00000000`

- ile bajtów ma instrukcja push 'H' ? `2 bajty`

- jaki kod rozkazu ma instrukcja push 'H' ? `6A48`

- jaki kod ASCI ma literka 'H' ? `0x48 (w ASCII, litera 'H' ma kod 72, co w systemie heksadecymalnym to 48)`


- jaki adres ma instrukcja call [ebx+1*4] ? `00000002`

- ile bajtów ma instrukcja call [ebx+1*4] ? `3 bajty`

- jaki kod rozkazu ma instrukcja call [ebx+1*4] ? `FF5304`
 
- ile bajtów zajmuje kod rozkazu instrukcji call [ebx+1*4] ? `3 bajt`

- jaki kod ma argument instrukcji call [ebx+1*4] ? `53 04 (reprezentuje [ebx+0x4])`


- jaki adres ma instrukcja add esp, 4 ? * `00000005`

- ile bajtów ma instrukcja add esp, 4 ? * `3 bajty`

- jaki kod rozkazu ma instrukcja add esp, 4 ? * `83C404`

- ile bajtów zajmuje kod rozkazu instrukcji add esp, 4 ? * `3 bajt`

- jaki kod ma argument instrukcji add esp, 4 ? * `C4 04 (reprezentuje esp, byte +0x4)`


- jaki adres ma instrukcja call [ebx+0*4] ? * `00000008`

- ile bajtów ma instrukcja call [ebx+0*4] ? * `2 bajty`

- jaki kod rozkazu ma instrukcja call [ebx+0*4] ? * `Ten kod to 6A00.`

- ile bajtów zajmuje kod rozkazu instrukcji call [ebx+0*4] ? * `Zajmuje 2 bajty.`

- czy instrukcja call [ebx+0*4] ma kod argumentu? * `Ma kod 00.`

## [Zad. 3.4]()

Napisz program `printf.asm` wypisujący napis `Hello world!` przy pomocy API asmloadera.

- jaki adres ma instrukcja `call getaddr` ? `00000000.`

- ile bajtów ma instrukcja `call getaddr` ? `Ma 5 bajty.`

- jaki kod rozkazu ma instrukcja `call getaddr` ? `Kod rozkazu to E80E000000.`

- ile bajtów ma argument instrukcji `call getaddr` ? `Argument ma 4 bajty.`


- co przechowuje etykieta format ? `Etykieta format przechowuje adres do miejsca w kodzie.`

- jaką wartość ma etykieta format ? `Jej wartość to ciąg znaków "Hello World!".`

- jaką wartość na stosie ma format ? `Adres komórki pamięci.`

## [Zad. 3.5]()

Napisz program, który przy pomocy asmloader api:

`printf2.asm` – wyświetla stałą `a`

`printf3.asm` – wyświetla dwie stałe `a i b` *

`printf4.asm` – wyświetla stałą a w podprogramie `print`

`printf5.asm` – wyświeta dwie stałe `a i b` w podprogramie `print` *

`printf6.asm` – wyświeta stałą `a` zapisaną w pamięci programu

`printf7.asm` – tak jak powyżej, ale z wykorzystaniem instrukcji `pop` *

`printf8.asm` – skrócona wersja programu `print6` *

`printf9.asm` – skrócona wersja programu `print7` *

Wskazówka do dwóch ostatnich zadań:

Umieść liczbę `a` i napis `a = w` jednolitym/spójnym obszarze pamięci.

## [Zad. 3.6]()

Napisz program, który przy pomocy asmloader api:

`add.asm` – dodaje do rejestru `eax` zawartość rejestru ecx i wypisuje wynik 

`add2.asm` – dodaje do wartości `a` w rejestrze `eax` stałą `b` i wypisuje wynik

`add3.asm` – dodaje do wartości `a` w rejestrze `eax` liczbę `b` z pamięci i wypisuje wynik *

`sub.asm` – odejmuje od rejestru `eax` zawartośc rejestru `ecx` i wypisuje wynik *

`sub2.asm` – odejmuje od wartości `a` w rejestrze `eax` stałą `b` i wypisuje wynik *

`sub3.asm` – odejmuje od wartości `a` w rejestrze `eax` liczbę `b` z pamięci i wypisuje wynik *

## [Zad. 3.7]()

Napisz program ilustrujący działanie instrukcji dodawania z przeniesieniem adc (add with carry) kolejno ze zgaszoną i ustawioną flagą CF. Instrukcja clc (clear carry flag) gasi flagę CF. Instrukcja stc (set carry flag) ustawia flagę CF.

`adc.asm`  – dodaje do rejestru `eax` zawartość rejestru `ecx` i wypisuje wynik 

`adc2.asm` – dodaje do wartości a w rejestrze `eax` stałą `b` i wypisuje wynik

**Uwaga: oba programy mają wyświetlać po dwa wyniki.**

## [Zad. 3.8 *]()

Napisz program ilustrujący działanie instrukcji odejmowania z pożyczką sbb (subtract with borrow) kolejno ze zgaszoną i ustawioną flagą CF. Instrukcja clc (clear carry flag) gasi flagę CF. Instrukcja stc (set carry flag) ustawia flagę CF.

`sbb.asm`  – odejmuje od rejestru `eax` zawartośc rejestru `ecx` i wypisuje wynik

`sbb2.asm` – odejmuje od wartości `a` w rejestrze `eax` stałą `b` i wypisuje wynik

**Uwaga: oba programy mają wyświetlać po dwa wyniki.**
