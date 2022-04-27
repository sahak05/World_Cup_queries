BEGIN TRANSACTION;
drop schema if exists Projet3 cascade;

create schema Projet3;
set search_path to Projet3;


create table Coupe_du_monde(
	edition int not null,
	--unique (edition),
	pays_org text not null,
	constraint sur_edition check (edition >= 1), 
	primary key (edition)
);


create table Entraineur(
	entraineur_id serial not null,
	prenom_E text not null,
	nom_E text not null,
	date_de_naissance_E date not null,
	anciennete_entraineur date not null,
	primary key (entraineur_id)
);

create table Equipe(
	nation text not null,
	edition int not null,
	UNIQUE (nation, edition),
	entraineur_id int not null,
	primary key (nation, edition),
	foreign key (edition) references Coupe_du_monde(edition),
	foreign key (entraineur_id) references Entraineur(entraineur_id)
);

create table Collaborateur(
	collaborateur_id serial not null,
	prenom_C text not null,
	nom_C text not null,
	expertise text not null,
	constraint sur_expertise check (expertise in ('Assistant entraineur',
		'Medecin', 'Psychologue', 'Physiotherapeute', 'Ostheopathe', 'Cuisinier', 'Preparateur physique',
												 'Entraineur adjoint', 'Intendant', 'Analyste video',
												 'Kinesitherapeute')),
	date_de_naissance_C date not null,
	anciennete_collab date not null,
	primary key (collaborateur_id)
);

create table Collabore(
	nation text not null, 
	edition int not null,
	collaborateur_id int not null,
	primary key (nation, edition, collaborateur_id),
	foreign key (nation, edition) references Equipe(nation, edition),
	foreign key (collaborateur_id) references Collaborateur(collaborateur_id) 
);

create table Joueur(
	joueur_id serial not null,
	prenom text not null,
	nom text not null,
	date_de_naissance date not null,
	anciennete_joueur date not null,
	primary key (joueur_id)
);


create table Stade(
	nom_stade text not null,
	UNIQUE (nom_stade),
	ville text not null,
	capacite int not null,
	constraint sur_capacite check (capacite >=1),
	primary key (nom_stade)
);

create table Match(
	dateM date not null,
	nation1 text not null,
	nation2 text not null,
	edition int not null,
	nom_stade text not null,
	rang text not null,
	score_eq1 int not null,
	score_eq2 int not null,
	constraint sur_rang check (rang in ('Round de 8', 'Quart de finale',
		'Demi-finale', '3e place', 'Finale')),
	constraint sur_score check (score_eq2 >=0 and score_eq1>=0),
	UNIQUE (dateM),
	primary key (dateM, nation1, nation2, edition, nom_stade),
	foreign key (nom_stade) references Stade(nom_stade),
	foreign key (edition) references Coupe_du_monde(edition),
	foreign key (nation1, edition) references Equipe(nation, edition),
	foreign key (nation2, edition) references Equipe(nation, edition)
);

create table Appartient(
	joueur_id int not null,
	nation text not null,
	edition int not null,
	position text not null, 
	numero int not null,
	constraint sur_position check (position in ('Gardien', 'Defenseur', 'Milieu defensif',
		'Milieu offensif', 'Lateral', 'Attaquant')),
	constraint sur_numero check (numero >=1),
	primary key (joueur_id, nation, edition),
	foreign key (nation, edition) references Equipe(nation, edition),
	foreign key (joueur_id) references Joueur(joueur_id)
);

create table Arbitre(
	arbitre_id serial not null,
	nom_A text not null,
	prenom_A text not null,
	date_de_naissance_A date not null,
	anciennete_arbitre date not null,
	primary key (arbitre_id)
);

create table Gerer_par(
	dateM date not null,
	arbitre_id int not null,
	type text not null,
	constraint sur_type check (type in ('Principal', 'Assistant')),
	primary key (dateM, arbitre_id, type),
	foreign key (dateM) references Match(dateM),
	foreign key (arbitre_id) references Arbitre(arbitre_id)
);

create table Sanction(
	sanction_id serial not null,
	joueur_id int not null,
	dateM date not null,
	arbitre_id int not null,
	couleur text not null,
	constraint sur_couleur check (couleur in ('Jaune', 'Rouge')),
	primary key (sanction_id),
	foreign key (joueur_id) references Joueur(joueur_id),
	foreign key (dateM) references Match(dateM),
	foreign key (arbitre_id) references Arbitre(arbitre_id)
);















--Place aux insertions 










--coupe du monde 2014

--pays : 

--8 de finale: Bresil Chili Colombie Uruguay France Nigeria Allemagne
-- Algerie Pays-Bas Mexique Costa Rica Grece Argentine Suisse Belgique Etats unis  


--insert into Coupe_du_monde into (nom de columns) values (.....)


--Here to insert coupe du monde 
insert into Coupe_du_monde values (2014, 'Bresil');
insert into Coupe_du_monde values (2018, 'Russie');


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


--Entraineurs
insert into Entraineur values   (19, 'Adenor', 'Bacchi', '1961-05-25', '1990-06-08'),
                                (20, 'Juan', 'Arbelaez', '1961-08-06', '2000-11-10'),
                                (21, 'Roberto', 'Montoliu', '1973-07-13', '2007-09-05'),
                                (22, 'Akira', 'Nishino', '1955-04-07', '1998-12-05'),
                                (23, 'Julen', 'Lopetegui', '1966-08-28', '1983-08-03'),
                                (24, 'Stanislav', 'Tchertchessov', '1963-09-02', '1981-09-11'),
                                (25, 'Zlatko', 'Dalic', '1966-10-26', '1983-08-07'),
                                (26, 'Age', 'Hareide', '1953-09-23', '1970-04-23'),
                                (27, 'Janne', 'Andersson', '1962-09-29','1979-10-30'),
                                (28, 'Vladimir', 'Petkovic', '1963-08-15', '1981-05-17'),
                                (30, 'Gareth', 'Southgate', '1970-09-03', '1989-07-10');


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



--Equipe
insert into Equipe values       ('Russie', 2018, 24), ('Uruguay', 2018, 7), ('Portugal', 2018, 6),
                                ('France', 2018, 10), ('Argentine', 2018, 4), ('Bresil', 2018, 19),
                                ('Mexique', 2018, 20), ('Belgique', 2018, 21), ('Japon', 2018, 22),
                                ('Espagne', 2018, 23), ('Croatie', 2018, 25),
                                ('Danemark', 2018, 26), ('Suede', 2018, 27), ('Suisse', 2018, 28),
                                ('Colombie', 2018, 5), ('Angleterre', 2018, 30);


	--Joueur et Appartient

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


insert into Joueur values (155, 'Orestis', 'Karnezis', '1985-07-11', '1990-05-05');
insert into Appartient values (155, 'Grece', 2014, 'Gardien', 1);

insert into Joueur values (156, 'Yioryos', 'Tzavellas', '1991-12-14', '2003-12-12');
insert into Appartient values (156, 'Grece', 2014, 'Defenseur', 3);

insert into Joueur values (157, 'Kostas', 'Manolas', '1991-02-11', '2000-02-10');
insert into Appartient values (157, 'Grece', 2014, 'Defenseur', 4);

insert into Joueur values (158, 'Vangelis', 'Moras', '1981-11-02', '1999-07-10');
insert into Appartient values (158, 'Grece', 2014, 'Defenseur', 5);

insert into Joueur values (159, 'Loukas', 'Vyntra', '1981-01-13', '2001-05-05');
insert into Appartient values (159, 'Grece', 2014, 'Defenseur', 11);

insert into Joueur values (160, 'Iosif', 'Cholevas', '1984-02-28', '2010-10-28');
insert into Appartient values (160, 'Grece', 2014, 'Defenseur', 20);

insert into Joueur values (161, 'Andreas', 'Samaris', '1995-05-22', '2005-01-10');
insert into Appartient values (161, 'Grece', 2014, 'Lateral', 23);

insert into Joueur values (162, 'Yeoryos', 'Samaras', '1985-05-17', '2005-03-26');
insert into Appartient values (162, 'Grece', 2014, 'Attaquant', 7);

insert into Joueur values (163, 'Kostas', 'Mitroglou', '1988-01-22', '2006-09-09');
insert into Appartient values (163, 'Grece', 2014, 'Attaquant', 9);

insert into Joueur values (164, 'Dimitris', 'Salpingidis', '1981-09-18', '2005-02-10');
insert into Appartient values (164, 'Grece', 2014, 'Attaquant', 14);

