-- Criação do Banco de Dados (opcional, dependendo do ambiente)
-- CREATE DATABASE PadariaPaoQuente;
-- USE PadariaPaoQuente;

-- 1. Tabela PRODUTO
CREATE TABLE PRODUTO (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    preco_venda DECIMAL(10, 2) NOT NULL,
    tipo_produto VARCHAR(50),
    estoque_atual INT DEFAULT 0
);

-- 2. Tabela INSUMO
CREATE TABLE INSUMO (
    id_insumo INT PRIMARY KEY,
    nome_insumo VARCHAR(100) NOT NULL,
    unidade_medida VARCHAR(10), -- ex: 'kg', 'un'
    estoque_atual DECIMAL(10, 2) DEFAULT 0,
    estoque_minimo DECIMAL(10, 2)
);

-- 3. Tabela CLIENTE
CREATE TABLE CLIENTE (
    id_cliente INT PRIMARY KEY,
    nome_cliente VARCHAR(150) NOT NULL,
    cpf_cnpj VARCHAR(18) UNIQUE, -- CPF (11) ou CNPJ (14), ajustado para ser mais flexível
    telefone VARCHAR(20)
);

-- 4. Tabela VENDA (Com FK para CLIENTE)
CREATE TABLE VENDA (
    id_venda INT PRIMARY KEY,
    data_hora_venda DATETIME NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    forma_pagamento VARCHAR(50),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
    -- O CASCADE/SET NULL pode ser ajustado, mas o padrão é RESTRICT
);

-- 5. Tabela ITEM_VENDA (Associação N:N entre VENDA e PRODUTO)
CREATE TABLE ITEM_VENDA (
    id_venda INT,
    id_produto INT,
    quantidade DECIMAL(10, 3) NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id_venda, id_produto),
    FOREIGN KEY (id_venda) REFERENCES VENDA(id_venda),
    FOREIGN KEY (id_produto) REFERENCES PRODUTO(id_produto)
);

-- 6. Tabela RECEITA (Com FK para PRODUTO - 1:1)
CREATE TABLE RECEITA (
    id_receita INT PRIMARY KEY,
    id_produto INT UNIQUE, -- Garante que apenas 1 Receita por Produto
    tempo_preparo TIME,
    porcao_base INT, -- Quantidade de produto que a receita gera
    FOREIGN KEY (id_produto) REFERENCES PRODUTO(id_produto)
);

-- 7. Tabela ITEM_RECEITA (Associação N:N entre RECEITA e INSUMO)
CREATE TABLE ITEM_RECEITA (
    id_receita INT,
    id_insumo INT,
    quantidade_necessaria DECIMAL(10, 3) NOT NULL,
    PRIMARY KEY (id_receita, id_insumo),
    FOREIGN KEY (id_receita) REFERENCES RECEITA(id_receita),
    FOREIGN KEY (id_insumo) REFERENCES INSUMO(id_insumo)
);