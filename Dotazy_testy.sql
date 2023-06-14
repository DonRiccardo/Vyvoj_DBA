
-- Tema: ZOO
-- Autor: Richard Hvizdoš, 2023
-- najprv otvor a precitaj subor 'Tabulky.sql' !



-- POHLADY

select * from Zvierata;
select * from Pavilony;
select * from Predatori_Koriste;
select * from Osetrovatelia;
select * from Osetruju_zvierata;



-- TEST TRIGGEROV, PROCESOV


-- pridanie noveho zvieratka, vytvorenie jedinca daneho druhu v ZOO
-- zmena jeho nebezpecnosti na hodnoty vyssiu ako je zabezpecenie pavilonu = vyhodenie chyby
EXEC u20669148.Novy_druh_zvierata MOJApanda, 1;
EXEC u20669148.Nove_zviera_vZOO XYZ,null ,99, 99, 1000000051, 2000000000;
-- alebo pomocou druhej procedury:
-- EXEC u20669148.Nove_zviera_vZOO_slovny_popis XXYZ, null, 98, 98, MOJApanda, 'Pavilón mravcov';
update Druh_Zvierata set Nebezpecnost=50 where Nazov='MOJApanda';
-- pridanie do pavilonu s nevyhovujucim zabezpecenim = vyhodenie chyby
delete from Zviera where Meno='XYZ';
update Druh_Zvierata set Nebezpecnost=50 where Nazov='MOJApanda';
EXEC u20669148.Nove_zviera_vZOO XXYZ,null ,99, 99, 1000000051, 2000000002;

-- zmena zabezpecenia pavilonu na mensiu ako je nebezpecnost zvierat = vyhodenie chyby
update Pavilon set Zabezpecenie=1 where ID=2000000001;

-- zmena poctu oddeleni na mensi pocet ako sa v pavilone nachadza druhov zvierat = vyhodenie chyby
update Pavilon set PocetOddeleni=1 where ID=2000000001;

-- pridanie noveho druhu do pavilonu, kde su oddelania obsadene druhmi zvierat = vyhodenie chyby
EXEC u20669148.Nove_zviera_vZOO XYZ,null ,99, 99, 1000000000, 2000000003;

-- kontrola, ci su predator a korist v jednom pavilone = upozornenie
EXEC u20669148.Nove_zviera_vZOO XYZ,null ,99, 99, 1000000023, 2000000005;

-- kontrola insertu/update hodnot v tabulke predatori = ak su v jednom pavilone = upozornenie
EXEC u20669148.Pridaj_predatora_korist 1000000024, 1000000026;

-- pridanie noveho osetrovatela 
EXEC u20669148.Novy_ostrovatel 'Ferko Rýchly', 'CZ', 'Zlín', 'Dlhá', 563, 15520;
EXEC u20669148.Novy_ostrovatel 'Ferko Pomalý', 'CZ', 'Gottwaldov', 'Krátka', 547, 95580, 'ferko@pomaly.cz', '00420', 985630002;

-- pridanie emailu osetrovatelovi
EXEC u20669148.Pridaj_email_osetrovatelovi 'tutu@ata.cz', 5000000035;
EXEC u20669148.Pridaj_email_osetrovatelovi_slovny_popis 'tatat@hej.hu', 'Ferko Pomalý';

-- pridaj telefon osetrovatelovi
EXEC u20669148.Pridaj_telefon_osetrovatelovi '00421', 563321007, 5000000035;
EXEC u20669148.Pridaj_telefon_osetrovatelovi_slovny_popis'00421', 563321017, 'Ferko Pomalý';

-- pridaj zviera na osetrovanie
EXEC u20669148.Pridaj_zviera_na_osetrovanie 5000000035, 6000000115;
EXEC u20669148.Pridaj_zviera_na_osetrovanie_slovny_popis 'Ferko Pomalý', 'XYZ';

-- pridaj predatora a korist
EXEC u20669148.Pridaj_predatora_korist 1000000046, 1000000045;
EXEC u20669148.Pridaj_predatora_korist_slovny_popis 'Tygr indický', 'Jak divoký';




-- DROP SCHEMY

drop view Zvierata;
drop view Pavilony;
drop view Predatori_Koriste;
drop view Osetrovatelia;
drop view Osetruju_zvierata;

drop procedure u20669148.Nove_zviera_vZOO;
drop procedure u20669148.Nove_zviera_vZOO_slovny_popis;
drop procedure u20669148.Novy_druh_zvierata;
drop procedure u20669148.Novy_ostrovatel;
drop procedure u20669148.Pridaj_email_osetrovatelovi;
drop procedure u20669148.Pridaj_email_osetrovatelovi_slovny_popis;
drop procedure u20669148.Pridaj_predatora_korist;
drop procedure u20669148.Pridaj_predatora_korist_slovny_popis;
drop procedure u20669148.Pridaj_telefon_osetrovatelovi;
drop procedure u20669148.Pridaj_telefon_osetrovatelovi_slovny_popis;
drop procedure u20669148.Pridaj_zviera_na_osetrovanie;
drop procedure u20669148.Pridaj_zviera_na_osetrovanie_slovny_popis;
drop procedure u20669148.Zmena_Adresy_osetrovatela;
drop procedure u20669148.Zmena_Adresy_osetrovatela_ID;
drop procedure u20669148.Zmena_Adresy_osetrovatela_slovny_popis;


drop table Email;
drop table Telefonne_cislo;
drop table Osetruje;
drop table Osetrovatel;
drop table Adresa;
drop table Predator;
drop table Zviera;
drop table Druh_Zvierata;
drop table Pavilon;


