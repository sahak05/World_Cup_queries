/*Coupe du monde 2018
    Pays :
    8 eme finale : Uruguay Portugal France Argentine Bresil Mexique
                    Belgique Japon Espagne Russie Croatie Danemark Suede Suisse
                    Colombie Angleterre
*/

insert into Coupe_du_monde values (2018, "Russie")

--Equipe
insert into Equipe values       ("Russie", 2018, 24), ("Uruguay", 2018, 7), ("Portugal", 2018, 6),
                                ("France", 2018, 10), ("Argentine", 2018, 4), ("Bresil", 2018, 19),
                                ("Mexique", 2018, 20), ("Belgique", 2018, 21), ("Japon", 2018, 22),
                                ("Espagne", 2018, 23), ("Croatie", 2018, 25),
                                ("Danemark", 2018, 26), ("Suede", 2018, 27), ("Suisse", 2018, 28),
                                ("Colombie", 2018, 5), ("Angleterre", 2018, 30)

--Entraineurs
insert into Entraineur values   (7, 'Oscar', 'Tabarez', '1947-03-03', '1970-07-13'),
                                (6, 'Fernando', 'Santos', '1954-10-10', '1980-10-10'),
                                (10, 'Didier', 'Deschamps', '1968-10-15', '1986-04-04'),
                                (4, 'Jorge', 'Sampaoli', '1960-03-13', '1990-04-17'),
                                (19, "Adenor", "Bacchi", "1961-05-25", "1990-06-08"),
                                (20, "Juan", "Arbelaez", "1961-08-06", "2000-11-10"),
                                (21, "Roberto", "Montoliu", "1973-07-13", "2007-09-05"),
                                (22, "Akira", "Nishino", "1955-04-07", "1998-12-05"),
                                (23, "Julen", "Lopetegui", "1966-08-28", "1983-08-03"),
                                (24, "Stanislav", "Tchertchessov", "1963-09-02", "1981-09-11"),
                                (25, "Zlatko", "Dalic", "1966-10-26", "1983-08-07"),
                                (26, "Age", "Hareide", "1953-09-23", "1970-04-23"),
                                (27, "Janne", "Andersson", "1962-09-29"," 1979-10-30"),
                                (28, "Vladimir", "Petkovic", "1963-08-15", "1981-05-17"),
                                (5, 'Jose', 'Pekerman', '1949-09-03', '1970-01-11'),
                                (30, "Gareth", "Southgate", "1970-09-03", "1989-07-10")

--Joueurs et leurs equipes
--Russie
insert into Joueur values (300, "Igor", "Akinfeiev", "1986-04-08", "2004-01-20");
insert into Appartient values (300, "Russie", 2018, "Gardien", 1); 

insert into Joueur values (301, "Mario", "Fernandes", "1990-09-19", "2007-03-01");
insert into Appartient values (301, "Russie", 2018, "Defenseur", 2);

insert into Joueur values (302, "Ilia", "Koutepov", "1993-07-29", "2016-09-01");
insert into Appartient values (302, "Russie", 2018, "Defenseur", 3);

insert into Joueur values (303, "Fiodor", "Koudriachov", "1987-04-05", "2016-10-21");
insert into Appartient values (303, "Russie", 2018, "Defenseur", 13);

insert into Joueur values (304, "Denis", "Tcherychev", "1990-12-26", "2012-01-13");
insert into Appartient values (304, "Russie", 2018, "Milieu offensif", 6);

insert into Joueur values (305, "Fiodor", "Smolov", "1990-02-09", "2012-08-17");
insert into Appartient values (305, "Russie", 2018, "Attaquant", 10);

--Uruguay
insert into Joueur values (306, "Fernando", "Muslera", "1986-06-16", "2007-02-13");
insert into Appartient values (306, "Uruguay", 2018, "Gardien", 1);

insert into Joueur values (307, "Jose", "Gimenez", "1995-01-20", "2012-09-12");
insert into Appartient values (307, "Uruguay", 2018, "Defenseur", 2);

