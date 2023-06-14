
-- Tema: ZOO
-- Autor: Richard Hvizdoš, 2023
-- najprv otvor a precitaj subor 'Tabulky.sql' !


-- triggre
-- procedury
-- pohlady
-- indexy





-- INDEXY



create index Potrava_FK_index on Predator(ID_potrava);

create index Druh_FK_index on Zviera(ID_druh);
create index Pavilon_FK_index on Zviera(ID_pavilon);

create index Osetrovatel_FK_index on Telefonne_cislo(ID_osetrovatel);

create index ZvieraOsetrovane_FK_index on Osetruje(ID_zviera);

create index Adresa_FK_index on Osetrovatel(ID_adresa);

create index OsetrovatelEmail_FK_index on Email(ID_osetrovatel);








-- POHLADY


-- Osetrovatelia, prislusne udaje

alter view Osetrovatelia
as
select o.ID, o.Meno, a.Ulica, a.Cislo as Cislo_domu, a.PSC, a.Mesto, a.Stat, t.Predvolba, t.Cislo as Tel_cislo, e.Email as Email, count(s.ID_osetrovatel) as Pocet_osetrovanych_zvierat
	from Osetrovatel as o 
		left outer join Adresa as a on(o.ID_adresa=a.ID) 
		left outer join Telefonne_cislo as t on(o.ID=t.ID_osetrovatel)
		left outer join Osetruje as s on(o.ID=s.ID_osetrovatel)
		left outer join Email as e on(o.ID=e.ID_osetrovatel)
	group by o.ID, o.Meno, a.Ulica, a.Cislo, a.PSC, a.Mesto, a.Stat, t.Predvolba, t.Cislo, e.Email, s.ID_osetrovatel;



-- Zvierata, ich umiestnenie a info o pavilone

create view Zvierata
as
select z.ID, z.Meno, z.Datum_narodenia, z.Vaha, z.Vyska, d.Nazov, d.Nebezpecnost, d.Potrava, p.Nazov as Umiestneny_v, p.Zabezpecenie as Zabezpecenie_pavilonu
	from Zviera as z
		inner join Pavilon as p on(z.ID_pavilon=p.ID)
		inner join Druh_Zvierata as d on(z.ID_druh=d.ID);



-- Pavilony, ich info, pocet drhuhov zvierat v pavilone a celkovy pocet zvierat napriec vsetkymi druhmi

create view Pavilony
as
select p.ID, p.Nazov, p.MaxPocetNavstevnikov, p.Zabezpecenie, p.PocetOddeleni,
	case when z.ID_pavilon is null then 0 else z.Pocet_druhov_zvierat end as Pocet_druhov_zvierat,
	case when z.ID_pavilon is null then 0 else z.Pocet_kusov_zvierat end as Pocet_kusov_zvierat
	from Pavilon as p
		left outer join (

			select X.ID_pavilon, count(X.ID_pavilon) as Pocet_druhov_zvierat, sum(X.Pocet) as Pocet_kusov_zvierat
				from ( 
						select Zviera.ID_pavilon, Zviera.ID_druh, count(Zviera.ID_pavilon) as Pocet
						from Zviera 
						group by ID_pavilon, ID_druh				
					 ) as X
			group by ID_pavilon
		) as z on(p.ID=z.ID_pavilon);
		


-- Predatori a ich druh

create view Predatori_Koriste
as
select p.ID_predator as PREDATOR, d1.Nazov as PRE_nazov, d1.Nebezpecnost as PRE_nebezpecnost, d1.Potrava as PRE_potrava, p.ID_potrava as KORIST,
	d2.Nazov as KO_nazov, d2.Nebezpecnost as KO_nebezpecnost, d2.Potrava as KO_potrava from Druh_Zvierata as d1
	inner join Predator as p on(d1.ID=p.ID_predator)
	inner join Druh_Zvierata as d2 on(d2.ID=p.ID_potrava);




