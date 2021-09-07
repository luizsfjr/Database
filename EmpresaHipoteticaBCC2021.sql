DROP TABLE IF EXISTS cargo;
DROP TABLE IF EXISTS departamento;
DROP TABLE IF EXISTS empregado;
DROP TABLE IF EXISTS obra;
DROP TABLE IF EXISTS empregado_obra;

CREATE TABLE cargo (
  codigo serial,
  nome varchar(50) NOT NULL,
  PRIMARY KEY (codigo)
);

CREATE TABLE departamento (
   codigo integer PRIMARY KEY,
   nome varchar(50) NOT NULL
);

CREATE TABLE empregado (
  codigo integer NOT NULL,
  primeiro_nome varchar(30),
  sobrenome varchar(50), 
  sexo char(1) DEFAULT 'M', 
  cpf char(11),
  codCargo integer NOT NULL,
  dataNascimento date,
  dataAdmissao date,  
  salario real CHECK(salario >= 1100.00), 
  ativo boolean DEFAULT true,	
  codDepartamento integer NOT NULL,
  PRIMARY KEY (codigo),
  FOREIGN KEY (codCargo) REFERENCES cargo(codigo) ON DELETE CASCADE,
  FOREIGN KEY (codDepartamento) REFERENCES departamento (codigo) ON DELETE CASCADE
);

CREATE TABLE obra (
  codigo integer NOT NULL,
  descricao varchar(50),
  cidade varchar(50) NOT NULL DEFAULT 'Santarém',
  dataInicio date,
  dataPrevistaTermino date,
  situacao varchar(20) NOT NULL,
  orcamento money,	
  PRIMARY KEY (codigo)
);

CREATE TABLE empregado_obra (
   codObra integer NOT NULL,
   codEmpregado integer NOT NULL,
   dataAlocacaoEmpregado date,
   PRIMARY KEY (codObra, codEmpregado),
   FOREIGN KEY (codObra) REFERENCES obra(codigo) ON DELETE CASCADE,
   FOREIGN KEY (codEmpregado) REFERENCES empregado(codigo) ON DELETE CASCADE
);