insert into Joueur values (165, 'Theofanis', 'Gekas', '1980-09-18', '2002-05-05');
insert into Appartient values (165, 'Grece', 2014, 'Attaquant', 17);





--Uruguay



insert into Joueur values (166, 'Fernando', 'Muslera', '1986-08-31', '1990-05-05');
insert into Appartient values (166, 'Uruguay', 2014, 'Gardien', 1);

insert into Joueur values (167, 'Rodrigo', 'Munoz', '1982-12-14', '2003-12-12');
insert into Appartient values (167, 'Uruguay', 2014, 'Gardien', 12);

insert into Joueur values (168, 'Martin', 'Silva', '1983-02-11', '2000-02-10');
insert into Appartient values (168, 'Uruguay', 2014, 'Gardien', 23);

insert into Joueur values (169, 'Diego', 'Lugano', '1980-11-02', '1999-07-10');
insert into Appartient values (169, 'Uruguay', 2014, 'Defenseur', 2);

insert into Joueur values (170, 'Diego', 'Godin', '1986-01-13', '2001-05-05');
insert into Appartient values (170, 'Uruguay', 2014, 'Defenseur', 3);

insert into Joueur values (171, 'Jorge', 'Fucile', '1994-02-28', '2010-10-28');
insert into Appartient values (171, 'Uruguay', 2014, 'Defenseur', 4);

insert into Joueur values (172, 'Jose', 'Gimenez', '1995-05-22', '2005-01-10');
insert into Appartient values (172, 'Uruguay', 2014, 'Defenseur', 13);

insert into Joueur values (173, 'Maxime', 'Pereira', '1984-05-17', '2005-03-26');
insert into Appartient values (173, 'Uruguay', 2014, 'Defenseur', 16);

insert into Joueur values (174, 'Sebastien', 'Costas', '1990-01-22', '2006-09-09');
insert into Appartient values (174, 'Uruguay', 2014, 'Defenseur', 19);

insert into Joueur values (175, 'Martin', 'Caceres', '1987-09-18', '2005-02-10');
insert into Appartient values (175, 'Uruguay', 2014, 'Defenseur', 22);

insert into Joueur values (176, 'Walter', 'Gargano', '1984-09-18', '2002-05-05');
insert into Appartient values (176, 'Uruguay', 2014, 'Milieu defensif', 5);




--Costa Rica 

insert into Joueur values (177, 'Keylor', 'Navas', '1986-08-31', '1990-05-05');
insert into Appartient values (177, 'Costa Rica', 2014, 'Gardien', 1);

insert into Joueur values (178, 'Michael', 'Umana', '1982-12-14', '2003-12-12');
insert into Appartient values (178, 'Costa Rica', 2014, 'Defenseur', 4);

insert into Joueur values (179, 'Junior', 'Diaz', '1983-02-11', '2000-02-10');
insert into Appartient values (179, 'Costa Rica', 2014, 'Defenseur', 15);

insert into Joueur values (180, 'Roy', 'Miller', '1986-11-02', '1999-07-10');
insert into Appartient values (180, 'Costa Rica', 2014, 'Defenseur', 19);

insert into Joueur values (181, 'Dave', 'Myrie', '1992-01-13', '2001-05-05');
insert into Appartient values (181, 'Costa Rica', 2014, 'Defenseur', 8);

insert into Joueur values (182, 'Celso', 'Borges', '1993-02-28', '2010-10-28');
insert into Appartient values (182, 'Costa Rica', 2014, 'Lateral', 5);

insert into Joueur values (183, 'Christian', 'Bolanos', '1985-05-22', '2005-01-10');
insert into Appartient values (183, 'Costa Rica', 2014, 'Lateral', 11);

insert into Joueur values (184, 'Yeltsin', 'Tejeda', '1985-05-17', '2005-03-26');
insert into Appartient values (184, 'Costa Rica', 2014, 'Milieu offensif', 17);

insert into Joueur values (185, 'Bryan', 'Ruiz', '1986-01-22', '2006-09-09');
insert into Appartient values (185, 'Costa Rica', 2014, 'Attaquant', 10);

insert into Joueur values (186, 'Randall', 'Brenes', '1986-09-18', '2005-02-10');
insert into Appartient values (186, 'Costa Rica', 2014, 'Attaquant', 14);

insert into Joueur values (187, 'Joel', 'Campbell', '1986-09-18', '2002-05-05');
insert into Appartient values (187, 'Costa Rica', 2014, 'Attaquant', 9);





--Suisse


insert into Joueur values (188, 'Diego', 'Benaglio', '1988-08-31', '1990-05-05');
insert into Appartient values (188, 'Suisse', 2014, 'Gardien', 1);

insert into Joueur values (189, 'Yann', 'Sommier', '1990-12-14', '2003-12-12');
insert into Appartient values (189, 'Suisse', 2014, 'Defenseur', 2);

insert into Joueur values (190, 'Reto', 'Ziegler', '1986-02-11', '2000-02-10');
insert into Appartient values (190, 'Suisse', 2014, 'Defenseur', 3);

insert into Joueur values (191, 'Philipe', 'Senderos', '1986-11-02', '1999-07-10');
insert into Appartient values (191, 'Suisse', 2014, 'Defenseur', 4);

insert into Joueur values (192, 'Haris', 'Seferovic', '1986-09-18', '2005-02-10');
insert into Appartient values (192, 'Suisse', 2014, 'Attaquant', 9);

insert into Joueur values (193, 'Mario', 'Gavranovic', '1986-09-18', '2002-05-05');
insert into Appartient values (193, 'Suisse', 2014, 'Attaquant', 17);





--France

insert into Joueur values (194, 'Hugo', 'Loris', '1988-08-31', '1990-05-05');
insert into Appartient values (194, 'France', 2014, 'Gardien', 1);

insert into Joueur values (195, 'Patrice', 'Evra', '1985-12-14', '2003-12-12');
insert into Appartient values (195, 'France', 2014, 'Defenseur', 3);

insert into Joueur values (196, 'Raphael', 'Varane', '1986-02-11', '2000-02-10');
insert into Appartient values (196, 'France', 2014, 'Defenseur', 4);

insert into Joueur values (197, 'Blaise', 'Matuidi', '1993-02-28', '2010-10-28');
insert into Appartient values (197, 'France', 2014, 'Milieu offensif', 14);

insert into Joueur values (198, 'Antoine', 'Griezmann', '1985-05-22', '2005-01-10');
insert into Appartient values (198, 'France', 2014, 'Milieu offensif', 11);

insert into Joueur values (199, 'Remy', 'Cabella', '1985-05-17', '2005-03-26');
insert into Appartient values (199, 'France', 2014, 'Attaquant', 7);

insert into Joueur values (200, 'Olivier', 'Giroud', '1986-01-22', '2006-09-09');
insert into Appartient values (200, 'France', 2014, 'Attaquant', 9);

insert into Joueur values (201, 'Karim', 'Benzema', '1986-09-18', '2005-02-10');
insert into Appartient values (201, 'France', 2014, 'Attaquant', 10);





--Argentine


insert into Joueur values (202, 'Sergio', 'Romero', '1988-08-31', '1990-05-05');
insert into Appartient values (202, 'Argentine', 2014, 'Gardien', 1);

insert into Joueur values (203, 'Marcos', 'Rojo', '1985-12-14', '2003-12-12');
insert into Appartient values (203, 'Argentine', 2014, 'Defenseur', 16);

insert into Joueur values (204, 'Pablo', 'Zabaleta', '1986-02-11', '2000-02-10');
insert into Appartient values (204, 'Argentine', 2014, 'Defenseur', 4);

insert into Joueur values (205, 'Enzo', 'Perez', '1993-02-28', '2010-10-28');
insert into Appartient values (205, 'Argentine', 2014, 'Milieu offensif', 8);

insert into Joueur values (206, 'Maxi', 'Rodriguez', '1985-05-22', '2005-01-10');
insert into Appartient values (206, 'Argentine', 2014, 'Milieu offensif', 11);

insert into Joueur values (207, 'Fernando', 'Gago', '1985-05-17', '2005-03-26');
insert into Appartient values (207, 'Argentine', 2014, 'Attaquant', 5);

insert into Joueur values (208, 'Lionel', 'Messi', '1995-06-24', '2001-09-09');
insert into Appartient values (208, 'Argentine', 2014, 'Attaquant', 10);