-- Osetrovatelia a im priradene zvieratka
create view Osetruju_zvierata
as
select o.ID as ID_osetrovatela, o.Meno as Osetrovatel, z.ID as ID_zvierata, z.Meno as Zviera, z.Datum_narodenia, z.Vaha, z.Vyska, d.Nazov as Druh, d.Nebezpecnost, d.Potrava, p.Nazov as Pavilon, p.Zabezpecenie from Osetrovatel as o
	inner join Osetruje as s on(o.ID=s.ID_osetrovatel)
	left outer join Zviera as z on(s.ID_zviera=z.ID)
	left outer join Druh_Zvierata as d on(z.ID_druh=d.ID)
	left outer join Pavilon as p on(z.ID_pavilon=p.ID);


-- TRIGGRE


-- Nebezpecnost zvierata vs. zabezpecenie pavilonu (tieto hodnoty su v rzonych tabulkach)

-- ak bude nove zviera a priradime ho do pavilonu/zmenime mu pavilon napriklad
create trigger Nebezpecnost_zvierata_bezpecnost_pavilonu
on Zviera
after update, insert
as
begin

	if exists(
		select *
			from inserted as i
			inner join Pavilon as p on(i.ID_pavilon=p.ID)
			inner join Druh_Zvierata as d on(i.ID_druh=d.ID)
			where d.Nebezpecnost>p.Zabezpecenie
	)
	begin
		RAISERROR('POZOR, pavilon ma pre zviera nevhodne zabezpecenie!%
		', 15,1);
		ROLLBACK TRANSACTION;
	end;

end;

-- zviera ma sovjich zastupcov v ZOO a zmenime mu nebezpecnost napriklad
create trigger Nebezpecnost_druhu_zvierata_bezpecnost_pavilonu
on Druh_Zvierata
after update, insert
as
begin

	if exists(
		select *
			from inserted as i
			inner join Zviera as z on(i.ID=z.ID_druh)
			inner join Pavilon as p on(z.ID_pavilon=p.ID)			
			where i.Nebezpecnost>p.Zabezpecenie
	)
	begin
		RAISERROR('POZOR, pavilon ma pre zviera nevhodne zabezpecenie!', 15,1);
		ROLLBACK TRANSACTION;
	end;

end;

-- zmenime zapezpecenie pavilonu napriklad
create trigger Bezpecnost_pavilonu_nebezpecnost_zvierata
on Pavilon
after update, insert
as
begin

	if exists(
		select *
			from inserted as i
			inner join Zviera as z on(i.ID=z.ID_pavilon)
			inner join Druh_Zvierata as d on(z.ID_druh=d.ID)
			where d.Nebezpecnost>i.Zabezpecenie
	)
	begin
		RAISERROR('POZOR, zviera je pre pavilon prilis nebezpecne!', 15,1);
		ROLLBACK TRANSACTION;
	end;

end;



-- pocet oddeleni pre zvierata v pavilone musi byt mensi rovny poctu druhov v pavilone

-- napriklad pri zmene poctu oddeleni v pavilone
create trigger Pocet_oddeleni_pocet_druhov_zvierat_v_pavilone
on Pavilon
after update, insert
as
begin

	if exists(
		select * 
			from inserted as i
				inner join (
							select X.ID_pavilon, count(X.ID_pavilon) as Pocet_druhov_zvierat
								from ( 
										select Zviera.ID_pavilon, Zviera.ID_druh, count(Zviera.ID_pavilon) as Pocet
										from Zviera 
										group by ID_pavilon, ID_druh				
									 ) as X
							group by ID_pavilon
							) as XY on(i.ID=XY.ID_pavilon)
			where i.PocetOddeleni<XY.Pocet_druhov_zvierat
		)
		begin
			RAISERROR('POZOR, v pavilone je nedostatok oddeleni pre dane druhy zvierat!', 15,1);
			ROLLBACK TRANSACTION;
		end;
end;

-- napriklad pri priradeni noveho zvierata do pavilonu
create trigger Pocet_druhov_zvierat_pocet_oddeleni_v_pavilone
on Zviera
after update, insert
as
begin

	if exists(
		select * 
			from inserted as i
				inner join (
							select X.ID_pavilon, count(X.ID_pavilon) as Pocet_druhov_zvierat
								from ( 
										select Zviera.ID_pavilon, Zviera.ID_druh, count(Zviera.ID_pavilon) as Pocet
										from Zviera 
										group by ID_pavilon, ID_druh				
									 ) as X
							group by ID_pavilon
							) as XY on(i.ID_pavilon=XY.ID_pavilon)
				inner join Pavilon as p on(p.ID=i.ID_pavilon)
			where p.PocetOddeleni<XY.Pocet_druhov_zvierat
		)
		begin
			RAISERROR('POZOR, nemozno pridat novy druh zvierata do pavilonu, z dovovdu nedostatocneho poctu oddeleni!', 15,1);
			ROLLBACK TRANSACTION;
		end;
end;




-- predator a jeho potrava v jednom pavilone vyzaduje zvysenu pozornost

-- funkcia na najdenie predatora alebo koriste zvierata
alter function Predator_zviera_retazec(
	@pZviera_druh numeric(10,0)
	) returns @a table (
		Predator_OR_Potrava numeric(10,0),
		Typ varchar(20)
	)
as
begin
	
	with 
		potrava(ID_predator, typ) as(
			select ID_predator, 'predator'
				from Predator
				where ID_potrava=@pZviera_druh and @pZviera_druh is not null
		),
		predator(ID_potrava, typ) as(
			select ID_potrava, 'potrava'
				from Predator
				where ID_predator=@pZviera_druh and @pZviera_druh is not null
		)
		insert @a
		select * from potrava
		union all
		select * from predator
	return
end;



-- napriklad nove zviera/update zvierata, teda mozna zmena jeho pavilonu alebo druhu

alter trigger Zviera_predator_v_pavilone
on Zviera
after update, insert
as
begin

	if exists(
		select * 
			from inserted as i
			where exists (
							select * 
								from u20669148.Predator_zviera_retazec(i.ID_druh) as X
								inner join Zviera as z on(z.ID_druh=X.Predator_OR_Potrava)
								where z.ID_pavilon=i.ID_pavilon
						 )
	)
	begin
		RAISERROR('UPOZORNENIE na predatora a jeho korist v jednom pavilone', 15, 1);
	end;

end;



-- pridanie noveho vztahu pre predatora a jeho korist
create trigger Predator_zmena
on Predator
after update, insert
as
begin
	-- zistenie, ci sa dany predator a jeho potrava(korist) nachadzaju v jednom pavilone (realny zastupcovia danych druhov)
	if exists(
		select *
			from inserted as i
			inner join Zviera as z_pre on(i.ID_predator=z_pre.ID_druh)
			inner join Zviera as z_pot on(i.ID_potrava=z_pot.ID_druh)
			where z_pre.ID_pavilon=z_pot.ID_pavilon
	)
	begin
		RAISERROR('UPOZORNENIE na predatora a jeho korist v jednom pavilone', 15, 1);
	end;
end;







-- PROCEDURY


-- pridanie noveho druhu zvierata
create procedure Novy_druh_zvierata
	@pNazov varchar(70),
	@pNebezpecnost numeric(2,0),
	@pPotrava varchar(30) = ''
as
set nocount on;
begin
	insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values(@pNazov, @pNebezpecnost, @pPotrava);
end;



-- pridanie noveho zvierata do ZOO
create procedure Nove_zviera_vZOO
	@pMeno varchar(60),
	@pDatumNarodenia date = NULL,
	@pVaha numeric(6,3),
	@pVyska numeric(6,3),
	@pDruh numeric(10,0),
	@pPavilon numeric(10,0)
as
set nocount on;
begin

	set @pDatumNarodenia = ISNULL(@pDatumNarodenia, CONVERT(date, GETDATE()));
	insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) 
		values(@pMeno, @pDatumNarodenia, @pVaha, @pVyska, @pDruh, @pPavilon);
		
