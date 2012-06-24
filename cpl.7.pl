.\" Copyright (c) 1997 Mariusz Krawczyk
.\" Uogonkowienie i korekta formatowania: Andrzej Krzysztofowicz
.\" 
.TH CPL 7 "28 sierpnia 1997" "ConvPL"
.SH NAZWA
cpl \- konwerter standard�w polskich znak�w v2.07
.SH SK�ADNIA
.B cpl
.I nn
.RI [ konwersja ]
.RB [ - ]
.RI [ plik1.txt ]
.RI [ plik2.txt " ... ]"

.SH OPIS
Parametr
.RB nn
to dwie cyfry/litery, okre�laj�ce standard 
.I �r�d�owy 
(pierwsza) i 
.I docelowy 
(druga) przeprowadzanej konwersji.
Parametr
.B konwersja
okre�la rodzaj opcjonalnie stosowanej konwersji
zako�czenia linii pomiedzy DOSem a Unixem i Amig�.

.SH PRZYK�ADY
.TP
.B cpl 14 tekst1.txt
\- plik tekst1.txt (Mazovia -> ISO-Latin-2)
.TP
.B cpl 14 *.txt
\- wszystkie pliki z rozszerzeniem .txt
.TP
.B cpl 14 tekst1.txt *.doc
\- plik tekst1.txt i wszystkie .doc

.SH "OBS�UGIWANE STANDARDY"
Dost�pne standardy (podajemy dwie cyfry/litery):
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

.SH SKR�TY
Zamiast najcz�ciej stosowanych konwersji mo�na stosowa� skr�ty. Podajemy
w�wczas tylko jedn� liter�:
.TP
.B A:
Mazovia na IBM Latin 2
.TP
.B B:
IBM Latin 2 na Mazovi�
.TP
.B C:
Mazovia na ASCII
.TP
.B D:
IBM Latin 2 na ASCII
.TP
.B F:
FidoMazovia na Mazovi�
.PP
Dowolno�� konwersji jest ca�kowita, z jednym wyj�tkiem. Standard ASCII nie
mo�e by� standardem �r�d�owym konwersji (przyczyna jest oczywista - �eby nie
pokaszani� ca�ego tekstu - ale jest od tej regu�y wyj�tek! patrz
.BR UWAGI ).

.SH "KONWERSJA ZAKO�CZE� LINII"
.I ConvPL 
umo�liwia r�wnoleg�� konwersj� pomi�dzy tekstem spod DOSa, a tekstem
spod Uniksa czy Amigi. Rodzaj docelowej konwersji okre�laj� parametry:
.TP
.B \-: 
konwersja do tekstu Uniksa (Amigi)  -> NL
.TP
.B \=: 
konwersja do tekstu DOSa            -> CR+LF
.PP
Zmieni�em wyst�puj�ce w poprzednich wersjach oznaczenia tych parametr�w
(/, \\), poniewa� uko�nik odwrotny jest znakiem specjalnym pod Uniksami. Nowe
ustawienia mo�na r�wnie �atwo zapami�ta�: pod Uniksem koniec linii to jeden
znak (NL), wi�c jedna kreska: "-"; pod DOSem s� to dwa znaki (CR+LF), st�d
dwie kreski: "=". Logiczne ;)

