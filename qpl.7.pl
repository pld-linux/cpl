.\" Copyright (c) 2002 Andrzej Krzysztofowicz
.\"
.TH QPL 7 "28 lutego 2002" "ConvPL"
.SH NAZWA
qpl \- rozpoznawanie standard�w polskich znak�w v2.03
.SH SKLADNIA
.B qpl
.RB [ - ]
.RI [ plik1.txt ]
.RI [ plik2.txt " ...]"
.RB [ -v | -b ]

.SH OPIS
Argumentami polecenia s� nazwy plik�w, kt�rych standard kodowania ma
by� rozpoznany. Ograniczeniem dla ilo�ci nazw jest d�ugo�� linii
polece� i wielko�� pami�ci. Po nazwach plik�w mog� nast�powa� trzy
opcjonalne argumenty:
.TP
.B -v
wy�wietlenie tabeli zgodno�ci znak�w, na podstawie kt�rej wyznaczany jest
standard badanego tekstu
.TP
.B -b
podanie wyniku analizy w postaci parametru dla programu
.I ConvPL
\- cyfry lub litery; opcji tej mo�na uzy� do automatycznego konwertowania
plik�w o nieznanym standardzie, podstawiajac uzyskany znak do linii polece�
.B cpl
jako standard �r�d�owy; patrz dokumentacja
.IR ConvPL ;
opcja
.B -b
automatycznie wy��cza opcj�
.BR -v ;
opcje
.BR -b " i " -v
s� automatycznie wy��czane, gdy badany ma by� wi�cej ni� jeden plik.
.PP
Podanie "-" zamiast nazwy pliku powoduje prac� w trybie filtru \- dane b�d�
pobierane ze standardowego wej�cia.

.SH ALGORYTM
Zasada dzia�ania jest nast�puj�ca: zliczane s� wszystkie wyst�pienia
wszystkich polskich znak�w narodowych. Poniewa� znaki powtarzaj� si�
w r�nych standardach, ka�de znak jest zliczany oddzielnie dla ka�dego
ze standard�w. Obecne w tek�cie znaki o funkcji innej ni� polskie litery
(np. ramki), ale wchodz�ce w sk�ad kt�rego� ze standard�w mog� spowodowa�
zafa�szowanie wynik�w zwyk�ego zliczania. Dla unikni�cia takich zmian
liczba wyst�pie� ka�dego znaku jest mno�ona przez przypisany znakowi
wsp�czynnik, odzwiercielaj�cy cz�sto�� jego wyst�powania w przeci�tnym
polskim tek�cie. Nast�pnie wyst�pienia wszystkich znak�w s� sumowane
w obr�bie standard�w. Wygrywa standard o najwi�kszym wyniku \- czyli
najbardziej przypominaj�cy ten obecny w tek�cie.
.PP
Tabel� zlicze� znak�w wy�wietla opcja
.BR -v .
W ostatniej kolumnie znajduje
si� suma ka�dego wiersza. Pozwala to na samodzielne ocenienie wynik�w
zliczania w szczeg�lnie problematycznych przypadkach.

.SH UWAGI
.TP 3
1)
Winietka programu i wszystkie informacje s� wy�wietlane na stderr,
dzi�ki czemu s� "niewidzialne" przy zrzucaniu wyj�cia do pliku,
filtrowaniu itp. Tabela zgodno�ci
.RB ( -v )
i wynik \- parametr dla
.I ConvPL
.RB ( -b )
s� natomiast wy�wietlane na stdout (nigdy razem, bo jedno wyklucza drugie).
.TP 3
2)
.B qpl
jest rozprowadzany razem z konwerterem
.IR ConvPL .
Autor zdecydowa� si� na rozprowadzanie go w postaci odr�bnego programu
z powod�w praktycznych. Jako taki, mo�e on mie� wi�ksze mo�liwo�ci, wi�cej
zastosowa� i bogatsz� lini� polece�. Wsp�prac� mi�dzy obydwoma programami
\- w celu np. automatyzacji konwersji mo�na bardzo �atwo zapewni� sobie za
pomoc� skrypt�w (Unix) lub bacz�w (MSDOS/4DOS).
.TP 3
3)
Rozr�nienie standard�w DHN i Logic oraz FX i KWK jest trudne, bo sk�adaj�
si� one z tych samych znak�w w innej kolejno�ci. QPL zazwyczaj trafnie
rozpoznaje r�nic� w przypadku przeci�tnej d�ugo�ci tekst�w, jednak w wyniku
podaje na wszelki wypadek obie mo�liwo�ci.
.TP 3
4)
Opcje
.BR -b " i " -v
s� wy��czane, je�li w linii polece� wyst�puje wi�cej ni� jeden plik.
Ponadto opcje
.BR -b " i " -v
wykluczaj� si� nawzajem
.TP 3
5)
Autor nie kszta�ci si� na kierunku maj�cym cokolwiek wsp�lnego z informatyk�,
a oba algorytmy sam sobie wykombinowa�. W zwi�zku z tym przyjmuje ka�dy
zarzut o nieefektywno��, brak oryginalno�ci, poziom przedszkola itp. byle
na odpowiednim poziomie merytorycznym. ;)

.SH "ZOBACZ TAK�E"
.BR cpl (7)

.SH AUTOR
.B Pawe� Krawczyk
\- wla�ciciel praw autorskich programu
.B qpl
.br
.I <kravietz@pipeta.chemia.pk.edu.pl>
