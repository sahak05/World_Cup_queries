


--coupe du monde 2014

--pays : 

--8 de finale: Bresil Chili Colombie Uruguay France Nigeria Allemagne
-- Algerie Pays-Bas Mexique Costa Rica Grece Argentine Suisse Belgique Etats unis  


--insert into Coupe_du_monde into (nom de columns) values (.....)


--Here to insert coupe du monde 
insert into Coupe_du_monde values (2014, 'Bresil')


--Entraineur
insert into Entraineur values (1, 'Luiz', 'Scolari', '1948-11-09', '1980-04-30'),
	(2, 'Miguel', 'Herrera', '1968-03-18', '1999-07-10'),
	(3, 'Louis', 'van Gaal', '1951-08-08', '1980-01-10'),
	(4, 'Jorge', 'Sampaoli', '1960-03-13', '1990-04-17'),
	(5, 'Jose', 'Pekerman', '1949-09-03', '1970-01-11'),
	(6, 'Fernando', 'Santos', '1954-10-10', '1980-10-10'),
	(7, 'Oscar', 'Tabarez', '1947-03-03', '1970-07-13'),
	(8, 'Jorge', 'Pinto', '1952-12-16', '1984-05-10'),
	(9, 'Ottmar', 'Hitzfeld', '1949-12-01', '1980-12-12'),
	(10, 'Didier', 'Deschamps', '1968-10-15', '1986-04-04'),
	(11, 'Alejandro', 'Sabella', '1954-11-05', '1975-05-05'),
	(12, 'Stephen', 'Keshi', '1962-01-23', '1992-08-05'),
	(13, 'Joachim', 'Low', '1960-02-13', '1995-05-05'),
	(14, 'Jurgen', 'Klinsmann', '1964-07-30', '1995-05-05'),
	(15, 'Marc', 'Wilmots', '1969-02-22', '2000-05-05'),
	(16, 'Vahid', 'Halilhodzic', '1952-05-15', '1990-09-30');


--Here to insert participants
insert into Equipe values ('Bresil', 2014,1),
	('Mexique', 2014, 2), 
	('Pays-Bas', 2014, 3), 
	('Chili', 2014, 4), 
	('Colombie', 2014, 5),
	('Grece', 2014, 6),
	('Uruguay', 2014, 7), 
	('Costa Rica', 2014, 8),
	('Suisse', 2014, 9), 
	('France', 2014, 10), 
	('Argentine', 2014, 11), 
	('Nigeria', 2014, 12), 
	('Allemagne', 2014, 13), 
	('Etats-Unis', 2014, 14),
	('Belgique', 2014, 15),
	('Algerie', 2014, 16);


	--Joueur et Appartient
	--Bresil

insert into Joueur values (100, 'Julio', 'Cesar', '1979-09-03', '1990-05-05');
insert into Appartient values (100, 'Bresil', 2014, 'Gardien', 12);
	
insert into Joueur values (101, 'Dani', 'Alves', '1983-05-06', '2003-12-12');
insert into Appartient values (101, 'Bresil', 2014, 'Defenseur', 2);

insert into Joueur values (102, 'Thiago', 'Silva', '1984-04-22', '2000-02-10');
insert into Appartient values (102, 'Bresil', 2014, 'Defenseur', 3);

insert into Joueur values (103, 'David', 'Luiz', '1987-04-22', '1999-07-10');
insert into Appartient values (103, 'Bresil', 2014, 'Defenseur', 4);

insert into Joueur values (104, 'Marcelo', 'Viera', '1988-05-12', '2001-05-05');
insert into Appartient values (104, 'Bresil', 2014, 'Defenseur', 6);

insert into Joueur values (105, 'Oscar', 'Dos Santos', '1991-09-09', '2010-10-28');
insert into Appartient values (105, 'Bresil', 2014, 'Milieu offensif', 11);

insert into Joueur values (106, 'Willian', 'da Silva', '1988-08-09', '2005-01-10');
insert into Appartient values (106, 'Bresil', 2014, 'Milieu offensif', 19);

insert into Joueur values (107, 'Fernando', 'Luiz Roza', '1985-05-04', '2005-03-26');
insert into Appartient values (107, 'Bresil', 2014, 'Milieu defensif', 5);

insert into Joueur values (108, 'Luiz', 'Gustavo', '1987-07-23', '2006-09-09');
insert into Appartient values (108, 'Bresil', 2014, 'Milieu defensif', 17);

insert into Joueur values (109, 'Neymar', 'Santos', '1992-02-05', '2005-02-10');
insert into Appartient values (109, 'Bresil', 2014, 'Lateral', 10);

