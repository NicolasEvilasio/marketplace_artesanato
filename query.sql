WITH faturamento_por_vendedor AS (
	SELECT
		v.idvenda AS id_venda,
		v.datavenda AS data_venda,
		v.idclientevendedor AS id_vendedor,
		c.nomecliente AS nome_vendedor,
		v.idclientecomprador AS id_comprador,
		iv.iditemvenda AS id_item_venda,
		iv.quantidadeitemvenda AS quantidade_item_venda,
		iv.idproduto AS id_produto,
		p.categoriaproduto AS categoria_produto,
		p.nomeproduto AS nome_produto,
		p.precoproduto AS preco_unitario_produto
	FROM
		public.vendas v
	LEFT JOIN
		public.itensvenda iv ON iv.idvenda = v.idvenda
	LEFT JOIN
		public.produtos p ON p.idproduto = iv.idproduto
	LEFT JOIN
		public.clientes c ON c.idcliente = v.idclientevendedor
)
SELECT
	EXTRACT (YEAR FROM data_venda) AS ano_venda,
	id_vendedor,
	nome_vendedor,
	SUM(quantidade_item_venda * preco_unitario_produto) AS faturamento
FROM
	faturamento_por_vendedor
GROUP BY
	ano_venda,
	id_vendedor,
	nome_vendedor
ORDER BY
	ano_venda DESC,
	id_vendedor;