insert into Joueur values (308, "Diego", "Godin", "1986-02-16", "2008-04-21");
insert into Appartient values (308, "Uruguay", 2018, "Defenseur", 3);

insert into Joueur values (309, "Carlos", "Sanchez", "1984-12-02", "2008-02-21");
insert into Appartient values (309, "Uruguay", 2018, "Milieu defensif", 5);

insert into Joueur values (310, "Rodrigo", "Bentancur", "1997-06-25", "2013-08-19");
insert into Appartient values (310, "Uruguay", 2018, "Milieu offensif", 6);

insert into Joueur values (311, "Luis", "Suarez", "1987-01-24", "2007-09-11");
insert into Appartient values (311, "Uruguay", 2018, "Attaquant", 9);


--Portugal
insert into Joueur values (312, "Rui", "Patricio", "1988-02-15", "2010-01-17");
insert into Appartient values (312, "Portugal", 2018, "Gardien", 1);

insert into Joueur values (313, "Bruno", "Alves", "1981-11-27", "2007-08-29");
insert into Appartient values (313, "Portugal", 2018, "Defenseur", 2);

insert into Joueur values (314, "Bernardo", "Silva", "1994-08-10", "2013-01-11");
insert into Appartient values (314, "Portugal", 2018, "Milieu offensif", 11);

insert into Joueur values (315, "Cristiano", "Ronaldo", "1985-02-05", "2006-01-02");
insert into Appartient values (315, "Portugal", 2018, "Attaquant", 7);

insert into Joueur values (316, "Ricardo", "Quaresma", "1983-09-26", "2007-02-19");
insert into Appartient values (316, "Portugal", 2018, "Attaquant", 20);

--France
insert into Joueur values (317, "Hugo", "Lloris", "1986-12-26", "2008-01-21");
insert into Appartient values (317, "France", 2018, "Gardien", 1);

insert into Joueur values (318, "Raphael", "Varane", "1993-04-25", "2013-03-13");
insert into Appartient values (318, "France", 2018, "Defenseur", 4);

insert into Joueur values (319, "Samuel", "Umtiti", "1993-11-14", "2016-08-26");
insert into Appartient values (319, "France", 2018, "Defenseur", 5);

insert into Joueur values (320, "Paul", "Pogba", "1993-03-15", "2013-06-22");
insert into Appartient values (320, "France", 2018, "Milieu offensif", 6);

insert into Joueur values (321, "Kylian", "Mbappe", "1998-12-20", "2015-01-12");
insert into Appartient values (321, "France", 2018, "Attaquant", 10);

insert into Joueur values (322, "Ousmane", "Dembele", "1997-05-15", "2014-07-28");
insert into Appartient values (322, "France", 2018, "Attaquant", 11);


--Argentine
insert into Joueur values (323, "Nahuel", "Guzman", "1986-02-10", "2008-06-30");
insert into Appartient values (323, "Argentine", 2018, "Gardien", 1);

insert into Joueur values (324, "Gabriel", "Mercado", "1987-03-18", "2010-04-11");
insert into Appartient values (324, "Argentine", 2018, "Defenseur", 2);

insert into Joueur values (325, "Marcos", "Rojo", "1990-03-18", "2011-02-14");
insert into Appartient values (325, "Argentine", 2018, "Defenseur", 16);

insert into Joueur values (326, "Lucas", "Biglia", "1986-01-30", "2009-07-12");
insert into Appartient values (326, "Argentine", 2018, "Milieu offensif", 5);

insert into Joueur values (327, "Lionel", "Messi", "1987-06-24", "2004-03-12");
insert into Appartient values (327, "Argentine", 2018, "Attaquant", 10);

insert into Joueur values (328, "Paulo", "Dybala", "1993-11-15", "2012-08-14");
insert into Appartient values (328, "Argentine", 2018, "Attaquant", 21);


--Bresil
insert into Joueur values (329, "Alisson", "Becker", "1992-10-02", "2011-03-22");
insert into Appartient values (329, "Bresil", 2018, "Gardien", 1);

