
-- Tema: ZOO
-- Autor: Richard Hvizdoö, 2023
-- najprv otvor a precitaj subor 'Tabulky.sql' !


-- Adresa

insert into Adresa(Stat, Mesto, Ulica, Cislo, PSC) values('Ceska republika', 'Praha', 'Severna', '12603/12', '10900');
insert into Adresa(Stat, Mesto, Ulica, Cislo, PSC) values('Ceska republika', 'Praha', 'Hruskova', '886/1', '14901');
insert into Adresa(Stat, Mesto, Ulica, Cislo, PSC) values('Ceska republika', 'Praha', 'Peskova', '603/2', '19000');
insert into Adresa(Stat, Mesto, Ulica, Cislo, PSC) values('Ceska republika', 'Praha', 'U potoka', '3620/4', '17900');
insert into Adresa(Stat, Mesto, Ulica, Cislo, PSC) values('Ceska republika', 'Praha', 'Rychly svist', '5681/8', '10102');

insert into Adresa(Stat, Mesto, Ulica, Cislo, PSC) values('Ceska republika', 'Praha', 'Nadrazni', '3001/2', '10007');
insert into Adresa(Stat, Mesto, Ulica, Cislo, PSC) values('Ceska republika', 'Praha', 'Jedlickova', '7532/1', '16001');
insert into Adresa(Stat, Mesto, Ulica, Cislo, PSC) values('Ceska republika', 'Praha', 'Rytirska', '603/2', '17700');
insert into Adresa(Stat, Mesto, Ulica, Cislo, PSC) values('Ceska republika', 'Praha', 'U Slovaka', '3865/2', '10300');
insert into Adresa(Stat, Mesto, Ulica, Cislo, PSC) values('Ceska republika', 'Praha', 'Koupaliste', '6993/4', '10702');


-- Osetrovatel

insert into Osetrovatel(Meno, ID_adresa) values('Do Id In Dolor', 4000000000);
insert into Osetrovatel(Meno, ID_adresa) values('Ipsum Lab', 4000000001);
insert into Osetrovatel(Meno, ID_adresa) values('Occ Qui', 4000000002);
insert into Osetrovatel(Meno, ID_adresa) values('Anim Irur', 4000000003);
insert into Osetrovatel(Meno, ID_adresa) values('Magna Id', 4000000004);

insert into Osetrovatel(Meno, ID_adresa) values('Id Bleh Officia', 4000000005);
insert into Osetrovatel(Meno, ID_adresa) values('Huh Veniam', 4000000006);
insert into Osetrovatel(Meno, ID_adresa) values('Culpa In Dolor', 4000000007);
insert into Osetrovatel(Meno, ID_adresa) values('Qui Duis', 4000000008);
insert into Osetrovatel(Meno, ID_adresa) values('Ut Dese In', 4000000009);


-- Email

insert into Email(Email, ID_osetrovatel) values('doidondolor@xxx.cz', 5000000000);
insert into Email(Email, ID_osetrovatel) values('doidondolor@yyy.cz', 5000000000);
insert into Email(Email, ID_osetrovatel) values('doidondolor@zzz.cz', 5000000000);
insert into Email(Email, ID_osetrovatel) values('ipsumlab@xxx.cz', 5000000001);
insert into Email(Email, ID_osetrovatel) values('occqui@xxx.cz', 5000000002);

insert into Email(Email, ID_osetrovatel) values('animirur@xxx.cz', 5000000003);
insert into Email(Email, ID_osetrovatel) values('animirur@yyy.cz', 5000000003);
insert into Email(Email, ID_osetrovatel) values('magnaid@xxx.cz', 5000000004);
insert into Email(Email, ID_osetrovatel) values('magnaid@zzz.cz', 5000000004);
insert into Email(Email, ID_osetrovatel) values('idblehofficia@xxx.cz', 5000000005);

insert into Email(Email, ID_osetrovatel) values('huhveniam@xxx.cz', 5000000006);
insert into Email(Email, ID_osetrovatel) values('culpaindolor@xxx.cz', 5000000007);
insert into Email(Email, ID_osetrovatel) values('quiduis@xxx.cz', 5000000008);
insert into Email(Email, ID_osetrovatel) values('utdesein@xxx.cz', 5000000009);
insert into Email(Email, ID_osetrovatel) values('utdesein@yyy.cz', 5000000009);


