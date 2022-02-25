/* CRIAÇÃO DA TABELA*/

CREATE TABLE Cliente(
    codigo int,
    nome varchar(50),
    sexo char(1),
    altura float
);

/*INSERINDO DADOS NA TABLE*/
/*------------- DML [DATA MANIPULATION LANGUAGE]-------------------*/
INSERT INTO Cliente(codigo, nome , sexo, altura) 
VALUES(1, 'Maria da Silva', 'F', 1.60); 
INSERT INTO Cliente(codigo, nome , sexo, altura) 
VALUES(2, 'Leonardo Carvalho', 'M', 1.55);
INSERT INTO Cliente(codigo, nome , sexo, altura) 
VALUES(3, 'Pikachu Boaventura', 'M', 1.75);
INSERT INTO Cliente(codigo, nome , sexo, altura) 
VALUES(4, 'Gohan da Gomes', 'M', 1.73);
INSERT INTO Cliente(codigo, nome , sexo, altura) 
VALUES(5, 'Naruto Usumaki', 'M', 1.58);
INSERT INTO Cliente(codigo, nome , sexo, altura) 
VALUES(6, 'Rosangela Silva', 'F', 1.75);
INSERT INTO Cliente(codigo, nome , sexo, altura) 
VALUES(7, 'Joana Dark', 'F', 1.73);
INSERT INTO Cliente(codigo, nome , sexo, altura) 
VALUES(8, 'Rosana dos Ventos', 'F', 1.80);
INSERT INTO Cliente(codigo, nome , sexo, altura) 
VALUES(9, 'Marcos Antonio', 'M', 1.88);
INSERT INTO Cliente(codigo, nome , sexo, altura) 
VALUES(10, 'Joao Pedro', 'M', 1.88);
INSERT INTO Cliente(codigo, nome , sexo, altura) 
VALUES(11, 'Pedro Manoel', 'M', 1.88);
INSERT INTO Cliente(codigo, nome , sexo, altura) 
VALUES(12, 'Pedro Carlos', 'M', 1.99);
INSERT INTO Cliente(codigo, nome , sexo, altura) 
VALUES(13, 'Flavia Souza Lima', 'F', 1.33);
INSERT INTO Cliente(codigo, nome , sexo, altura) 
VALUES(14, 'Roberta Souza Santos', 'F', 1.67);

/* BUSCANDO TODOS OS DADOS DA TABELA*/
SELECT * FROM Cliente; 

/* BUSCANDO TODOS DO SEXO MASCULINO*/
SELECT * FROM Cliente WHERE sexo='M'; 

/* BUSCANDO PELO NOME*/
SELECT * FROM Cliente WHERE nome ='Leonardo Carvalho'; 

/*BUSCANDO TODOS COM ALTURA MAIOR QUE 1.70*/
SELECT * FROM Cliente WHERE  altura>1.70;

/*BUSCANDO PELO CÓDIGO*/
SELECT * FROM Cliente WHERE codigo<>5; 

/*BUSCANDO TODOS QUE TENHAM O PRIMEIRO NOME DE PEDRO*/
SELECT * FROM Cliente WHERE nome LIKE 'Pedro%'; 

/* BUSCANDO TODOS QUE TENHAM O ULTIMO NOME DE SILVA*/
SELECT * FROM Cliente WHERE nome LIKE '%Silva'; 

/*BUSCANDO TODOS QUE TENHAM O "SOUZA" NO NOME*/
SELECT * FROM Cliente WHERE nome LIKE '%Souza%'; 

/*BUSCA A LISTA POR NOME ASCENDENTE*/
SELECT * FROM Cliente ORDER BY nome ASC; 

 /*BUSCA A LISTA POR NOME DESCENDENTE*/
SELECT * FROM Cliente ORDER BY nome DESC;

/*BUSCA A LISTA POR ALTURA ASCENDENTE*/
SELECT * FROM Cliente ORDER BY altura ASC; 

/*BUSCA APENAS NOME E ALTURA DE TODOS DO SEXO FEMININO*/
SELECT nome , altura FROM Cliente 
WHERE sexo = 'F' 
ORDER BY altura ASC; 

/*[2 CRITÉRIOS DE BUSCA]BUSCA TODOS DO SEXO MASCULINO E ALTURA MAIOR QUE 1.80*/
SELECT * FROM Cliente WHERE sexo='M' AND altura >1.80; 

/*[3 CRITÉRIOS DE BUSCA]BUSCA TODOS DO SEXO MASCULINO, ALTURA MAIOR QUE 1.80 E COM SOUZA NO NOME*/
SELECT * FROM Cliente WHERE sexo='M' 
AND altura >1.80 AND nome 'Souza'; 