insert into Joueur values (330, "Thiago", "Silva", "1984-08-22", "2006-07-13");
insert into Appartient values (330, "Bresil", 2018, "Defenseur", 2);

insert into Joueur values (331, "Marcelo", "Vieira", "1988-05-12", "2009-10-16");
insert into Appartient values (331, "Bresil", 2018, "Defenseur", 12);

insert into Joueur values (332, "Philippe", "Coutinho", "1992-06-12", "2011-03-02");
insert into Appartient values (332, "Bresil", 2018, "Milieu offensif", 11);

insert into Joueur values (333, "Roberto", "Firmino", "1991-10-02", "2012-03-11");
insert into Appartient values (333, "Bresil", 2018, "Attaquant", 20);

insert into Joueur values (334, "Gabriel", "Jesus", "1997-03-03", "2012-02-16");
insert into Appartient values (334, "Bresil", 2018, "Attaquant", 9);


--Mexique
insert into Joueur values (335, "Guillermo", "Ochoa", "1985-07-13", "2008-02-14");
insert into Appartient values (335, "Mexique", 2018, "Gardien", 1);

insert into Joueur values (336, "Hector", "Moreno", "1988-01-17", "2008-12-11");
insert into Appartient values (336, "Mexique", 2018, "Defenseur", 15);

insert into Joueur values (337, "Carlos", "Salcedo", "1993-09-29", "2012-06-02");
insert into Appartient values (337, "Mexique", 2018, "Defenseur", 3);

insert into Joueur values (338, "Hector", "Herrera", "1990-04-19", "2010-05-19");
insert into Appartient values (338, "Mexique", 2018, "Milieu offensif", 16);

insert into Joueur values (339, "Raul", "Jimenez", "1991-05-05", "2008-02-16");
insert into Appartient values (339, "Mexique", 2018, "Attaquant", 9);


--Belgique
insert into Joueur values (340, "Thibaut", "Courtois", "1992-05-11", "2010-01-11");
insert into Appartient values (340, "Belgique", 2018, "Gardien", 1);

insert into Joueur values (341, "Thomas", "Meunier", "1991-09-12", "2011-10-21");
insert into Appartient values (341, "Belgique", 2018, "Defenseur", 15);

insert into Joueur values (342, "Kevin", "De Bruyne", "1991-05-28", "2013-09-12");
insert into Appartient values (342, "Belgique", 2018, "Milieu offensif", 7);

insert into Joueur values (343, "Yannick", "Carrasco", "1993-09-04", "2013-08-24");
insert into Appartient values (343, "Belgique", 2018, "Defenseur", 11);

insert into Joueur values (344, "Eden", "Hazard", "1991-01-07", "2009-11-21");
insert into Appartient values (344, "Belgique", 2018, "Attaquant", 9);

--Japon
insert into Joueur values (345, "Eiji", "Kawashima", "1983-03-20", "2006-12-22");
insert into Appartient values (345, "Japon", 2018, "Gardien", 1);
                                
insert into Joueur values (346, "Yuto", "Nagatomo", "1986-09-12", "2008-01-21");
insert into Appartient values (346, "Japon", 2018, "Defenseur", 5);

insert into Joueur values (347, "Hiroki", "Sakai", "1990-04-12", "2010-04-17");
insert into Appartient values (347, "Japon", 2018, "Defenseur", 19);

insert into Joueur values (348, "Shinji", "Kagawa", "1989-03-17", "2012-02-22");
insert into Appartient values (348, "Japon", 2018, "Milieu offensif", 10);

insert into Joueur values (349, "Shinji", "Okazaki", "1986-04-16", "2008-06-12");
insert into Appartient values (349, "Japon", 2018, "Attaquant", 9);


--Espagne
insert into Joueur values (350, "David", "De Gea", "1990-11-07", "2006-03-26");
insert into Appartient values (350, "Espagne", 2018, "Gardien", 1);

