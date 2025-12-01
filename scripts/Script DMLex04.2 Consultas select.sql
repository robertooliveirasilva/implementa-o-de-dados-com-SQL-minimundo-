-- Consulta 1: Listar produtos com estoque baixo (WHERE)
SELECT nome_produto, estoque_atual
FROM PRODUTO
WHERE estoque_atual < 50
ORDER BY estoque_atual ASC;

-- Consulta 2: Detalhe de uma Venda específica, listando produtos (JOIN)
SELECT
    V.id_venda,
    V.data_hora_venda,
    P.nome_produto,
    IV.quantidade,
    IV.preco_unitario
FROM VENDA V
JOIN ITEM_VENDA IV ON V.id_venda = IV.id_venda
JOIN PRODUTO P ON IV.id_produto = P.id_produto
WHERE V.id_venda = 502;

-- Consulta 3: Insumos abaixo do ponto de reposição (WHERE e ORDER BY)
SELECT nome_insumo, unidade_medida, estoque_atual, estoque_minimo
FROM INSUMO
WHERE estoque_atual < estoque_minimo;

-- Consulta 4: Clientes que fizeram alguma compra, ordenados pelo nome (JOIN e DISTINCT)
SELECT DISTINCT C.nome_cliente, C.telefone
FROM CLIENTE C
JOIN VENDA V ON C.id_cliente = V.id_cliente
ORDER BY C.nome_cliente
LIMIT 5;

-- Consulta 5: Quais insumos são necessários para o Bolo de Cenoura (JOIN)
SELECT
    P.nome_produto,
    I.nome_insumo,
    IR.quantidade_necessaria,
    I.unidade_medida
FROM PRODUTO P
JOIN RECEITA R ON P.id_produto = R.id_produto
JOIN ITEM_RECEITA IR ON R.id_receita = IR.id_receita
JOIN INSUMO I ON IR.id_insumo = I.id_insumo
WHERE P.nome_produto = 'Bolo de Cenoura';