--Encontre os códigos dos funcionários que são responsáveis por fazendas ou por lotes.
(SELECT codfuncresp FROM fazenda) 
UNION 
(SELECT codfuncresp FROM lote);

--tirando o registro [null] da consulta anterior
(SELECT codfuncresp FROM fazenda WHERE codfuncresp IS NOT NULL) 
UNION 
(SELECT codfuncresp FROM lote WHERE codfuncresp IS NOT NULL);

--Encontre os nomes dos funcionários que são responsáveis por fazendas ou por lotes.
(SELECT f.nome FROM funcionario f, fazenda faz WHERE f.codigo=faz.codfuncresp) 
UNION 
(SELECT f.nome FROM funcionario f, lote l WHERE f.codigo=l.codfuncresp);
 
(SELECT f.nome 
 FROM funcionario f, fazenda faz 
 WHERE f.codigo=faz.codfuncresp) 
UNION 
(SELECT f.nome 
 FROM funcionario f, lote l 
 WHERE f.codigo=l.codfuncresp);

--Encontre os códigos dos funcionários que são responsáveis por fazendas e por lotes. 
(SELECT codfuncresp FROM fazenda) 
INTERSECT 
(SELECT codfuncresp FROM lote);

SELECT * FROM fazenda;

SELECT * FROM lote;

UPDATE lote
SET codfuncresp=4
WHERE codfuncresp=1;

(SELECT codfuncresp FROM fazenda WHERE codfuncresp IS NOT NULL) 
INTERSECT 
(SELECT codfuncresp FROM lote WHERE codfuncresp IS NOT NULL);

SELECT nome FROM funcionario WHERE codigo=4;

--Encontre os códigos dos funcionários que têm que são responsáveis por fazendas, mas não por lotes. 
(SELECT codfuncresp FROM fazenda WHERE codfuncresp IS NOT NULL) 
EXCEPT 
(SELECT codfuncresp FROM lote WHERE codfuncresp IS NOT NULL)

SELECT nome FROM funcionario WHERE codigo=6;

--------------FUNCOES DE AGREGAÇÃO COM GROUPBY
SELECT count(*) 
FROM funcionario;

SELECT experiencia, count(experiencia) 
FROM funcionario
GROUP BY experiencia;

SELECT f.nome_funcao, count(nome_funcao) 
FROM funcao f
JOIN funcionario func ON func.codfuncao=f.codigo
GROUP BY nome_funcao;

SELECT * 
FROM funcionario;
GROUP BY experiencia;

--Quantidade de funcionarios trabalhando em cada fazenda
SELECT *
FROM funcionario_fazenda;


SELECT codfazenda, count(codigofunc)
FROM funcionario_fazenda
GROUP BY codfazenda
ORDER BY codfazenda;


