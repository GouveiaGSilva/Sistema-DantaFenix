CREATE TABLE IF NOT EXISTS musicas(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40) NOT NULL UNIQUE,
    duracao TIME DEFAULT '00:00:00',
    compositor VARCHAR(40) NOT NULL,
    
    CHECK (duracao >= '00:00:00')
);

CREATE TABLE IF NOT EXISTS apresentacoes(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    endereco VARCHAR(100) NOT NULL,
    localidade VARCHAR(40) NOT NULL,
    horario TIME NOT NULL ,
    
    CHECK (horario >= '00:00:00'),
    UNIQUE(endereco,horario,localidade)
);

CREATE TABLE IF NOT EXISTS cargos(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40) NOT NULL UNIQUE,
    funcao VARCHAR(100) DEFAULT 'nao especificado'
);

CREATE TABLE IF NOT EXISTS integrantes(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	cpf VARCHAR(11) UNIQUE NOT NULL,
	nome VARCHAR(45) NOT NULL,
	idCargos INTEGER,
    idade INTEGER NOT NULL,
    sexo VARCHAR(20) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    experiencia INTEGER NOT NULL,
    
    FOREIGN KEY (idCargos) REFERENCES cargos(id),
    
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
    idFornecedores INTEGER,
    
    FOREIGN KEY (idFornecedores) REFERENCES fornecedores(id)
);

CREATE TABLE IF NOT EXISTS musicas_Instrumentos(
    idMusicas INTEGER,
    idInstrumentos INTEGER,
    qntInstrumentos INTEGER NOT NULL,
    
	FOREIGN KEY (idMusicas) REFERENCES musicas(id),
    FOREIGN KEY (idInstrumentos) REFERENCES instrumentos(id),
    
    PRIMARY KEY(idMusicas, idInstrumentos)
);

CREATE TABLE IF NOT EXISTS musicas_Integrantes(
	idIntegrantes INTEGER,
    idMusicas INTEGER,
    proficiencia VARCHAR(45) NOT NULL,
    
	FOREIGN KEY (idMusicas) REFERENCES musicas(id),
    FOREIGN KEY (idIntegrantes) REFERENCES integrantes(id),

    PRIMARY KEY(idMusicas,idIntegrantes)
);

CREATE TABLE IF NOT EXISTS integrantes_Instrumentos(
    idIntegrantes INTEGER,
    idInstrumentos INTEGER,
    proficiencia VARCHAR(45) NOT NULL,
    
    FOREIGN KEY (idIntegrantes) REFERENCES integrantes(id),
    FOREIGN KEY (idInstrumentos) REFERENCES instrumentos(id),
    
    PRIMARY KEY(idInstrumentos,idIntegrantes)
);

CREATE TABLE IF NOT EXISTS apresentacoes_Detalhadas(
    idIntegrantes INTEGER,
    idApresentacoes INTEGER,
    idMusicas INTEGER,
    idInstrumentos INTEGER,

	FOREIGN KEY(idIntegrantes) REFERENCES integrantes(id),
    FOREIGN KEY(idInstrumentos) REFERENCES instrumentos(id),
    FOREIGN KEY (idMusicas) REFERENCES musicas(id),
    FOREIGN KEY (idApresentacoes) REFERENCES apresentacoes(id),
    
    PRIMARY KEY(idApresentacoes,idMusicas,idInstrumentos,idIntegrantes)
);



