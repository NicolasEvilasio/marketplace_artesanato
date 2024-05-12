COPY
    public.clientes (nomecliente,
                     cpfcliente,
                     emailcliente,
                     telefonecelularcliente,
                     logradourocliente,
                     numeroenderecocliente,
                     bairrocliente,
                     cepcliente,
                     tipocliente)
FROM
    'C:/Temp/marketplace_artesanato/arquivos_csv/clientes_vendedor.csv'
WITH(
    FORMAT csv, HEADER true
);

COPY
    public.clientes (nomecliente,
                     cpfcliente,
                     emailcliente,
                     telefonecelularcliente,
                     logradourocliente,
                     numeroenderecocliente,
                     bairrocliente,
                     cepcliente,
                     tipocliente)
FROM
    'C:/Temp/marketplace_artesanato/arquivos_csv/clientes_dual.csv'
WITH(
    FORMAT csv, HEADER true
);

COPY
    public.clientes (nomecliente,
                     cpfcliente,
                     emailcliente,
                     telefonecelularcliente,
                     logradourocliente,
                     numeroenderecocliente,
                     bairrocliente,
                     cepcliente,
                     tipocliente)
FROM
    'C:/Temp/marketplace_artesanato/arquivos_csv/clientes_comprador.csv'
WITH(
    FORMAT csv, HEADER true
);

COPY
    public.lojas (idCliente, nomeLoja)
FROM
    'C:/Temp/marketplace_artesanato/arquivos_csv/lojas.csv'
WITH(
    FORMAT csv, HEADER true
);

COPY
    public.vendas (dataVenda, totalquantidadeprodutovenda, totalvalorvenda, idclientevendedor, idclientecomprador)
FROM
    'C:/Temp/marketplace_artesanato/arquivos_csv/vendas.csv'
WITH(
    FORMAT csv, HEADER true
);

COPY
    public.produtos (categoriaproduto, nomeproduto, descricaoproduto, precoproduto, idloja)
FROM
    'C:/Temp/marketplace_artesanato/arquivos_csv/produtos.csv'
WITH(
    FORMAT csv, HEADER true
);

COPY
    public.estoques (quantidadeprodutoestoque, idloja, idproduto)
FROM
    'C:/Temp/marketplace_artesanato/arquivos_csv/estoques.csv'
WITH(
    FORMAT csv, HEADER true
);

COPY
    public.itensVenda (quantidadeItemVenda, precounitarioitemvenda, idProduto, idVenda)
FROM
    'C:/Temp/marketplace_artesanato/arquivos_csv/itens_venda.csv'
WITH(
    FORMAT csv, HEADER true
);