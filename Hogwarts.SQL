-- Tabela das Casas
CREATE TABLE IF NOT EXISTS Casas (
  idCasas INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(45) NOT NULL,
  fundador VARCHAR(45),
  caracteristicas LONGTEXT,
  animal_simbolo VARCHAR(45)
);

-- Tabela de Professores
CREATE TABLE IF NOT EXISTS Professores (
  idProfessores INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  area_de_conhecimento VARCHAR(100)
);

-- Tabela de Matérias
CREATE TABLE IF NOT EXISTS Materias (
  idMaterias INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  Professores_idProfessores INT,
  FOREIGN KEY (Professores_idProfessores) REFERENCES Professores(idProfessores)
);

-- Tabela de Alunos
CREATE TABLE IF NOT EXISTS Alunos (
  idAlunos INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  casa VARCHAR(255) NOT NULL,
  idade INT NOT NULL,
  ano INT NOT NULL,
  Casas_idCasas INT NOT NULL,
  FOREIGN KEY (Casas_idCasas) REFERENCES Casas(idCasas)
);

-- Tabela de Feitiços
CREATE TABLE IF NOT EXISTS Feiticos (
  idFeiticos INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  efeito LONGTEXT,
  dificuldade INT
);

-- Tabela de Criaturas Mágicas
CREATE TABLE IF NOT EXISTS Criaturas_Magicas (
  idCriaturas INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  especie VARCHAR(45),
  habitat VARCHAR(45),
  caracteristicas LONGTEXT
);

-- Relacionamento N:N Alunos <-> Matérias
CREATE TABLE IF NOT EXISTS Alunos_has_Materias (
  Alunos_idAlunos INT NOT NULL,
  Materias_idMaterias INT NOT NULL,
  PRIMARY KEY (Alunos_idAlunos, Materias_idMaterias),
  FOREIGN KEY (Alunos_idAlunos) REFERENCES Alunos(idAlunos),
  FOREIGN KEY (Materias_idMaterias) REFERENCES Materias(idMaterias)
);

-- Relacionamento N:N Feitiços <-> Alunos
CREATE TABLE IF NOT EXISTS Feiticos_has_Alunos (
  Feiticos_idFeiticos INT NOT NULL,
  Alunos_idAlunos INT NOT NULL,
  PRIMARY KEY (Feiticos_idFeiticos, Alunos_idAlunos),
  FOREIGN KEY (Feiticos_idFeiticos) REFERENCES Feiticos(idFeiticos),
  FOREIGN KEY (Alunos_idAlunos) REFERENCES Alunos(idAlunos)
);

-- Relacionamento N:N Feitiços <-> Matérias
CREATE TABLE IF NOT EXISTS Feiticos_has_Materias (
  Feiticos_idFeiticos INT NOT NULL,
  Materias_idMaterias INT NOT NULL,
  PRIMARY KEY (Feiticos_idFeiticos, Materias_idMaterias),
  FOREIGN KEY (Feiticos_idFeiticos) REFERENCES Feiticos(idFeiticos),
  FOREIGN KEY (Materias_idMaterias) REFERENCES Materias(idMaterias)
);

-- Relacionamento N:N Alunos <-> Criaturas Mágicas
CREATE TABLE IF NOT EXISTS Alunos_has_Criaturas_Magicas (
  Alunos_idAlunos INT NOT NULL,
  Criaturas_Magicas_idCriaturas INT NOT NULL,
  PRIMARY KEY (Alunos_idAlunos, Criaturas_Magicas_idCriaturas),
  FOREIGN KEY (Alunos_idAlunos) REFERENCES Alunos(idAlunos),
  FOREIGN KEY (Criaturas_Magicas_idCriaturas) REFERENCES Criaturas_Magicas(idCriaturas)
);

INSERT INTO Casas (nome, fundador, caracteristicas, animal_simbolo)
VALUES
  ('Grifinória', 'Godric Gryffindor', 'Coragem, bravura, determinação', 'Leão'),
  ('Sonserina', 'Salazar Slytherin', 'Astúcia, ambição, liderança', 'Serpente'),
  ('Corvinal', 'Rowena Ravenclaw', 'Inteligência, criatividade, sabedoria', 'Águia'),
  ('Lufa-Lufa', 'Helga Hufflepuff', 'Lealdade, paciência, justiça', 'Texugo');
