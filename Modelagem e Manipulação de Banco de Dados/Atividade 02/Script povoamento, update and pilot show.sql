insert into Temporada (numero)
values (01)

insert into Patrocinio (nome, valor)
values
('MotorTech Brasil', 5000.00),
('Velocidade Extrema', 45000.00),
('Alta Perfomance', 40000.00),
('Turbo Racing', 42000.00),
('Pneu ProDrive', 38000.00);

insert into Equipe (nome, id_patrocinio)
values
('Escuderia Veloz', 1),
('Rápidos & Furiosos', 2),
('Fenix Racing', 3),
('Equipe Tempestade', 4),
('Corredores de Aço', 5);

insert into Etapa (nome, e_data, id_temporada)
values
('São Paulo', '2024-01-15', 1),
('Rio de Janeiro', '2024-02-20', 1),
('Campo Grande', '2024-03-18', 1),
('Londrina', '2024-04-22', 1),
('Porto Alegre', '2024-05-10', 1);

insert into Piloto (nome, dataNascimento, id_equipe)
values
('Lucas Andrade', '1995-01-01', 1),
('Renato Fugueiredo', '1994-01-01',1),
('Mateus Silva', '1996-01-01',2),
('Bruno Almeida', '1996-01-01',2),
('Carla Pereira', '1998-01-01',3),
('Gabriela Torres', '1999-01-01',3),
('João Costa','1992-01-01',4),
('Thiago Santos','1997-01-01',4),
('Mariana Gomes','1995-01-01',5),
('Beatriz Lopes', '1996-01-01',5);

insert into Etapa_has_Piloto (id_etapa, id_piloto)
values
(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10);

set sql_safe_updates = 0;
update Etapa
set nome = 'Salvador' 
where nome ='Campo Grande';

update Etapa
set nome = 'Goiânia' 
where nome ='Londrina';

update Equipe
set id_patrocinio = null
where nome = 'Corredores de Aço';

delete from Patrocinio 
where nome = 'Pneu ProDrive';

Select * from Piloto; 

Alter table Etapa
add column horario time;

alter table Piloto
add column nacionalidade varchar(50) not null,
add column peso decimal (5,2);

alter table Equipe
add column id_capitao int unique,
add foreign key (id_capitao) references Piloto (id_piloto),
on delete set null
on update cascade;

update Etapa set horario = '14:00:00' where nome = 'São Paulo';
update Etapa set horario = '15:30:00' where nome = 'Rio de Janeiro';
update Etapa set horario = '13:35:00' where nome = 'Salvador';
update Etapa set horario = '16:00:00' where nome = 'Goiânia';
update Etapa set horario = '14:30:00' where nome = 'Porto Alegre';


update Piloto set nacionalidade = 'Brasileiro', peso = 72.50 where id_piloto = 1;
update Piloto set nacionalidade = 'Brasileiro', peso = 75.00 where id_piloto = 2;
update Piloto set nacionalidade = 'Argentino', peso = 70.30 where id_piloto = 3;
update Piloto set nacionalidade = 'Uruguaio', peso = 74.10 where id_piloto = 4;
update Piloto set nacionalidade = 'Brasileira', peso = 60.20 where id_piloto = 5;
update Piloto set nacionalidade = 'Chilena', peso = 58.90 where id_piloto = 6;
update Piloto set nacionalidade = 'Brasileiro', peso = 80.00 where id_piloto = 7;
update Piloto set nacionalidade = 'Paraguaio', peso = 77.40 where id_piloto = 8;
update Piloto set nacionalidade = 'Brasileira', peso = 59.70 where id_piloto = 9;
update Piloto set nacionalidade = 'Brasileira', peso = 62.00 where id_piloto = 10;

update Equipe set id_capitao = 1 where id_equipe = 1;
update Equipe set id_capitao = 3 where id_equipe = 2;
update Equipe set id_capitao = 5 where id_equipe = 3;
update Equipe set id_capitao = 7 where id_equipe = 4;
update Equipe set id_capitao = 9 where id_equipe = 5;


select 
    p.nome as Piloto,
    p.nacionalidade,
    p.peso,
    p.dataNascimento,
    e.nome as Equipe,
    pa.nome as Patrocinador,
    case 
        when e.id_capitao = p.id_piloto then 'Sim'
        else 'Não'
    end as Capitao
from Piloto p
join Equipe e on p.id_equipe = e.id_equipe
left join Patrocinio pa on e.id_patrocinio = pa.id_patrocinio
order by e.nome, p.nome;









