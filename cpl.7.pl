.\" Copyright (c) 1997 Mariusz Krawczyk
.\" Uogonkowienie i korekta formatowania: Andrzej Krzysztofowicz
.\" 
.TH CPL 7 "28 sierpnia 1997" "ConvPL"
.SH NAZWA
cpl \- konwerter standardów polskich znaków v2.07
.SH SK£ADNIA
.B cpl
.I nn
.RI [ konwersja ]
.RB [ - ]
.RI [ plik1.txt ]
.RI [ plik2.txt " ... ]"

.SH OPIS
Parametr
.RB nn
to dwie cyfry/litery, okre¶laj±ce standard 
.I ¼ród³owy 
(pierwsza) i 
.I docelowy 
(druga) przeprowadzanej konwersji.
Parametr
.B konwersja
okre¶la rodzaj opcjonalnie stosowanej konwersji
zakoñczenia linii pomiedzy DOSem a Unixem i Amig±.

.SH PRZYK£ADY
.TP
.B cpl 14 tekst1.txt
\- plik tekst1.txt (Mazovia -> ISO-Latin-2)
.TP
.B cpl 14 *.txt
\- wszystkie pliki z rozszerzeniem .txt
.TP
.B cpl 14 tekst1.txt *.doc
\- plik tekst1.txt i wszystkie .doc

.SH "OBS£UGIWANE STANDARDY"
Dostêpne standardy (podajemy dwie cyfry/litery):
.TP
.B 0:
bez polskich liter (ASCII, CP473)
.TP
.B 1:
Mazovia
.TP
.B 2:
FidoMazovia
.TP
.B 3:
IBM Latin 2 (CP852)
.TP
.B 4:
ISO Latin 2 (ISO-8859-2)
.TP
.B 5:
DHN
.TP
.B 6:
CSK
.TP
.B 7:
Cyfromat (IINTE-ISIS)
.TP
.B 8:
IEA
.TP
.B 9:
LOGIC
.TP
.B a:
Microvex
.TP
.B b:
Amiga PL
.TP
.B c:
CP/J (Elwro 800 Junior)
.TP
.B d:
Amiga FAT
.TP
.B e:
Windows 3.x/95 (CP1250)
.TP
.B f:
Amiga XJP
.TP
.B g:
Ventura
.TP
.B h:
Macintosh
.TP
.B i:
TeX PL
.TP
.B j:
Corel 2.0
.TP
.B k:
Atari Calamus
.TP
.B l:
FX
.TP
.B m:
KWK
.TP
.B n:
MS Works
.TP
.B o:
ATM

.SH SKRÓTY
Zamiast najczê¶ciej stosowanych konwersji mo¿na stosowaæ skróty. Podajemy
wówczas tylko jedn± literê:
.TP
.B A:
Mazovia na IBM Latin 2
.TP
.B B:
IBM Latin 2 na Mazoviê
.TP
.B C:
Mazovia na ASCII
.TP
.B D:
IBM Latin 2 na ASCII
.TP
.B F:
FidoMazovia na Mazoviê
.PP
Dowolno¶æ konwersji jest ca³kowita, z jednym wyj±tkiem. Standard ASCII nie
mo¿e byæ standardem ¼ród³owym konwersji (przyczyna jest oczywista - ¿eby nie
pokaszaniæ ca³ego tekstu - ale jest od tej regu³y wyj±tek! patrz
.BR UWAGI ).

.SH "KONWERSJA ZAKOÑCZEÑ LINII"
.I ConvPL 
umo¿liwia równoleg³± konwersjê pomiêdzy tekstem spod DOSa, a tekstem
spod Uniksa czy Amigi. Rodzaj docelowej konwersji okre¶laj± parametry:
.TP
.B \-: 
konwersja do tekstu Uniksa (Amigi)  -> NL
.TP
.B \=: 
konwersja do tekstu DOSa            -> CR+LF
.PP
Zmieni³em wystêpuj±ce w poprzednich wersjach oznaczenia tych parametrów
(/, \\), poniewa¿ uko¶nik odwrotny jest znakiem specjalnym pod Uniksami. Nowe
ustawienia mo¿na równie ³atwo zapamiêtaæ: pod Uniksem koniec linii to jeden
znak (NL), wiêc jedna kreska: "-"; pod DOSem s± to dwa znaki (CR+LF), st±d
dwie kreski: "=". Logiczne ;)