insert into Joueur values (351, "Dani", "Carvajal", "1992-01-11", "2009-12-26");
insert into Appartient values (351, "Espagne", 2018, "Defenseur", 2);

insert into Joueur values (352, "Sergio", "Busquets", "1988-07-16", "2007-02-10");
insert into Appartient values (352, "Espagne", 2018, "Milieu defensif", 5);

insert into Joueur values (353, "Thiago", "Alcantara", "1991-04-11", "2011-08-21");
insert into Appartient values (353, "Espagne", 2018, "Milieu offensif", 10);

insert into Joueur values (354, "Diego", "Costa", "1988-10-07", "2008-06-19");
insert into Appartient values (354, "Espagne", 2018, "Attaquant", 19);

--Croatie
insert into Joueur values (355, "Dominik", "Livakovic", "1995-01-09", "2012-09-03");
insert into Appartient values (355, "Croatie", 2018, "Gardien", 1);

insert into Joueur values (356, "Dejan", "Lovren", "1989-07-05", "2010-05-11");
insert into Appartient values (356, "Croatie", 2018, "Defenseur", 6);

insert into Joueur values (357, "Josip", "Pivaric", "1989-01-30", "2011-03-02");
insert into Appartient values (357, "Croatie", 2018, "Defenseur", 22);

insert into Joueur values (358, "Ivan", "Rakitic", "1988-03-10", "2010-02-15");
insert into Appartient values (358, "Croatie", 2018, "Milieu offensif", 7);

insert into Joueur values (359, "Mario", "Mandzukic", "1989-02-02", "2008-01-15");
insert into Appartient values (359, "Croatie", 2018, "Attaquant", 17);

--Danemark
insert into Joueur values (360, "Kasper", "Schmeichel", "1986-11-05", "2010-07-19");
insert into Appartient values (360, "Danemark", 2018, "Gardien", 1);

insert into Joueur values (361, "Andreas", "Christensen", "1996-04-10", "2013-07-02");
insert into Appartient values (361, "Danemark", 2018, "Defenseur", 6);

insert into Joueur values (362, "Christian", "Eriksen", "1992-02-14", "2010-04-10");
insert into Appartient values (362, "Danemark", 2018, "Milieu offensif", 10);

insert into Joueur values (363, "Martin", "Braithwaite", "1991-06-05", "2011-10-18");
insert into Appartient values (363, "Danemark", 2018, "Attaquant", 11);

insert into Joueur values (364, "Yussuf", "Poulsen", "1994-06-15", "2012-05-11");
insert into Appartient values (364, "Danemark", 2018, "Attaquant", 20);


--Suede
insert into Joueur values (365, "Robin", "Olsen", "1990-01-08", "2009-08-09");
insert into Appartient values (365, "Suede", 2018, "Gardien", 1);

insert into Joueur values (366, "Victor", "Lindelof", "1994-07-17", "2012-08-19");
insert into Appartient values (366, "Suede", 2018, "Defenseur", 3);

insert into Joueur values (367, "Sebastian", "Larsson", "1985-06-06", "2009-12-02");
insert into Appartient values (367, "Suede", 2018, "Milieu offensif", 7);

insert into Joueur values (368, "Gustav", "Svensson", "1987-02-07", "2008-11-05");
insert into Appartient values (368, "Suede", 2018, "Milieu defensif", 13);

insert into Joueur values (369, "John", "Guidetti", "1992-04-15", "2012-12-15");
insert into Appartient values (369, "Suede", 2018, "Attaquant", 11);


--Suisse
insert into Joueur values (370, "Yann", "Sommer", "1988-12-17", "2011-10-05");
insert into Appartient values (370, "Suisse", 2018, "Gardien", 1);

insert into Joueur values (371, "Manuel", "Akanji", "1995-07-19", "2011-08-05");
insert into Appartient values (371, "Suisse", 2018, "Defenseur", 5);

insert into Joueur values (372, "Stephan", "Lichsteiner", "1984-01-16", "2007-08-15");
insert into Appartient values (372, "Suisse", 2018, "Defenseur", 2);