insert into Joueur values (209, 'Sergio', 'Aguero', '1986-09-18', '2005-02-10');
insert into Appartient values (209, 'Argentine', 2014, 'Attaquant', 20);




--Nigeria


insert into Joueur values (210, 'Vincent', 'Enyeama', '1988-08-31', '1990-05-05');
insert into Appartient values (210, 'Nigeria', 2014, 'Gardien', 1);

insert into Joueur values (211, 'Joseph', 'Yobo', '1985-12-14', '2003-12-12');
insert into Appartient values (211, 'Nigeria', 2014, 'Defenseur', 2);

insert into Joueur values (212, 'Efe', 'Ambrose', '1986-02-11', '2000-02-10');
insert into Appartient values (212, 'Nigeria', 2014, 'Defenseur', 3);

insert into Joueur values (213, 'John', 'Obi Mikel', '1993-02-28', '2010-10-28');
insert into Appartient values (213, 'Nigeria', 2014, 'Milieu offensif', 10);

insert into Joueur values (214, 'Ahmed', 'Musa', '1985-05-22', '2005-01-10');
insert into Appartient values (214, 'Nigeria', 2014, 'Milieu defensif', 7);

insert into Joueur values (215, 'Peter', 'Odemwingie', '1985-05-17', '2005-03-26');
insert into Appartient values (215, 'Nigeria', 2014, 'Attaquant', 8);

insert into Joueur values (216, 'Emmanuel', 'Emenike', '1986-01-22', '2006-09-09');
insert into Appartient values (216, 'Nigeria', 2014, 'Attaquant', 9);

insert into Joueur values (217, 'Shola', 'Ameobi', '1986-09-18', '2005-02-10');
insert into Appartient values (217, 'Nigeria', 2014, 'Attaquant', 23);



--Allemagne


insert into Joueur values (218, 'Manuel', 'Neuer', '1988-08-31', '1990-05-05');
insert into Appartient values (218, 'Allemagne', 2014, 'Gardien', 1);

insert into Joueur values (219, 'Eric', 'Durm', '1985-12-14', '2003-12-12');
insert into Appartient values (219, 'Allemagne', 2014, 'Defenseur', 3);

insert into Joueur values (220, 'Philipp', 'Lahm', '1986-02-11', '2000-02-10');
insert into Appartient values (220, 'Allemagne', 2014, 'Defenseur', 4);

insert into Joueur values (221, 'Thomas', 'Muller', '1993-02-28', '2010-10-28');
insert into Appartient values (221, 'Allemagne', 2014, 'Milieu offensif', 14);

insert into Joueur values (222, 'Julian', 'Draxler', '1985-05-22', '2005-01-10');
insert into Appartient values (222, 'Allemagne', 2014, 'Milieu offensif', 11);

insert into Joueur values (223, 'Toni', 'Kroos', '1985-05-17', '2005-03-26');
insert into Appartient values (223, 'Allemagne', 2014, 'Lateral', 7);

insert into Joueur values (224, 'Mesut', 'Ozil', '1986-01-22', '2006-09-09');
insert into Appartient values (224, 'Allemagne', 2014, 'Milieu defensif', 9);

insert into Joueur values (225, 'Miroslav', 'Klose', '1986-09-18', '2005-02-10');
insert into Appartient values (225, 'Allemagne', 2014, 'Attaquant', 11);



--Etats-Unis


insert into Joueur values (226, 'Tim', 'Howard', '1979-08-31', '1990-05-05');
insert into Appartient values (226, 'Etats-Unis', 2014, 'Gardien', 1);

insert into Joueur values (227, 'DaMarcus', 'Beasley', '1982-12-14', '2003-12-12');
insert into Appartient values (227, 'Etats-Unis', 2014, 'Defenseur', 7);

insert into Joueur values (228, 'Matt', 'Besler', '1986-02-11', '2000-02-10');
insert into Appartient values (228, 'Etats-Unis', 2014, 'Defenseur', 5);

insert into Joueur values (229, 'Michael', 'Bradley', '1987-02-28', '2010-10-28');
insert into Appartient values (229, 'Etats-Unis', 2014, 'Milieu offensif', 4);

insert into Joueur values (230, 'Jermaine', 'Jones', '1981-05-22', '2005-01-10');
insert into Appartient values (230, 'Etats-Unis', 2014, 'Milieu offensif', 13);

insert into Joueur values (231, 'Brad', 'Davis', '1981-05-17', '2005-03-26');
insert into Appartient values (231, 'Etats-Unis', 2014, 'Lateral', 14);

insert into Joueur values (232, 'Julian', 'Green', '1995-01-22', '2006-09-09');
insert into Appartient values (232, 'Etats-Unis', 2014, 'Lateral', 16);

insert into Joueur values (233, 'Clint', 'Dempsey', '1986-09-18', '2005-02-10');
insert into Appartient values (233, 'Etats-Unis', 2014, 'Attaquant', 10);



--Belgique

insert into Joueur values (234, 'Thibaut', 'Courtois', '1992-08-31', '1990-05-05');
insert into Appartient values (234, 'Belgique', 2014, 'Gardien', 1);

insert into Joueur values (235, 'Vincent', 'Kompany', '1986-12-14', '2003-12-12');
insert into Appartient values (235, 'Belgique', 2014, 'Defenseur', 4);

insert into Joueur values (236, 'Jan', 'Vertonghen', '1987-02-11', '2000-02-10');
insert into Appartient values (236, 'Belgique', 2014, 'Defenseur', 5);

insert into Joueur values (237, 'Moussa', 'Dembele', '1987-02-28', '2010-10-28');
insert into Appartient values (237, 'Belgique', 2014, 'Milieu offensif', 19);

insert into Joueur values (238, 'Marouane', 'Fellaini', '1985-05-22', '2005-01-10');
insert into Appartient values (238, 'Belgique', 2014, 'Milieu offensif', 6);

insert into Joueur values (239, 'Romelu', 'Lukaku', '1993-05-17', '2005-03-26');
insert into Appartient values (239, 'Belgique', 2014, 'Attaquant', 9);

insert into Joueur values (240, 'Dries', 'Mertens', '1986-01-22', '2006-09-09');
insert into Appartient values (240, 'Belgique', 2014, 'Attaquant', 14);

insert into Joueur values (241, 'Divock', 'Origi', '1995-09-18', '2005-02-10');
insert into Appartient values (241, 'Belgique', 2014, 'Attaquant', 17);




--Algerie


insert into Joueur values (242, 'Rais', 'MBolhi', '1988-08-31', '1990-05-05');
insert into Appartient values (242, 'Algerie', 2014, 'Gardien', 23);

insert into Joueur values (243, 'Madjid', 'Bougherra', '1985-12-14', '2003-12-12');
insert into Appartient values (243, 'Algerie', 2014, 'Defenseur', 2);

insert into Joueur values (244, 'Faouzi', 'Ghoulam', '1986-02-11', '2000-02-10');
insert into Appartient values (244, 'Algerie', 2014, 'Defenseur', 3);

insert into Joueur values (245, 'Sofiane', 'Feghouli', '1993-02-28', '2010-10-28');
insert into Appartient values (245, 'Algerie', 2014, 'Milieu offensif', 10);

insert into Joueur values (246, 'Yacine', 'Brahimi', '1985-05-22', '2005-01-10');
insert into Appartient values (246, 'Algerie', 2014, 'Milieu offensif', 11);

insert into Joueur values (247, 'Nabil', 'Ghilas', '1990-05-17', '2005-03-26');
insert into Appartient values (247, 'Algerie', 2014, 'Attaquant', 9);

insert into Joueur values (248, 'Islam', 'Slimani', '1986-01-22', '2006-09-09');
insert into Appartient values (248, 'Algerie', 2014, 'Attaquant', 13);

insert into Joueur values (249, 'El Arabi', 'Soudani', '1986-09-18', '2005-02-10');
insert into Appartient values (249, 'Algerie', 2014, 'Attaquant', 15);




--Joueurs et leurs equipes
--Russie
insert into Joueur values (300, 'Igor', 'Akinfeiev', '1986-04-08', '2004-01-20');
insert into Appartient values (300, 'Russie', 2018, 'Gardien', 1); 

insert into Joueur values (301, 'Mario', 'Fernandes', '1990-09-19', '2007-03-01');
insert into Appartient values (301, 'Russie', 2018, 'Defenseur', 2);

insert into Joueur values (302, 'Ilia', 'Koutepov', '1993-07-29', '2016-09-01');
insert into Appartient values (302, 'Russie', 2018, 'Defenseur', 3);

