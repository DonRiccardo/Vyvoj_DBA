
-- Tema: ZOO
-- Autor: Richard Hvizdoš, 2023
-- ER model je v priecinku s nazvom diagram_ZOO.png (v celku dobre popisuje tuto ZOO)

-- pavilon ma oddelenia = pre kazdy druh zvierata bude v samostatnom oddeleni
-- celkovy pocet zvierat v pavilone/oddeleni pavilonu nie je obmedzeny
-- pavilon by mal mat dostatocne zabezpecenie na zvierata (zabezpecenie>=nebezpecnost zvierat)
-- najprv vytvorit tabulky, funkcne nastroje zo suboru 'Funkcne_nastroje.sql', nasledne vlozit data pomocou suboru 'Data.sql', potom mozeme vykonavat dotazy zo suboru 'Dotazy_testy.sql'



-- Druh zvierata

create table Druh_Zvierata(
	ID numeric(10,0) identity(1000000000,1)
		constraint Druh_Zvierata_PK primary key,
	Nazov varchar(70) not null
		constraint Druh_Zvierata_Nazov_unique unique,
	Nebezpecnost numeric(2,0) default 1
		constraint Druh_Zvierata_Nebezpectnost_kladna check (Nebezpecnost > 0),
	Potrava varchar(30)
);


-- Pavilon

create table Pavilon(
	ID numeric(10,0) identity(2000000000,1)
		constraint Pavilon_PK primary key,
	Nazov varchar(70) not null
		constraint Pavilon_Nazov_unique unique,
	MaxPocetNavstevnikov numeric(3,0) not null default 0
		constraint Pavilon_max_ludi_kladne check (MaxPocetNavstevnikov >= 0),
	Zabezpecenie numeric(2,0) not null default 1
		constraint Pavilon_Zabezpecenie_kladne check (Zabezpecenie > 0),
	PocetOddeleni numeric(3,0) not null default 1
		constraint Pavilon_PocetOddeleni_kladne check (PocetOddeleni > 0),
);


-- Adresa

create table Adresa(
	ID numeric(10,0) identity(4000000000,1)
		constraint Adresa_PK primary key,
	Stat varchar(50) not null,
	Mesto varchar(50) not null,
	Ulica varchar(50) not null,
	Cislo varchar(15) not null,
	PSC varchar(5) not null
);


-- Osetrovatel

create table Osetrovatel(
	ID numeric(10,0) identity(5000000000,1)
		constraint Osetrovatel_PK primary key,
	Meno varchar(100) not null,
	ID_adresa numeric(10,0) not null
		constraint Osetrovatel_Adresa_FK references Adresa(ID)
		on update cascade
		on delete no action
);


-- Telefonne cislo

create table Telefonne_cislo(
	ID numeric(10,0) identity(7000000000,1)
		constraint Telefonne_cislo_PK primary key,
	Predvolba varchar(6) not null default '00420',
	Cislo numeric(9,0) not null 
		constraint Telefonne_cislo_unique unique,
	ID_osetrovatel numeric(10,0) not null
		constraint Telefonne_cislo_Osetrovatel_FK references Osetrovatel(ID)
		on update cascade
		on delete cascade
);


-- Email

create table Email(
	ID numeric(10,0) identity(3000000000,1)
		constraint Email_PK primary key,
	Email varchar(100) not null 
		constraint Email_unique unique,
	ID_osetrovatel numeric(10,0) not null
		constraint Email_Osetrovatel_FK references Osetrovatel(ID)
		on update cascade
		on delete cascade
);


-- Zviera

create table Zviera(
	ID numeric(10,0) identity(6000000000,1)
		constraint Zviera_PK primary key,
	Meno varchar(60) not null 
		constraint Zviera_Meno_unique unique,
	Datum_narodenia date not null,
	Vaha numeric(6,3) not null,
	Vyska numeric(6,3) not null,
	ID_druh numeric(10,0) not null
		constraint Zviera_Druh_FK references Druh_Zvierata(ID)
		on update cascade
		on delete no action,
	ID_pavilon numeric(10,0) not null
		constraint Zviera_Pavilon_FK references Pavilon(ID)
		on update cascade
		on delete no action
);


-- Osetruje

create table Osetruje(
	ID_osetrovatel numeric(10,0) not null
		constraint Osetruje_Osetrovatel_FK references Osetrovatel(ID)
		on update cascade
		on delete no action,
	ID_zviera numeric(10,0) not null
		constraint Osetruje_Zviera_FK references Zviera(ID)
		on update cascade
		on delete cascade,
	constraint Osetruje_PK primary key (ID_osetrovatel, ID_zviera)
);


-- Predator

create table Predator(
	ID_predator numeric(10,0) not null
		constraint Predator_predator_FK references Druh_Zvierata(ID)
		on update no action
		on delete no action,
	ID_potrava numeric(10,0) not null
		constraint Predator_potrava_FK references Druh_Zvierata(ID)
		on update no action
		on delete no action,
	constraint Predator_PK primary key (ID_predator, ID_potrava)
);


