------------------------------------------------------------- Projeto Final - Implementação de Banco de Dados ------------------------------------------------------------------------




--Criação do banco de dados "aluguel_imoveis"

CREATE DATABASE aluguel_imoveis;

--Criação das tabelas

CREATE TABLE proprietario 
(id_proprietario INT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(255),
    cpf VARCHAR(40),
    cadastro_plataforma_on BOOLEAN,
    imovel INT
);

CREATE TABLE imovel 
(id_imovel INT PRIMARY KEY,
    endereco VARCHAR(255) NOT NULL,
    tipo_propriedade VARCHAR(20),
    area VARCHAR(20),
    n_quarto INT,
    n_banheiro INT
);

CREATE TABLE inquilino 
(id_inquilino INT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(255),
    cpf VARCHAR(40),
    imovel INT
);

CREATE TABLE corretor 
(id_corretor INT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(255),
    cpf VARCHAR(40)
);

--Implementação de Relacionamentos
--Adicionando chave estrangeira na tabela "proprietario"
ALTER TABLE proprietario ADD FOREIGN KEY (imovel) REFERENCES imovel(id_imovel) ON DELETE SET NULL;

--Adicionando chave estrangeira na tabela "inquilino"
ALTER TABLE inquilino ADD FOREIGN KEY (imovel) REFERENCES imovel(id_imovel) ON DELETE SET NULL;



--Criação de tabelas adicionais contendo a relação de proprietario e corretor e a relação de corretor e inquilino respectivamente

CREATE TABLE pro_corretor
(id_proprietario INT, id_corretor INT,
PRIMARY KEY(id_proprietario, id_corretor),
FOREIGN KEY(id_proprietario) REFERENCES proprietario(id_proprietario) ON DELETE CASCADE,
FOREIGN KEY(id_corretor) REFERENCES corretor(id_corretor) ON DELETE CASCADE);


CREATE TABLE corretor_inqui
(id_corretor INT, id_inquilino INT,
PRIMARY KEY(id_corretor, id_inquilino),
FOREIGN KEY(id_corretor) REFERENCES corretor(id_corretor) ON DELETE CASCADE,
FOREIGN KEY(id_inquilino) REFERENCES inquilino(id_inquilino) ON DELETE CASCADE);



--Populando as Tabelas

INSERT INTO proprietario VALUES 
(1, 'José', 'Rua exemplo, bairro exemplo1', '+5571975863052', 'exemplo@gmail.com', '78523698753', TRUE, 100),
(2, 'João', 'Rua exemplo1, bairro exemplo2', '+5571976663052', 'exemplo93@gmail.com', '78522698753', TRUE, 101),
(3, 'Tereza', 'Rua exemplo2, bairro exemplo2', '+5571975860052', 'exemplo@bol.com.br', '88528998753', TRUE, 103),
(4, 'Gondim', 'Rua exemplo3, bairro exemplo3', '+5571865863052', 'exemplo@hotmail.com', '68523698722', FALSE, 102),
(5, 'Judas', 'Rua exemplo4, bairro exemplo4', '+5571978963052', 'exemplo@yahoo.com.br', '68786987536', TRUE, 105),
(6, 'Maria', 'Rua exemplo5, bairro exemplo17', '+5571998863052', 'exemplo45@gmail.com', '48523698753', TRUE, 104),
(7, 'Pablo Gomes', 'Rua exemplo55, bairro exemplo23', '+5571976663052', 'exemplo12@gmail.com', '88528898536', FALSE, 106),
(8, 'Fernanda Bonfim', 'Rua exemplo21, bairro exemplo17', '+5571975833052', 'exemplo556@gmail.com', '68523697536', FALSE, 108),
(9, 'Ezequias', 'Rua exemplo27, bairro exemplo78', '+5571977863052', 'exemplo222@yahoo.com.br', '78523328756', TRUE, 107),
(10, 'Margô', 'Rua exemplo89, bairro exemplo169', '+5571975863662', 'exemplo021@bol.com', '55236998536', FALSE, 109);


