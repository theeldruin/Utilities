---------------------------------------------------------------------------------------------------------------------------------------
----- Validar em quais respostas determinada opção foi marcada -----------------------------
----- Trocar o X, nos DOIS CAMPOS, pelo número correspondente a condição que deseja buscar
----- 1 = OPCAO 1, 2 = OPCAO 2, 3 = OPCAO 3, 4 = OPCAO 4, 5 = OPCAO 5
---------------------------------------------------------------------------------------------------------------------------------------
----- O Select é apenas para testar a condição, caso queira comparar com o valor via banco
---------------------------------------------------------------------------------------------------------------------------------------

---- Criaremos uma tabela respostas, onde será armazenado o SOMATORIO das opções marcadas
--- 01 - Opção 1
--- 02 - Opção 2
--- 04 - Opção 3
--- 08 - Opção 4
--- 16 - Opção 5

-- Se marcar as opções 2 e 5 terá o valor 18 (02 + 16) por exemplo

CREATE TABLE respostas (
	somatorio_questoes_marcadas int8
);

--- Vamos inserir alguns valores na tabela
INSERT INTO respostas VALUES (63);
INSERT INTO respostas VALUES (50);
INSERT INTO respostas VALUES (20);
INSERT INTO respostas VALUES (8);
INSERT INTO respostas VALUES (2);
INSERT INTO respostas VALUES (6);
INSERT INTO respostas VALUES (9);
INSERT INTO respostas VALUES (1);

-- No SELECT abaixo eu trago o valor do campo SE a opção que coloquei na variavel X estiver marcada
SELECT
    somatorio_questoes_marcadas
FROM
    respostas
    --- Trocar o X no próximo campo
WHERE 
	substring(somatorio_questoes_marcadas::bit(32)::varchar,33-X,1)::integer = 1