insert into Joueur values (303, 'Fiodor', 'Koudriachov', '1987-04-05', '2016-10-21');
insert into Appartient values (303, 'Russie', 2018, 'Defenseur', 13);

insert into Joueur values (304, 'Denis', 'Tcherychev', '1990-12-26', '2012-01-13');
insert into Appartient values (304, 'Russie', 2018, 'Milieu offensif', 6);

insert into Joueur values (305, 'Fiodor', 'Smolov', '1990-02-09', '2012-08-17');
insert into Appartient values (305, 'Russie', 2018, 'Attaquant', 10);

--Uruguay
insert into Appartient values (166, 'Uruguay', 2018, 'Gardien', 1);

insert into Appartient values (172, 'Uruguay', 2018, 'Defenseur', 2);

insert into Appartient values (170, 'Uruguay', 2018, 'Defenseur', 3);

insert into Joueur values (309, 'Carlos', 'Sanchez', '1984-12-02', '2008-02-21');
insert into Appartient values (309, 'Uruguay', 2018, 'Milieu defensif', 5);

insert into Joueur values (310, 'Rodrigo', 'Bentancur', '1997-06-25', '2013-08-19');
insert into Appartient values (310, 'Uruguay', 2018, 'Milieu offensif', 6);

insert into Joueur values (311, 'Luis', 'Suarez', '1987-01-24', '2007-09-11');
insert into Appartient values (311, 'Uruguay', 2018, 'Attaquant', 9);


--Portugal
insert into Joueur values (312, 'Rui', 'Patricio', '1988-02-15', '2010-01-17');
insert into Appartient values (312, 'Portugal', 2018, 'Gardien', 1);

insert into Joueur values (313, 'Bruno', 'Alves', '1981-11-27', '2007-08-29');
insert into Appartient values (313, 'Portugal', 2018, 'Defenseur', 2);

insert into Joueur values (314, 'Bernardo', 'Silva', '1994-08-10', '2013-01-11');
insert into Appartient values (314, 'Portugal', 2018, 'Milieu offensif', 11);

insert into Joueur values (315, 'Cristiano', 'Ronaldo', '1985-02-05', '2006-01-02');
insert into Appartient values (315, 'Portugal', 2018, 'Attaquant', 7);

insert into Joueur values (316, 'Ricardo', 'Quaresma', '1983-09-26', '2007-02-19');
insert into Appartient values (316, 'Portugal', 2018, 'Attaquant', 20);



--France

insert into Appartient values (194, 'France', 2018, 'Gardien', 1);

insert into Appartient values (196, 'France', 2018, 'Defenseur', 4);

insert into Joueur values (319, 'Samuel', 'Umtiti', '1993-11-14', '2016-08-26');
insert into Appartient values (319, 'France', 2018, 'Defenseur', 5);

insert into Joueur values (320, 'Paul', 'Pogba', '1993-03-15', '2013-06-22');
insert into Appartient values (320, 'France', 2018, 'Milieu offensif', 6);

insert into Joueur values (321, 'Kylian', 'Mbappe', '1998-12-20', '2015-01-12');
insert into Appartient values (321, 'France', 2018, 'Attaquant', 10);

insert into Joueur values (322, 'Ousmane', 'Dembele', '1997-05-15', '2014-07-28');
insert into Appartient values (322, 'France', 2018, 'Attaquant', 11);



--Argentine
insert into Joueur values (323, 'Nahuel', 'Guzman', '1986-02-10', '2008-06-30');
insert into Appartient values (323, 'Argentine', 2018, 'Gardien', 1);

insert into Joueur values (324, 'Gabriel', 'Mercado', '1987-03-18', '2010-04-11');
insert into Appartient values (324, 'Argentine', 2018, 'Defenseur', 2);

insert into Appartient values (203, 'Argentine', 2018, 'Defenseur', 16);

insert into Joueur values (326, 'Lucas', 'Biglia', '1986-01-30', '2009-07-12');
insert into Appartient values (326, 'Argentine', 2018, 'Milieu offensif', 5);

insert into Appartient values (208, 'Argentine', 2018, 'Attaquant', 10);

insert into Joueur values (328, 'Paulo', 'Dybala', '1993-11-15', '2012-08-14');
insert into Appartient values (328, 'Argentine', 2018, 'Attaquant', 21);




--Bresil
insert into Joueur values (329, 'Alisson', 'Becker', '1992-10-02', '2011-03-22');
insert into Appartient values (329, 'Bresil', 2018, 'Gardien', 1);

insert into Appartient values (102, 'Bresil', 2018, 'Defenseur', 2);

insert into Appartient values (104, 'Bresil', 2018, 'Defenseur', 12);

insert into Joueur values (332, 'Philippe', 'Coutinho', '1992-06-12', '2011-03-02');
insert into Appartient values (332, 'Bresil', 2018, 'Milieu offensif', 11);

insert into Joueur values (333, 'Roberto', 'Firmino', '1991-10-02', '2012-03-11');
insert into Appartient values (333, 'Bresil', 2018, 'Attaquant', 20);

insert into Joueur values (334, 'Gabriel', 'Jesus', '1997-03-03', '2012-02-16');
insert into Appartient values (334, 'Bresil', 2018, 'Attaquant', 9);


--Mexique
insert into Appartient values (111, 'Mexique', 2018, 'Gardien', 1);

insert into Joueur values (336, 'Hector', 'Moreno', '1988-01-17', '2008-12-11');
insert into Appartient values (336, 'Mexique', 2018, 'Defenseur', 15);

insert into Appartient values (114, 'Mexique', 2018, 'Defenseur', 3);

insert into Appartient values (116, 'Mexique', 2018, 'Milieu offensif', 16);

insert into Joueur values (339, 'Raul', 'Jimenez', '1991-05-05', '2008-02-16');
insert into Appartient values (339, 'Mexique', 2018, 'Attaquant', 9);





--Belgique
insert into Appartient values (234, 'Belgique', 2018, 'Gardien', 1);

insert into Joueur values (341, 'Thomas', 'Meunier', '1991-09-12', '2011-10-21');
insert into Appartient values (341, 'Belgique', 2018, 'Defenseur', 15);

insert into Joueur values (342, 'Kevin', 'De Bruyne', '1991-05-28', '2013-09-12');
insert into Appartient values (342, 'Belgique', 2018, 'Milieu offensif', 7);

insert into Joueur values (343, 'Yannick', 'Carrasco', '1993-09-04', '2013-08-24');
insert into Appartient values (343, 'Belgique', 2018, 'Defenseur', 11);

insert into Joueur values (344, 'Eden', 'Hazard', '1991-01-07', '2009-11-21');
insert into Appartient values (344, 'Belgique', 2018, 'Attaquant', 9);

--Japon
insert into Joueur values (345, 'Eiji', 'Kawashima', '1983-03-20', '2006-12-22');
insert into Appartient values (345, 'Japon', 2018, 'Gardien', 1);
                                
insert into Joueur values (346, 'Yuto', 'Nagatomo', '1986-09-12', '2008-01-21');
insert into Appartient values (346, 'Japon', 2018, 'Defenseur', 5);

insert into Joueur values (347, 'Hiroki', 'Sakai', '1990-04-12', '2010-04-17');
insert into Appartient values (347, 'Japon', 2018, 'Defenseur', 19);

insert into Joueur values (348, 'Shinji', 'Kagawa', '1989-03-17', '2012-02-22');
insert into Appartient values (348, 'Japon', 2018, 'Milieu offensif', 10);

insert into Joueur values (349, 'Shinji', 'Okazaki', '1986-04-16', '2008-06-12');
insert into Appartient values (349, 'Japon', 2018, 'Attaquant', 9);


--Espagne
insert into Joueur values (350, 'David', 'De Gea', '1990-11-07', '2006-03-26');
insert into Appartient values (350, 'Espagne', 2018, 'Gardien', 1);

insert into Joueur values (351, 'Dani', 'Carvajal', '1992-01-11', '2009-12-26');
insert into Appartient values (351, 'Espagne', 2018, 'Defenseur', 2);

insert into Joueur values (352, 'Sergio', 'Busquets', '1988-07-16', '2007-02-10');
insert into Appartient values (352, 'Espagne', 2018, 'Milieu defensif', 5);

insert into Joueur values (353, 'Thiago', 'Alcantara', '1991-04-11', '2011-08-21');
insert into Appartient values (353, 'Espagne', 2018, 'Milieu offensif', 10);

