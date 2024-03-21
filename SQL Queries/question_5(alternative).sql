--- Which product category generated the most profit for in the Wiltshire, UK region in 2021?
SELECT 
    dim_product.category,
    SUM((dim_product.sale_price::numeric - dim_product.cost_price::numeric) * orders.product_quantity::numeric) AS total_profit
FROM 
    orders
JOIN 
    dim_product ON orders.product_code = dim_product.product_code
JOIN 
    dim_date ON orders.order_date = dim_date.date
JOIN 
    dim_store ON orders.store_code = dim_store.store_code
WHERE 
    dim_date.year = 2021
AND 
    dim_store.full_region = 'Wiltshire, UK'
GROUP BY 
    dim_product.category
ORDER BY 
    total_profit DESC;
