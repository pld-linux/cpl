.\" Copyright (c) 2002 Andrzej Krzysztofowicz
.\"
.TH QPL 7 "28 lutego 2002" "ConvPL"
.SH NAZWA
qpl \- rozpoznawanie standardów polskich znaków v2.03
.SH SKLADNIA
.B qpl
.RB [ - ]
.RI [ plik1.txt ]
.RI [ plik2.txt " ...]"
.RB [ -v | -b ]

.SH OPIS
Argumentami polecenia s± nazwy plików, których standard kodowania ma
byæ rozpoznany. Ograniczeniem dla ilo¶ci nazw jest d³ugo¶æ linii
poleceñ i wielko¶æ pamiêci. Po nazwach plików mog± nastêpowaæ trzy
opcjonalne argumenty:
.TP
.B -v
wy¶wietlenie tabeli zgodno¶ci znaków, na podstawie której wyznaczany jest
standard badanego tekstu
.TP
.B -b
podanie wyniku analizy w postaci parametru dla programu
.I ConvPL
\- cyfry lub litery; opcji tej mo¿na uzyæ do automatycznego konwertowania
plików o nieznanym standardzie, podstawiajac uzyskany znak do linii poleceñ
.B cpl
jako standard ¼ród³owy; patrz dokumentacja
.IR ConvPL ;
opcja
.B -b
automatycznie wy³±cza opcjê
.BR -v ;
opcje
.BR -b " i " -v
s± automatycznie wy³±czane, gdy badany ma byæ wiêcej ni¿ jeden plik.
.PP
Podanie "-" zamiast nazwy pliku powoduje pracê w trybie filtru \- dane bêd±
pobierane ze standardowego wej¶cia.

.SH ALGORYTM
Zasada dzia³ania jest nastêpuj±ca: zliczane s± wszystkie wyst±pienia
wszystkich polskich znaków narodowych. Poniewa¿ znaki powtarzaj± siê
w ró¿nych standardach, ka¿de znak jest zliczany oddzielnie dla ka¿dego
ze standardów. Obecne w tek¶cie znaki o funkcji innej ni¿ polskie litery
(np. ramki), ale wchodz±ce w sk³ad którego¶ ze standardów mog± spowodowaæ
zafa³szowanie wyników zwyk³ego zliczania. Dla unikniêcia takich zmian
liczba wyst±pieñ ka¿dego znaku jest mno¿ona przez przypisany znakowi
wspó³czynnik, odzwiercielaj±cy czêsto¶æ jego wystêpowania w przeciêtnym
polskim tek¶cie. Nastêpnie wyst±pienia wszystkich znaków s± sumowane
w obrêbie standardów. Wygrywa standard o najwiêkszym wyniku \- czyli
najbardziej przypominaj±cy ten obecny w tek¶cie.
.PP
Tabelê zliczeñ znaków wy¶wietla opcja
.BR -v .
W ostatniej kolumnie znajduje
siê suma ka¿dego wiersza. Pozwala to na samodzielne ocenienie wyników
zliczania w szczególnie problematycznych przypadkach.

.SH UWAGI
.TP 3
1)
Winietka programu i wszystkie informacje s± wy¶wietlane na stderr,
dziêki czemu s± "niewidzialne" przy zrzucaniu wyj¶cia do pliku,
filtrowaniu itp. Tabela zgodno¶ci
.RB ( -v )
i wynik \- parametr dla
.I ConvPL
.RB ( -b )
s± natomiast wy¶wietlane na stdout (nigdy razem, bo jedno wyklucza drugie).
.TP 3
2)
.B qpl
jest rozprowadzany razem z konwerterem
.IR ConvPL .
Autor zdecydowa³ siê na rozprowadzanie go w postaci odrêbnego programu
z powodów praktycznych. Jako taki, mo¿e on mieæ wiêksze mo¿liwo¶ci, wiêcej
zastosowañ i bogatsz± liniê poleceñ. Wspó³pracê miêdzy obydwoma programami
\- w celu np. automatyzacji konwersji mo¿na bardzo ³atwo zapewniæ sobie za
pomoc± skryptów (Unix) lub baczów (MSDOS/4DOS).
.TP 3
3)
Rozró¿nienie standardów DHN i Logic oraz FX i KWK jest trudne, bo sk³adaj±
siê one z tych samych znaków w innej kolejno¶ci. QPL zazwyczaj trafnie
rozpoznaje ró¿nicê w przypadku przeciêtnej d³ugo¶ci tekstów, jednak w wyniku
podaje na wszelki wypadek obie mo¿liwo¶ci.
.TP 3
4)
Opcje
.BR -b " i " -v
s± wy³±czane, je¶li w linii poleceñ wystêpuje wiêcej ni¿ jeden plik.
Ponadto opcje
.BR -b " i " -v
wykluczaj± siê nawzajem
.TP 3
5)
Autor nie kszta³ci siê na kierunku maj±cym cokolwiek wspólnego z informatyk±,
a oba algorytmy sam sobie wykombinowa³. W zwi±zku z tym przyjmuje ka¿dy
zarzut o nieefektywno¶æ, brak oryginalno¶ci, poziom przedszkola itp. byle
na odpowiednim poziomie merytorycznym. ;)

.SH "ZOBACZ TAK¯E"
.BR cpl (7)

.SH AUTOR
.B Pawe³ Krawczyk
\- wla¶ciciel praw autorskich programu
.B qpl
.br
.I <kravietz@pipeta.chemia.pk.edu.pl>
