create database sistema_faculdade;

use sistema_faculdade;


create table tbl_professores (
	id int primary key not null auto_increment,
	nome_completo varchar(45) not null,
	cpf varchar(15) not null
);

create table tbl_email_professores (
	id int primary key not null auto_increment,
	email_professores varchar(250) not null,
	id_professores int not null,

	constraint FK_email_professores
	foreign key (id_professores)
	references tbl_professores (id)
);

create table tbl_telefone_professores (
	id int primary key not null auto_increment,
	telefone_professores varchar(45) not null,
	id_professores int not null,

	constraint FK_telefone_professores
	foreign key (id_professores)
	references tbl_professores (id)
);

create table tbl_alunos (
	id int primary key not null auto_increment,
	nome_completo varchar(45) not null,
	data_nascimento date not null,
	matricula varchar(45) not null,
	curso varchar(45) not null,
	status_matricula varchar(45) not null,
	rg varchar(15) not null,
	cpf varchar(15) not null
);

create table tbl_endereco_alunos (
	id int primary key not null auto_increment,
	logradouro varchar(45) not null,
	cidade varchar(45) not null,
	bairro varchar(45) not null,
	cep varchar(45) not null,
	id_alunos int not null,

	constraint FK_endereco_alunos
	foreign key (id_alunos)
	references tbl_alunos(id)
);

create table tbl_email_alunos (
	id int primary key not null auto_increment,
	email_alunos varchar(250) not null,
	id_alunos int not null,
    
    constraint FK_email_alunos
    foreign key (id_alunos)
    references tbl_alunos(id)
);

create table tbl_telefone_alunos (
	id int not null primary key not null auto_increment,
	telefone_alunos varchar(45) not null,
	id_alunos int not null,

	constraint FK_telefone_alunos
	foreign key(id_alunos)
	references tbl_alunos(id)
);

create table tbl_curso (
	id int primary key not null auto_increment,
	nome_curso varchar(45) not null,
	duracao_curso varchar(45) not null,
	id_alunos int not null,

	constraint FK_curso_alunos
	foreign key (id_alunos)
	references tbl_alunos(id)	 
);

create table tbl_notas (
	id int primary key not null auto_increment,
	notas varchar(45) not null,
	id_alunos int not null,

	constraint FK_notas_alunos
	foreign key(id_alunos)
	references tbl_alunos(id)
);

create table tbl_turmas (
	id int primary key not null auto_increment,
	semestre varchar(45) not null,
	id_curso int not null,

	constraint FK_turmas_curso
	foreign key (id_curso)
	references tbl_curso(id)
);

create table tbl_horarios (
	id int primary key not null auto_increment,
	dia_semana varchar(45) not null,
	horario_inicio varchar(45) not null,
	horario_fim varchar(45) not null,
	id_turmas int not null,

	constraint FK_horario_turmas
	foreign key(id_turmas)
	references tbl_turmas(id)
);

create table tbl_disciplinas (
	id int primary key not null auto_increment,
	nome_disciplina varchar(45) not null,
	carga_horaria varchar(45) not null,
	faltas varchar(45) not null,
	id_horarios int not null,
	id_notas int not null,
	id_curso int not null,
	id_professores int not null,

	constraint FK_horarios_disciplinas
	foreign key(id_horarios)
	references tbl_horarios(id),

	constraint FK_notas_disciplinas
	foreign key(id_notas)
	references tbl_notas(id),

	constraint FK_curso_disciplinas
	foreign key(id_curso)
	references tbl_curso(id),

	constraint FK_professores_disciplinas
	foreign key(id_professores)
	references tbl_professores(id)
);

insert into 
	tbl_alunos (nome_completo, data_nascimento, matricula, curso, cpf, status_matricula, rg)
values 
	('Alberto dos Santos', '2003-05-17', '265417', 'Direito', '23514523689', 'Ativo', '648525349'),
	('Thiago Junior Souza', '1998-08-05', '558764', 'Educação Fisica', '24589612756', 'Concluido', '754218469'),
    ('Eloisa Aguiar Bento', '2005-03-10', '541289', 'Enfermagen', '21478564985', 'Inativo', '541978431'),
    ('Miguel Gomes Carvalho', '2008-01-05', '235479', 'Administração', '85479613548', 'Inativo', '478563149'),
    ('Elisa Malta dos Santos', '1998-08-01', '254785', 'Psicologia', '35417856941', 'Ativo', '854612497');
    
insert into 
	tbl_endereco_alunos (logradouro, cidade, bairro, cep, id_alunos)
values
	('Rua dos Anjos', 'São Paulo', 'Jardim Angelo', '34555796', 1),
    ('Rua Emilia Pilon', 'Diadema', 'Jardim Paulista', '0555778', 2),
	('Rua Caconde', 'Cotia', 'Vila Sonia', '54123697',3),
    ('Rua Sapetuba', 'São Paulo', 'Vila Madalena', '05558964', 4),
    ('Rua Aurélia', 'São Paulo', 'Rio Pequeno', '04440542', 5);
    
    

select * from tbl_alunos;
select * from tbl_endereco_alunos;
    
    