/*[ALTERA A TABLEA] ADICIONA UMA NOVA COLUNA COM DATA DE NASCIMENTO NA TABELA*/
ALTER TABLE Cliente ADD data_nascimento date;

/*INSERE CLIENTE COM A DATA DE NASCIMENTO [FUNÇÃO TO_DATE('--/--/----','DD/MM/YYYY')]*/
INSERT INTO Cliente(codigo, nome , sexo, altura, data_nascimento) 
VALUES (15, 'Rogério Lorenzo', 'M', 2.04, 
TO_DATE('05/08/1987','DD/MM/YYYY'));

/*************************************************/
/*******************AULA O2***********************/
/*************************************************/


/*ATUALIZA O NOME DO CLIENTE ATRAVÉS DO CÓDIGO*/
UPDATE Cliente SET nome = 'Gohan Gomes' WHERE codigo=4;

/*ADICIONA/ALTERA DATA DE NASCIMENTO ATRÁVES DO CÓDIGO*/
UPDATE Cliente SET data_nascimento = TO_DATE('15/12/1999','DD/MM/YYYY') WHERE codigo=1;

/*ADICIONA/ALTERA DATA DE NASCIMENTO E ALTURA ATRÁVES DO CÓDIGO*/
UPDATE Cliente SET altura = 1.77, data_nascimento=TO_DATE('13/02/1997','DD/MM/YYYY') WHERE codigo=2;

/*DEIXA TODOS CAMPOS DE NASCIMENTO EM NULL[VAZIO]*/
UPDATE Cliente SET data_nascimento=null;

/*APAGA UM CLIENTE ATRAVÉS DO CÓDIGO*/
DELETE FROM Cliente WHERE codigo=8;

/*APAGA A TABELA COMPLETA*/
DROP TABLE Cliente;

/*APAGA OS CLIENTE QUE TEM O CÓDIGO 
MAIOR OU IGUAL 13 E MENOR OU IGUAL A 16*/
DELETE FROM Cliente WHERE codigo >=13 AND codigo <=16;

/*ADICIONA A COLUNA "PESO" NA TABELA*/
ALTER TABLE Cliente add peso float;

/*MUDA A QUANTIDADE DE CARACTERES DO NOME PARA 100*/
ALTER TABLE Cliente MODIFY nome varchar(100);

/*RENOMEIA A COLUNA DATA NASCIMENTO*/
ALTER TABLE Cliente RENAME COLUMN data_nascimento TO data_nasc;

/*RENOMEIA A TABELA*/
ALTER TABLE Cliente RENAME TO tb_clientes;
ALTER TABLE tb_clientes RENAME TO Cliente;

/*EXCLUIR A COLUNA PESO*/
ALTER TABLE Cliente DROP COLUMN peso;


/*ADICIONA UMA RESTRIÇÃO NA COLUNA NOME [NÃO PERMITE VAZIO]*/
ALTER TABLE Cliente MODIFY COLUMN nome varchar(100) NOT NULL;



/*CRIA SEQUENCIA DE AUTO INCREMENT[DEVO USAR: cod.nextval]*/
CREATE SEQUENCE cod
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

/*INSERE CLIENTE COM AUTO INCREMENT*/
INSERT INTO Cliente(codigo, nome , sexo, altura) 
VALUES(cod.nextval, 'Maria da Silva', 'F', 1.60);
INSERT INTO Cliente(codigo, nome , sexo, altura) 
VALUES(cod.nextval, 'Leonardo Carvalho', 'M', 1.55);
INSERT INTO Cliente(codigo, nome , sexo, altura) 
VALUES(cod.nextval, 'Pikachu Boaventura', 'M', 1.75);
INSERT INTO Cliente(codigo, nome , sexo, altura) 
VALUES(cod.nextval, 'Gohan da Gomes', 'M', 1.73);
INSERT INTO Cliente(codigo, nome , sexo, altura) 
VALUES(cod.nextval, 'Naruto Usumaki', 'M', 1.58);

/*ALTERA ORDEM DA COLUNA SEXO PARA DEPOIS DA COLUNA NOME*/
ALTER TABLE Cliente
MODIFY COLUMN sexo varchar(1)
AFTER nome;

/*[CORRIGIR OS ID] APAGA E ADICIONA A COLUNA ID COM INCREMENTOS*/
ALTER TABLE cliente DROP id;
ALTER TABLE Cliente ADD id INT(255) NOT NULL AUTO_INCREMENT FIRST, ADD PRIMARY KEY (id);