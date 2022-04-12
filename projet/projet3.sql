BEGIN TRANSACTION;
drop schema if exists Projet3 cascade;

create schema Projet3;
set search_path to Projet3;


create table Coupe_du_monde(
	edition int not null,
	unique (edition),
	pays_org text not null,
	constraint sur_edition (edition >= 1), 
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
	foreign key collaborateur_id references Collaborateur(collaborateur_id) 
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
	constraint sur_rang check (rang in ('Round de 8', 'Quart de finale'
		'Demi-finale', '3e place', 'Finale')),
	constraint sur_score check (score_eq2 >=0 and score_eq1>=0),
	primary key (dateM, nation1, nation2, edition, nom_stade),
	foreign key nom_stade references Stade(nom_stade),
	foreign key edition references Coupe_du_monde(edition),
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
	foreign key joueur_id references Joueur(joueur_id)
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
	foreign key dateM references Match(dateM),
	foreign key arbitre_id references Arbitre(arbitre_id)
);

create table Sanction(
	sanction_id serial not null,
	joueur_id int not null,
	dateM date not null,
	arbitre_id int not null,
	couleur text not null,
	constraint sur_couleur check (couleur in ('Jaune', 'Rouge')),
	primary key (sanction_id),
	foreign key joueur_id references Joueur(joueur_id),
	foreign key dateM references Match(dateM),
	foreign key arbitre_id references Arbitre(arbitre_id)
);


--Place aux insertions 