insert into Joueur values (373, "Granit", "Xhaka", "1992-09-27", "2012-01-05");
insert into Appartient values (373, "Suisse", 2018, "Milieu defensif", 10);

insert into Joueur values (374, "Breel", "Embolo", "1997-02-14", "2013-01-15");
insert into Appartient values (374, "Suisse", 2018, "Attaquant", 7);


--Colombie
insert into Joueur values (375, "David", "Ospina", "1988-08-31", "2010-08-25");
insert into Appartient values (375, "Colombie", 2018, "Gardien", 1);

insert into Joueur values (376, "Christian", "Zapata", "1988-12-17", "2011-10-05");
insert into Appartient values (376, "Colombie", 2018, "Defenseur", 2);

insert into Joueur values (377, "Juan", "Cuadrado", "1988-05-26", "2012-10-21");
insert into Appartient values (377, "Colombie", 2018, "Milieu offensif", 11);

insert into Joueur values (378, "Carlos", "Bacca", "1986-09-08", "2009-01-24");
insert into Appartient values (378, "Colombie", 2018, "Attaquant", 7);

insert into Joueur values (379, "Radamel", "Falcao", "1986-02-10", "2008-05-22");
insert into Appartient values (379, "Colombie", 2018, "Attaquant", 9);


--Angleterre
insert into Joueur values (380, "Jordan", "Pickford", "1994-03-07", "2010-01-26");
insert into Appartient values (380, "Angleterre", 2018, "Gardien", 1);

insert into Joueur values (381, "Kyle", "Walker", "1990-07-02", "2012-11-21");
insert into Appartient values (381, "Angleterre", 2018, "Defenseur", 2);

insert into Joueur values (382, "Eric", "Dier", "1994-01-15", "2010-02-22");
insert into Appartient values (382, "Angleterre", 2018, "Milieu offensif", 4);

insert into Joueur values (383, "Jesse", "Lingard", "1992-12-15", "2012-08-16");
insert into Appartient values (383, "Angleterre", 2018, "Milieu offensif", 7);

insert into Joueur values (384, "Harry", "Kane", "1993-07-28", "2009-08-22");
insert into Appartient values (384, "Angleterre", 2018, "Attaquant", 9);

--Stade
insert into Stade values ("Stade Ficht", "Sotchi", 40000),
                         ("Ak Bars Arena", "Kazan", 45379),
                         ("Samara Arena", "Samara", 45000),
                         ("Rostov Arena", "Rostov sur le Don", 43472),
                         ("Stade Loujniki", "Moscou", 81000),
                         ("Stade de Nijni Novgorod", "Nijni Novgorod", 44899),
                         ("Gazprom Arena", "Saint Petersbourg", 68134),
                         ("Otkrytie Arena", "Moscou", 45360);


--Arbitre
insert into Arbitre values (50, "Nestor", "Pitana", "1975-06-17", "2010-01-10"),
                            (51, "Alireza", "Faghani", "1978-03-21", "2007-03-11"),
                            (52, "Andres", "Cunha", "1976-09-08", "2007-08-19"),
                            (53, "Malang", "Diedhiou", "1973-04-30", "2006-02-11"),
                            (54, "Felix", "Brych", "1975-08-03", "2007-06-21"),
                            (55, "Janny", "Sikazwe", "1979-05-26", "2001-08-01"),
                            (56, "Fahad", "Al Mirdasi", "1985-08-06", "2011-05-12"),
                            (57, "Bakary", "Gassama", "1979-02-10", "2007-03-22"),
                            (58, "Szymon", "Marciniak", "1981-01-07", "2011-06-01"),
                            (59, "Enrique", "Caceres", "1974-03-20", "2010-03-10"),
                            (60, "Antonio", "Mateu Lahoz", "1977-03-12", "2007-02-11"),
                            (61, "Gehad", "Grisha", "1976-02-29", "2005-12-12"),
                            (62, "Bjorn", "Kuipers", "1973-03-28", "2002-08-31"),
                            (63, "Sergei", "Karasev", "1979-06-12", "2007-07-26");

