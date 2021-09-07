
INSERT INTO Cliente VALUES
(1, 'Luiz Fernandes', '12345678910', '1234567', '23/11/1981', '68200000','1717', 'Aningal', 'lc.fernandes@gmail.com', '093991548762', '093981475622'),
(2, 'Marcio Marinho', '22345566811', '3334467', '14/08/1992', '65300456','1215', 'Centro', 'm.marinho@gmail.com', '093992558854', NULL),
(3, 'Maria Lima', '45678912390', '9874560', '01/10/2001', '68849200', NULL, 'São Francisco', NULL, '093991254761', NULL),
(4, 'Leo Alves', '22109876541', '1011450', '15/11/1999', '68200000', NULL, 'Aningal', NULL, '092992277761', '093991874523');

INSERT INTO Servico VALUES
(1,'Trocar pneu'),
(2,'Trocar óleo'),
(3,'Revisão geral'),
(4,'Trocar embreagem');

INSERT INTO Veiculo VALUES
(1,1,'Bros 125',2019),
(2,2,'Biz 100',2015),
(3,3,'XRE 300',2020),
(4,4,'Fan 160',2019);

INSERT INTO ServicoVeiculo VALUES
(1,3, '21/03/2018'),
(1,4, '22,04/2019'),
(2,2, '19/02/2020'),
(4,3, '25/04/2021');

INSERT INTO Divida VALUES
(1,2, '22/03/2018', 150.00, TRUE, '24/04/2018'),
(2,3, '25/04/2019', 250.00, FALSE, NULL),
(3,1, '19/02/2020', 500.00, TRUE, '25/02/2020'),
(4,4, '26/04/2021', 140.00, FALSE, NULL);

INSERT INTO OrdemServico VALUES
(1, 1, 1, 1, 150.00, FALSE),
(2, 2, 2, 2, 250.00, FALSE),
(3, 3, 3, 3, 500.00, FALSE),
(4, 4, 4, 4, 140.00, FALSE),
(5, 3, 1, NULL, 1000.00, TRUE);

INSERT INTO Mecanico VALUES
(1, 'Marcelo Alves', '4251684', '15/02/1993', '093991245678', '093981247000'),
(2, 'Eduardo Silva', '4178922', '17/06/1998', '093991649900', NULL),
(3, 'Mateus Cabral', '8456741', '21/08/1999', '093991814201', NULL);

INSERT INTO OrdemServico_Mecanico VALUES
(1, 1, True),
(1, 2, True),
(3, 1, False),
(4, 2, False);

INSERT INTO Parcela VALUES
(1, 2, 125.00, '26/04/2019', NULL),
(2, 2, 125.00, '26/05/2019', NULL),
(3, 4, 70.00, '26/05/2021', NULL),
(4, 4, 70.00, '26/05/2021', NULL);

INSERT INTO Categoria VALUES
(1, 'Pneu', NULL),
(2, 'Óleo', 'Todos os tipos de óleos.'),
(3, 'Disco', 'Todos os tipos de discos.'),
(4, 'Retrovisor', NULL);

INSERT INTO Peca VALUES
(0, NULL, 'Serviço', 'Mão de obra', NULL, NULL),
(1, 1, 'Pneu Traseiro da Bros', 'Pneu traseiro Aro 17 da Bros, Rinaldi.', 5, 150.00),
(2, 1, 'Pneu dianteiro da Biz', 'Pneu dianteiro Aro 17 da Biz, Maggion.', 2, 80.00),
(3, 2, 'Óleo Mobil 4T 20W-50', 'Óleo mobil 4T 20W-50, para altas temperaturas ', 15, 15.00),
(4, 2, 'Óleo Castrol 4T', 'Óleo castol, indicado para alto desempenho. ', 12, 20.00),
(5, 4, 'Retrovisor modelo pequeno', 'Retrovisor original pop e biz', 7, 16.00);

INSERT INTO ServicoVeiculo_Peca VALUES
(1, 2, 3, '21/04/2018'),
(1, 2, 3, '17/11/2018'),
(2, 1, 2, '26/08/2019'),
(2, 1, 2, '21/05/2020'),
(2, 3, 0, '19/02/2021');

INSERT INTO Apelido VALUES
(1, 3, 'Lubrificante'),
(2, 3, 'Lubrificador'),
(3, 5, 'Espelho');

INSERT INTO Fornecedor VALUES
(1, 'Moto Show LTD', '12345678910121', 'Santarém', 'Borges Leal', '68040440', '093991546723', '35428711'),
(2, 'Moto Mais LTD', '14131211109876', 'Santarém', 'Mendança Furtado', '68040990','093981472301', NULL),
(3, 'DAKRA SA', '20191817161514', 'Manaus', 'Jóse de Anchieta', '12345678', '092991472004', '35669800');

INSERT INTO PecaFornecedor VALUES
(1, 1, '08/02/2021', 20),
(2, 1, '07/02/2021', 5),
(3, 2, '15/02/2021', 8),
(3, 3, '11/01/2021', 14),
(3, 4, '10/12/2020', 10),
(1, 5, '06/08/2020', 10);

INSERT INTO PrecoCompra VALUES
(1, 1 , 110.00),
(2, 2 , 50.00),
(3, 3 , 10.00),
(4, 4, 15.00),
(5, 5 , 11.00);