-- Telefonne cislo

insert into Telefonne_cislo(Cislo, ID_osetrovatel) values(369952105, 5000000000);
insert into Telefonne_cislo(Cislo, ID_osetrovatel) values(600598406, 5000000001);
insert into Telefonne_cislo(Cislo, ID_osetrovatel) values(900663248, 5000000002);
insert into Telefonne_cislo(Cislo, ID_osetrovatel) values(503661124, 5000000003);
insert into Telefonne_cislo(Cislo, ID_osetrovatel) values(910558247, 5000000003);

insert into Telefonne_cislo(Cislo, ID_osetrovatel) values(911007101, 5000000004);
insert into Telefonne_cislo(Cislo, ID_osetrovatel) values(563001255, 5000000005);
insert into Telefonne_cislo(Cislo, ID_osetrovatel) values(662531970, 5000000006);
insert into Telefonne_cislo(Cislo, ID_osetrovatel) values(741559031, 5000000007);
insert into Telefonne_cislo(Cislo, ID_osetrovatel) values(122446893, 5000000008);
insert into Telefonne_cislo(Cislo, ID_osetrovatel) values(741638859, 5000000009);
insert into Telefonne_cislo(Cislo, ID_osetrovatel) values(726658009, 5000000009);


-- Pavilon

insert into Pavilon(Nazov, MaxPocetNavstevnikov, Zabezpecenie, PocetOddeleni) values('PavilÛn mravcov', 220, 5, 1);
insert into Pavilon(Nazov, MaxPocetNavstevnikov, Zabezpecenie, PocetOddeleni) values('PavilÛn opÌc', 191, 12, 8);
insert into Pavilon(Nazov, MaxPocetNavstevnikov, Zabezpecenie, PocetOddeleni) values('PavilÛn lietaj˙ceho hmyzu', 107, 5, 12);
insert into Pavilon(Nazov, MaxPocetNavstevnikov, Zabezpecenie, PocetOddeleni) values('PavilÛn lesn˝ch zvierat', 171, 7, 6);
insert into Pavilon(Nazov, MaxPocetNavstevnikov, Zabezpecenie, PocetOddeleni) values('PavilÛn nelietav˝ch vt·kov', 120, 6, 3);

insert into Pavilon(Nazov, MaxPocetNavstevnikov, Zabezpecenie, PocetOddeleni) values('PavilÛn vt·kov', 238, 8, 6);
insert into Pavilon(Nazov, MaxPocetNavstevnikov, Zabezpecenie, PocetOddeleni) values('PavilÛn plazov', 257, 9, 20);
insert into Pavilon(Nazov, MaxPocetNavstevnikov, Zabezpecenie, PocetOddeleni) values('PavilÛn zimn˝ch zvierat', 95, 10, 3);
insert into Pavilon(Nazov, MaxPocetNavstevnikov, Zabezpecenie, PocetOddeleni) values('PavilÛn pav˙kov', 247, 5, 7);
insert into Pavilon(Nazov, MaxPocetNavstevnikov, Zabezpecenie, PocetOddeleni) values('PavilÛn hospod·rskych zvierat', 184, 10, 13);

insert into Pavilon(Nazov, MaxPocetNavstevnikov, Zabezpecenie, PocetOddeleni) values('PavilÛn vodn˝ch zvierat', 281, 10, 7);
insert into Pavilon(Nazov, MaxPocetNavstevnikov, Zabezpecenie, PocetOddeleni) values('PavilÛn oce·n', 239, 9, 11);
insert into Pavilon(Nazov, MaxPocetNavstevnikov, Zabezpecenie, PocetOddeleni) values('PavilÛn Amerika', 171, 4, 4);
insert into Pavilon(Nazov, MaxPocetNavstevnikov, Zabezpecenie, PocetOddeleni) values('PavilÛn Afrika', 247, 6, 14);
insert into Pavilon(Nazov, MaxPocetNavstevnikov, Zabezpecenie, PocetOddeleni) values('PavilÛn ¡zia', 256, 10, 16);

