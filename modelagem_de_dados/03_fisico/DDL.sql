CREATE TABLE Produto
(
 idProduto SERIAL PRIMARY KEY,
 nomeProduto CHAR(50) NOT NULL,
 descricaoProduto TEXT,
 precoProduto FLOAT NOT NULL,
 idLoja INT NOT NULL,
 CHECK (precoProduto > 0)
);

CREATE TABLE Estoque
(
 idEstoque SERIAL PRIMARY KEY,
 quantidadeProdutoEstoque INT NOT NULL,
 idLoja INT NOT NULL,
 idProduto INT,
 CHECK (quantidadeProdutoEstoque > 0)
);

CREATE TABLE Cliente
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

CREATE TABLE Venda
(
 idVenda SERIAL PRIMARY KEY,
 dataVenda DATE NOT NULL,
 totalQuantidadeProdutoVenda INT NOT NULL,
 totalValorVenda FLOAT NOT NULL,
 idCliente INT NOT NULL,
 CHECK (totalQuantidadeProdutoVenda > 0 AND totalValorVenda >= 0)
);

CREATE TABLE ItemVenda
(
 idItemVenda SERIAL PRIMARY KEY,
 quantidadeItemVenda INT NOT NULL,
 precoUnitarioItemVenda FLOAT NOT NULL,
 idProduto INT NOT NULL,
 idVenda INT NOT NULL,
 CHECK (quantidadeItemVenda > 0 AND precoUnitarioItemVenda >= 0)
);

CREATE TABLE Loja
(
 idLoja SERIAL PRIMARY KEY,
 idCliente INT NOT NULL,
 nomeLoja VARCHAR(255) NOT NULL
);

ALTER TABLE Produto ADD FOREIGN KEY(idLoja) REFERENCES Loja (idLoja);
ALTER TABLE Estoque ADD FOREIGN KEY(idLoja) REFERENCES Loja (idLoja);
ALTER TABLE Estoque ADD FOREIGN KEY(idProduto) REFERENCES Produto (idProduto);
ALTER TABLE Cliente ADD FOREIGN KEY(idVenda) REFERENCES Venda (idVenda);
ALTER TABLE Venda ADD FOREIGN KEY(idCliente) REFERENCES Cliente (idCliente);
ALTER TABLE ItemVenda ADD FOREIGN KEY(idProduto) REFERENCES Produto (idProduto);
ALTER TABLE ItemVenda ADD FOREIGN KEY(idVenda) REFERENCES Venda (idVenda);
ALTER TABLE Loja ADD FOREIGN KEY(idCliente) REFERENCES Cliente (idCliente);
