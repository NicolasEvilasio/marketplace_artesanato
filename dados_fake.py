import os
from faker import Faker
import random
import csv

fake = Faker('pt_BR')


# Função para gerar dados para a tabela Lojas
def generate_lojas_data(path: str, file: str, num_rows: int):
    with open(os.path.join(path, file), mode='w', newline='', encoding='utf-8') as csv_file:
        fieldnames = ['idCliente', 'nomeLoja']
        writer = csv.DictWriter(csv_file, fieldnames=fieldnames)

        writer.writeheader()
        for i in range(num_rows):
            writer.writerow({
                'idCliente': i+1,
                'nomeLoja': fake.company()
            })


# Função para gerar dados para a tabela Produtos
def generate_produtos_data(path: str, file: str, num_rows: int, lojas_rows: int):
    categorias = {
        'Joias e Bijuterias': ['Bracelete', 'Anel', 'Colar', 'Pulseira', 'Pingente', 'Broche', 'Brinco', 'Corrente',
                               'Adorno'],
        'Cerâmica': ['Vaso', 'Caqueira', 'Prato', 'Pote', 'Copo', 'Escultura'],
        'Tecidos e Costura': ['Camisa', 'Vestido', 'Calça', 'Bermuda', 'Biquini', 'Chapéu'],
        'Madeira': ['Cadeira', 'Mesa', 'Centro', 'Raque', 'Painel'],
        'Têxteis e Tapeçaria': ['Tapete', 'Almofada', 'Manta', 'Cobertor']
    }

    with open(os.path.join(path, file), mode='w', newline='', encoding='utf-8') as csv_file:
        fieldnames = ['categoriaProduto', 'nomeProduto', 'descricaoProduto', 'precoProduto', 'idLoja']
        writer = csv.DictWriter(csv_file, fieldnames=fieldnames)

        writer.writeheader()

        for _ in range(num_rows):
            categoria = random.choice(list(categorias.keys()))

            writer.writerow({
                'categoriaProduto': categoria,
                'nomeProduto': random.choice(categorias[categoria]),
                # 'nomeProduto': fake.text(max_nb_chars=50).strip(),
                'descricaoProduto': fake.text(max_nb_chars=255),
                'precoProduto': fake.random_number(digits=4, fix_len=False) / 100.0,
                'idLoja': fake.random_int(min=1, max=lojas_rows)
            })


# Função para gerar dados para a tabela Clientes
def generate_clientes_data(path:str, file: str, tipo_cliente: str, num_rows: int):
    with open(os.path.join(path, file), mode='w', newline='', encoding='utf-8') as csv_file:
        fieldnames = ['nomeCliente', 'cpfCliente', 'emailCliente', 'telefoneCelularCliente', 'logradouroCliente',
                      'numeroEnderecoCliente', 'bairroCliente', 'cepCliente', 'tipoCliente']
        writer = csv.DictWriter(csv_file, fieldnames=fieldnames)

        writer.writeheader()
        for _ in range(num_rows):
            writer.writerow({
                'nomeCliente': fake.name(),
                'cpfCliente': fake.ssn(),
                'emailCliente': fake.email(),
                'telefoneCelularCliente': fake.random_number(digits=9, fix_len=True),
                'logradouroCliente': fake.street_name(),
                'numeroEnderecoCliente': fake.building_number(),
                'bairroCliente': fake.bairro(),
                'cepCliente': fake.postcode().replace('-', ''),
                'tipoCliente': tipo_cliente
            })


# Função para gerar dados para a tabela Vendas
def generate_vendas_data(path: str, file: str, num_rows: int, lista_id_compradores: list, lista_id_vendedores: list):
    with open(os.path.join(path, file), mode='w', newline='', encoding='utf-8') as csv_file:
        fieldnames = ['dataVenda', 'totalQuantidadeProdutoVenda', 'totalValorVenda', 'idClienteVendedor',
                      'idClienteComprador']
        writer = csv.DictWriter(csv_file, fieldnames=fieldnames)

        writer.writeheader()
        for _ in range(num_rows):
            id_vendedor = random.choice(lista_id_vendedores)
            id_comprador = random.choice(lista_id_compradores)
            # Verifica se idClienteVendedor é igual a idClienteComprador e escolhe outro idComprador se necessário
            while id_vendedor == id_comprador:
                id_comprador = random.choice(lista_id_compradores)
            writer.writerow({
                'dataVenda': fake.date(),
                'totalQuantidadeProdutoVenda': 1,  # Manter o valor zerado e calcular com base na tabela itensVenda
                'totalValorVenda': 0.0,  # Manter o valor zerado e calcular com base no preço unitário
                'idClienteVendedor': id_vendedor,
                'idClienteComprador': id_comprador
            })