insert into Joueur values (354, 'Diego', 'Costa', '1988-10-07', '2008-06-19');
insert into Appartient values (354, 'Espagne', 2018, 'Attaquant', 19);

--Croatie
insert into Joueur values (355, 'Dominik', 'Livakovic', '1995-01-09', '2012-09-03');
insert into Appartient values (355, 'Croatie', 2018, 'Gardien', 1);

insert into Joueur values (356, 'Dejan', 'Lovren', '1989-07-05', '2010-05-11');
insert into Appartient values (356, 'Croatie', 2018, 'Defenseur', 6);

insert into Joueur values (357, 'Josip', 'Pivaric', '1989-01-30', '2011-03-02');
insert into Appartient values (357, 'Croatie', 2018, 'Defenseur', 22);

insert into Joueur values (358, 'Ivan', 'Rakitic', '1988-03-10', '2010-02-15');
insert into Appartient values (358, 'Croatie', 2018, 'Milieu offensif', 7);

insert into Joueur values (359, 'Mario', 'Mandzukic', '1989-02-02', '2008-01-15');
insert into Appartient values (359, 'Croatie', 2018, 'Attaquant', 17);

--Danemark
insert into Joueur values (360, 'Kasper', 'Schmeichel', '1986-11-05', '2010-07-19');
insert into Appartient values (360, 'Danemark', 2018, 'Gardien', 1);

insert into Joueur values (361, 'Andreas', 'Christensen', '1996-04-10', '2013-07-02');
insert into Appartient values (361, 'Danemark', 2018, 'Defenseur', 6);

insert into Joueur values (362, 'Christian', 'Eriksen', '1992-02-14', '2010-04-10');
insert into Appartient values (362, 'Danemark', 2018, 'Milieu offensif', 10);

insert into Joueur values (363, 'Martin', 'Braithwaite', '1991-06-05', '2011-10-18');
insert into Appartient values (363, 'Danemark', 2018, 'Attaquant', 11);

insert into Joueur values (364, 'Yussuf', 'Poulsen', '1994-06-15', '2012-05-11');
insert into Appartient values (364, 'Danemark', 2018, 'Attaquant', 20);


--Suede
insert into Joueur values (365, 'Robin', 'Olsen', '1990-01-08', '2009-08-09');
insert into Appartient values (365, 'Suede', 2018, 'Gardien', 1);

insert into Joueur values (366, 'Victor', 'Lindelof', '1994-07-17', '2012-08-19');
insert into Appartient values (366, 'Suede', 2018, 'Defenseur', 3);

insert into Joueur values (367, 'Sebastian', 'Larsson', '1985-06-06', '2009-12-02');
insert into Appartient values (367, 'Suede', 2018, 'Milieu offensif', 7);

insert into Joueur values (368, 'Gustav', 'Svensson', '1987-02-07', '2008-11-05');
insert into Appartient values (368, 'Suede', 2018, 'Milieu defensif', 13);

insert into Joueur values (369, 'John', 'Guidetti', '1992-04-15', '2012-12-15');
insert into Appartient values (369, 'Suede', 2018, 'Attaquant', 11);


--Suisse
insert into Appartient values (189, 'Suisse', 2018, 'Gardien', 1);

insert into Joueur values (371, 'Manuel', 'Akanji', '1995-07-19', '2011-08-05');
insert into Appartient values (371, 'Suisse', 2018, 'Defenseur', 5);

insert into Joueur values (372, 'Stephan', 'Lichsteiner', '1984-01-16', '2007-08-15');
insert into Appartient values (372, 'Suisse', 2018, 'Defenseur', 2);

insert into Joueur values (373, 'Granit', 'Xhaka', '1992-09-27', '2012-01-05');
insert into Appartient values (373, 'Suisse', 2018, 'Milieu defensif', 10);

insert into Joueur values (374, 'Breel', 'Embolo', '1997-02-14', '2013-01-15');
insert into Appartient values (374, 'Suisse', 2018, 'Attaquant', 7);


--Colombie
insert into Appartient values (144, 'Colombie', 2018, 'Gardien', 1);

insert into Appartient values (147, 'Colombie', 2018, 'Defenseur', 2);

insert into Joueur values (377, 'Juan', 'Cuadrado', '1988-05-26', '2012-10-21');
insert into Appartient values (377, 'Colombie', 2018, 'Milieu offensif', 11);

insert into Appartient values (154, 'Colombie', 2018, 'Attaquant', 7);

insert into Joueur values (379, 'Radamel', 'Falcao', '1986-02-10', '2008-05-22');
insert into Appartient values (379, 'Colombie', 2018, 'Attaquant', 9);


--Angleterre
insert into Joueur values (380, 'Jordan', 'Pickford', '1994-03-07', '2010-01-26');
insert into Appartient values (380, 'Angleterre', 2018, 'Gardien', 1);

insert into Joueur values (381, 'Kyle', 'Walker', '1990-07-02', '2012-11-21');
insert into Appartient values (381, 'Angleterre', 2018, 'Defenseur', 2);

insert into Joueur values (382, 'Eric', 'Dier', '1994-01-15', '2010-02-22');
insert into Appartient values (382, 'Angleterre', 2018, 'Milieu offensif', 4);

insert into Joueur values (383, 'Jesse', 'Lingard', '1992-12-15', '2012-08-16');
insert into Appartient values (383, 'Angleterre', 2018, 'Milieu offensif', 7);

insert into Joueur values (384, 'Harry', 'Kane', '1993-07-28', '2009-08-22');
insert into Appartient values (384, 'Angleterre', 2018, 'Attaquant', 9);

--Insert Stade 
insert into Stade values ('Mineirao', 'Belo Horizonte', 62547),
	('Estadio Nacional', 'Brasilia', 70064),
	('Arena Pantanal', 'Cuiaba', 42968),
	('Arena da Baixada', 'Curitiba', 41456),
	('Estadio Castelao', 'Fortaleza', 64846),
	('Arena Amazonia', 'Manaus', 42374),
	('Arena das Dunas', 'Natal', 62547),
	('Estadio Beira-Rio', 'Porto Alegre', 48849),
	('Arena Pernambuco', 'Recife', 44248),
	('Stade Maracana', 'Rio de Janeiro', 76804),
	('Arena Fonte Nova', 'Salvador', 48747),
	('Arena de Sao Paulo', 'Sao Paulo', 62547);



--Stade
insert into Stade values ('Stade Ficht', 'Sotchi', 40000),
                         ('Ak Bars Arena', 'Kazan', 45379),
                         ('Samara Arena', 'Samara', 45000),
                         ('Rostov Arena', 'Rostov sur le Don', 43472),
                         ('Stade Loujniki', 'Moscou', 81000),
                         ('Nijni Novgorod', 'Nijni Novgorod', 44899),
                         ('Gazprom Arena', 'Saint Petersbourg', 68134),
                         ('Otkrytie Arena', 'Moscou', 45360);


--Arbitre 
insert into Arbitre values (1, 'Felix', 'Brych', '1993-05-17', '2005-03-26'),
	(2, 'Cuneyt', 'Cakir', '1993-05-17', '2005-03-26'),
	(3, 'Jonas', 'Eriksson', '1993-05-17', '2005-03-26'),
	(4, 'Pedro', 'Proenca', '1993-05-17', '2005-03-26'), --------PRINCIPAL
	(5, 'Stefan', 'Lupp', '1993-05-17', '2005-03-26'),
	(6, 'Mark', 'Borsch', '1993-05-17', '2005-03-26'),
	(7, 'Tarik', 'Ongun', '1993-05-17', '2005-03-26'),
	(8, 'Mathias', 'Clasenius', '1993-05-17', '2005-03-26'),
	(9, 'Daniel', 'Warnmark', '1993-05-17', '2005-03-26'),
	(10, 'Bertinio', 'Miranda', '1993-05-17', '2005-03-26'),
	(11, 'Tiago', 'Trigo', '1993-05-17', '2005-03-26'),
	(12, 'Renato', 'Faverani', '1993-05-17', '2005-03-26'),
	(13, 'Andreas', 'Stefani', '1993-05-17', '2005-03-26'),
	(14, 'Mike', 'Mullarkey', '1993-05-17', '2005-03-26'),
	(15, 'Darren', 'Cann', '1993-05-17', '2005-03-26'); -------ASSISTANT



