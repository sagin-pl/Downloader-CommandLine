# Downloader-CommandLine
[![Release](https://img.shields.io/github/v/release/sagin-pl/Downloader-CommandLine)](https://github.com/sagin-pl/Downloader-CommandLine/releases)
[![Project](https://img.shields.io/badge/project-SAGIN--PL-green)](https://github.com/sagin-pl)

Narzędzie uruchamiane w wierszu poleceń lub terminalu służące do pobierania filmów/zdjęć z platform takich jak Tiktok, Instagram, Youtube.

#### SPIS TREŚCI
- [Wymagania](#wymagania)
- [Funkcje](#funkcje)
- [Instalacja](#instalacja)
- [Screenshots](#screenshots)
- [Changelog](#changelog)
- [Autorzy](#autorzy)

#### WYMAGANIA
- System: Windows/Linux/MacOS
- Zainstalowane środowisko Ruby

#### FUNKCJE
- Pobieranie filmu lub zdjęcia
- Pasek postępu pobierania </br>

#### INSTALACJA
Aby zainstalować aplikację trzeba najpierw zainstalować środowisko Ruby, poniżej znajdziesz poradnik dla twojego systemu operacyjnego. Po zainstalowaniu środowiska pobieramy narzędzie z zakładki [RELEASE](https://github.com/sagin-pl/Downloader-CommandLine/releases) i przenosimy do miejsca na dysku z którego będziemy go uruchamiać. Następnie otwieramy Wiersz poleceń lub Terminal w zależności co mamy i przechodzimy do lokalizacji naszego narzędzia.</br>

Narzędzie uruchamiamy komendą:</br>
&emsp; `./Downloader.rb` na linux'ie</br>
&emsp; `ruby Downloader.rb` na windows'ie

Można również skorzystać z szybszej formy, gdzie wpisujemy URL jako parametr uruchamiania</br>
&emsp; `./Downloader.rb https://link.do/filmu` na linux'ie</br>
&emsp; `ruby Downloader.rb https://link.do/filmu` na windows'ie

#### WINDOWS
Należy wejść na [stronę producenta](https://www.ruby-lang.org/en/downloads) i pobrać najnowszą wersję stabilną

#### LINUX
Należy otworzyć Terminal i wpisać komendę odpowiednią dla naszej dystrybucji

###### DEBIAN / UBUNTU
&emsp; `sudo apt-get install ruby`

###### CENTOS / FEDORA
&emsp; `sudo yum install ruby`

###### ARCH LINUX
&emsp; `sudo pacman -S ruby-full`

###### INNE (Z wbudowanym menedżerem snap)
&emsp; `sudo snap install ruby --classic`

#### MAC OS
Należy otworzyć Terminal i wpisać komendę</br></br>
&emsp; `brew install ruby`

# Screenshots
#### ALPHA
<img src='https://imgur.com/Gunhs8H.jpg' height='100' width='680'/>
<img src='https://imgur.com/rf6j28W.jpg' height='140' width='680'/>

# Changelog
#### ALPHA
- 23.04.2022 - Sprawdzanie czy API jest dostępne
- 23.04.2022 - Pobieranie od użytkownika URL i jakości
- 23.04.2022 - Pobieranie URL z parametrów uruchamiania
- 23.04.2022 - Wysyłanie URL do API
- 23.04.2022 - Progress Bar z procentami
- 23.04.2022 - Wyświetlanie linku
- 23.04.2022 - Wypuszczenie wersji Alpha-v0.1
- 23.04.2022 - Rezygnacja z kontynuowania projektu ze względu na bezużyteczność

# Autorzy
- **[@onhq11](https://github.com/onhq11)**
