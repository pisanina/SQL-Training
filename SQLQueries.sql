Create Table Flight (Id int not null, DateOfFlight datetime2, AirplaneId int not null, Number varchar(23))
Insert into Flight  Values  (1, '2018-06-25', 99, 111),
							(2, '2018-06-25', 77, 112),
							(3, '2018-06-26', 66, 113),
							(4, '2018-06-26', 65, 114),
							(5, '2018-06-27', 99, 115);

Create Table Airplane (Id int Not Null, AircraftRegistration varchar(6) not null)
Insert Into Airplane Values (99, 'R-SKED'),  (77, 'J-ORAN'), (66, 'M-MONK'), (65, 'Z-ZUUM');

Select Number from Flight where DateOfFlight = '2018-06-25'
Select Number from Flight Inner join Airplane on Flight.AirplaneId=Airplane.Id where Airplane.AircraftRegistration = 'R-SKED'
Select Count(Number) as [Liczba Lotow], DateOfFlight as Dzien from Flight group by DateOfFlight
Select AircraftRegistration as [Aircraft registration], Count(AirplaneId) as [Liczba lotow]  
from Flight, Airplane where Flight.AirplaneId=Airplane.Id
group by Airplane.AircraftRegistration


----------------------------------------

Create Table Flight2 (Id int not null, DateOfFlight DateTime2, Number Varchar(23))
Insert Into Flight2 values  (1, '2018-07-05', 'EZY9876'),
							(2, '2018-07-05', 'WWW9876'),
							(3, '2018-07-06', 'AAA2341'),
							(4, '2018-07-06', 'AQW3423'),
							(5, '2018-07-07', 'WTF9999');

Create Table Passenger (Id int not null, Name varchar(128))
 Insert Into Passenger values   (1, 'Monika Pietrucha'),
								(2, 'Swietopelek Pyzaty'),
								(3, 'Obiezyswiat Wspanialy');	

 Create Table FlightPassenger (FlightId int not null, PassengerId int not null)
 Insert Into FlightPassenger Values (1,1),(1,2),(1,3),(2,2),(3,3),(4,1),(4,3),(5,1),(5,3);


Select DateOfFlight from Flight2 where Number ='EZY9876'

Select Number As [Numery lotow z Monika Pietrucha] from Flight2
inner join FlightPassenger on Flight2.id=FlightPassenger.FlightId
inner join Passenger ON Passenger.Id=FlightPassenger.PassengerId 
WHERE Passenger.Name = 'Monika Pietrucha';
Select Number As [Numery lotow z Monika Pietrucha] from Flight2, Passenger, FlightPassenger
where Passenger.Id

declare @LiczbaLotow float, @LiczbaPasazerow float, @Wynik float
Set @LiczbaLotow = (Select Count(FlightID) from FlightPassenger)
Set @LiczbaPasazerow = (Select Max(Id) from Passenger)
Set @Wynik = @LiczbaLotow/@LiczbaPasazerow
Select @Wynik As [Srednia liczbalotow na pasazera]


declare @LiczbaLotow2 float, @LiczbaPasazerow2 float, @Wynik2 float
Set @LiczbaLotow2 = (Select Count(FlightID) from FlightPassenger)
Set @LiczbaPasazerow2 = (Select Max(Id) from Passenger)
Set @Wynik2 = @LiczbaPasazerow2/@LiczbaLotow2
Select @Wynik2 AS [Srednia Liczba pasazerow na lot]

----------------------------------------

Create table Oddzial (Id int primary key not null, Adres varchar (20));
Create table Pracownik (Id int primary key not null IDENTITY(1,1), 
						imie varchar(20), IdOddzial int, 
						foreign key(IdOddzial) references Oddzial(Id));
Create table Biurko (Id int primary key not null, IdOddzial int,
					foreign key(IdOddzial) references Oddzial(Id));
Create table BiurkoPracownik ( id int primary key not null Identity(0,1), IdBiurko int, IdPracownik int,
								foreign key (IdBiurko) references Biurko(Id),
								foreign key (IdPracownik) references Pracownik(ID));

Insert Into Oddzial Values (1, 'Warszawa'), (2, 'Szczebrzeszyn'), (3, 'Kioto');
Insert into Biurko Values (1, 1),(2,1),(3,1),(4,2),(5,3),(6,3);
Insert Into Pracownik Values ('Kaska', 1), ('Stas', 1), ('Esmeralda', 1), ('Krzys', 2), 
								('Bozena', 2), ('Jola', 3);   