--Arbitre
insert into Arbitre values (50, 'Nestor', 'Pitana', '1975-06-17', '2010-01-10'),
                            (51, 'Alireza', 'Faghani', '1978-03-21', '2007-03-11'),
                            (52, 'Andres', 'Cunha', '1976-09-08', '2007-08-19'),
                            (53, 'Malang', 'Diedhiou', '1973-04-30', '2006-02-11'),
                            (54, 'Felix', 'Brych', '1975-08-03', '2007-06-21'),
                            (55, 'Janny', 'Sikazwe', '1979-05-26', '2001-08-01'),
                            (56, 'Fahad', 'Al Mirdasi', '1985-08-06', '2011-05-12'),
                            (57, 'Bakary', 'Gassama', '1979-02-10', '2007-03-22'),
                            (58, 'Szymon', 'Marciniak', '1981-01-07', '2011-06-01'),
                            (59, 'Enrique', 'Caceres', '1974-03-20', '2010-03-10'),
                            (60, 'Antonio', 'Mateu Lahoz', '1977-03-12', '2007-02-11'),
                            (61, 'Gehad', 'Grisha', '1976-02-29', '2005-12-12'),
                            (62, 'Bjorn', 'Kuipers', '1973-03-28', '2002-08-31'),
                            (63, 'Sergei', 'Karasev', '1979-06-12', '2007-07-26');


----MATCH + GERER PAR + SANCTION

insert into Match values ('2014-06-28', 'Bresil', 'Chili', 2014, 'Mineirao', 'Round de 8', 1, 1);
insert into Gerer_par values ('2014-06-28', 1, 'Principal'),
	('2014-06-28', 5, 'Assistant'), 
	('2014-06-28', 6, 'Assistant'),
	('2014-06-28', 7, 'Assistant');
insert into Sanction values (1, 110, '2014-06-28', 1, 'Jaune'),
	(2, 101, '2014-06-28', 1, 'Jaune'),
	(3, 142, '2014-06-28', 1, 'Jaune');


insert into Match values ('2014-06-29', 'Colombie', 'Uruguay', 2014, 'Stade Maracana', 'Round de 8', 2, 0);
insert into Gerer_par values ('2014-06-29', 2, 'Principal'),
	('2014-06-29', 8, 'Assistant'), 
	('2014-06-29', 9, 'Assistant'),
	('2014-06-29', 10, 'Assistant');
insert into Sanction values (4, 152, '2014-06-29', 2, 'Rouge'),
	(5, 153, '2014-06-29', 2, 'Jaune'),
	(6, 154, '2014-06-29', 2, 'Jaune');


insert into Match values ('2014-06-30', 'Pays-Bas', 'Mexique', 2014, 'Estadio Castelao', 'Round de 8', 2, 1);
insert into Gerer_par values ('2014-06-30', 3, 'Principal'),
	('2014-06-30', 11, 'Assistant'), 
	('2014-06-30', 12, 'Assistant'),
	('2014-06-30', 13, 'Assistant');
insert into Sanction values (7, 125, '2014-06-28', 3, 'Jaune'),
	(8, 125, '2014-06-30', 3, 'Jaune'),
	(9, 125, '2014-06-30', 3, 'Rouge');


insert into Match values ('2014-07-01', 'Costa Rica', 'Grece', 2014, 'Arena Pernambuco', 'Round de 8', 1, 1);
insert into Gerer_par values ('2014-07-01', 4, 'Principal'),
	('2014-07-01', 14, 'Assistant'), 
	('2014-07-01', 15, 'Assistant'),
	('2014-07-01', 1, 'Assistant');
insert into Sanction values (10, 156, '2014-07-01', 4, 'Jaune'),
	(11, 157, '2014-07-01', 4, 'Jaune');


insert into Match values ('2014-07-02', 'France', 'Nigeria', 2014, 'Estadio Nacional', 'Round de 8', 2, 0);
insert into Gerer_par values ('2014-07-02', 1, 'Principal'),
	('2014-07-02', 5, 'Assistant'), 
	('2014-07-02', 6, 'Assistant'),
	('2014-07-02', 7, 'Assistant');
insert into Sanction values (12, 213, '2014-07-02', 1, 'Jaune'),
	(13, 213, '2014-07-02', 1, 'Rouge');


insert into Match values ('2014-07-03', 'Allemagne', 'Algerie', 2014, 'Estadio Beira-Rio', 'Round de 8', 2, 1);
insert into Gerer_par values ('2014-07-03', 2, 'Principal'),
	('2014-07-03', 8, 'Assistant'), 
	('2014-07-03', 9, 'Assistant'),
	('2014-07-03', 10, 'Assistant');
insert into Sanction values (14, 221, '2014-07-03', 2, 'Jaune'),
	(15, 247, '2014-07-03', 2, 'Jaune');


insert into Match values ('2014-07-04', 'Argentine', 'Suisse', 2014, 'Arena de Sao Paulo', 'Round de 8', 1, 0);
insert into Gerer_par values ('2014-07-04', 2, 'Principal'),
	('2014-07-04', 10, 'Assistant'), 
	('2014-07-04', 3, 'Assistant'),
	('2014-07-04', 5, 'Assistant');
insert into Sanction values (16, 208, '2014-07-04', 2, 'Jaune'),
	(17, 189, '2014-07-04', 2, 'Jaune');


insert into Match values ('2014-07-05', 'Belgique', 'Etats-Unis', 2014, 'Arena Fonte Nova', 'Round de 8', 2, 1);
insert into Gerer_par values ('2014-07-05', 3, 'Principal'),
	('2014-07-05', 11, 'Assistant'), 
	('2014-07-05', 12, 'Assistant'),
	('2014-07-05', 13, 'Assistant');
insert into Sanction values (18, 232, '2014-07-05', 3, 'Jaune'),
	(19, 232, '2014-07-05', 3, 'Rouge');


insert into Match values ('2014-07-06', 'France', 'Allemagne', 2014, 'Stade Maracana', 'Quart de finale', 0, 1);
insert into Gerer_par values ('2014-07-06', 1, 'Principal'),
	('2014-07-06', 5, 'Assistant'), 
	('2014-07-06', 6, 'Assistant'),
	('2014-07-06', 7, 'Assistant');


insert into Match values ('2014-07-07', 'Bresil', 'Colombie', 2014, 'Estadio Castelao', 'Quart de finale', 2, 1);
insert into Gerer_par values ('2014-07-07', 2, 'Principal'),
	('2014-07-07', 8, 'Assistant'), 
	('2014-07-07', 9, 'Assistant'),
	('2014-07-07', 10, 'Assistant');


insert into Match values ('2014-07-08', 'Argentine', 'Belgique', 2014, 'Arena Fonte Nova', 'Quart de finale', 1, 0);
insert into Gerer_par values ('2014-07-08', 3, 'Principal'),
	('2014-07-08', 11, 'Assistant'), 
	('2014-07-08', 12, 'Assistant'),
	('2014-07-08', 13, 'Assistant');

insert into Match values ('2014-07-09', 'Pays-Bas', 'Costa Rica', 2014, 'Estadio Nacional', 'Quart de finale', 0, 0);
insert into Gerer_par values ('2014-07-09', 1, 'Principal'),
	('2014-07-09', 14, 'Assistant'), 
	('2014-07-09', 15, 'Assistant'),
	('2014-07-09', 5, 'Assistant');


insert into Match values ('2014-07-10', 'Bresil', 'Allemagne', 2014, 'Mineirao', 'Demi-finale', 1, 7);
insert into Gerer_par values ('2014-07-10', 1, 'Principal'),
	('2014-07-10', 5, 'Assistant'), 
	('2014-07-10', 6, 'Assistant'),
	('2014-07-10', 7, 'Assistant');



insert into Match values ('2014-07-11', 'Pays-Bas', 'Argentine', 2014, 'Arena da Baixada', 'Demi-finale', 0, 0);
insert into Gerer_par values ('2014-07-11', 2, 'Principal'),
	('2014-07-11', 8, 'Assistant'), 
	('2014-07-11', 9, 'Assistant'),
	('2014-07-11', 10, 'Assistant');



insert into Match values ('2014-07-13', 'Allemagne', 'Argentine', 2014, 'Stade Maracana', 'Finale', 1, 0);
insert into Gerer_par values ('2014-07-13', 1, 'Principal'),
	('2014-07-13', 11, 'Assistant'), 
	('2014-07-13', 12, 'Assistant'),
	('2014-07-13', 13, 'Assistant');
