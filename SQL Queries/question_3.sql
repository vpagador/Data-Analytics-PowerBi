--  Which German store type had the highest revenue for 2022?

SELECT dim_store.store_type,ROUND(SUM(orders.product_quantity*dim_product.sale_price)::numeric, 1) AS store_revenue
FROM orders
JOIN dim_store on dim_store.store_code = orders.store_code
JOIN dim_product on dim_product.product_code = orders.product_code
WHERE dim_store.country_code = 'DE'
AND EXTRACT(YEAR FROM orders.order_date::date) = 2022
GROUP BY dim_store.store_type
ORDER BY store_revenue DESC; 

