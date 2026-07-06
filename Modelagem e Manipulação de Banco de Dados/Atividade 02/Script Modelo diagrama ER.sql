create table Temporada(
id_temporada int Auto_increment primary key,
numero int not null);

create table Patrocinio(
id_patrocinio int auto_increment primary key,
nome varchar(100) not null,
valor decimal (10,2) not null,
ativo boolean not null default true);

create table Equipe(
id_Equipe int auto_increment primary key,
nome varchar(100) not null,
id_patrocinio int,
foreign key (id_patrocinio) references Patrocinio(id_patrocinio)
on delete restrict 
on update cascade );

create table Piloto(
id_Piloto int auto_increment primary key,
nome varchar(100) not null,
dataNascimento date not null,
id_equipe int not null,
foreign key (id_equipe) references Equipe(id_equipe)
on delete restrict 
on update cascade);

create table Etapa(
id_Etapa int auto_increment primary key,
nome varchar(100) not null,
e_Data date not null,
id_temporada int not null,
foreign key (id_temporada) references Temporada(id_temporada)
on delete restrict
on update cascade);

create table Etapa_has_Piloto(
id_etapa int not null,
id_piloto int not null,
primary key (id_etapa, id_piloto),
foreign key (id_etapa) references Etapa(id_etapa)
on delete cascade
on update cascade,
foreign key (id_piloto) references Piloto(id_piloto)
on delete cascade 
on update cascade);