--Match
insert into Match values ("2018-06-30", "France", "Argentine", 2018, "Kazan Arena", "Round de 8", 4, 3);
insert into Gerer_par values ("2018-06-30", 51, "Principal"),
                                ("2018-06-30", 57, "Assistant"),
                                ("2018-06-30", 61, "Assistant"),
                                ("2018-06-30", 63, "Assistant");
insert into Sanction values (50, 319, "2018-06-30", 51, "Jaune"),
                            (51, 325, "2018-06-30", 51, "Jaune");

insert into Match values ("2018-06-30", "Uruguay", "Portugal", 2018, "Stade Ficht", "Round de 8", 2, 1);
insert into Gerer_par values ("2018-06-30", 54, "Principal"),
                                ("2018-06-30", 55, "Assistant"),
                                ("2018-06-30", 56, "Assistant"),
                                ("2018-06-30", 59, "Assistant");
insert into Sanction values (52, 308, "2018-06-30", 54, "Jaune"),
                            (53, 309, "2018-06-30", 54, "Jaune"),
                            (54, 313, "2018-06-30", 54, "Jaune");

insert into Match values ("2018-07-01", "Espagne", "Russie", 2018, "Stade Loujniki", "Round de 8", 4, 5);
insert into Gerer_par values ("2018-07-01", 60, "Principal"),
                                ("2018-07-01", 50, "Assistant"),
                                ("2018-07-01", 53, "Assistant"),
                                ("2018-07-01", 55, "Assistant");
insert into Sanction values (55, 351, "2018-07-01", 60, "Jaune"),
                            (56, 354, "2018-07-01", 60, "Jaune"),
                            (57, 303, "2018-07-01", 60, "Jaune");

insert into Match values ("2018-07-01", "Croatie", "Danemark", 2018, "Stade de Nijni Novgorod", "Round de 8", 4, 3);
insert into Gerer_par values ("2018-07-01", 63, "Principal"),
                                ("2018-07-01", 52, "Assistant"),
                                ("2018-07-01", 57, "Assistant"),
                                ("2018-07-01", 59, "Assistant");
insert into Sanction values (58, 357, "2018-07-01", 63, "Jaune"),
                            (59, 359, "2018-07-01", 63, "Jaune"),
                            (60, 362, "2018-07-01", 63, "Jaune");

insert into Match values ("2018-07-02", "Brésil", "Mexique", 2018, "Stade de Samara", "Round de 8", 2, 0);
insert into Gerer_par values ("2018-07-02", 62, "Principal"),
                                ("2018-07-02", 51, "Assistant"),
                                ("2018-07-02", 56, "Assistant"),
                                ("2018-07-02", 50, "Assistant");
insert into Sanction values (61, 330, "2018-07-02", 62, "Jaune"),
                            (62, 336, "2018-07-02", 62, "Jaune");

insert into Match values ("2018-07-02", "Belgique", "Japon", 2018, "Rostov Arena", "Round de 8", 3, 2);
insert into Gerer_par values ("2018-07-02", 55, "Principal"),
                                ("2018-07-02", 52, "Assistant"),
                                ("2018-07-02", 61, "Assistant"),
                                ("2018-07-02", 51, "Assistant");
insert into Sanction values (63, 341, "2018-07-02", 55, "Jaune"),
                            (64, 347, "2018-07-02", 55, "Jaune");

insert into Match values ("2018-07-03", "Suede", "Suisse", 2018, "Gazprom Arena", "Round de 8", 1, 0);
insert into Gerer_par values ("2018-07-03", 51, "Principal"),
                                ("2018-07-03", 50, "Assistant"),
                                ("2018-07-03", 58, "Assistant"),
                                ("2018-07-03", 57, "Assistant");
