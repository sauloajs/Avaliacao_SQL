DROP TABLE IF EXISTS loja;

CREATE TABLE loja (
    loj_prod INT(8) NOT NULL,
    desc_loj CHAR(40),
    PRIMARY KEY (loj_prod)
);

DROP TABLE IF EXISTS estoque;

CREATE TABLE estoque (
    cod_prod INT(8) NOT NULL,
    loj_prod INT(8) NOT NULL,
    qtd_prod DECIMAL(15,3),
    PRIMARY KEY (cod_prod, loj_prod),
    FOREIGN KEY (loj_prod) REFERENCES loja(loj_prod)
);

DROP TABLE IF EXISTS produtos;

CREATE TABLE produtos (
    cod_prod INT(8) NOT NULL,
    loj_prod INT(8) NOT NULL,
    desc_prod CHAR(40),
    dt_inclu_prod DATE,
    preco_prod DECIMAL(8,2),
    PRIMARY KEY (cod_prod, loj_prod),
    FOREIGN KEY (loj_prod) REFERENCES loja(loj_prod)
);