end;



alter procedure Nove_zviera_vZOO_slovny_popis
	@pMeno varchar(60),
	@pDatumNarodenia date = NULL,
	@pVaha numeric(6,3),
	@pVyska numeric(6,3),
	@pDruh varchar(70),
	@pPavilon varchar(70)
as
set nocount on;
begin
	begin transaction;
	begin try
		declare @xDruhID numeric(10,0);
		set @xDruhID = (select ID from Druh_Zvierata where Druh_Zvierata.Nazov=@pDruh);

		declare @xPavilonID numeric(10,0);
		set @xPavilonID = (select ID from Pavilon where Pavilon.Nazov=@pPavilon);

		EXEC u20669148.Nove_zviera_vZOO @pMeno, @pDatumNarodenia, @pVaha, @pVyska, @xDruhID, @xPavilonID
		commit transaction
	end try
	begin catch
		DECLARE @ErrorMessage NVARCHAR(4000);
		DECLARE @ErrorSeverity INT;
		DECLARE @ErrorState INT;
		SELECT
			@ErrorMessage = ERROR_MESSAGE(),
			@ErrorSeverity = ERROR_SEVERITY(),
			@ErrorState = ERROR_STATE();
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
		ROLLBACK TRANSACTION;        
	end catch
end;



-- pridanie noveho pavilonu netreba, predpokladam, ze musi najprv nastav vystavba (teda dostatocne dlhy proces), t. j. novy pavilon moze pridat administrator databaze
-- taktiez predpokladam, ze sa pridanie noveho pavilonu nastane raz za dost dlhu dobu



