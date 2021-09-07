-- Consulta sem Join - Qual o maior valor de uma Ordem de serviço na base?

SELECT MAX(valor) "Maior valor"
FROM  OrdemServico;

-- Consulta sem Join - Qual o nome da peça mais barata na base?

SELECT nome 
FROM PECA
WHERE preco = (SELECT MIN(preco)
				FROM PECA);
				
-- Consulta sem Join - Quais parcelas vencem em 2021 na base?

SELECT * 
FROM parcela
WHERE (extract(year from datavencimento) = 2021);

-- Consulta sem Join - Quais são os modelos de veículos existentes na base e seus respectivos anos?

SELECT modelo, ano
FROM veiculo;

-- Consulta com Join - Qual o nome dos clientes que possuem dívidas não pagas?

SELECT c.nome
FROM Cliente c
JOIN DIVIDA d ON (c.idcliente = d.numcliente)
WHERE d.quitada = False;

-- Consulta com Join - Exiba o nome dos clientes e o modelo dos seus respectivos veículos.

SELECT c.nome, v.modelo
FROM Cliente c
JOIN Veiculo v ON (C.idcliente = v.idveiculo);

/* Conculta com Join - Exiba o nome das Categorias em ordem alfabética, independentemente se houver ou não uma peça associada à ela. Se existir,
deve aparecer ainda o nome da peças associadas à categoria, o nome fornecedor da peça e o seu preço de venda.
Atenção: Caso haja mais de um fornecedor de uma peça, ele também deve aparecer.*/

SELECT c.nome Categoria, p.nome Peca, f.nome Fornecedor,  p.preco "Preço de venda"
FROM Categoria c
LEFT JOIN Peca p ON (c.idcategoria = p.idcategoria)
LEFT JOIN PecaFornecedor pf ON (p.idpeca = pf.numpeca)
LEFT JOIN Fornecedor f ON (f.idfornecedor = pf.numfornecedor)
ORDER BY Categoria ASC;

/*Consulta com Join - Exiba o nome dos mecânicos independente se ele executou ou não uma OS. Se ele executar,
deve aparecer o id da OS, o tipo de serviço que ele realizou, o modelo do veículo em que feito o trabalho e o nome
do cliente dono da moto.
Atenção: Caso haja mais de um mecânico execute uma OS, ele(s) também deve(m) aparecer.*/

SELECT m.nome Mecanico, os.idOrdemServico idOS, s.descricao Servico, v.modelo Veiculo, c.nome Cliente
FROM OrdemServico_Mecanico os_m
RIGHT JOIN mecanico m On (os_m.nummecanico = m.idmecanico)
LEFT JOIN OrdemServico os ON (os.idOrdemServico = os_m.numos)
LEFT JOIN ServicoVeiculo sv ON (os.numservico = sv.numservico) AND (os.numveiculo = sv.numveiculo)
LEFT JOIN Servico s ON (os.numservico = s.idservico)
LEFT JOIN veiculo v ON (os.numveiculo = v.idveiculo)
LEFT JOIN Cliente c ON (v.numcliente = c.idcliente);

