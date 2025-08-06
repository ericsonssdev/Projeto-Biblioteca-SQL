USE Biblioteca;

--Tabelas


-- Tabela de Autores
CREATE TABLE Autores
(
	idAutor		int		primary key		identity,
	Nome		varchar(100)			not null,
	Nacionalidade varchar(50)
);


--Tabela de Livros
CREATE TABLE Livros
(
	idLivro		int		primary key		identity,
	Titulo		varchar(150)			not null,
	AnoPublicacao	int,
	Categoria	varchar(50),
	idAutor		int,
	FOREIGN KEY (idAutor) REFERENCES Autores(idAutor)
);


--Tabela de Membros
CREATE TABLE Membros 
(
	idMembro	int		primary key		identity,
	Nome		varchar(100)			not null,
	Email		varchar(100)			not null		unique,
	DataCadastro date	default		getdate()
);


--Tabela de Emprestimos
CREATE TABLE Emprestimos 
(
	idEmprestimo	int		primary key		identity,
	idMembro		int,
	idLivro			int,
	DataEmprestimo	date	not null	default		getdate(),
	DataDevolucaoPrevista	date	not null,
	DataDevolucaoReal		date	not null,
	FOREIGN KEY	(idMembro)	REFERENCES Membros(idMembro),
	FOREIGN KEY (idLivro)	REFERENCES Livros(idLivro),
);


--Tabela de Multas
CREATE TABLE Multas 
(
	idMulta		int		primary key		identity,
	idEmprestimo	int,
	Valor	decimal(6,2)	not null,
	Pago	BIT		default 0,
	FOREIGN KEY (idEmprestimo)	REFERENCES Emprestimos(idEmprestimo)
);