Insert Into BiurkoPracownik Values (1,1), (2,1), (1,2), (3,3), (4,4), (5,6), (6,6);

Drop table Pracownik

Select imie As [Pracownicy oddzialu Warszawa] 
from Pracownik  where IdOddzial =
(Select Id from Oddzial where adres = 'Warszawa');

Select ((Select Count(Id) from Biurko where IdOddzial = 
(Select Id from Oddzial where adres = 'Kioto'))/
(Select Count(Id) from Pracownik where IdOddzial =
(Select Id from Oddzial where adres = 'Kioto')));


Select imie AS [Pracownicy uzywający wiecej niz 1 biurka]
from Pracownik where Id IN
(SELECT IdPracownik FROM BiurkoPracownik GROUP BY IdPracownik HAVING COUNT( IdPracownik ) >1)


----------------------------------------

Create table Dziecko (Id int Not null Primary key Identity(1,1), Imie Varchar(128));

Create Table Zabawka (Id int not null Primary Key Identity(1,1), Nazwa Varchar(32),
						DzieckoID int not null, foreign key (DzieckoId) references Dziecko(Id))
						
Insert Into Dziecko  Values ('Tadeusz Rozwadowski'),('Zuzia'), ('Bartek');
Insert into Zabawka Values ('Mis', 1), ('Pokemon', 1), ('Puzle', 2), ('Grzechotka', 3);
Insert Into Dziecko  Values ('Smutna Zuza')


Select Nazwa As [Zabawki Tadeusza] from Zabawka 
Where DzieckoId IN (Select Id from Dziecko where Imie='Tadeusz Rozwadowski');


Select Imie, Count(Zabawka.DzieckoId) AS [Liczba zabawek] from Dziecko
Left Join Zabawka On Dziecko.Id=Zabawka.DzieckoID 
Group by Dziecko.Imie

----------------------------------------

Create table Wiezienie ( Id int not null primary key Identity(1,1), Nazwa Varchar(32));
Create table Wiezien ( Id int not null primary key Identity(1,1), Pesel Varchar(11) not null,
						Imie Nvarchar(128), WiezienieId int,
						foreign key (WiezienieId) References Wiezienie(Id));
Create table ProbaUcieczki ( Id int not null primary key Identity(1,1), Data DateTime2);
Create table WiezienProbaUcieczki (WiezienPesel Varchar(11) not null,
									ProbaUcieczkiId int not null, IsSuccess BIT,									
									foreign key (ProbaUcieczkiId) references ProbaUcieczki(Id));

Insert into Wiezienie Values ( 'Shawshank'), ('BootCamp');
Insert into Wiezien Values ('88987656786', 'Andy Dufresne', 1), ('71234545678', 'Will Smith', 1),
					('57487656723', 'Barack Obama', 2), ('56234545667', 'George Washington', 2);
Insert into ProbaUcieczki Values ('2016-11-11 22:21:23'), ('2017-01-01 3:32:12');
Insert into WiezienProbaUcieczki Values ('88987656786', 1, 1), ('57487656723', 2, 0);
Insert into WiezienProbaUcieczki Values ('88987656786', 2, 1);
Select * from Wiezienie
Select * from Wiezien
Select * from ProbaUcieczki
Select * from WiezienProbaUcieczki

Select Pesel from Wiezien where WiezienieId In (Select Id from Wiezienie where Nazwa ='Shawshank');

Select [Data] As [Proba Ucieczki Andy Dufresne] 
from ProbaUcieczki 
where Id IN( 
	Select ProbaUcieczkiId from WiezienProbaUcieczki where WiezienPesel = 
		(Select Pesel from Wiezien where Imie ='Andy Dufresne'));

declare @ProbyUcieczki Float, @LiczbaWiezniow Float, @Wynik Float
Set @ProbyUcieczki = (Select Count(ProbaUcieczkiId) from WiezienProbaUcieczki)
Set @LiczbaWiezniow =  (Select Max(id) from Wiezien)
Set @Wynik = (@ProbyUcieczki/@LiczbaWiezniow)
Select @Wynik As [Srednia liczba prob ucieczek na wieznia]
