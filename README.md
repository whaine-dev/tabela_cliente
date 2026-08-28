# Sistema de E-commerce (Exercício de Modelagem de Banco de Dados)

Exercício de modelagem relacional em MySQL, com foco em relacionamentos **1:N** e **N:N**.

## Tabelas

- **cliente** — dados dos clientes
- **endereco** — endereços de entrega (1:N com cliente)
- **pedido** — pedidos feitos pelos clientes (1:N com cliente)
- **produto** — catálogo de produtos
- **pedido_produto** — tabela associativa que resolve o relacionamento N:N entre pedido e produto, guardando também a quantidade de cada item

## Relacionamentos

- Um cliente pode ter vários endereços e vários pedidos (1:N)
- Um pedido pode conter vários produtos, e um produto pode aparecer em vários pedidos diferentes (N:N), resolvido pela tabela `pedido_produto`

## Observação

Os dados de CPF inseridos são fictícios, gerados apenas para fins de teste.

## Relacionamento entra as tabelas
<img width="800" height="535" alt="relacionamento_entre_cinco_tabelas" src="https://github.com/user-attachments/assets/73d04199-856d-4a22-8249-4ba02a197414" />

