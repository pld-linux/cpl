Summary:	Converter of Polish character encodings with encoding recognizer
Summary(pl.UTF-8):	Konwerter polskich kodowań znaków z rozpoznawaniem kodowania
Name:		cpl
Version:	2.0.7
Release:	4
License:	Freeware for non-commercial use, not distributable without source
Group:		Applications/Text
Source0:	%{name}-%{version}-ELF.tar.gz
# Source0-md5:	92d186fe2c9896423da527c6283ae0ff
Source1:	cpl.7.pl
Source2:	cpn.7.pl
Source3:	qpl.7.pl
URL:		http://ipsec.pl/cpl
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%description
cpl - Universal converter of Polish character encodings. Things that
distinguish it from other programs of that type are amount of
supported standards, conversion in any direction and maximally
simplified - yet powerful - command line.

qpl - Utility for recognizing Polish character encodings. It's used
for recognizing encoding in text files if encoding is unknown or
unsure.

%description -l pl.UTF-8
cpl - Uniwersalny konwerter standardów polskich znaków. To co go
wyróżnia od innych tego typu programów, to liczba obsługiwanych
standardów, dowolność kierunków konwersji i maksymalnie uproszczona -
choć dająca wiele możliwości - linia poleceń.

qpl - Narzędzie do rozpoznawania standardów polskich znaków. Służy do
rozpoznawania standardu kodowania polskich znaków w plikach
tekstowych, jeśli standard ten jest nieznany lub niepewny.

%prep
%setup -q

%build
%{__make} \
	CC="%{__cc}" \
	CFLAGS="%{rpmcflags} -pipe -DNO_LINE_CNT" \
	LDFLAGS="%{rpmldflags}"

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT{%{_bindir},%{_mandir}/pl/man7}

install cpl qpl cpn $RPM_BUILD_ROOT%{_bindir}
ln -s cpl $RPM_BUILD_ROOT%{_bindir}/ConvPL

install %{SOURCE1} %{SOURCE2} %{SOURCE3} $RPM_BUILD_ROOT%{_mandir}/pl/man7
echo ".so cpl" > $RPM_BUILD_ROOT%{_mandir}/pl/man7/ConvPL.7

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,755)
%doc doc/*.txt
%attr(755,root,root) %{_bindir}/*
%lang(pl) %{_mandir}/pl/man7/*
