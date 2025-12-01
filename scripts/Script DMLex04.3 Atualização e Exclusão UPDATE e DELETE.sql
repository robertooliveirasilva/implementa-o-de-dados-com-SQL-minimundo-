-- COMANDOS UPDATE (3 ou mais)

-- 1. Aumentar o preço do Pão de Queijo em 10%
UPDATE PRODUTO
SET preco_venda = preco_venda * 1.10
WHERE nome_produto = 'Pão de Queijo (un)';

-- 2. Atualizar a forma de pagamento de uma venda (exemplo: cliente pagou depois)
UPDATE VENDA
SET forma_pagamento = 'Boleto'
WHERE id_venda = 502;

-- 3. Aumentar o estoque mínimo de Farinha de Trigo para 30kg
UPDATE INSUMO
SET estoque_minimo = 30.00
WHERE nome_insumo = 'Farinha de Trigo';

-- 4. Corrigir o telefone de um cliente
UPDATE CLIENTE
SET telefone = '(11) 55555-4321'
WHERE id_cliente = 401;


-- COMANDOS DELETE (3 ou mais)

-- 1. Excluir um produto que saiu de linha (e que não foi vendido)
-- OBS: Assumindo que o produto 104 não possui dependências em ITEM_VENDA ou RECEITA
DELETE FROM PRODUTO
WHERE id_produto = 104; -- Deleta a Baguete Integral

-- 2. Excluir um cliente que nunca realizou uma venda (caso houvesse um cliente novo)
-- OBS: Não há clientes sem vendas na amostra, mas o comando seria:
-- DELETE FROM CLIENTE WHERE id_cliente = 403;

-- 3. Excluir uma venda específica e todos os seus itens associados (é necessário deletar primeiro os itens da venda)
DELETE FROM ITEM_VENDA WHERE id_venda = 503;
DELETE FROM VENDA WHERE id_venda = 503;

-- 4. Excluir um item de insumo se o estoque estiver zerado e o insumo for obsoleto
-- OBS: Supondo que o id_insumo 204 (Fermento) será removido (necessário deletar de ITEM_RECEITA primeiro se não houver CASCADE ON DELETE)
DELETE FROM ITEM_RECEITA WHERE id_insumo = 204;
DELETE FROM INSUMO WHERE id_insumo = 204 AND estoque_atual = 0;