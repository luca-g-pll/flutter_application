drop database if exists pc;
create database pc;
use pc;

CREATE TABLE Ruoli (
  nome varchar(50) not null primary key
);

CREATE TABLE Utenti (
  id int not null primary key auto_increment,
  nome varchar (100),
  cognome varchar (100) not null,
  email varchar (255) not null,
  ruolo varchar (50) not null references Ruoli(nome)
);

CREATE TABLE Login (
	id int not null primary key auto_increment,
	username varchar(255) not null,
	password varchar(255) not null, 
	utente int not null references Utenti(id)
);

CREATE TABLE Computers (
  id int NOT NULL primary key auto_increment,
  marca varchar(100) NOT NULL,
  cpu varchar(100) NOT NULL,
  dim_ram int NOT NULL,
  status varchar(50) NOT NULL,
  note varchar(255) DEFAULT NULL,
  armadio int DEFAULT NULL references Armadi(id),
  CHECK (status='disponibile' OR status='non disponibile')
);

CREATE TABLE Ritiri (
  id int not null primary key auto_increment,
  ora_ritiro time not null,
  ora_consegna time not null,
  data date not null,
  status varchar(50) not null,
  classe varchar(15) not null,
  aula_utilizzo int not null references Aule(id),
  computer int not null references Computers(id),
  insegnante int not null
);

CREATE TABLE Armadi (
  id int NOT NULL primary key auto_increment,
  capienza int DEFAULT NULL,
  aula int DEFAULT NULL references Aule(id)
);

CREATE TABLE Aule (
  id int not null primary key auto_increment,
  nome varchar(255) not null,
  piano int not null
);

insert into Ruoli values ('Utente');
insert into Ruoli values ('Admin');
insert into Aule values (1, 'DOCENTIINFO', 2);
insert into Armadi values (1, 10, 1);
insert into Computers values (1, 'HP', 'i7', '16', 'disponibile', '', 1);
insert into Utenti values (1, 'Giuliano', 'Bellucci', 'bellux@gmail.com', 'Utente');