.SH "PRACA W TRYBIE FILTRU"
.I ConvPL
mo�e pracowa� r�wnie� w trybie filtru. Podanie znaku "-" zamiast
nazw plik�w spowoduje pobranie tekstu ze standardowego urz�dzenia wej�cia 
- stdin (klawiatura) i zapisanie go do standardowego wyj�cia - stdout 
(monitor, terminal, drukarka). Przyk�ady:
.TP
.B cpl A \-
\- ka�da linia wpisywana z klawiatury b�dzie
pojawia�a si� poni�ej po wci�ni�ciu
.IR <Enter> ,
znaki z kodu Mazovia b�d�
zamieniane na IBM Latin 2
.TP
.B cpl 13 <joke.txt >prn
\- konwersja pliku joke.txt i wys�anie
wynik�w bezpo�rednio na drukark� (DOS); cz�sto sam z tego korzystam, bo na
moim PC pod DOSem mam Mazovi�, a na drukarce CP852.
.PP
Je�li nie chcemy za�mieca� sobie dysku, wydajemy nastepuj�ce polecenia:
.TP
.BR "cpl A - <joke.txt >nul " (MSDOS)
lub 
.B >/dev/null
(Unix) ;)))
.PP
Tryb filtru umo�liwia r�wnie� przetwarzanie tekstu w potoku (pipe).
.br 
.I Przyk�ad:
.TP
.BR "type joke1.txt | cpl 14- - >joke3.txt " (MSDOS)
Plik 
.I joke1.txt
zostanie przepuszczony przez konwersj� Mazovia -> ISO-Latin-2,
a ko�ce linii zostan� zamienione na mod�� uniksow�. Wynik zostanie 
zapisany do pliku
.IR joke3.txt .
.PP
Zwr�� uwag� na obecno�� dw�ch minus�w w linii polece� - ka�dy pe�ni inn�
funkcj�. Pierwszy, po��czony z opisem konwersji ("14-"), w��cza konwersj�
zako�cze� linii. Drugi, samodzielny, w��cza tryb filtru.
.TP
.BR "cat joke.txt1 joke2.txt | cpl 14- - >joke3.txt " (Unix)
Przyjmuj�c, �e pliki 
.I joke.txt 
i
.I joke2.txt 
s� napisane oryginalnie w Mazovii i pod MSDOSem, takie polecenie spowoduje 
po��czenie obu plik�w, konwersj� ca�o�ci z Mazovii na ISO Latin 2, i przy
okazji z CR+LF -> NL, a nast�pnie zapis do pliku 
.IR joke3.txt .
.PP
Uruchamiaj�c
.I ConvPL
w tym trybie nale�y uwa�a� na pomy�ki takie jak ta:
.TP
.B cpl A joke.txt >prn
Tekst zostanie przekonwertowany zgodnie z regu�� 13 (skr�t "A"), ale na
drukark� nie zostanie wys�any, gdy�
.I ConvPL
b�dzie go zapisywa� do pliku
.I joke.txt
a nie na standardowe wyj�cie. W rzeczywisto�ci powy�sze (b��dne)
polecenie oznacza:
.br
.B konwertuj plik joke.txt, zapisuj�c wynik pod t� sam� nazw�,
za� na drukark� wysy�aj wyj�cie przez program
normalnie wyswietlane na ekranie, czyli komunikaty.
.PP
Polecenie poni�sze spowoduje najprawdopodobniej uszkodzenie oryginalnego
pliku, wi�c nale�y si� go wystrzega�:
.TP
.BR "cpl A - <joke.txt >joke.txt " (obie nazwy takie same!)
Po prostu, system straci g�ow� pr�buj�c r�wnocze�nie czyta� i pisa�
do pliku, a ucierpi na tym ten�e plik.
.PP
.I Pami�tajmy:
aby uruchomi� ConvPL w trybie filtru, potok danych musi
przychodzi� z stdin i wychodzi� na stdout (a nie cz�ciowo z pliku, cz�ciowo
z potoku). Je�li nie wiesz o co chodzi, to poczytaj o potokach, filtrach oraz
roli symboli <, |, > itp. w poleceniach DOSa i Uniksa.