insert into Pavilon(Nazov, MaxPocetNavstevnikov, Zabezpecenie, PocetOddeleni) values('PavilÛn EurÛpa', 33, 8, 1);
insert into Pavilon(Nazov, MaxPocetNavstevnikov, Zabezpecenie, PocetOddeleni) values('PavilÛn Austr·lia', 87, 12, 24);


-- Druh Zvierata

insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Lev p˙öùov˝', 6, 'maso');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Slon africk˝', 5, 'bylinky');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Antilopa sk·kav·', 3, 'trava');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Hroch obojûiveln˝', 5, 'vodna rastlina');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Zebra stepnÌ', 4, 'trava');

insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('éirafa severnÌ', 3, 'rastliny');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Hyena skvrnit·', 6, 'maso');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Nosoroûec dvouroh˝', 5, 'trava');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Buvol africk˝', 5, 'trava');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Orangutan bornejsk˝', 4, 'trava');

insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Levhart indick˝', 6, 'maso');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Panda veæk·', 5, 'bambus');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Panda Ëerven·', 3, 'bylinky');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Varan komodsk˝', 5, 'maso');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Jak divok˝', 4, 'trava');

insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Tygr indick˝', 7, 'maso');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Krokod˝l mo¯sk˝', 5, 'maso');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Makak j·vsk˝', 3, 'bylinky obratlovce');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Gibon st¯Ìbrn˝', 3, 'rastliny');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Sob pol·rnÌ', 2, 'trava');

insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('LÌöka pol·rnÌ', 5, 'maso');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('MedveÔ lednÌ', 6, 'maso');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Koala medvÌdkovit˝', 3, 'eukaliptus');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Klokan rud˝', 5, 'rastliny');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Emu hnÏd˝', 4, 'bobule');

insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Kakadu bÌl˝', 2, 'rostliny');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Kakadu ·rov˝', 2, 'rostliny');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('éralok bÌl˝', 7, 'maso');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('»ty¯hranka Fleckerova', 4, '');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Pakobra australsk·', 4, 'plazy');

insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Leug·n zelen˝', 2, 'rostliny');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Vydra obrovsk·', 3, 'maso');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Ara olivov·', 2, 'semiaËka');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Kolib¯Ìk rubÌnohrl˝', 2, '');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Rys ostrovid', 4, 'maso');

insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Lykoûr˙t seversk˝', 2, 'rostliny');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Zubr evropsk˝', 3, 'rostliny');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Vlk eurasijsk˝', 6, 'maso');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Srnec obecn˝', 4, 'bylinky');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Kuna lesnÌ', 4, 'maso');

insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('KamzÌk vrchovsk˝', 2, 'rostliny');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Bocian biely', 2, 'maso');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Tur dom·ci', 3, 'rastliny');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Ovca dom·ca', 2, 'rastliny');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Kura dom·ca', 2, 'vöetko');

insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Koza dom·ca', 2, 'rostliny');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('SviÚa dom·ca', 2, 'vöetko');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Morka dom·ca', 2, 'rastliny');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('MedveÔ hned˝', 5, 'vöetko');
insert into Druh_Zvierata(Nazov, Nebezpecnost, Potrava) values('Myö panÛnska', 2, 'semiaËka rastliny');


-- Predator

insert into Predator(ID_predator, ID_potrava) values(1000000023, 1000000001);
insert into Predator(ID_predator, ID_potrava) values(1000000021, 1000000014);
insert into Predator(ID_predator, ID_potrava) values(1000000021, 1000000001);
insert into Predator(ID_predator, ID_potrava) values(1000000019, 1000000020);
insert into Predator(ID_predator, ID_potrava) values(1000000019, 1000000018);

insert into Predator(ID_predator, ID_potrava) values(1000000016, 1000000020);
insert into Predator(ID_predator, ID_potrava) values(1000000016, 1000000021);
insert into Predator(ID_predator, ID_potrava) values(1000000047, 1000000044);
insert into Predator(ID_predator, ID_potrava) values(1000000046, 1000000045);
insert into Predator(ID_predator, ID_potrava) values(1000000044, 1000000027);

