CREATE TABLE IF NOT EXISTS musicas(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40) NOT NULL UNIQUE,
    duracao TIME DEFAULT '00:00:00' CHECK (duracao >= '00:00:00'),
    compositor VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS apresentacoes(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    endereco VARCHAR(100) NOT NULL,
    localidade VARCHAR(40) NOT NULL,
    horario TIME NOT NULL DEFAULT '00:00:00' CHECK (horario >= '00:00:00')
		
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
    idade INTEGER NOT NULL CHECK(idade > 4),
    sexo VARCHAR(20) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    experiencia INTEGER NOT NULL
    
);

CREATE TABLE IF NOT EXISTS fornecedores(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    cnpj VARCHAR(14) NOT NULL UNIQUE,
    nome VARCHAR(40) NOT NULL,
    endereco VARCHAR(100) UNIQUE
    
);

CREATE TABLE IF NOT EXISTS instrumentos(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    idFornecedores INTEGER
    
);

CREATE TABLE IF NOT EXISTS condicoes(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    condicao VARCHAR(45) NOT NULL UNIQUE
    
);

CREATE TABLE IF NOT EXISTS instrumentos_Condicoes(
	idInstrumentos INTEGER,
    idCondicoes INTEGER,
    quantidade INTEGER NOT NULL CHECK(quantidade >=0),
    observacao VARCHAR(45) DEFAULT 'Sem Alteração'
    
);

CREATE TABLE IF NOT EXISTS musicas_Instrumentos(
    idMusicas INTEGER,
    idInstrumentos INTEGER,
    qntInstrumentos INTEGER NOT NULL
    
);

CREATE TABLE IF NOT EXISTS musicas_Integrantes(
	idIntegrantes INTEGER,
    idMusicas INTEGER,
    proficiencia VARCHAR(45) NOT NULL
    
);

CREATE TABLE IF NOT EXISTS integrantes_Instrumentos(
    idIntegrantes INTEGER,
    idInstrumentos INTEGER,
    proficiencia VARCHAR(45) NOT NULL
    
);

CREATE TABLE IF NOT EXISTS apresentacoes_Detalhadas(
    idIntegrantes INTEGER,
    idApresentacoes INTEGER,
    idMusicas INTEGER,
    idInstrumentos INTEGER
	
);