insert into Sanction values (20, 221, '2014-07-13', 1, 'Jaune'),
    (21, 222, '2014-07-13', 1, 'Jaune'),
    (22, 223, '2014-07-13', 1, 'Jaune'),
    (23, 225, '2014-07-13', 1, 'Rouge'),
	(24, 204, '2014-07-13', 1, 'Jaune'),
	(25, 205, '2014-07-13', 1, 'Rouge'),
	(26, 206, '2014-07-13', 1, 'Jaune'),
	(27, 208, '2014-07-13', 1, 'Jaune'),
	(28, 202, '2014-07-13', 1, 'Rouge');






-----------------EDITION MATCH 2018--------------------------------------------------------




--Match
insert into Match values ('2018-06-30', 'France', 'Argentine', 2018, 'Ak Bars Arena', 'Round de 8', 4, 3);
insert into Gerer_par values ('2018-06-30', 51, 'Principal'),
                                ('2018-06-30', 57, 'Assistant'),
                                ('2018-06-30', 61, 'Assistant'),
                                ('2018-06-30', 63, 'Assistant');
insert into Sanction values (50, 319, '2018-06-30', 51, 'Jaune'),
                            (51, 203, '2018-06-30', 51, 'Jaune');

insert into Match values ('2018-07-01', 'Uruguay', 'Portugal', 2018, 'Stade Ficht', 'Round de 8', 2, 1);
insert into Gerer_par values ('2018-07-01', 54, 'Principal'),
                                ('2018-07-01', 55, 'Assistant'),
                                ('2018-07-01', 56, 'Assistant'),
                                ('2018-07-01', 59, 'Assistant');
insert into Sanction values (52, 170, '2018-07-01', 54, 'Jaune'),
                            (53, 309, '2018-07-01', 54, 'Jaune'),
                            (54, 313, '2018-07-01', 54, 'Jaune');

insert into Match values ('2018-07-02', 'Espagne', 'Russie', 2018, 'Stade Loujniki', 'Round de 8', 4, 5);
insert into Gerer_par values ('2018-07-02', 60, 'Principal'),
                                ('2018-07-02', 50, 'Assistant'),
                                ('2018-07-02', 53, 'Assistant'),
                                ('2018-07-02', 55, 'Assistant');
insert into Sanction values (55, 351, '2018-07-02', 60, 'Jaune'),
                            (56, 354, '2018-07-02', 60, 'Jaune'),
                            (57, 303, '2018-07-02', 60, 'Jaune');

insert into Match values ('2018-07-03', 'Croatie', 'Danemark', 2018, 'Nijni Novgorod', 'Round de 8', 4, 3);
insert into Gerer_par values ('2018-07-03', 63, 'Principal'),
                                ('2018-07-03', 52, 'Assistant'),
                                ('2018-07-03', 57, 'Assistant'),
                                ('2018-07-03', 59, 'Assistant');
insert into Sanction values (58, 357, '2018-07-03', 63, 'Jaune'),
                            (59, 359, '2018-07-03', 63, 'Jaune'),
                            (60, 362, '2018-07-03', 63, 'Jaune');

insert into Match values ('2018-07-04', 'Bresil', 'Mexique', 2018, 'Samara Arena', 'Round de 8', 2, 0);
insert into Gerer_par values ('2018-07-04', 62, 'Principal'),
                                ('2018-07-04', 51, 'Assistant'),
                                ('2018-07-04', 56, 'Assistant'),
                                ('2018-07-04', 50, 'Assistant');
insert into Sanction values (61, 102, '2018-07-04', 62, 'Jaune'),
                            (62, 336, '2018-07-04', 62, 'Jaune');

insert into Match values ('2018-07-05', 'Belgique', 'Japon', 2018, 'Rostov Arena', 'Round de 8', 3, 2);
insert into Gerer_par values ('2018-07-05', 55, 'Principal'),
                                ('2018-07-05', 52, 'Assistant'),
                                ('2018-07-05', 61, 'Assistant'),
                                ('2018-07-05', 51, 'Assistant');
insert into Sanction values (63, 341, '2018-07-05', 55, 'Jaune'),
                            (64, 347, '2018-07-05', 55, 'Jaune');

insert into Match values ('2018-07-06', 'Suede', 'Suisse', 2018, 'Gazprom Arena', 'Round de 8', 1, 0);
insert into Gerer_par values ('2018-07-06', 51, 'Principal'),
                                ('2018-07-06', 50, 'Assistant'),
                                ('2018-07-06', 58, 'Assistant'),
                                ('2018-07-06', 57, 'Assistant');
insert into Sanction values (65, 365, '2018-07-06', 51, 'Jaune'),
                            (66, 366, '2018-07-06', 51, 'Jaune'),
                            (68, 367, '2018-07-06', 51, 'Jaune'),
                            (69, 189, '2018-07-06', 51, 'Jaune'),
                            (70, 371, '2018-07-06', 51, 'Rouge'),
                            (71, 372, '2018-07-06', 51, 'Jaune');

insert into Match values ('2018-07-07', 'Colombie', 'Angleterre', 2018, 'Otkrytie Arena', 'Round de 8', 4, 5);
insert into Gerer_par values ('2018-07-07', 60, 'Principal'),
                                ('2018-07-07', 55, 'Assistant'),
                                ('2018-07-07', 54, 'Assistant'),
                                ('2018-07-07', 53, 'Assistant');
insert into Sanction values (72, 147, '2018-07-07', 60, 'Jaune'),
                            (73, 377, '2018-07-07', 60, 'Jaune'),
                            (74, 381, '2018-07-07', 60, 'Jaune'),
                            (75, 382, '2018-07-07', 60, 'Jaune');
                                           
insert into Match values ('2018-07-08', 'Uruguay', 'France', 2018, 'Nijni Novgorod', 'Quart de finale', 0, 2);
insert into Gerer_par values ('2018-07-08', 62, 'Principal'),
                                ('2018-07-08', 63, 'Assistant'),
                                ('2018-07-08', 51, 'Assistant'),
                                ('2018-07-08', 54, 'Assistant');
insert into Sanction values (76, 170, '2018-07-08', 62, 'Jaune'),
                            (77, 310, '2018-07-08', 62, 'Jaune'),
                            (78, 320, '2018-07-08', 62, 'Jaune'),
                            (79, 319, '2018-07-08', 62, 'Jaune');

insert into Match values ('2018-07-09', 'Bresil', 'Belgique', 2018, 'Ak Bars Arena', 'Quart de finale', 1, 2);
insert into Gerer_par values ('2018-07-09', 59, 'Principal'),
                                ('2018-07-09', 52, 'Assistant'),
                                ('2018-07-09', 57, 'Assistant'),
                                ('2018-07-09', 61, 'Assistant');
insert into Sanction values (80, 102, '2018-07-09', 59, 'Jaune'),
                            (81, 104, '2018-07-09', 59, 'Jaune'),
                            (82, 341, '2018-07-09', 59, 'Jaune');
insert into Match values ('2018-07-10', 'Suede', 'Angleterre', 2018, 'Samara Arena', 'Quart de finale', 0, 2);
insert into Gerer_par values ('2018-07-10', 50, 'Principal'),
                                ('2018-07-10', 51, 'Assistant'),
                                ('2018-07-10', 59, 'Assistant'),
                                ('2018-07-10', 62, 'Assistant');
insert into Sanction values (83, 366, '2018-07-10', 50, 'Jaune'),
                            (84, 368, '2018-07-10', 50, 'Rouge'),
                            (85, 382, '2018-07-10', 50, 'Jaune');

insert into Match values ('2018-07-11', 'Russie', 'Croatie', 2018, 'Stade Ficht', 'Quart de finale', 5, 6);
insert into Gerer_par values ('2018-07-11', 53, 'Principal'),
                                ('2018-07-11', 63, 'Assistant'),
                                ('2018-07-11', 54, 'Assistant'),
                                ('2018-07-11', 55, 'Assistant');
insert into Sanction values (86, 301, '2018-07-11', 53, 'Jaune'),
                            (87, 302, '2018-07-11', 53, 'Jaune'),
                            (88, 356, '2018-07-11', 53, 'Jaune');

insert into Match values ('2018-07-12', 'France', 'Belgique', 2018, 'Gazprom Arena', 'Demi-finale', 1, 0);
insert into Gerer_par values ('2018-07-12', 51, 'Principal'),
                                ('2018-07-12', 55, 'Assistant'),
                                ('2018-07-12', 52, 'Assistant'),
                                ('2018-07-12', 59, 'Assistant');