# Função para gerar dados para a tabela Estoques
def generate_estoques_data(path: str, file: str, num_rows: int, produtos_rows: int, lojas_rows: int):
    with open(os.path.join(path, file), mode='w', newline='', encoding='utf-8') as csv_file:
        fieldnames = ['quantidadeProdutoEstoque', 'idLoja', 'idProduto']
        writer = csv.DictWriter(csv_file, fieldnames=fieldnames)

        writer.writeheader()
        for loja in range(lojas_rows):
            for produto in range(produtos_rows):
                writer.writerow({
                    'quantidadeProdutoEstoque': fake.random_number(digits=2, fix_len=False),
                    'idLoja': loja + 1,
                    'idProduto': produto + 1
                })


# Função para gerar dados para a tabela ItensVenda
def generate_itens_venda_data(pat: str, file: str, num_rows: int, produtos_rows: int, vendas_rows: int):
    with open(os.path.join(path, file), mode='w', newline='', encoding='utf-8') as csv_file:
        fieldnames = ['quantidadeItemVenda', 'precoUnitarioItemVenda', 'idProduto', 'idVenda']
        writer = csv.DictWriter(csv_file, fieldnames=fieldnames)

        writer.writeheader()
        for _ in range(num_rows):
            writer.writerow({
                'quantidadeItemVenda': fake.random_int(1, 12),
                'precoUnitarioItemVenda': 0.0,
                'idProduto': fake.random_int(min=1, max=produtos_rows),
                'idVenda': fake.random_int(min=1, max=vendas_rows)
            })


# Função para gerar dados da pesquisa de preço
def generate_pesquisa_preco_data(path: str, file: str, num_rows: int, produtos_rows: int):
    with open(os.path.join(path, file), mode='w', newline='', encoding='utf-8') as csv_file:
        fieldnames = ['product_id', 'product_name', 'average_price', 'minimum_price', 'maximum_price', 'survey_date']
        writer = csv.DictWriter(csv_file, fieldnames=fieldnames)

        writer.writeheader()
        for _ in range(num_rows):
            minimum_price = fake.random_int(1, 99999) / 100.0
            maximum_price = fake.random_int(int(minimum_price * 100), 99999) / 100.0

            writer.writerow({
                'product_id': fake.random_int(min=1, max=produtos_rows),
                'product_name': '',
                'average_price': random.uniform(minimum_price, maximum_price),
                'minimum_price': minimum_price,
                'maximum_price': maximum_price,
                'survey_date': fake.date(pattern='%Y-%m-%d')
            })


# Gerar dados para todas as tabelas
current_dir = os.getcwd()
path = os.path.join(current_dir, 'arquivos_csv')

generate_lojas_data(path, 'lojas.csv', 15)
generate_clientes_data(path, 'clientes_vendedor.csv', 'vendedor', 5)
generate_clientes_data(path, 'clientes_dual.csv', 'dual', 10)
generate_clientes_data(path, 'clientes_comprador.csv', 'comprador', 5)

generate_vendas_data(path, 'vendas.csv', 1000,
                     lista_id_compradores=list(range(6, 16)),
                     lista_id_vendedores=list(range(1, 11)))

generate_produtos_data(path, 'produtos.csv', 100, 15)
generate_estoques_data(path, 'estoques.csv', 1500, 100, 15)
generate_itens_venda_data(path, 'itens_venda.csv', 10000, 100, 1000)
generate_pesquisa_preco_data(path, 'pesquisa_preco.csv', 100, 100)
