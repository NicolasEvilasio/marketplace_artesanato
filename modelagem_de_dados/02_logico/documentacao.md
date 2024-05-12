## Documentaçao do Modelo Lógico

<img src="modelo_logico.png">

### Entidades e Atributos:
- **Cliente:**
  - idCliente (PK)
  - nomeCliente
  - cpfCliente
  - emailCliente
  - telefoneCelularCliente
  - logradouroCliente
  - numeroEnderecoCliente
  - bairroCliente
  - cepCliente
  - tipoCliente
  - idVenda (FK)

- **Loja:**
  - idLoja (PK)
  - nomeLoja
  - idCliente (FK)
  
- **Produto:**
  - idProduto (PK)
  - nomeProduto
  - descricaoProduto
  - precoProduto
  - idLoja (FK)

- **Estoque:**
  - idEstoque (PK)
  - idLoja (FK)
  - idProduto (FK)
  - quantidadeProdutoEstoque

- **Venda:**
  - idVenda (PK)
  - idCliente (FK)
  - dataVenda
  - totalQuantidadeProdutoVenda
  - totalValorVenda
  
- **ItemVenda:**
  - idItemVenda (PK)
  - idVenda (FK)
  - idProduto (FK)
  - quantidadeItemVenda
  - precoUnitarioItemVenda
  
### Relacionamentos:
1. Uma loja tem um ou mais produtos.
2. Um produto está em zero ou mais estoques.
3. Um estoque está associado a uma única loja e um único produto.
4. Uma venda contém um ou mais itens de venda.
5. Um item de venda pertence a uma única venda.

### Cardinalidade dos Relacionamentos:
- **Loja para Produto:**
  - Uma Loja pode ter vários Produtos (1:N).
  - Um Produto está associado a no máximo uma Loja (0:1 ou 1:1).
  
- **Produto para Estoque:**
  - Um Produto pode estar em vários Estoques (1:N).
  - Um Estoque está associado a um único Produto (1:1).
  
- **Estoque para Loja:**
  - Um Estoque está associado a uma única Loja (1:1).
  - Uma Loja pode ter vários Estoques (1:N).

- **Venda para ItemVenda:**
  - Uma Venda contém um ou mais Itens de Venda (1:N).
  - Um Item de Venda pertence a uma única Venda (1:1).
  
- **Loja para Cliente:**
  - Uma Loja pode ter vários Clientes (1:N).
  - Um Cliente está associado a no máximo uma Loja (0:1 ou 1:1).