INSERT INTO imovel VALUES 
(100, 'Rua exemplo1, bairro exemplo1', 'casa', '40m²', 2, 1),
(101, 'Rua exemplo2, bairro exemplo3', 'casa', '100m²', 3, 2),
(102, 'Rua exemplo3, bairro exemplo162', 'Apartamento', '30m²', 2, 1),
(103, 'Rua exemplo4, bairro exemplo4', 'Apartamento', '40m²', 2, 2),
(104, 'Rua exemplo5, bairro exemplo168', 'casa', '120m²', 3, 2),
(105, 'Rua exemplo6, bairro exemplo22', 'casa', '30m²', 1, 1),
(106, 'Rua exemplo7, bairro exemplo182', 'casa', '150m²', 3, 3),
(107, 'Rua exemplo98, bairro exemplo222', 'apartamento', '30²', 1, 1),
(108, 'Rua exemplo22, bairro exemplo1288', 'Apartamento', '30m²', 1, 1),
(109, 'Rua exemplo179, bairro exemplo189', 'casa', '120m²', 2, 1);


INSERT INTO inquilino VALUES 
(1000, 'Fagner', 'Rua exemplo658, bairro exemplo1', '+55719758003052', 'exemplo@gmail.com', '78526998753', 100),
(1001, 'Maria José', 'Rua exemplo, bairro exemplo8932', '+5571975869052', 'exemplo111@gmail.com', '78523698223', 102),
(1002, 'Carlos Henrique', 'Rua exemplo, bairro exemplo061', '+5571975860052', 'exemplo@hotmail.com', '78528898753', 101),
(1003, 'Macedo', 'Rua exemplo1111, bairro exemplo1111', '+5571999863052', 'exemplo644@gmail.com', '78523698333', 104),
(1004, 'Barney', 'Rua exemplo, bairro exemploexemplo', '+5571975693052', 'exemplo0265@gmail.com', '78523698753', 103),
(1005, 'Mirco', 'Rua exemplo, bairro-bairro', '+5571975773052', 'exemplo778@gmail.com', '78523548753', 106),
(1006, 'Batista', 'Rua-rua, bairro exemplo1', '+5571975643052', 'exemploasa@gmail.com', '78523248753', 105),
(1007, 'John', 'Rua-rua-rua, bairro-bairro', '+5571235863052', 'exemplo231@gmail.com', '78213698753', 108),
(1008, 'Maria Rita', 'Rua exemplo401, bairro exemplo401', '+5571976663052', 'exemplo6620@gmail.com', '78001698753', 107),
(1009, 'Naty', 'Rua exemplo0000, bairro exemplo1111', '+5571975863042', 'exemplo478@gmail.com', '78673698753', 109);


INSERT INTO corretor VALUES 
(300, 'Júlio', 'Rua exemplo58, bairro exemplo1', '+55719758333052', 'exemplo11@gmail.com', '78526998753'),
(301, 'Juliana', 'Rua exemplo21, bairro exemplo8932', '+5571975779052', 'exemplo221@gmail.com', '78523718223'),
(302, 'Larissa', 'Rua exemplo53, bairro exemplo061', '+5571975804052', 'exemplo33@hotmail.com', '78528208753'),
(303, 'Marcos Gouveia', 'Rua exemplo069, bairro exemplo1111', '+5571839863052', 'exemplo4@gmail.com', '76523698333'),
(304, 'Miercolis', 'Rua exemplo, bairro exemploexemplo879', '+5571970093052', 'exemplo0265@gmail.com', '48523698753'),
(305, 'Saulo', 'Rua exemplo, bairro-bairro214', '+5571975023052', 'exemplo698@gmail.com', '18523548753'),
(306, 'Garrido', 'Rua-rua, bairro exemplo11158', '+5571979843052', 'exemploas058@gmail.com', '28523248753'),
(307, 'Igor', 'Rua-rua-rua, bairro-bairro3694', '+5571235213052', 'exemplo777@gmail.com', '68213698753'),
(308, 'Sora', 'Rua exemplo401, bairro exemplo201', '+5571966663052', 'exemplo201@gmail.com', '58001698753'),
(309, 'Sara', 'Rua exemplo0220, bairro exemplo11', '+55718775863042', 'exemplo20148@gmail.com', '98673698753');


INSERT INTO pro_corretor VALUES 
(1, 300),
(1, 309),
(2, 305),
(3, 305),
(5, 302),
(10, 309),
(9, 309),
(8, 304),
(4, 308),
(8, 308);

INSERT INTO corretor_inqui VALUES 
(304, 1001),
(304, 1009),
(305, 1009),
(302, 1006),
(303, 1004),
(309, 1002),
(309, 1007),
(301, 1008),
(303, 1008),
(303, 1000);

