.\" Copyright (c) 2002 Andrzej Krzysztofowicz
.\" 
.TH CPN 7 "28 lutego 2002" "ConvPL"
.SH NAZWA
cpn \- automatyczna konwersja wielu plików na jeden standard polskich znaków
.SH SKLADNIA
.B cpn
.I standard plik
.RI [ plik2 " ...]"

.SH OPIS
Skrypt
.B cpn
pozwala na automatyczn± konwersjê plików o ró¿nych, nieznanych standardach
na jeden standard. Wykorzystuje w tym celu mo¿liwo¶ci probgramów
.IR cpl i qpl .

.SH UWAGA
Wynik przeszukiwania w przypadku wielu plików zostaje wys³any na
stderr, wiêc nie mo¿na go skierowaæ do pliku czy do potoku. Mo¿na
wykorzystaæ do tego celu przekierowanie wyj¶cia (Unix). Na przyk³ad:
.sp
.nf
	$ cd /usr/src/cpl204
	$ qpl doc/* 2>&1 | grep "ISO-Latin"

doc/cpl.txt              12267     standardowa   ISO-8859/2 (ISO-Latin-2)
doc/qpl.txt              5528      standardowa   ISO-8859/2 (ISO-Latin-2)
.fi

.SH "ZOBACZ TAK¯E"
.BR cpl (7),
.BR qpl (7)

.SH AUTOR
.B Pawe³ Krawczyk
\- autor skryptu
.B cpn
.br
.I <kravietz@pipeta.chemia.pk.edu.pl>