-- novy osetrovatel

alter procedure Novy_ostrovatel
	@pMeno varchar(100),
	@pADRstat varchar(50),
	@pADRmesto varchar(50),
	@pADRulica varchar(50),
	@pADRcislo varchar(15),
	@pADRpsc numeric(5,0),
	@pEmail varchar(100) = NULL,
	@pTELpredvolba varchar(6) = '00420',
	@pTELcislo numeric(9,0) = NULL
as
set nocount on;
begin
	begin TRANSACTION;
	begin TRY
		declare @xIDosetrovatel numeric(10,0);
		declare @xIDadresa numeric(10,0);

		insert into Adresa(Stat, Mesto, Ulica, Cislo, PSC) values(@pADRstat, @pADRmesto, @pADRulica, @pADRcislo, @pADRpsc);
		set @xIDadresa = SCOPE_IDENTITY();

		insert into Osetrovatel(Meno, ID_adresa) values(@pMeno, @xIDadresa);
		set @xIDosetrovatel = SCOPE_IDENTITY();

		if @pTELcislo is not null
		begin
			insert into Telefonne_cislo(Predvolba, Cislo, ID_osetrovatel) values(@pTELpredvolba, @pTELcislo, @xIDosetrovatel);
		end;

		if @pEmail is not null
		begin
			insert into Email(Email, ID_osetrovatel) values(@pEmail, @xIDosetrovatel);
		end;
		commit transaction;
	end TRY
	begin CATCH
		DECLARE @ErrorMessage NVARCHAR(4000);
		DECLARE @ErrorSeverity INT;
		DECLARE @ErrorState INT;
		SELECT
			@ErrorMessage = ERROR_MESSAGE(),
			@ErrorSeverity = ERROR_SEVERITY(),
			@ErrorState = ERROR_STATE();
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
		ROLLBACK TRANSACTION; 
	end CATCH
end;



create procedure Pridaj_email_osetrovatelovi
	@pEmail varchar(100),
	@pIDosetrovatel numeric(10,0)
as
set nocount on
begin
	insert into Email(Email, ID_osetrovatel) values(@pEmail, @pIDosetrovatel);
end;



alter procedure Pridaj_email_osetrovatelovi_slovny_popis
	@pEmail varchar(100),
	@pMeno varchar(100)
