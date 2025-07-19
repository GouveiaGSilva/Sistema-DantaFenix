-- Isert da tabela musicas
INSERT 
INTO musicas (id,nome,duracao,compositor) 
VALUES (1, 'Sakura', '00:03:45', 'Taro Yamada'),
(2, 'Kaze no Uta', '00:04:10', 'Hiroshi Tanaka'),
(3, 'Fênix','00:05:20','Akira Suzuki'),
(4, 'Yuki no Hana', '00:04:00', 'Haruki Murakami'),
(5, 'Tsuki no Sora', '00:03:30', 'Naoko Kato'),
(6, 'Hana', '00:05:10', 'Emi Takahashi');


-- Isert da tabela fornecedores
INSERT IGNORE
INTO fornecedores(id, cnpj, nome, endereco)
VALUES (1, '12345678000190', 'Música & Cia', 'Rua dos Instrumentos, 100'),
(2, '98765432000155', 'Sonorização Ltda', 'Av. das Américas, 500'),
(3, '19283746500129', 'Som e Luz', 'Praça Central, 15');


-- Isert da tabela cargos
INSERT 
INTO cargos (id, nome, funcao)
VALUES (1, 'Líder', 'Coordena o grupo'),
(2, 'Tocador', 'Executa as peças musicais'),
(3, 'Auxiliar', 'Apoia a logística'),
(4, 'Técnico de Som', 'Responsável pelo equipamento'),
(5, 'Produtor', 'Planeja eventos e logística');


-- Isert da tabela apresentacoes
INSERT
INTO apresentacoes (id, endereco, localidade, horario)
VALUES (1, 'Rua das Flores, 123', 'Centro', '19:00:00'),
(2, 'Av. Paulista, 500', 'São Paulo', '20:30:00'),
(3, 'Praça da Liberdade, 75', 'Belo Horizonte', '18:00:00'),
(4, 'Teatro Municipal, 10', 'Rio de Janeiro', '21:00:00'),
(5, 'Parque das Águas, 80', 'Curitiba', '17:30:00');


-- Isert da tabela integrantes 
INSERT
INTO integrantes (id, cpf, nome, idCargos, idade, sexo, endereco, experiencia)
VALUE (1, '12345678901', 'Carlos Silva', 2, 28, 'Masculino', 'Rua das Acácias, 45', 5),
(2, '23456789012', 'Mariana Souza', 1, 32, 'Feminino', 'Av. Brasil, 200', 8),
(3, '34567890123', 'João Pereira', 3, 25, 'Masculino', 'Travessa das Oliveiras, 10', 2),
(4, '45678901234', 'Ana Beatriz', 2, 27, 'Feminino', 'Rua do Sol, 150', 6),
(5, '56789012345', 'Felipe Gomes', 4, 30, 'Masculino', 'Avenida Central, 300', 7),
(6, '67890123456', 'Carla Dias', 5, 35, 'Feminino', 'Rua Nova, 75', 9);


-- Isert da tabela instrumentos;
INSERT
INTO instrumentos (id, nome, condicao, quantidade, idFornecedores) 
VALUES(2, 'Shime-daiko', 'Bom', 6, 2),
(3, 'Okedo-daiko', 'Regular', 3, 3),
(4, 'Chappa', 'Novo', 5, 1),
(7, 'Kane', 'Bom', 3, 2),
(9, 'Uchiwa-daiko', 'Ruim', 2, 3),
(10, 'Bamboo Flute', 'Novo', 5, 2);


-- Isert da tabela musicas_Instrumentos
INSERT
INTO musicas_Instrumentos (idMusicas, idInstrumentos, qntInstrumentos)
VALUES (1, 1, 3),
(1, 2, 2),
(2, 1, 4),
(3, 3, 1),
(4, 4, 2),
(4, 6, 1),
(5, 5, 3),
(6, 1, 2);


-- Isert da tabela musicas_Integrantes
INSERT
INTO musicas_Integrantes (idIntegrantes, idMusicas, proficiencia)
VALUES (1, 1, 'Avançado'),
(2, 2, 'Intermediário'),
(3, 3, 'Iniciante'),
(4, 4, 'Avançado'),
(5, 5, 'Intermediário'),
(6, 6, 'Avançado');


-- Isert da tabela integrantes_Instrumentos
INSERT
INTO integrantes_Instrumentos (idIntegrantes, idInstrumentos, proficiencia)
VALUES (1, 1, 'Avançado'),
(2, 2, 'Intermediário'),
(3, 3, 'Iniciante'),
(4, 4, 'Avançado'),
(5, 5, 'Intermediário'),
(6, 6, 'Avançado');


-- Isert da tabela apresentacoes_Detalhadas
INSERT
INTO apresentacoes_Detalhadas (idIntegrantes, idApresentacoes, idMusicas, idInstrumentos)
VALUES (1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 4),
(5, 5, 5, 5),
(6, 5, 6, 6);