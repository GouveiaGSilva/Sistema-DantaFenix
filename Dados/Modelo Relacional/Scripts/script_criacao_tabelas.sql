CREATE TABLE IF NOT EXISTS musicas(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40) NOT NULL UNIQUE,
    duracao TIME ,
    compositor VARCHAR(40) NOT NULL,
    
    CHECK (duracao >= 0)
);



CREATE TABLE IF NOT EXISTS apresentacoes(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    endereco VARCHAR(100) NOT NULL,
    horario TIME NOT NULL,
    localidade VARCHAR(40) NOT NULL,
    
    UNIQUE(endereco,horario,localidade)
);

CREATE TABLE IF NOT EXISTS cargos(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40) NOT NULL UNIQUE,
    funcao VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS integrantes(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    nome VARCHAR(45) NOT NULL,
    idade INTEGER NOT NULL,
    sexo VARCHAR(20) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    experiencia INTEGER NOT NULL,
    FOREIGN KEY (id_Cargos) REFERENCES cargos(id),
    
    CHECK(idade > 4)
);

CREATE TABLE IF NOT EXISTS fornecedores(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    cnpj VARCHAR(14) NOT NULL UNIQUE,
    nome VARCHAR(40) NOT NULL,
    endereco VARCHAR(100) UNIQUE
);

CREATE TABLE IF NOT EXISTS instrumentos(
	id INTEGER PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    condicao VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_Fornecedores) REFERENCES fornecedores(id)
);

CREATE TABLE IF NOT EXISTS musicas_Instrumentos(
	FOREIGN KEY (id_Musicas) REFERENCES musicas(id),
    FOREIGN KEY (id_Instrumentos) REFERENCES instrumentos(id),
    quantidade INTEGER NOT NULL,
    PRIMARY KEY(id_Musicas, id_Instrumentos)
);

CREATE TABLE IF NOT EXISTS musicas_Integrantes(
	FOREIGN KEY (id_Musicas) REFERENCES musicas(id),
    FOREIGN KEY (id_Integrantes) REFERENCES integrantes(id),
	proficiencia VARCHAR(45) NOT NULL,
    PRIMARY KEY(id_Musicas,id_Integrantes)
);







SELECT *
FROM musicas

