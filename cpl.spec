Summary:	Converter of polish character encodings with encodind recognizer
Summary(pl):	Konwerter polskich kodowañ znaków z rozpoznawaniem kodowania
Name:		cpl
Version:	2.0.6
Release:	1
License:	freeware for noncommercial use
Group:		Applications/Text
Source0:	%{name}-%{version}-ELF.tar.gz
Source0:	http://ceti.com.pl/~kravietz/progs/%{name}-%{version}-ELF.tar.gz
URL:		http://ceti.com.pl/~kravietz/cpl.html
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%description
cpl - Universal converter of polish character encodings. Things that
distinguish it from other programs of that type are amount of
supported standards, conversion in any direction and maximally
simplified - yet powerfull - command line.

qpl - Utility for recognizing polish character encodings. It's used
for recognizing encoding in text files if encoding is unknown or
unsure.

%description -l pl
cpl - Uniwersalny konwerter standardów polskich znaków. To co go
wyró¿nia od innych tego typu programów, to liczba obs³ugiwanych
standardów, dowolno¶æ kierunków konwersji i maksymalnie uproszczona -
choæ daj±ca wiele mo¿liwo¶ci - linia poleceñ.

qpl - Narzêdzie do rozpoznawania standardów polskich znaków. S³u¿y do
rozpoznawania standardu kodowania polskich znaków w plikach
tekstowych, je¶li standard ten jest nieznany lub niepewny.

%prep
%setup -q

%build
%{__make} \
	CC="%{__cc}" \
	CFLAGS="%{rpmcflags} -pipe -DNO_LINE_CNT" \
	LDFLAGS="%{rpmldflags}"

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT%{_bindir}

install {cpl,qpl,cpn} $RPM_BUILD_ROOT%{_bindir}

gzip -9nf doc/*.txt

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,755)
%doc doc/*.gz
%attr(755,root,root) %{_bindir}/*