insert into Sanction values (65, 365, "2018-07-03", 51, "Jaune"),
                            (66, 366, "2018-07-03", 51, "Jaune"),
                            (68, 367, "2018-07-03", 51, "Jaune"),
                            (69, 370, "2018-07-03", 51, "Jaune"),
                            (70, 371, "2018-07-03", 51, "Rouge"),
                            (71, 372, "2018-07-03", 51, "Jaune");

insert into Match values ("2018-07-03", "Colombie", "Angleterre", 2018, "Otkrytie Arena", "Round de 8", 4, 5);
insert into Gerer_par values ("2018-07-03", 60, "Principal"),
                                ("2018-07-03", 55, "Assistant"),
                                ("2018-07-03", 54, "Assistant"),
                                ("2018-07-03", 53, "Assistant");
insert into Sanction values (72, 376, "2018-07-03", 60, "Jaune"),
                            (73, 377, "2018-07-03", 60, "Jaune"),
                            (74, 381, "2018-07-03", 60, "Jaune"),
                            (75, 382, "2018-07-03", 60, "Jaune");
                                           
insert into Match values ("2018-07-06", "Uruguay", "France", 2018, "Stade de Nijni Novgorod", "Quart de finale", 0, 2);
insert into Gerer_par values ("2018-07-06", 62, "Principal"),
                                ("2018-07-06", 63, "Assistant"),
                                ("2018-07-06", 51, "Assistant"),
                                ("2018-07-06", 54, "Assistant");
insert into Sanction values (76, 308, "2018-07-06", 62, "Jaune"),
                            (77, 310, "2018-07-06", 62, "Jaune"),
                            (78, 320, "2018-07-06", 62, "Jaune"),
                            (79, 319, "2018-07-06", 62, "Jaune");

insert into Match values ("2018-07-06", "Bresil", "Belgique", 2018, "Kazan Arena", "Quart de finale", 1, 2);
insert into Gerer_par values ("2018-07-06", 59, "Principal"),
                                ("2018-07-06", 52, "Assistant"),
                                ("2018-07-06", 57, "Assistant"),
                                ("2018-07-06", 61, "Assistant");
insert into Sanction values (80, 330, "2018-07-06", 59, "Jaune"),
                            (81, 331, "2018-07-06", 59, "Jaune"),
                            (82, 341, "2018-07-06", 59, "Jaune");

insert into Match values ("2018-07-07", "Suede", "Angleterre", 2018, "Samara Arena", "Quart de finale", 0, 2);
insert into Gerer_par values ("2018-07-07", 50, "Principal"),
                                ("2018-07-07", 51, "Assistant"),
                                ("2018-07-07", 59, "Assistant"),
                                ("2018-07-07", 62, "Assistant");
insert into Sanction values (83, 366, "2018-07-07", 50, "Jaune"),
                            (84, 368, "2018-07-07", 50, "Rouge"),
                            (85, 382, "2018-07-07", 50, "Jaune");

insert into Match values ("2018-07-07", "Russie", "Croatie", 2018, "Stade Ficht", "Quart de finale", 5, 6);
insert into Gerer_par values ("2018-07-07", 53, "Principal"),
                                ("2018-07-07", 63, "Assistant"),
                                ("2018-07-07", 54, "Assistant"),
                                ("2018-07-07", 65, "Assistant");
insert into Sanction values (86, 301, "2018-07-07", 53, "Jaune"),
                            (87, 302, "2018-07-07", 53, "Jaune"),
                            (88, 356, "2018-07-07", 53, "Jaune");

insert into Match values ("2018-07-10", "France", "Belgique", 2018, "Gazprom Arena", "Demi finale", 1, 0);
insert into Gerer_par values ("2018-07-10", 51, "Principal"),
                                ("2018-07-10", 55, "Assistant"),
                                ("2018-07-10", 52, "Assistant"),
                                ("2018-07-10", 59, "Assistant");
insert into Sanction values (89, 318, "2018-07-10", 51, "Jaune"),
                            (90, 343, "2018-07-10", 51, "Jaune");