.SH "PRACA W TRYBIE FILTRU"
.I ConvPL
mo¿e pracowaæ równie¿ w trybie filtru. Podanie znaku "-" zamiast
nazw plików spowoduje pobranie tekstu ze standardowego urz±dzenia wej¶cia 
- stdin (klawiatura) i zapisanie go do standardowego wyj¶cia - stdout 
(monitor, terminal, drukarka). Przyk³ady:
.TP
.B cpl A \-
\- ka¿da linia wpisywana z klawiatury bêdzie
pojawia³a siê poni¿ej po wci¶niêciu
.IR <Enter> ,
znaki z kodu Mazovia bêd±
zamieniane na IBM Latin 2
.TP
.B cpl 13 <joke.txt >prn
\- konwersja pliku joke.txt i wys³anie
wyników bezpo¶rednio na drukarkê (DOS); czêsto sam z tego korzystam, bo na
moim PC pod DOSem mam Mazoviê, a na drukarce CP852.
.PP
Je¶li nie chcemy za¶miecaæ sobie dysku, wydajemy nastepuj±ce polecenia:
.TP
.BR "cpl A - <joke.txt >nul " (MSDOS)
lub 
.B >/dev/null
(Unix) ;)))
.PP
Tryb filtru umo¿liwia równie¿ przetwarzanie tekstu w potoku (pipe).
.br 
.I Przyk³ad:
.TP
.BR "type joke1.txt | cpl 14- - >joke3.txt " (MSDOS)
Plik 
.I joke1.txt
zostanie przepuszczony przez konwersjê Mazovia -> ISO-Latin-2,
a koñce linii zostan± zamienione na mod³ê uniksow±. Wynik zostanie 
zapisany do pliku
.IR joke3.txt .
.PP
Zwróæ uwagê na obecno¶æ dwóch minusów w linii poleceñ - ka¿dy pe³ni inn±
funkcjê. Pierwszy, po³±czony z opisem konwersji ("14-"), w³±cza konwersjê
zakoñczeñ linii. Drugi, samodzielny, w³±cza tryb filtru.
.TP
.BR "cat joke.txt1 joke2.txt | cpl 14- - >joke3.txt " (Unix)
Przyjmuj±c, ¿e pliki 
.I joke.txt 
i
.I joke2.txt 
s± napisane oryginalnie w Mazovii i pod MSDOSem, takie polecenie spowoduje 
po³±czenie obu plików, konwersjê ca³o¶ci z Mazovii na ISO Latin 2, i przy
okazji z CR+LF -> NL, a nastêpnie zapis do pliku 
.IR joke3.txt .
.PP
Uruchamiaj±c
.I ConvPL
w tym trybie nale¿y uwa¿aæ na pomy³ki takie jak ta:
.TP
.B cpl A joke.txt >prn
Tekst zostanie przekonwertowany zgodnie z regu³± 13 (skrót "A"), ale na
drukarkê nie zostanie wys³any, gdy¿
.I ConvPL
bêdzie go zapisywa³ do pliku
.I joke.txt
a nie na standardowe wyj¶cie. W rzeczywisto¶ci powy¿sze (b³êdne)
polecenie oznacza:
.br
.B konwertuj plik joke.txt, zapisuj±c wynik pod t± sam± nazw±,
za¶ na drukarkê wysy³aj wyj¶cie przez program
normalnie wyswietlane na ekranie, czyli komunikaty.
.PP
Polecenie poni¿sze spowoduje najprawdopodobniej uszkodzenie oryginalnego
pliku, wiêc nale¿y siê go wystrzegaæ:
.TP
.BR "cpl A - <joke.txt >joke.txt " (obie nazwy takie same!)
Po prostu, system straci g³owê próbuj±c równocze¶nie czytaæ i pisaæ
do pliku, a ucierpi na tym ten¿e plik.
.PP
.I Pamiêtajmy:
aby uruchomiæ ConvPL w trybie filtru, potok danych musi
przychodziæ z stdin i wychodziæ na stdout (a nie czê¶ciowo z pliku, czê¶ciowo
z potoku). Je¶li nie wiesz o co chodzi, to poczytaj o potokach, filtrach oraz
roli symboli <, |, > itp. w poleceniach DOSa i Uniksa.

