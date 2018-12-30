# SQL-Training
Basic SQL queries

Zapytania SQL wykonujące poniższe polecenia

Test 1.

Masz dwie dane table:

Table name: Flight
Id INT NOT NULL ,
DateOfFlight DATETIME2,
AirplaneId INT NOT NULL,
Numer VARCHAR(23)

Table name: Airplane
Id INT NOT NULL,
AircraftRegistration VARCHAR(6) NOT NULL

1.1 Napisz zapytanie, ktore zwroci numery lotow z dnia 2018-06-07
…..
1.2 Napisz zapytania, ktore zwroci numery lotow , ktorych aircaftRegistration jest rowny ‘R-SKED’
…..
1.3 Napisz zapytanie, ktore zwroci liczbe lotow kazdego dnia.
Tzw. Rezultat powinien byc w stylu:
Dzien			Liczba lotow:
2018-06-07		2
2018-06-08		4	
…			…
….
1.4 Napisz zapytanie, ktore zwroci liczbe lotow dla kazdego aircraftregistration
Tzw:
Aircraft registration			Liczba lotow
R-SKED					24
J-ORAN					13
…					…
…….

Test 2
Masz trzy tabele:

Table name: Flight
Id INT NOT NULL ,
DateOfFlight DATETIME2,
Numer VARCHAR(23)

Table name: Passenger
Id INT NOT NULL,
Name NVARCHAR(128)

Table name: FlightPassenger
FlightId INT NOT NULL
PassengerId INT NOT NULL


2.1 Napisz zapytanie, ktore wylistuje wszystkie dni lotow dla numeru EZY9876
….
2.2 Napisz zapytanie, ktore zwroci wszystkie numery lotow dla pasezera o nazwie: “Monika Pietrucha”
…..
2.3 Napisz zapytanie, ktore zwroci srednia liczbe lotow na pasazera
Tzw.
Srednia liczba lotow na pasazera
12.34
……
2.4 Napisz zapytanie, ktore zwroci srednia liczbe pasazerow na lot
…

Test 3
3.1 Narysuj schemat ERD bazy danych dla nastepujacych potrzeb.
Pracownik ma imie. Kazdy pracownik moze rpacowac tylko w jednym oddziale. Odzial ma adres. Odzial moze miec wielu pracownikow. Kazdy rpacownik moze pracowac na wielu biurkach I kazde burko moze byc uzywane przez wielu pracownikow.
…
3.2 Napisz zapytanie, ktore zwroci wszysktie imiona pracownikow pracujacych w odziale o adresie: Warszawa
…
3.3 Napisz zapyatnie zwracajace srednia liczbe pracownikow na biurko w odziale o adresie: Krakow
…
3.4 Napisz zapytanie zwracajace imiona uzytkownikow, ktorzy uzywaja wiecej niz 1 biurko.
….

Test 4
4.1 Co to jest transakcja? Jak sie tworzy transakcje?
…
4.2 Jak implementuje sie relacje wiele do wielu. Podaj jakis przyklad.
…
4.3 Masz dane dwie tabele:
Table 1 Zabawka
ID INT NOT NULL,
Nazwa VARCHAR(32),
DzieckoId INT NOT NULL

Table 2 Dziecko
ID INT NO NULL,
Imie NVARCHAR (128)

Napisz zapytanie ktore zwroci nazwy wszystkich zabawek dla dziecka o imieniu “Tadeusz Rozwadowski”
…
4.4 Dla table z porzedniego zadania, napsiz zapytanie, ktore poda imie dziecka I liczbe jego zabawek.
…

Test 5
Masz dane tabele:

Tabela 1: Wiezenie
Id INT NUT NULL,
Nazwa VARCHAR(32)

Tabela 2: Wiezien
PESEL VARCHAR(11) NOT NULL
Imie NVARCHAR(128)
WiezenieId

Tabela 3: ProbaUcieczki
Id INT NOT NULL
Data DATETIME2

Tabela 4: WiezienProbaUcieczki
WiezienPesel VARCHAR(11) NOT NULL
ProbaUcieczkiId INT NOT NULL
IsSuccess BIT


5.1 Napisz zapytanie, ktore zwroci pesel wszystkich wiezniow wiezienia o nazwie “Shawshank”
…
5.2 Napisz zapytanie, ktore zwroci daty wszystkich prob ucieczek wieznia “Andy Dufresne”
….
5.3 Napisz zapytanie ktore zwroci srednia liczbe prob ucieczek na wieznia

