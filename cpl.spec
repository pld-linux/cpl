Summary:	Converter of Polish character encodings with encodind recognizer
Summary(pl):	Konwerter polskich kodowa� znak�w z rozpoznawaniem kodowania
Name:		cpl
Version:	2.0.7
Release:	1
License:	freeware for noncommercial use
Group:		Applications/Text
Source0:	%{name}-%{version}-ELF.tar.gz
Source1:	http://ceti.com.pl/~kravietz/progs/cpl.7
#Patch0:		%{name}-no_-N.diff
#Patch1:		%{name}-no_compat_h.diff
URL:		http://ceti.com.pl/~kravietz/cpl.html
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%description
cpl - Universal converter of Polish character encodings. Things that
distinguish it from other programs of that type are amount of
supported standards, conversion in any direction and maximally
simplified - yet powerfull - command line.

qpl - Utility for recognizing Polish character encodings. It's used
for recognizing encoding in text files if encoding is unknown or
unsure.

%description -l pl
cpl - Uniwersalny konwerter standard�w polskich znak�w. To co go
wyr�nia od innych tego typu program�w, to liczba obs�ugiwanych
standard�w, dowolno�� kierunk�w konwersji i maksymalnie uproszczona -
cho� daj�ca wiele mo�liwo�ci - linia polece�.

qpl - Narz�dzie do rozpoznawania standard�w polskich znak�w. S�u�y do
rozpoznawania standardu kodowania polskich znak�w w plikach
tekstowych, je�li standard ten jest nieznany lub niepewny.

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

install {cpl,qpl,cpn} $RPM_BUILD_ROOT%{_bindir}
install %{SOURCE1} $RPM_BUILD_ROOT%{_mandir}/pl/man7

gzip -9nf doc/*.txt

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,755)
%doc doc/*.gz
%{_mandir}/pl/man7/*
%attr(755,root,root) %{_bindir}/*
