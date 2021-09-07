--28
SELECT faz.nome AS "Fazenda", func.nome "Responsavel"
FROM fazendas AS faz
LEFT JOIN funcionarios AS func ON faz.codfuncresp=func.codigo;

--29
SELECT func.codigo AS "COD FUNCIONARIO", func.nome AS "FUNCIONARIOS", faz.codigo AS "COD FAZENDA",faz.nome AS "FAZENDAS"  
FROM funcionario_fazenda AS ff
INNER JOIN funcionario AS func ON (ff.codigofunc=func.codigo)
RIGHT JOIN fazenda AS faz ON (ff.codfazenda=faz.codigo)
ORDER BY faz.nome;

--30
SELECT a.nome
FROM animais AS a
WHERE a.idlote = (SELECT a.idLote
                                 FROM animais AS a
                                 WHERE a.nome='Malhado')
AND a.nome<>'Malhado';

--31
SELECT func.nome "Nome do funcionário", f.nome AS "Nome da Fazenda"
FROM  funcionario AS func
LEFT JOIN fazenda AS f ON f.codfuncresp=func.codigo
WHERE salario>=7000;

--32) Listar o nome de todos os funcionários, juntamente com o nome da fazenda onde eles trabalham. 
SELECT func.nome Funcionario, faz.nome Fazenda
FROM funcionario_fazenda ff
RIGHT JOIN funcionario func ON (ff.codigofunc = func.codigo)
LEFT JOIN fazenda faz ON (ff.codfazenda = faz.codigo); 

--33) Listar o código e o nome de todos os lotes da fazenda ‘Bela Vista do Campo’.
SELECT l.idlote "Código Lote", l.descricao "Nome do lote"
FROM lote l
JOIN fazenda faz ON (l.codfazenda = faz.codigo)
AND lower(faz.nome) = 'bela vista do campo';

--34
SELECT f.nome, l.descricao, a.nome
FROM fazenda AS f
LEFT JOIN lote as l ON (f.codigo=l.codfazenda)
LEFT JOIN animal AS a ON (l.idlote=a.idlote);

--35
DELETE FROM funcionario 
USING funcionario_fazenda
WHERE (funcionario_fazenda.codigofunc = funcionario.codigo) AND (extract (year FROM funcionario_fazenda.dataInicioContrato)=2016);

DELETE FROM funcionario
WHERE codigo IN (SELECT codigofunc 
                                  FROM funcionario_fazenda 
                                  WHERE (extract (year FROM funcionario_fazenda.dataInicioContrato)=2016));

--36
UPDATE funcionario f
SET salario = salario*1.1
FROM lote AS l
WHERE (l.codfuncresp = f.codigo);


