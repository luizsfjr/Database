CREATE TABLE Cliente(
	idCliente integer,
	Nome varchar(45) NOT NULL,
	CPF varchar(11) NOT NULL,
	RG varchar(7),
	DataNascimento date,
	CEP varchar(8),
	Numero varchar(4),
	Bairro varchar(20),
	Email varchar(50),
	Telefone1 varchar(15),
	Telefone2 varchar(15),
	PRIMARY KEY(idCliente)
);

CREATE TABLE Servico(
	idServico integer,
	Descricao varchar(45),
	PRIMARY KEY(idServico)
);

CREATE TABLE Veiculo(
	idVeiculo integer,
	numCliente integer,
	Modelo varchar(45),
	Ano integer,
	PRIMARY KEY(idVeiculo),
	FOREIGN KEY (numCliente) REFERENCES Cliente(idCliente) ON UPDATE CASCADE
);

CREATE TABLE ServicoVeiculo(
	numVeiculo integer,
	numServico integer,
	dataServico date,
	PRIMARY KEY(numVeiculo, numServico, dataServico),
	FOREIGN KEY (numVeiculo) REFERENCES Veiculo(idVeiculo) ON UPDATE CASCADE ON DELETE NO ACTION,
	FOREIGN KEY (numServico) REFERENCES Servico(idServico) ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE Divida(
	idDivida integer,
	numCliente integer,
	dataEmissao date,
	valor money,
	quitada boolean,
	dataQuitacao date,
	PRIMARY KEY(idDivida),
	FOREIGN KEY (numCliente) REFERENCES Cliente(idCliente) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE OrdemServico(
	idOrdemServico integer,
	numServico integer,
	numVeiculo integer,
	numDivida integer,
	valor money,
	paga boolean,
	PRIMARY KEY(idOrdemServico),
	FOREIGN KEY (numVeiculo) REFERENCES Veiculo(idVeiculo) ON UPDATE CASCADE ON DELETE NO ACTION,
	FOREIGN KEY (numServico) REFERENCES Servico(idServico) ON UPDATE CASCADE ON DELETE NO ACTION,
	FOREIGN KEY (numDivida) REFERENCES Divida(idDivida) ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE Mecanico(
	idMecanico integer,
	Nome varchar(45) NOT NULL,
	RG varchar(7),
	DataNascimento date,
	Telefone1 varchar(15),
	Telefone2 varchar(15),
	PRIMARY KEY(idMecanico)
);

CREATE TABLE OrdemServico_Mecanico(
	numOS integer,
	numMecanico integer,
	concluida boolean,
	PRIMARY KEY(numOS, numMecanico),
	FOREIGN KEY (numOS) REFERENCES OrdemServico(idOrdemServico) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (numMecanico) REFERENCES Mecanico(idMecanico) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Parcela(
	idParcela integer,
	numDivida integer,
	valor money,
	dataVencimento date,
	dataPagamento date,
	PRIMARY KEY(idParcela),
	FOREIGN KEY (numDivida) REFERENCES Divida(idDivida) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Categoria(
	idCategoria integer,
	nome varchar(20),
	descricao varchar(30),
	PRIMARY KEY(idCategoria)
);

CREATE TABLE Peca(
	idPeca integer,
	idCategoria integer,
	nome varchar(40),
	descricao varchar(50),
	qtdEstoque integer,
	preco money,
	PRIMARY KEY(idPeca),
	FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE ServicoVeiculo_Peca(
	numVeiculo integer,
	numServico integer,
	numPeca integer,
	dtUltimoUso date,
	PRIMARY KEY(numVeiculo, numServico, numPeca, dtUltimoUso),
	FOREIGN KEY (numVeiculo) REFERENCES Veiculo(idVeiculo) ON UPDATE CASCADE ON DELETE NO ACTION,
	FOREIGN KEY (numServico) REFERENCES Servico(idServico) ON UPDATE CASCADE ON DELETE NO ACTION,
	FOREIGN KEY (numPeca) REFERENCES Peca(idPeca) ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE Apelido(
	idApelido integer,
	numPeca integer,
	apelido varchar(30),
	PRIMARY KEY(idApelido),
	FOREIGN KEY (numPeca) REFERENCES Peca(idPeca) ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE Fornecedor(
	idFornecedor integer,
	nome varchar(45),
	CNPJ varchar(14),
	cidade varchar(15),
	logradouro varchar(20),
	CEP varchar(8),
	Telefone1 varchar(15),
	Telefone2 varchar(15),
	PRIMARY KEY(idFornecedor)
);


CREATE TABLE PecaFornecedor(
	numFornecedor integer,
	numPeca integer,
	DtUltimaCompra date,
	qtde integer,
	PRIMARY KEY(numFornecedor, numPeca),
	FOREIGN KEY (numPeca) REFERENCES Peca(idPeca) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (numFornecedor) REFERENCES Fornecedor(idFornecedor) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE PrecoCompra(
	idPrecoCompra integer,
	numPeca integer,
	preco money,
	PRIMARY KEY(idPrecoCompra),
	FOREIGN KEY (numPeca) REFERENCES Peca(idPeca) ON UPDATE CASCADE ON DELETE CASCADE
);