insert into Joueur values (110, 'Givanildo', 'de Souza', '1986-07-25', '2002-05-05');
insert into Appartient values (110, 'Bresil', 2014, 'Attaquant', 7);


	--Mexique
	
insert into Joueur values (111, 'Guillemo', 'Ochoa', '1985-07-13', '2005-05-05');
insert into Appartient values (111, 'Mexique', 2014, 'Gardien', 12);
	
insert into Joueur values (112, 'Francisco', 'Rodriguez', '1981-10-20', '2003-12-12');
insert into Appartient values (112, 'Mexique', 2014, 'Defenseur', 2);

insert into Joueur values (113, 'Rafael', 'Marquez', '1979-02-13', '2000-02-10');
insert into Appartient values (113, 'Mexique', 2014, 'Defenseur', 4);

insert into Joueur values (114, 'Carlos', 'Salcido', '1980-04-02', '1999-07-10');
insert into Appartient values (114, 'Mexique', 2014, 'Defenseur', 3);

insert into Joueur values (115, 'Paul', 'Aguilar', '1986-03-06', '2001-05-05');
insert into Appartient values (115, 'Mexique', 2014, 'Defenseur', 22);

insert into Joueur values (116, 'Hector', 'Herrera', '1990-04-19', '2010-10-28');
insert into Appartient values (116, 'Mexique', 2014, 'Milieu offensif', 11);

insert into Joueur values (117, 'Giovani', 'dos Santos', '1989-05-11', '2005-01-10');
insert into Appartient values (117, 'Mexique', 2014, 'Milieu offensif', 10);

insert into Joueur values (118, 'Marco', 'Fabian', '1989-07-21', '2005-03-26');
insert into Appartient values (118, 'Mexique', 2014, 'Milieu defensif', 8);

insert into Joueur values (119, 'Jose', 'Vasquez', '1988-03-14', '2006-09-09');
insert into Appartient values (119, 'Mexique', 2014, 'Milieu offensif', 23);

insert into Joueur values (120, 'Javier', 'Hernandez', '1988-06-01', '2005-02-10');
insert into Appartient values (120, 'Mexique', 2014, 'Attaquant', 14);

insert into Joueur values (121, 'Oribe', 'Peralta', '1984-01-12', '2002-05-05');
insert into Appartient values (121, 'Mexique', 2014, 'Attaquant', 19);



	--Pays-Bas
	
insert into Joueur values (122, 'jasper', 'Cillessen', '1989-04-22', '1990-05-05');
insert into Appartient values (122, 'Pays-Bas', 2014, 'Gardien', 1);
	
insert into Joueur values (123, 'Stefan', 'de Vrij', '1992-05-06', '2003-12-12');
insert into Appartient values (123, 'Pays-Bas', 2014, 'Defenseur', 3);

insert into Joueur values (124, 'Brunos', 'Martins Indi', '1992-02-08', '2008-02-10');
insert into Appartient values (124, 'Pays-Bas', 2014, 'Defenseur', 4);

insert into Joueur values (125, 'Daley', 'Blind', '1992-02-08', '2009-07-10');
insert into Appartient values (125, 'Pays-Bas', 2014, 'Defenseur', 5);

insert into Joueur values (126, 'Daryl', ' Janmaat', '1989-07-22', '2001-05-05');
insert into Appartient values (126, 'Bresil', 2014, 'Defenseur', 7);

insert into Joueur values (127, 'Wesley', 'Sneijder', '1984-06-09', '2010-10-28');
insert into Appartient values (127, 'Pays-Bas', 2014, 'Milieu defensif', 10);

insert into Joueur values (128, 'Arjen', 'Robben', '1984-01-23', '2000-01-10');
insert into Appartient values (128, 'Pays-Bas', 2014, 'Milieu offensif', 11);

insert into Joueur values (129, 'Georginio', 'Wijnaldum', '1990-11-11', '2005-03-26');
insert into Appartient values (129, 'Pays-Bas', 2014, 'Milieu defensif', 20);

insert into Joueur values (130, 'Memphis', 'Depay', '1994-02-13', '2006-09-09');
insert into Appartient values (130, 'Pays-Bas', 2014, 'Milieu offensif', 21);

insert into Joueur values (131, 'Robin', 'van Persie', '1983-08-06', '2004-02-10');
insert into Appartient values (131, 'Pays-Bas', 2014, 'Lateral', 12);