as
set nocount on
begin
	begin transaction;
	begin try
		declare @pocet numeric, @retval numeric(10,0);
		select @pocet=count(*), @retval=min(ID) from Osetrovatel where Meno=@pMeno;
		if @pocet<>1 
		begin
			RAISERROR('Nutne presne specifikovat ID osetrovatela!', 15, 1);
		end;

		insert into Email(Email, ID_osetrovatel) values(@pEmail, @retval);
		commit transaction;
	end try
	begin catch
		DECLARE @ErrorMessage NVARCHAR(4000);
		DECLARE @ErrorSeverity INT;
		DECLARE @ErrorState INT;
		SELECT
			@ErrorMessage = ERROR_MESSAGE(),
			@ErrorSeverity = ERROR_SEVERITY(),
			@ErrorState = ERROR_STATE();
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
		ROLLBACK TRANSACTION;
	end catch
end;


create procedure Pridaj_telefon_osetrovatelovi
	@pTELpredvolba varchar(6) = '00420',
	@pTELcislo numeric(9,0),
	@pIDosetrovatel numeric(10,0)
as
set nocount on;
begin
	insert into Telefonne_cislo(Predvolba, Cislo, ID_osetrovatel) values(@pTELpredvolba, @pTELcislo, @pIDosetrovatel);
end;



alter procedure Pridaj_telefon_osetrovatelovi_slovny_popis
	@pTELpredvolba varchar(6) = '00420',
	@pTELcislo numeric(9,0),
	@pMeno varchar(100)
as
set nocount on;
begin
	begin transaction;
	begin try
		declare @pocet numeric, @retval numeric(10,0);
		select @pocet=count(*), @retval=min(ID) from Osetrovatel where Meno=@pMeno;
		if @pocet<>1 
		begin
			RAISERROR('Nutne presne specifikovat ID osetrovatela!', 15, 1);
		end;

		insert into Telefonne_cislo(Predvolba, Cislo, ID_osetrovatel) values(@pTELpredvolba, @pTELcislo, @retval);
		commit transaction;
	end try
	begin catch
		DECLARE @ErrorMessage NVARCHAR(4000);
		DECLARE @ErrorSeverity INT;
		DECLARE @ErrorState INT;
		SELECT
			@ErrorMessage = ERROR_MESSAGE(),
			@ErrorSeverity = ERROR_SEVERITY(),
			@ErrorState = ERROR_STATE();
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
		ROLLBACK TRANSACTION;
	end catch
end;



-- pridanie zvieratka na osetrovanie osetrovatelovi

create procedure Pridaj_zviera_na_osetrovanie
	@pIDosetrovatel numeric(10,0),
	@pIDzviera numeric(10,0)
as
set nocount on;
begin
	insert into Osetruje(ID_osetrovatel, ID_zviera) values(@pIDosetrovatel, @pIDzviera);
end;

alter procedure Pridaj_zviera_na_osetrovanie_slovny_popis
	@pMenoOsetrovatel varchar(100),
	@pMenoZvierata varchar(60)
as
set nocount on;
begin
	begin transaction;
	begin try
		declare @pocetO numeric, @xIDosetrovatel numeric(10,0);
		select @pocetO=count(*), @xIDosetrovatel=min(ID) from Osetrovatel where Meno=@pMenoOsetrovatel;
		if @pocetO<>1 
		begin
			RAISERROR('Nutne presne specifikovat ID osetrovatela!', 15, 1);
		end;

		declare @xIDzviera numeric(10,0);
		set @xIDzviera = (select ID from Zviera where Meno=@pMenoZvierata);	

		insert into Osetruje(ID_osetrovatel, ID_zviera) values(@xIDosetrovatel, @xIDzviera);
		commit transaction;
	end try
	begin catch
		DECLARE @ErrorMessage NVARCHAR(4000);
		DECLARE @ErrorSeverity INT;
		DECLARE @ErrorState INT;
		SELECT
			@ErrorMessage = ERROR_MESSAGE(),
			@ErrorSeverity = ERROR_SEVERITY(),
			@ErrorState = ERROR_STATE();
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
		ROLLBACK TRANSACTION;
	end catch
end;



-- pridanie vztahu predator korist
create procedure Pridaj_predatora_korist
	@pIDpredator numeric(10,0),
	@pIDpotrava numeric(10,0)
