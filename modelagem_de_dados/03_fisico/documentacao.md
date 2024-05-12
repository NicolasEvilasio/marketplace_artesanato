# Documento de Especificação do Banco de Dados

---

## 1. Introdução

Este documento descreve a estrutura e as relações do banco de dados do marketplace de artesanato. O banco de dados foi projetado para armazenar informações sobre produtos, estoque, clientes, vendas e lojas.

---

## 2. Tabelas

O banco de dados consiste nas seguintes tabelas:

### Tabela Produtos:
- `idProduto`: Identificador único do produto (chave primária).
- `nomeProduto`: Nome do produto.
- `descricaoProduto`: Descrição do produto.
- `precoProduto`: Preço do produto.
- `idLoja`: Identificador da loja à qual o produto pertence.
- `CONSTRAINT CHECK`: Verifica se o preço do produto é maior que 0.

### Tabela Estoques:
- `idEstoque`: Identificador único do estoque (chave primária).
- `quantidadeProdutoEstoque`: Quantidade de produtos em estoque.
- `idLoja`: Identificador da loja à qual o estoque pertence.
- `idProduto`: Identificador do produto associado ao estoque.
- `CONSTRAINT CHECK`: Verifica se a quantidade de produtos em estoque é maior que 0.

### Tabela Clientes:
- `idCliente`: Identificador único do cliente (chave primária).
- `nomeCliente`: Nome do cliente.
- `cpfCliente`: CPF do cliente.
- `emailCliente`: Endereço de e-mail do cliente.
- `telefoneCelularCliente`: Número de telefone celular do cliente.
- `logradouroCliente`: Logradouro do cliente.
- `numeroEnderecoCliente`: Número do endereço do cliente.
- `bairroCliente`: Bairro do cliente.
- `cepCliente`: CEP do cliente.
- `tipoCliente`: Tipo de cliente (comprador ou vendedor).
- `idVenda`: Identificador da venda associada ao cliente.
- `CONSTRAINT UNIQUE`: Garante a unicidade do CPF, e-mail e número de telefone celular do cliente.

### Tabela Vendas:
- `idVenda`: Identificador único da venda (chave primária).
- `dataVenda`: Data da venda.
- `totalQuantidadeProdutoVenda`: Total de produtos vendidos.
- `totalValorVenda`: Valor total da venda.
- `idCliente`: Identificador do cliente associado à venda.
- `CONSTRAINT CHECK`: Verifica se o total de produtos vendidos é maior que 0 e se o valor total da venda é maior ou igual a 0.

### Tabela ItensVenda:
- `idItemVenda`: Identificador único do item de venda (chave primária).
- `quantidadeItemVenda`: Quantidade do item vendido.
- `precoUnitarioItemVenda`: Preço unitário do item vendido.
- `idProduto`: Identificador do produto associado ao item de venda.
- `idVenda`: Identificador da venda associada ao item de venda.
- `CONSTRAINT CHECK`: Verifica se a quantidade do item vendido e o preço unitário são maiores que 0.

### Tabela Lojas:
- `idLoja`: Identificador único da loja (chave primária).
- `idCliente`: Identificador do cliente proprietário da loja.
- `nomeLoja`: Nome da loja.

---

## 3. Relacionamentos

As tabelas estão relacionadas da seguinte forma:

- A tabela Produtos possui uma chave estrangeira (`idLoja`) que referencia a tabela Lojas.
- A tabela Estoques possui duas chaves estrangeiras: `idLoja` (referenciando a tabela Lojas) e `idProduto` (referenciando a tabela Produtos).
- A tabela Clientes possui uma chave estrangeira (`idVenda`) que referencia a tabela Vendas.
- A tabela Vendas possui uma chave estrangeira (`idCliente`) que referencia a tabela Clientes.
- A tabela ItensVenda possui duas chaves estrangeiras: `idProduto` (referenciando a tabela Produtos) e `idVenda` (referenciando a tabela Vendas).
- A tabela Lojas possui uma chave estrangeira (`idCliente`) que referencia a tabela Clientes.

---

## 4. Considerações Finais

Este documento descreve a estrutura e as relações do banco de dados do marketplace de artesanato. Ele serve como uma referência para o desenvolvimento e manutenção do banco de dados, garantindo consistência e integridade dos dados.

---