insert into Sanction values (89, 196, '2018-07-12', 51, 'Jaune'),
                            (90, 343, '2018-07-12', 51, 'Jaune');
insert into Match values ('2018-07-13', 'Croatie', 'Angleterre', 2018, 'Stade Loujniki', 'Demi-finale', 2, 1);
insert into Gerer_par values ('2018-07-13', 54, 'Principal'),
                                ('2018-07-13', 60, 'Assistant'),
                                ('2018-07-13', 53, 'Assistant'),
                                ('2018-07-13', 58, 'Assistant');
insert into Sanction values (91, 355, '2018-07-13', 54, 'Jaune'),
                            (92, 381, '2018-07-13', 54, 'Jaune');

                        
insert into Match values ('2018-07-15', 'France', 'Croatie', 2018, 'Stade Loujniki', 'Finale', 4, 2);
insert into Gerer_par values ('2018-07-15', 60, 'Principal'),
                                ('2018-07-15', 54, 'Assistant'),
                                ('2018-07-15', 57, 'Assistant'),
                                ('2018-07-15', 56, 'Assistant');
insert into Sanction values (95, 196, '2018-07-15', 60, 'Jaune'),
                            (96, 355, '2018-07-15', 60, 'Jaune');






-------------------------------------------------------------------------------------------


--Collaborateur

insert into Collaborateur values
	(1, 'Maguy', 'Camara', 'Assistant entraineur', '1980-06-22', '2000-01-01'),
	(2, 'Christoph', 'Camer', 'Physiotherapeute', '1977-04-22', '1989-01-01'),
	(3, 'Alain', 'Simon', 'Medecin', '1978-06-22', '2000-01-01'),
	(4, 'Phillipe', 'Jaulin', 'Assistant entraineur', '1980-06-22', '2000-01-01'),
	(5, 'Guillaume', 'Paris', 'Physiotherapeute', '1980-06-22', '2000-01-01'),
	(6, 'Katy', 'Perlemuter', 'Medecin', '1980-06-22', '2000-01-01'),
	(7, 'Mathieu', 'Meyer', 'Assistant entraineur', '1980-06-22', '2000-01-01'),
	(8, 'Amir', 'Zafouli', 'Psychologue', '1980-06-22', '2000-01-01'),
	(9, 'Gilles', 'Cohen', 'Physiotherapeute', '1980-06-22', '2000-01-01'),
	(10, 'Abdoul', 'Abdoul', 'Psychologue', '1980-06-22', '2000-01-01'),
	(11, 'Jeanne', 'Audrey', 'Medecin', '1980-06-22', '2000-01-01'),
	(12, 'Al', 'Wahid', 'Assistant entraineur', '1980-06-22', '2000-01-01'),
	(13, 'Guy', 'Concordia', 'Medecin', '1980-06-22', '2000-01-01'),
	(14, 'Liam', 'Paul', 'Assistant entraineur', '1980-06-22', '2000-01-01'),
	(15, 'Honore', 'Beaugrand', 'Assistant entraineur', '1980-06-22', '2000-01-01'),
	(16, 'Marguerite', 'Samba', 'Medecin', '1980-06-22', '2000-01-01'),
	(17, 'Charles', 'Samba', 'Psychologue', '1980-06-22', '2000-01-01');








	--Collabore

insert into Collabore values 
	('Bresil', 2014,1),
	('Mexique', 2014, 2), 
	('Pays-Bas', 2014, 3), 
	('Chili', 2014, 4),
	('Chili', 2014, 5), 
	('Colombie', 2014, 17),
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





--Collaborateur
insert into Collaborateur values 
            (20, 'Walid', 'Sax', 'Assistant entraineur', '1997-03-27', '2005-10-21'),
            (21, 'Ricardo', 'Pereira', 'Medecin', '1995-02-19', '2009-08-08'),
            (22, 'Juan', 'Alcaraz', 'Kinesitherapeute', '1985-07-17', '2008-04-09'),
            (23, 'Gojo', 'Satoru', 'Cuisinier', '1980-12-31', '2002-03-02'),
            (24, 'Jules', 'Nathan', 'Ostheopathe', '1987-12-10', '2004-03-20'),
            (25, 'Ethan', 'Carl', 'Preparateur physique', '1995-06-09', '2010-10-30'),
            (26, 'Michel', 'Morcel', 'Assistant entraineur', '1990-02-10', '2007-05-12'),
            (27, 'Stephane', 'Rousseau', 'Entraineur adjoint', '1985-06-18', '2005-07-23'),
            (28, 'Kamil', 'Ladji', 'Ostheopathe', '1989-09-13', '2006-06-27'),
            (29, 'Antoine', 'Fokoue', 'Medecin', '1980-05-05', '2002-08-03'),
            (30, 'Daniel', 'Levi', 'Kinesitherapeute', '1992-04-19', '2007-09-09'),
            (31, 'Maxime', 'Blaise', 'Intendant', '1988-03-16', '2005-07-25'),
            (32, 'Giyu', 'Tomioka', 'Analyste video', '1989-08-11', '2006-05-02'),
            (33, 'Speedy', 'Gonzales', 'Kinesitherapeute', '1994-03-12', '2007-05-08'),
            (34, 'Alex', 'Morgan', 'Intendant', '1995-02-19', '2009-11-11'),
            (35, 'Georges', 'Armand', 'Intendant', '1993-07-22', '2006-10-10');

insert into Collabore values 
            ('Russie', 2018, 20), 
            ('Uruguay', 2018, 21), 
            ('Portugal', 2018, 22),
            ('France', 2018, 23), 
            ('Argentine', 2018, 24), 
            ('Bresil', 2018, 25),
            ('Mexique', 2018, 26), 
            ('Belgique', 2018, 27), 
            ('Japon', 2018, 28),
            ('Espagne', 2018, 29), 
            ('Croatie', 2018, 30),
            ('Danemark', 2018, 31), 
            ('Suede', 2018, 32), 
            ('Suisse', 2018, 33),
            ('Colombie', 2018, 34), 
            ('Angleterre', 2018, 35);






with r1 as (select * from  Match   where rang='Finale'),
arbitre1 as (select nom_a,prenom_a,arbitre_id from Arbitre),
sanction1 as (select sanction_id, arbitre_id, dateM from Sanction),
r2 as (select * from r1 natural join Gerer_par ),
r3 as (	select * from r2 NATURAL JOIN sanction1 ),
r4 as (	select * from r3 NATURAL JOIN arbitre1 ),
r5 as (select nom_a,prenom_a, count(sanction_id) as nombre_sanctions from r4 
	 GROUP BY  nom_a,prenom_a )

select* from r5  where
nombre_sanctions >= all (select nombre_sanctions from r5);



With rjoueur as (select * from Joueur where nom ='Messi' AND prenom='Lionel'),
  joueur_1 as(select joueur_id from rjoueur),
  rEdition as (select * from Appartient where edition in (2014,2018)),
  appartient_1 as (select joueur_id, nation from rEdition),
  stade_1 as (select nom_stade, ville from Stade),
  match_1 as (select nation1, nation2, edition,nom_stade from Match),
  r1 as (select * from joueur_1 natural join appartient_1),
r2 as (select * from r1 natural join match_1 where nation=nation1),
  r3 as (select * from r1 natural join match_1 where nation=nation2),
  r4 as (select * from r2 union select * from r3),
  r5 as (select  nom_stade, ville from r4 natural join stade_1)
  select * from r5;


with r1 as(select collaborateur_id, nom_C, prenom_C, expertise from Collaborateur),
r2 as(select nation1,nation2, edition from Match where edition=2018 AND rang='Finale'),
r3 as (select * from r1 natural join Collabore),
r4 as (select * from r2 natural join r3),
r5 as (select * from r4 natural join r2 where nation= nation1),
r6 as (select nation,nom_C, prenom_C, expertise  from r5 UNION (select nation, nom_C, prenom_C, expertise  from r4 natural join r2 where nation= nation2))
select * from r6;


With r1 as (select * from Joueur where 
 ( date_de_naissance BETWEEN '1985-01-01' AND '1995-01-01' )
	Order by date_de_naissance ),
	r2 as (select * from Appartient where (numero between 10 and 19) and position != 'Attaquant' AND edition=2014),
r3 as (select * FROM r1 NATURAL JOIN r2),
r4 as (select * from r3 NATURAL JOIN Sanction WHERE couleur= 'Jaune')

select nom, prenom, nation from r4 
GROUP BY nom,prenom,nation
HAVING Count(couleur) >=2 ;  


	COMMIT;
