- Com base na tabela de “produtos” acima favor inserir um registro na referida tabela passando os seguintes valores : cod_prod =170, loj_prod=2, desc_prod=LEITE CONDESADO MOCOCA, dt_inclu_prod=30/12/2010  e preço_prod = R$45,40.

```SQL
INSERT INTO produtos VALUES (170, 2, "LEITE CONDENSADO ITALAC", "2012-12-30", 45.40);
```

- O Índice da tabela  de “produtos é o cód_prod e a loj_prod, com base no referido índice faça a alteração do preço do produto para R$95,40, lembrando que o cod_prod =170 e a loj_prod=2: 
```SQL
UPDATE produtos 
SET 
    preco_prod = 95.40
WHERE
    cod_prod = 170 AND loj_prod = 2;
```

- Com base na tabela de “produtos” monte um select trazendo todos os registros da loja 1 e 2:
```SQL
SELECT * FROM produtos where loj_prod in (1, 2);
```

- Com base na tabela de “produtos” monte um select para trazer a maior e a menor data  de inclusão do produto “dt_inclu_prod”:
```SQL
SELECT * FROM produtos order by dt_inclu_prod asc limit 1;

SELECT * FROM produtos order by dt_inclu_prod desc limit 1;
```

- Com base na tabela de “produtos” monte um select para trazer a quantidade total de registros existentes na tabela de “produtos”:
```SQL
SELECT count(*) as total from produtos;
```

- Com base na tabela de “produtos” monte um select para trazer todos os produtos que comecem com a letra “L” na tabela de “produtos”:
```SQL
SELECT * from produtos where desc_prod like "L%";
```

- Com base na tabela de “produtos” monte um select para trazer a soma de todos os preços dos produtos totalizado por loja:
```SQL
SELECT loj_prod, sum(preco_prod) as total from produtos group by loj_prod;
```

- Com base na tabela de “produtos” monte um select para trazer a soma de todos os preços dos produtos totalizados por loja que seja maior que R$100.000

```SQL
SELECT loj_prod, sum(preco_prod) as total from produtos group by loj_prod HAVING total > 100000;
```
- A) Montar um unico select para trazer os seguintes campos: o código da loja do produto, a descrição da loja, código do produto, a descrição do produto, o preço do produto, a quantidade em estoque do produto. Considere  que o código da loja para esta consulta seja igual a 1.

```SQL

SELECT 
	l.loj_prod as "Código da loja do produto",
    l.desc_loj as "Descrição da loja",
    p.cod_prod as "Código do produto",
    p.desc_prod as "Descrição do produto",
    p.preco_prod as "Preço do produto",
	e.qtd_prod as "Quantidade em estoque"
FROM produtos p
INNER JOIN loja l ON l.loj_prod = p.loj_prod
LEFT JOIN estoque e ON e.cod_prod = p.cod_prod AND e.loj_prod = p.loj_prod
WHERE l.loj_prod = 1;
```

- B) Observe a estrutura da tabela de estoque e da tabela de produtos, monte um select para trazer todos os produtos que existem na tabela de produtos que não existem na tabela de estoque.

```SQL

SELECT 
	p.*
FROM produtos p
LEFT JOIN estoque e ON e.cod_prod = p.cod_prod AND e.loj_prod = p.loj_prod
WHERE e.cod_prod IS NULL;
```

- C) Observe a estrutura da tabela de estoque e da tabela de produtos, monte um select para trazer todos os produtos que existem na tabela de estoque que não existem na tabela de produtos.
```SQL

SELECT e.* from estoque e
LEFT JOIN produtos p ON e.cod_prod = p.cod_prod
WHERE p.cod_prod IS NULL;
```