insert into Predator(ID_predator, ID_potrava) values(1000000044, 1000000001);
insert into Predator(ID_predator, ID_potrava) values(1000000044, 1000000039);
insert into Predator(ID_predator, ID_potrava) values(1000000046, 1000000045);
insert into Predator(ID_predator, ID_potrava) values(1000000037, 1000000035);
insert into Predator(ID_predator, ID_potrava) values(1000000037, 1000000038);

insert into Predator(ID_predator, ID_potrava) values(1000000037, 1000000034);
insert into Predator(ID_predator, ID_potrava) values(1000000000, 1000000035);
insert into Predator(ID_predator, ID_potrava) values(1000000000, 1000000036);
insert into Predator(ID_predator, ID_potrava) values(1000000000, 1000000039);
insert into Predator(ID_predator, ID_potrava) values(1000000000, 1000000033);


-- Zviera

insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Peter', '2018-09-24' , 0.5, 1, 1000000010, 2000000011);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Henrieta', '1952-01-31' , 38.6, 1, 1000000019, 2000000003);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Frederika', '1990-08-12' , 93, 2, 1000000035, 2000000013);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Hyacint', '1966-08-30' ,120.8, 2, 1000000034, 2000000013);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Fero', '1982-01-14' , 48, 1.2, 1000000027, 2000000009);

insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('TucTuc', '1973-06-24' , 0.94, 1, 1000000012, 2000000006);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Bonif·c', '1970-11-08' , 89, 2.65, 1000000009, 2000000011);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Ingrida', '1978-03-26' , 160, 2.13, 1000000039, 2000000013);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Aneta', '1994-02-08' ,70.8, 1, 1000000027, 2000000009);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Ivo', '2014-10-08' , 0.138, 0.2, 1000000017, 2000000003);

insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Bernard', '1953-03-26' , 0.5, 0.32, 1000000001, 2000000005);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('éofia', '1961-09-28' , 98.6, 1.42, 1000000050, 2000000007);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Duöan', '1973-05-25' , 93, 2, 1000000020, 2000000003);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Emil', '2023-04-09', 2.8, 2, 1000000010, 2000000011);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('J˙lia', '2023-04-23', 57.9, 1.2, 1000000025, 2000000009);

insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Filip', '1984-02-16' , 10.5, 1, 1000000029, 2000000009);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Valdemart', '1990-11-19', 128, 3.2, 1000000047, 2000000011);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Gertr˙da', '1991-05-13' , 97.3, 2, 1000000005, 2000000016);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Lenka', '1971-12-08' ,128, 2, 1000000045, 2000000014);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Oxana', '2014-07-14' , 98, 1.2, 1000000024, 2000000009);

insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Vilma', '1980-04-04', 105, 1.4, 1000000000, 2000000013);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Ferdinand', '1997-09-01', 4, 1, 1000000026, 2000000009);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Laura', '1984-01-28' , 2.3, 1, 1000000026, 2000000009);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Tamara', '2009-04-21' ,128, 2, 1000000003, 2000000007);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Kevin', '1994-03-06' , 99.8, 1.2, 1000000039, 2000000013);

insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Dalibor', '1997-04-25' , 105, 1.78, 1000000041, 2000000014);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Marek', '1996-02-26', 153.6, 1.5, 1000000035, 2000000013);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('VladimÌr', '2002-11-20' , 24.3, 1, 1000000021, 2000000003);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Stanislav', '1957-11-20', 98, 2, 1000000020, 2000000003);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('MargarÈta', '1965-07-24' , 94, 1.2, 1000000025, 2000000009);

insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Gita', '1971-08-19' , 105, 1.78, 1000000025, 2000000009);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('RÛbert', '1966-03-07', 102, 1.5, 1000000046, 2000000014);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Slavoj', '1954-04-18' , 94.8, 1.8, 1000000004, 2000000016);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Bruno', '1955-01-27', 98, 2, 1000000029, 2000000009);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Adolf', '1971-07-07' , 92.35, 1.65, 1000000016, 2000000003);

insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Vasil', '2005-11-07' , 107.42, 1.9, 1000000045, 2000000014);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Anton', '1987-12-23', 72, 1.5, 1000000022, 2000000003);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('VÌt', '2013-10-06' , 81.4, 2, 1000000023, 2000000005);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Zlatko', '1958-07-16', 98, 2, 1000000040, 2000000001);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Bianka', '1991-01-13' , 63.45, 1.5, 1000000004, 2000000016);

insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Milan', '1971-10-01' , 117, 1.59, 1000000038, 2000000013);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('SidÛna', '2002-05-30', 92, 2.5, 1000000047, 2000000011);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('PaulÌna', '1970-07-20' , 81.4, 1.24, 1000000020, 2000000003);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('ValÈria', '2018-10-21', 97.26, 2, 1000000050, 2000000007);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Be·ta', '1969-03-20' , 83.5, 1.2, 1000000028, 2000000009);

insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Ladislav', '2014-10-31' , 0.235, 0.59, 1000000015, 2000000005);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Mel·nia', '1994-10-01', 0.2, 0.31, 1000000014, 2000000005);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Nat·lia', '2014-12-20' , 81.4, 1.24, 1000000049, 2000000001);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Miroslav', '2016-03-06', 7.26, 2, 1000000044, 2000000014);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Nora', '2002-05-02' , 89.9, 1.4, 1000000000, 2000000013);

insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Margita', '1980-03-04' , 100.235, 4.59, 1000000032, 2000000013);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Luboö', '1960-05-02', 90.2, 1.31, 1000000042, 2000000014);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Duöana', '1966-02-23' , 81.4, 1.24, 1000000013, 2000000010);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Kriötof', '1996-08-14', 70.6, 2, 1000000005, 2000000016);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Alena', '2012-04-14' , 90.9, 1.47, 1000000018, 2000000015);

insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('M·ria', '1971-04-13' , 90, 4.59, 1000000036, 2000000013);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Jolana', '2010-12-12', 9.4, 3.38, 1000000011, 2000000006);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Stela', '1995-09-14' , 87.5, 1.86, 1000000035, 2000000013);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Tibor', '1982-05-26', 70.6, 2.37, 1000000006, 2000000004);
insert into Zviera(Meno, Datum_narodenia, Vaha, Vyska, ID_druh, ID_pavilon) values('Ren·ta', '1975-08-18' , 90.9, 1.47, 1000000033, 2000000013);


-- Osetruje

insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000007, 5000000000);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000008, 5000000003);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000009, 5000000000);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000010, 5000000004);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000011, 5000000007);

insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000012, 5000000003);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000013, 5000000007);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000014, 5000000000);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000015, 5000000004);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000016, 5000000003);

insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000018, 5000000000);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000019, 5000000003);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000020, 5000000004);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000021, 5000000002);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000022, 5000000003);

insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000023, 5000000003);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000025, 5000000007);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000026, 5000000007);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000027, 5000000008);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000032, 5000000008);

insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000033, 5000000008);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000034, 5000000006);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000037, 5000000007);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000038, 5000000001);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000039, 5000000009);

insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000048, 5000000001);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000049, 5000000009);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000050, 5000000009);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000052, 5000000000);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000053, 5000000004);

insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000007, 5000000000);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000007, 5000000002);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000007, 5000000009);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000007, 5000000002);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000007, 5000000002);

insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000054, 5000000003);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000055, 5000000004);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000056, 5000000005);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000057, 5000000000);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000058, 5000000004);

insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000059, 5000000005);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000060, 5000000000);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000061, 5000000001);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000062, 5000000005);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000063, 5000000001);

insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000064, 5000000001);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000065, 5000000008);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000067, 5000000001);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000068, 5000000002);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000069, 5000000008);

insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000070, 5000000000);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000071, 5000000009);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000072, 5000000002);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000073, 5000000005);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000074, 5000000004);

insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000076, 5000000005);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000077, 5000000009);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000078, 5000000000);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000079, 5000000000);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000082, 5000000005);

insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000083, 5000000001);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000084, 5000000006);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000085, 5000000006);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000086, 5000000006);
insert into Osetruje(ID_zviera, ID_osetrovatel) values(6000000087, 5000000001);






