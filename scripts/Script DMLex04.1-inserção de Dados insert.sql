-- Inserir Produtos
INSERT INTO PRODUTO (id_produto, nome_produto, preco_venda, tipo_produto, estoque_atual) VALUES
(101, 'Pão Francês (Kg)', 18.00, 'Pão', 50),
(102, 'Bolo de Cenoura', 45.00, 'Bolo', 10),
(103, 'Pão de Queijo (un)', 3.50, 'Salgado', 100),
(104, 'Baguete Integral', 12.00, 'Pão', 20);

-- Inserir Insumos
INSERT INTO INSUMO (id_insumo, nome_insumo, unidade_medida, estoque_atual, estoque_minimo) VALUES
(201, 'Farinha de Trigo', 'kg', 50.00, 20.00),
(202, 'Açúcar Refinado', 'kg', 15.00, 5.00),
(203, 'Ovos', 'un', 300.00, 100.00),
(204, 'Fermento Biológico', 'g', 250.00, 50.00);

-- Inserir Receitas (depende de PRODUTO)
INSERT INTO RECEITA (id_receita, id_produto, tempo_preparo, porcao_base) VALUES
(301, 102, '00:45:00', 1), -- Receita para 1 Bolo de Cenoura
(302, 101, '01:30:00', 50); -- Receita para 50 pães

-- Inserir Itens da Receita (depende de RECEITA e INSUMO)
INSERT INTO ITEM_RECEITA (id_receita, id_insumo, quantidade_necessaria) VALUES
(301, 202, 0.500), -- 0.5kg de Açúcar para o Bolo
(301, 203, 6.000), -- 6 Ovos para o Bolo
(302, 201, 10.000), -- 10kg de Farinha para o Pão
(302, 204, 0.050); -- 50g de Fermento para o Pão

-- Inserir Clientes
INSERT INTO CLIENTE (id_cliente, nome_cliente, cpf_cnpj, telefone) VALUES
(401, 'Empresa ABC Cafeteria', '00.111.222/0001-33', '(11) 98765-4321'),
(402, 'Maria Santos (PF)', '123.456.789-00', '(11) 99999-1234');

-- Inserir Vendas (depende de CLIENTE)
INSERT INTO VENDA (id_venda, data_hora_venda, valor_total, forma_pagamento, id_cliente) VALUES
(501, '2025-11-28 09:30:00', 49.50, 'PIX', 402), -- Venda para Maria
(502, '2025-11-28 15:00:00', 180.00, 'Cartão', 401), -- Venda para Empresa ABC
(503, '2025-11-29 10:00:00', 10.50, 'Dinheiro', NULL); -- Venda de balcão anônima

-- Inserir Itens da Venda (depende de VENDA e PRODUTO)
INSERT INTO ITEM_VENDA (id_venda, id_produto, quantidade, preco_unitario) VALUES
(501, 102, 1, 45.00), -- 1 Bolo de Cenoura
(501, 103, 1, 3.50), -- 1 Pão de Queijo
(502, 101, 10.000, 18.00), -- 10kg de Pão Francês para Empresa ABC
(503, 103, 3, 3.50); -- 3 Pães de Queijo para Venda Anônima