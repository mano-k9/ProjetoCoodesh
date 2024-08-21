/* Listar os Clientes que nao realizaram uma compra */

SELECT C.*
FROM customers AS C 
    FULL OUTER JOIN orders AS O ON C.customer_id = O.customer_id
WHERE O.order_id IS NULL;


/* Listar os Produtos que nao tenham sido comprados*/

SELECT P.*
FROM products AS P 
    FULL OUTER JOIN order_itens AS OI ON P.product_id = OI.product_id
WHERE OI.item_id IS NULL;


/* Listar os Produtos sem Estoque */

SELECT P.*
FROM products AS P 
    FULL OUTER JOIN stocks AS K ON P.product_id = K.product_id
WHERE K.store_id IS NULL OR K.quantity < 1;


/* Agrupar a quantidade de vendas que uma determinada Marca por Loja */

SELECT
    ST.store_name,
    K.brand_name,
    COUNT(*) AS QTD
FROM
    stores AS ST 
    INNER JOIN orders AS O ON ST.store_id = O.store_id
    INNER JOIN order_itens AS OI ON O.order_id = OI.order_id
    INNER JOIN products AS P ON OI.product_id = P.product_id
    INNER JOIN stocks AS K ON P.brand_id = K.brand_id
GROUP BY
    ST.store_name,
    K.brand_name;


/* Listar os Funcionarios que nao estejam relacionados a um Pedido */

 SELECT
    F.first_name,
    F.last_name
 FROM
    staffs AS F
    FULL OUTER JOIN orders AS O ON F.staff_id = O.staff_id
WHERE
    F.order_id IS NULL;