insert into Match values ("2018-07-11", "Croatie", "Angleterre", 2018, "Stade Loujniki", "Demi finale", 2, 1);
insert into Gerer_par values ("2018-07-11", 54, "Principal"),
                                ("2018-07-11", 60, "Assistant"),
                                ("2018-07-11", 53, "Assistant"),
                                ("2018-07-11", 58, "Assistant");
insert into Sanction values (91, 355, "2018-07-11", 54, "Jaune"),
                            (92, 381, "2018-07-11", 54, "Jaune");

insert into Match values ("2018-07-10", "France", "Belgique", 2018, "Gazprom Arena", "Demi finale", 1, 0);
insert into Gerer_par values ("2018-07-10", 51, "Principal"),
                                ("2018-07-10", 55, "Assistant"),
                                ("2018-07-10", 52, "Assistant"),
                                ("2018-07-10", 59, "Assistant");
insert into Sanction values (93, 318, "2018-07-10", 51, "Jaune"),
                            (94, 343, "2018-07-10", 51, "Jaune");
                        
insert into Match values ("2018-07-15", "France", "Croatie", 2018, "Stade Loujniki", "Finale", 4, 2);
insert into Gerer_par values ("2018-07-15", 60, "Principal"),
                                ("2018-07-15", 54, "Assistant"),
                                ("2018-07-15", 57, "Assistant"),
                                ("2018-07-15", 56, "Assistant");
insert into Sanction values (95, 318, "2018-07-15", 60, "Jaune"),
                            (96, 355, "2018-07-15", 60, "Jaune");


--Collaborateur
insert into Collaborateur values 
            (20, "Walid", "Sax", "Assistant entraineur", "1997-03-27", "2005-10-21"),
            (21, "Ricardo", "Pereira", "Medecin", "1995-02-19", "2009-08-08"),
            (22, "Juan", "Alcaraz", "Kinesitherapeute", "1985-07-17", "2008-04-09"),
            (23, "Gojo", "Satoru", "Cuisinier", "1980-12-31", "2002-03-02"),
            (24, "Jules", "Nathan", "Ostheopathe", "1987-12-10", "2004-03-20"),
            (25, "Ethan", "Carl", "Preparateur physique", "1995-06-09", "2010-10-30"),
            (26, "Michel", "Morcel", "Assistant entraineur", "1990-02-10", "2007-05-12"),
            (27, "Stephane", "Rousseau", "Entraineur adjoint", "1985-06-18", "2005-07-23"),
            (28, "Kamil", "Ladji", "Ostheopathe", "1989-09-13", "2006-06-27"),
            (29, "Antoine", "Fokoue", "Medecin", "1980-05-05", "2002-08-03"),
            (30, "Daniel", "Levi", "Kinesitherapeute", "1992-04-19", "2007-09-09"),
            (31, "Maxime", "Blaise", "Intendant", "1988-03-16", "2005-07-25"),
            (32, "Giyu", "Tomioka", "Analyste video", "1989-08-11", "2006-05-02"),
            (33, "Speedy", "Gonzales", "Kinesitherapeute", "1994-03-12", "2007-05-08"),
            (34, "Alex", "Morgan", "Intendant", "1995-02-19", "2009-11-11"),
            (35, "Georges", "Armand", "Intendant", "1993-07-22", "2006-10-10");

insert into Collabore values 
            ("Russie", 2018, 20), 
            ("Uruguay", 2018, 21), 
            ("Portugal", 2018, 22),
            ("France", 2018, 23), 
            ("Argentine", 2018, 24), 
            ("Bresil", 2018, 25),
            ("Mexique", 2018, 26), 
            ("Belgique", 2018, 27), 
            ("Japon", 2018, 28),
            ("Espagne", 2018, 29), 
            ("Croatie", 2018, 30),
            ("Danemark", 2018, 31), 
            ("Suede", 2018, 32), 
            ("Suisse", 2018, 33),
            ("Colombie", 2018, 34), 
            ("Angleterre", 2018, 35);