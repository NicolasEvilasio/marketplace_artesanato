CREATE TABLE Produtos
(
 idProduto SERIAL PRIMARY KEY,
 nomeProduto CHAR(50) NOT NULL,
 descricaoProduto TEXT,
 precoProduto FLOAT NOT NULL,
 idLoja INT NOT NULL,
 CHECK (precoProduto > 0)
);

CREATE TABLE Estoques
(
 idEstoque SERIAL PRIMARY KEY,
 quantidadeProdutoEstoque INT NOT NULL,
 idLoja INT NOT NULL,
 idProduto INT,
 CHECK (quantidadeProdutoEstoque > 0)
);

CREATE TABLE Clientes
(
 idCliente SERIAL PRIMARY KEY,
 nomeCliente VARCHAR(255) NOT NULL,
 cpfCliente CHAR(11) NOT NULL,
 emailCliente VARCHAR(255) NOT NULL,
 telefoneCelularCliente INT NOT NULL,
 logradouroCliente VARCHAR(255) NOT NULL,
 numeroEnderecoCliente VARCHAR(10),
 bairroCliente VARCHAR(255) NOT NULL,
 cepCliente CHAR(8) NOT NULL,
 tipoCliente VARCHAR(9) NOT NULL DEFAULT 'comprador',
 idVenda INT,
 UNIQUE (cpfCliente,emailCliente,telefoneCelularCliente)
);

CREATE TABLE Vendas
(
 idVenda SERIAL PRIMARY KEY,
 dataVenda DATE NOT NULL,
 totalQuantidadeProdutoVenda INT NOT NULL,
 totalValorVenda FLOAT NOT NULL,
 idCliente INT NOT NULL,
 CHECK (totalQuantidadeProdutoVenda > 0 AND totalValorVenda >= 0)
);

CREATE TABLE ItensVenda
(
 idItemVenda SERIAL PRIMARY KEY,
 quantidadeItemVenda INT NOT NULL,
 precoUnitarioItemVenda FLOAT NOT NULL,
 idProduto INT NOT NULL,
 idVenda INT NOT NULL,
 CHECK (quantidadeItemVenda > 0 AND precoUnitarioItemVenda >= 0)
);

CREATE TABLE Lojas
(
 idLoja SERIAL PRIMARY KEY,
 idCliente INT NOT NULL,
 nomeLoja VARCHAR(255) NOT NULL
);

ALTER TABLE Produtos ADD FOREIGN KEY(idLoja) REFERENCES Lojas (idLoja);
ALTER TABLE Estoques ADD FOREIGN KEY(idLoja) REFERENCES Lojas (idLoja);
ALTER TABLE Estoques ADD FOREIGN KEY(idProduto) REFERENCES Produtos (idProduto);
ALTER TABLE Clientes ADD FOREIGN KEY(idVenda) REFERENCES Vendas (idVenda);
ALTER TABLE Vendas ADD FOREIGN KEY(idCliente) REFERENCES Clientes (idCliente);
ALTER TABLE ItensVenda ADD FOREIGN KEY(idProduto) REFERENCES Produtos (idProduto);
ALTER TABLE ItensVenda ADD FOREIGN KEY(idVenda) REFERENCES Vendas (idVenda);
ALTER TABLE Lojas ADD FOREIGN KEY(idCliente) REFERENCES Clientes (idCliente);
