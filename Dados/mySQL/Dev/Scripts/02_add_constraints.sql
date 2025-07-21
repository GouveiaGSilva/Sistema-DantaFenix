
-- Constraints da tabela apresentacoes
ALTER TABLE apresentacoes
ADD CONSTRAINT UQ_apresentacoes_endereco_horario_local
UNIQUE(endereco,horario,localidade);
    
    
-- Constraints da tabela integrantes     
ALTER TABLE integrantes
ADD CONSTRAINT FK_integrantes_idCargos
FOREIGN KEY (idCargos) REFERENCES cargos(id);


-- Constraints da tabela instrumentos
ALTER TABLE instrumentos
ADD CONSTRAINT FK_instrumentos_idFornecedores
FOREIGN KEY (idFornecedores) REFERENCES fornecedores(id);


-- Constraints da tabela instrumentos_Condicoes
ALTER TABLE instrumentos_Condicoes
ADD CONSTRAINT FK_instrumentos_idInstrumentos
FOREIGN KEY (idInstrumentos) REFERENCES instrumentos(id),
ADD CONSTRAINT FK_condicoes_idCondicoes
FOREIGN KEY (idCondicoes) REFERENCES condicoes(id),
ADD CONSTRAINT PK_instrumentos_Condicoes_idInstrumentos_idCondicoes
PRIMARY KEY (idInstrumentos, idCondicoes);


-- Constraints da tabela musicas_Instrumentos
ALTER TABLE musicas_Instrumentos
ADD CONSTRAINT FK_musicas_Instrumentos_idMusicas
FOREIGN KEY (idMusicas) REFERENCES musicas(id),
ADD CONSTRAINT FK_musicas_Instrumentos_idInstrumentos
FOREIGN KEY (idInstrumentos) REFERENCES instrumentos(id),
ADD CONSTRAINT PK_musicas_Instrumentos_idMusicas_idInstrumentos
PRIMARY KEY(idMusicas, idInstrumentos);


-- Constraints da tabela musicas_Integrantes
ALTER TABLE musicas_Integrantes
ADD CONSTRAINT FK_musicas_Integrantes_idMusicas
FOREIGN KEY (idMusicas) REFERENCES musicas(id),
ADD CONSTRAINT FK_musicas_Integrantes_idIntegrantes
FOREIGN KEY (idIntegrantes) REFERENCES integrantes(id),
ADD CONSTRAINT PK_musicas_Integrantes_idMusicas_idIntegrantes
PRIMARY KEY(idMusicas,idIntegrantes);


-- Constraints da tabela integrantes_Instrumentos
ALTER TABLE integrantes_Instrumentos
ADD CONSTRAINT FK_integrantes_Instrumentos_idIntegrantes
FOREIGN KEY (idIntegrantes) REFERENCES integrantes(id),
ADD CONSTRAINT FK_integrantes_Instrumentos_idInstrumentos
FOREIGN KEY (idInstrumentos) REFERENCES instrumentos(id),
ADD CONSTRAINT PK_integrantes_Instrumentos_idIntegrantes_idInstrumentos
PRIMARY KEY(idInstrumentos,idIntegrantes);


-- Constraints da tabela apresentacoes_Detalhadas
ALTER TABLE apresentacoes_Detalhadas
ADD CONSTRAINT FK_apresentacoes_Detalhadas_idIntegrantes
FOREIGN KEY(idIntegrantes) REFERENCES integrantes(id),
ADD CONSTRAINT FK_apresentacoes_Detalhadas_idInstrumentos
FOREIGN KEY(idInstrumentos) REFERENCES instrumentos(id),
ADD CONSTRAINT FK_apresentacoes_Detalhadas_idMusicas
FOREIGN KEY (idMusicas) REFERENCES musicas(id),
ADD CONSTRAINT FK_apresentacoes_Detalhadas_idApresentacoes
FOREIGN KEY (idApresentacoes) REFERENCES apresentacoes(id),
ADD CONSTRAINT PK_apresentacoes_Detalhadas_Int_Inst_Mus_Apr
PRIMARY KEY(idApresentacoes,idMusicas,idInstrumentos,idIntegrantes);