insert into Joueur values (132, 'Dirk', 'Kuyt', '1980-07-22', '2002-05-05');
insert into Appartient values (132, 'Pays-Bas', 2014, 'Attaquant', 15);


--Chili 

insert into Joueur values (133, 'Claudio', 'Bravo', '1983-04-13', '1990-05-05');
insert into Appartient values (133, 'Chili', 2014, 'Gardien', 1);

insert into Joueur values (134, 'Cristopher', 'Toselli', '1988-06-15', '2003-12-12');
insert into Appartient values (134, 'Chili', 2014, 'Gardien', 12);

insert into Joueur values (135, 'Eugenio', 'Mena', '1988-07-18', '2000-02-10');
insert into Appartient values (135, 'Chili', 2014, 'Defenseur', 2);

insert into Joueur values (136, 'Miiko', 'Albornoz', '1990-11-30', '1999-07-10');
insert into Appartient values (136, 'Chili', 2014, 'Defenseur', 3);

insert into Joueur values (137, 'Gary', 'Medel', '1987-08-03', '2001-05-05');
insert into Appartient values (137, 'Chili', 2014, 'Defenseur', 17);

insert into Joueur values (138, 'Gonzalo', 'Jara', '1985-08-25', '2010-10-28');
insert into Appartient values (138, 'Chili', 2014, 'Milieu offensif', 18);

insert into Joueur values (139, 'Mauricio', 'Isla', '1988-06-12', '2005-01-10');
insert into Appartient values (139, 'Chili', 2014, 'Milieu offensif', 4);

insert into Joueur values (140, 'Francisco', 'Silva', '1986-02-11', '2005-03-26');
insert into Appartient values (140, 'Chili', 2014, 'Milieu defensif', 5);

insert into Joueur values (141, 'Carlos', 'Carmona', '1987-02-21', '2006-09-09');
insert into Appartient values (141, 'Chili', 2014, 'Milieu defensif', 6);

insert into Joueur values (142, 'Arturo', 'Vidal', '1987-05-22', '2005-02-10');
insert into Appartient values (142, 'Chili', 2014, 'Lateral', 8);

insert into Joueur values (143, 'Alexis', 'Sanchez', '1986-07-25', '2002-05-05');
insert into Appartient values (143, 'Chili', 2014, 'Attaquant', 7);






--Colombie


insert into Joueur values (144, 'David', 'Ospina', '1988-08-31', '1990-05-05');
insert into Appartient values (144, 'Colombie', 2014, 'Gardien', 1);

insert into Joueur values (145, 'Juan', 'Zuniga', '1985-12-14', '2003-12-12');
insert into Appartient values (145, 'Colombie', 2014, 'Defenseur', 18);

insert into Joueur values (146, 'Pablo', 'Armero', '1986-02-11', '2000-02-10');
insert into Appartient values (146, 'Colombie', 2014, 'Defenseur', 7);

insert into Joueur values (147, 'Cristian', 'Zapata', '1986-11-02', '1999-07-10');
insert into Appartient values (147, 'Colombie', 2014, 'Defenseur', 2);

insert into Joueur values (148, 'Santiago', 'Arias', '1992-01-13', '2001-05-05');
insert into Appartient values (148, 'Colombie', 2014, 'Defenseur', 4);

insert into Joueur values (149, 'Eder', 'Balanta', '1993-02-28', '2010-10-28');
insert into Appartient values (149, 'Colombie', 2014, 'Defenseur', 16);

insert into Joueur values (150, 'Carlos', 'Valdes', '1985-05-22', '2005-01-10');
insert into Appartient values (150, 'Colombie', 2014, 'Defenseur', 23);

insert into Joueur values (151, 'Teofilo', 'Gutierrez', '1985-05-17', '2005-03-26');
insert into Appartient values (151, 'Colombie', 2014, 'Attaquant', 9);

insert into Joueur values (152, 'Jakson', 'Martinez', '1986-01-22', '2006-09-09');
insert into Appartient values (152, 'Colombie', 2014, 'Attaquant', 21);

insert into Joueur values (153, 'Adrian', 'Ramos', '1986-09-18', '2005-02-10');
insert into Appartient values (153, 'Colombie', 2014, 'Attaquant', 19);

insert into Joueur values (154, 'Carlos', 'Bacca', '1986-09-18', '2002-05-05');
insert into Appartient values (154, 'Colombie', 2014, 'Attaquant', 17);





--Grece

--Uruguay

--Costa Rica 

--Suisse

--France

--Argentine

--Nigeria

--Allemagne

--Etats-Unis

--Belgique

--Algerie