.SH UWAGI
Od wersji 2.01 istnieje mo¿liwo¶æ wykonywania konwersji zakoñczeñ linii
bez zmiany standardu polskich znaków. Wystarczy jako standard ¼ród³owy
podaæ ASCII - "0" (do tej pory by³o to niedopuszczalne), za¶ jako drugi
parametr opcjê konwersji zakoñczeñ linii "-" lub "=".  Drugi parametr,
podany zgodnie z konwencj± i okre¶laj±cy standard docelowy jest w tym
wypadku ignorowany. A zatem, ka¿dy z poni¿szych przyk³adów ma takie samo
dzia³anie:
.TP
.B cpl  0- joke.txt
.TP
.B cpl 00- joke.txt
.TP
.B cpl 02- joke.txt
.PP
czyli konwersjê zakoñczeñ linii do pojedynczych NL, bez naruszania
polskich liter.
.TP 
.B Komentarz do standardów
Za definicjê Amiga PL dziekujê Marcinowi K±dzio³ce <2:484/15.16@fidonet>.
.IP
Definicje dodane w wersji 1.75 udostêpni³ mi Edwin Wierszelis
<2:482/16@fidonet>, autor konwertera KPN.
.IP
.I Standard ASCII 
to oczywi¶cie zwyk³e literki ASCII, zastêpuj±ce odpowiednie
polskie znaki. Taki tekst zwie siê zwykle "polskawym", a standard okre¶la
jako CP473 (oryginalna, amerykañska strona kodowa).
.IP
.I FidoMazovia 
jest pó³formalnym (jak ca³a reszta ;) standardem, przyjêtym 
w ¶rodowisku sieci Fido. Jedyna ró¿nica w stosunku do klasycznej Mazovii
to zamiana znaku c' (141) na c-cedilla (135), wynikaj±ca ze wzglêdów
technicznych.
.IP
.I Standard IBM Latin 2 (CP852) 
jest lansowany przez Micro$oft wraz z systemem
MSDOS. Wraz z kolejnym "systemem" - Windows wyszed³ na ¶wiat standard
strony kodowej 1250 (CP1250). Znany te¿ jako Windows-EE, czyli strona
kodowa dla Europy Wschodniej.
.IP
.I ISO-8859-2 
znany te¿ jako 
.I ISO Latin 2 
jest standardem rozpowszechnionym
zw³aszcza w systemach uniksowych i pracuj±cych pod X-window. Jest równie¿
standardem zalecanym przez Polskie Normy oraz uznanym za obowi±zujacy
w polskojêzycznym WWW oraz w polskim UseNecie.
.IP
Standard 
.I FAT 
jest jednym z amigowskich dialektów, znalezionym w diskmagu
FAT przez Edwina Wierszelisa.
.IP
Standard
.I DHN
jest rozpowszechniony wraz z polskim ChiWriterem.
.IP
Niektóre standardy pochodza z Polskiej Strony Ogonkowej 
.IR http://www.uci.agh.edu.pl/ogonki/ , 
na której mo¿na znale¼æ wiele cennych informacji na temat polskich liter.
.TP 
.B Konwersja tekstu Unix<->DOS:
Pod Uniksem ka¿da linijka tekstu koñczy siê znakiem NL (new line) o kodzie
0xa, równoznacznym DOSowemu LF (line feed). Pod DOSem zakoñczenie linii
stanowi para znaków CR+LF, czyli 0xd,0xa. Parametr "-" wymusza zakoñczenie
linii znakiem NL, za¶ "=" - par± CR+LF. Brak okre¶lonego kierunku konwersji
nie spowoduje ¿adnej zmiany koñców linii w pliku wynikowym. Parametry
konwersji zakoñczeñ linii dodaje siê "na trzeciego" do parametrów konwersji
standardów.
.TP 
.B Kod ¼ród³owy
Program by³ z powodzeniem kompilowany Borlandem 3.1, gcc 2.7.2 pod Linuksem
(a.out, ELF), oraz DJGPP pod DOSem (gcc 2.6.3). Proszê o kontakt w razie 
wyst±pienia niekompatybilno¶ci kodu ¼ród³owego w innych systemach.
Wersja 2.04 i wy¿sze s± na razie kompilowalne tylko pod Linuksem (i byæ mo¿e
innymi Uniksami).
.TP 
.B Licznik linii:
Typowy "wodotrysk". Zwalnia pracê o ok. 30%. Standardowo wy³±czony, w celu
w³±czenia trzeba przekompilowaæ ¼ród³a bez opcji NO_LINE_COUNT. Licznik jest
zawsze wy³±czony podczas pracy w trybie stdin/stdout (czyli zazwyczaj jako
filtr itp.).
.TP 
.B Znane b³êdy:
Tekst nie mo¿e zawieraæ znaku ASCII 0 (^@), 
który jest u¿ywany jako znacznik koñca pliku.

.SH "INNE OPCJE"
.TP
.BR \-? ", " \-h ", " --help:
wy¶wietlaj± listê wszystkich dostêpnych parametrów, sk³adniê linii poleceñ
itp.
.TP
.BR \-V ", " --version:
wy¶wietla (na stdout) numer wersji CPL
.TP
.BR \-L ", " --licencja:
wy¶wietlaj± licencjê u¿ytkowania programu.
.TP
.BR \-S ", " --standard:
wy¶wietlaj± tabelkê wszystkich obs³ugiwanych standardów polskich znaków.
.\" .SH "W PLANACH"
.\" .sp
.\" .B 'spolszczanie' cyrylicy
.\" .sp
.\" .B kody wieloznakowe

.SH "ZOBACZ TAK¯E"
.BR qpl (7) 

.SH AUTORZY
.TP
.B Pawe³ Krawczyk 
\- wla¶ciciel praw autorskich programu
.B cpl
.br
.I <kravietz@pipeta.chemia.pk.edu.pl>
.TP
.B Mariusz Krawczyk
\- twórca pliku manual-a, czyli tego
.br
.I <scorpio@astra.mech.pk.edu.pl>