as
set nocount on;
begin
	insert into Predator(ID_predator, ID_potrava) values(@pIDpredator, @pIDpotrava);
end;

alter procedure Pridaj_predatora_korist_slovny_popis
	@pDruhPredatora varchar(70),
	@pDruhPotravy varchar(70)
as
set nocount on;
begin
	
	declare @xIDpredator numeric(10,0), @xIDpotrava numeric(10,0);
	set @xIDpredator = (select ID from Druh_Zvierata where Nazov=@pDruhPredatora);
	set @xIDpotrava = (select ID from Druh_Zvierata where Nazov=@pDruhPotravy);

	insert into Predator(ID_predator, ID_potrava) values(@xIDpredator, @xIDpotrava);
	
end;




-- procedury na zmenu adresy osetrovatela


create procedure Zmena_Adresy_osetrovatela(
	@pID numeric(10,0),
	@pADRstat varchar(50),
	@pADRmesto varchar(50),
	@pADRulica varchar(50),
	@pADRcislo varchar(15),
	@pADRpsc numeric(5,0)
)
as
set nocount on;
begin

	begin TRANSACTION;
	begin TRY
		declare @xIDadresa numeric(10,0);

		insert into Adresa(Stat, Mesto, Ulica, Cislo, PSC) values(@pADRstat, @pADRmesto, @pADRulica, @pADRcislo, @pADRpsc);
		set @xIDadresa = SCOPE_IDENTITY();

		update Osetrovatel set ID_adresa=@xIDadresa where Osetrovatel.ID=@pID;
		
		commit transaction;
	end TRY
	begin CATCH
		DECLARE @ErrorMessage NVARCHAR(4000);
		DECLARE @ErrorSeverity INT;
		DECLARE @ErrorState INT;
		SELECT
			@ErrorMessage = ERROR_MESSAGE(),
			@ErrorSeverity = ERROR_SEVERITY(),
			@ErrorState = ERROR_STATE();
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
		ROLLBACK TRANSACTION; 
	end CATCH

end;



create procedure Zmena_Adresy_osetrovatela_ID(
	@pIDosetrovatel numeric(10,0),
	@pIDadresa numeric(10,0)
)
as
set nocount on;
begin

	update Osetrovatel set ID_adresa=@pIDadresa where Osetrovatel.ID=@pIDosetrovatel;

end;




create procedure Zmena_Adresy_osetrovatela_slovny_popis(
	@pMeno varchar(100),
	@pADRstat varchar(50),
	@pADRmesto varchar(50),
	@pADRulica varchar(50),
	@pADRcislo varchar(15),
	@pADRpsc numeric(5,0)
)
as
set nocount on;
begin

	begin TRANSACTION;
	begin TRY
		declare @xIDosetrovatel numeric(10,0);
		declare @xIDadresa numeric(10,0);

		insert into Adresa(Stat, Mesto, Ulica, Cislo, PSC) values(@pADRstat, @pADRmesto, @pADRulica, @pADRcislo, @pADRpsc);
		set @xIDadresa = SCOPE_IDENTITY();

		declare @pocet numeric;
		select @pocet=count(*), @xIDosetrovatel=min(ID) from Osetrovatel where Meno=@pMeno;
		if @pocet<>1 
		begin
			RAISERROR('Nutne presne specifikovat ID osetrovatela!', 15, 1);
		end;

		update Osetrovatel set ID_adresa=@xIDadresa where Osetrovatel.ID=@xIDosetrovatel;
		
		commit transaction;
	end TRY
	begin CATCH
		DECLARE @ErrorMessage NVARCHAR(4000);
		DECLARE @ErrorSeverity INT;
		DECLARE @ErrorState INT;
		SELECT
			@ErrorMessage = ERROR_MESSAGE(),
			@ErrorSeverity = ERROR_SEVERITY(),
			@ErrorState = ERROR_STATE();
		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
		ROLLBACK TRANSACTION; 
	end CATCH

end;









