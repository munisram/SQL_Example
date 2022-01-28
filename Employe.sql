select p.product_name,o.quanity_id,unit_price,o.quanity_id*o.unit_price "sales amount",ord.order_date,e.salesman_name,c.customer_name 
from products p inner join order_items o on o.product_id=p.product_id inner join orders ord 
on ord.order_id=o.order_id inner join employees e on ord.salesman_id=e.employee_id inner join customer c 
on ord.customer_id=c.customer_id where o.quanity_id>=5;