.SH UWAGI
Od wersji 2.01 istnieje mo�liwo�� wykonywania konwersji zako�cze� linii
bez zmiany standardu polskich znak�w. Wystarczy jako standard �r�d�owy
poda� ASCII - "0" (do tej pory by�o to niedopuszczalne), za� jako drugi
parametr opcj� konwersji zako�cze� linii "-" lub "=".  Drugi parametr,
podany zgodnie z konwencj� i okre�laj�cy standard docelowy jest w tym
wypadku ignorowany. A zatem, ka�dy z poni�szych przyk�ad�w ma takie samo
dzia�anie:
.TP
.B cpl  0- joke.txt
.TP
.B cpl 00- joke.txt
.TP
.B cpl 02- joke.txt
.PP
czyli konwersj� zako�cze� linii do pojedynczych NL, bez naruszania
polskich liter.
.TP 
.B Komentarz do standard�w
Za definicj� Amiga PL dziekuj� Marcinowi K�dzio�ce <2:484/15.16@fidonet>.
.IP
Definicje dodane w wersji 1.75 udost�pni� mi Edwin Wierszelis
<2:482/16@fidonet>, autor konwertera KPN.
.IP
.I Standard ASCII 
to oczywi�cie zwyk�e literki ASCII, zast�puj�ce odpowiednie
polskie znaki. Taki tekst zwie si� zwykle "polskawym", a standard okre�la
jako CP473 (oryginalna, ameryka�ska strona kodowa).
.IP
.I FidoMazovia 
jest p�formalnym (jak ca�a reszta ;) standardem, przyj�tym 
w �rodowisku sieci Fido. Jedyna r�nica w stosunku do klasycznej Mazovii
to zamiana znaku c' (141) na c-cedilla (135), wynikaj�ca ze wzgl�d�w
technicznych.
.IP
.I Standard IBM Latin 2 (CP852) 
jest lansowany przez Micro$oft wraz z systemem
MSDOS. Wraz z kolejnym "systemem" - Windows wyszed� na �wiat standard
strony kodowej 1250 (CP1250). Znany te� jako Windows-EE, czyli strona
kodowa dla Europy Wschodniej.
.IP
.I ISO-8859-2 
znany te� jako 
.I ISO Latin 2 
jest standardem rozpowszechnionym
zw�aszcza w systemach uniksowych i pracuj�cych pod X-window. Jest r�wnie�
standardem zalecanym przez Polskie Normy oraz uznanym za obowi�zujacy
w polskoj�zycznym WWW oraz w polskim UseNecie.
.IP
Standard 
.I FAT 
jest jednym z amigowskich dialekt�w, znalezionym w diskmagu
FAT przez Edwina Wierszelisa.
.IP
Standard
.I DHN
jest rozpowszechniony wraz z polskim ChiWriterem.
.IP
Niekt�re standardy pochodza z Polskiej Strony Ogonkowej 
.IR http://www.uci.agh.edu.pl/ogonki/ , 
na kt�rej mo�na znale�� wiele cennych informacji na temat polskich liter.
.TP 
.B Konwersja tekstu Unix<->DOS:
Pod Uniksem ka�da linijka tekstu ko�czy si� znakiem NL (new line) o kodzie
0xa, r�wnoznacznym DOSowemu LF (line feed). Pod DOSem zako�czenie linii
stanowi para znak�w CR+LF, czyli 0xd,0xa. Parametr "-" wymusza zako�czenie
linii znakiem NL, za� "=" - par� CR+LF. Brak okre�lonego kierunku konwersji
nie spowoduje �adnej zmiany ko�c�w linii w pliku wynikowym. Parametry
konwersji zako�cze� linii dodaje si� "na trzeciego" do parametr�w konwersji
standard�w.
.TP 
.B Kod �r�d�owy
Program by� z powodzeniem kompilowany Borlandem 3.1, gcc 2.7.2 pod Linuksem
(a.out, ELF), oraz DJGPP pod DOSem (gcc 2.6.3). Prosz� o kontakt w razie 
wyst�pienia niekompatybilno�ci kodu �r�d�owego w innych systemach.
Wersja 2.04 i wy�sze s� na razie kompilowalne tylko pod Linuksem (i by� mo�e
innymi Uniksami).
.TP 
.B Licznik linii:
Typowy "wodotrysk". Zwalnia prac� o ok. 30%. Standardowo wy��czony, w celu
w��czenia trzeba przekompilowa� �r�d�a bez opcji NO_LINE_COUNT. Licznik jest
zawsze wy��czony podczas pracy w trybie stdin/stdout (czyli zazwyczaj jako
filtr itp.).
.TP 
.B Znane b��dy:
Tekst nie mo�e zawiera� znaku ASCII 0 (^@), 
kt�ry jest u�ywany jako znacznik ko�ca pliku.

.SH "INNE OPCJE"
.TP
.BR \-? ", " \-h ", " --help:
wy�wietlaj� list� wszystkich dost�pnych parametr�w, sk�adni� linii polece�
itp.
.TP
.BR \-V ", " --version:
wy�wietla (na stdout) numer wersji CPL
.TP
.BR \-L ", " --licencja:
wy�wietlaj� licencj� u�ytkowania programu.
.TP
.BR \-S ", " --standard:
wy�wietlaj� tabelk� wszystkich obs�ugiwanych standard�w polskich znak�w.
.\" .SH "W PLANACH"
.\" .sp
.\" .B 'spolszczanie' cyrylicy
.\" .sp
.\" .B kody wieloznakowe

.SH "ZOBACZ TAK�E"
.BR qpl (7) 

.SH AUTORZY
.TP
.B Pawe� Krawczyk 
\- wla�ciciel praw autorskich programu
.B cpl
.br
.I <kravietz@pipeta.chemia.pk.edu.pl>
.TP
.B Mariusz Krawczyk
\- tw�rca pliku manual-a, czyli tego
.br
.I <scorpio@astra.mech.pk.edu.pl>
