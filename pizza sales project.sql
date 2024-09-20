USE pizzahut;

-- Total orders placed

SELECT 
    COUNT(*)
FROM
    orders;
    
    -- Total revenue generated from sales
    
    SELECT 
     round(SUM(p.price * od.quantity)) AS revenue
FROM
    pizzas AS p
        JOIN
    order_details AS od ON p.pizza_id = od.pizza_id

-- Pizza with the highest price.

SELECT 
    pt.name,p.price
FROM
    pizzas AS p
        JOIN
    pizza_types AS pt ON p.pizza_type_id = pt.pizza_type_id
ORDER BY p.price DESC
LIMIT 1

-- Most common pizza size ordered.

	SELECT 
    p.size, COUNT(*) AS count
FROM
    pizzas AS p
        JOIN
    order_details AS od ON p.pizza_id = od.pizza_id
GROUP BY p.size
ORDER BY count DESC
LIMIT 1;

-- Top 5 pizzas ordered quantities (Pizzas table used to join pizza_types and order_details)

SELECT 
    pt.name, SUM(od.quantity) AS orders
FROM
    pizzas AS p
        JOIN
    order_details AS od ON p.pizza_id = od.pizza_id
        JOIN
    pizza_types AS pt ON pt.pizza_type_id = p.pizza_type_id
GROUP BY pt.name
ORDER BY orders DESC
LIMIT 5;


-- Total orders per category

SELECT 
    pt.category, SUM(od.quantity) AS orders
FROM
    pizzas AS p
        JOIN
    order_details AS od ON p.pizza_id = od.pizza_id
        JOIN
    pizza_types AS pt ON pt.pizza_type_id = p.pizza_type_id
GROUP BY pt.category
ORDER BY orders;

-- Distribution of orders by hour of the day

select HOUR(order_time) as hour, count(*) as orders_per_hour
from orders
group by hour;

-- Distribution of orders by hour of the day category wise.

SELECT 
    pt.category,
    HOUR(o.order_time) AS hour,
    COUNT(*) AS orders_per_hour
FROM
    pizza_types AS pt
        JOIN
    pizzas AS p ON pt.pizza_type_id = p.pizza_type_id
        JOIN
    order_details AS od ON p.pizza_id = od.pizza_id
        JOIN
    orders AS o ON od.order_id = o.order_id
WHERE
    category = 'Chicken'
GROUP BY pt.category , hour;

-- Category wise distribution of pizzas

SELECT 
    category, COUNT(name) AS number_of_pizzas_in_a_category
FROM
    pizza_types
GROUP BY category;

-- Average_orders_per_day


	SELECT 
    ROUND(AVG(t.sum)) as Average_orders_per_day
FROM
    (SELECT 
        o.order_date, SUM(od.quantity) AS sum
    FROM
        orders AS o
    JOIN order_details AS od ON o.order_id = od.order_id
    GROUP BY o.order_date) AS t;
    
    -- Top 3 pizzas ordered based on revenue
    
    SELECT 
    pt.name, SUM(p.price * od.quantity) AS revenue
FROM
    pizzas AS p
        JOIN
    order_details AS od ON p.pizza_id = od.pizza_id
        JOIN
    pizza_types AS pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY revenue DESC
LIMIT 3;

-- Percentage contribution of each pizza type to total revenue (Using Subqueries)
   
  SELECT 
    t.category,
    ROUND((t.revenue / total.total_revenue) * 100,
            2) AS percentage
FROM
    (SELECT 
        pt.category, SUM(p.price * od.quantity) AS revenue
    FROM
        pizzas AS p
    JOIN order_details AS od ON p.pizza_id = od.pizza_id
    JOIN pizza_types AS pt ON p.pizza_type_id = pt.pizza_type_id
    GROUP BY pt.category) AS t,
    (SELECT 
        SUM(p.price * od.quantity) AS total_revenue
    FROM
        pizzas AS p
    JOIN order_details AS od ON p.pizza_id = od.pizza_id) AS total;

-- Percentage contribution of each pizza type to total revenue (Using CTEs)

WITH CategoryRevenue AS (
    SELECT 
        pt.category, 
        SUM(p.price * od.quantity) AS revenue
    FROM
        pizzas AS p
    JOIN order_details AS od ON p.pizza_id = od.pizza_id
    JOIN pizza_types AS pt ON p.pizza_type_id = pt.pizza_type_id
    GROUP BY pt.category
),
TotalRevenue AS (
    SELECT 
        SUM(p.price * od.quantity) AS total_revenue
    FROM
        pizzas AS p
    JOIN order_details AS od ON p.pizza_id = od.pizza_id
)

SELECT 
    cr.category,
    ROUND((cr.revenue / tr.total_revenue) * 100, 2) AS percentage
FROM 
    CategoryRevenue AS cr,
    TotalRevenue AS tr;
    
    -- Pizza sales cumulative revenue by date.
    
    Select t.order_date, 
    sum(t.revenue) over(order by t.order_date) as cumulative_revenue 
    from
    (select o.order_date, SUM(p.price * od.quantity) as revenue
    from orders as o
    join order_details as od on o.order_id = od.order_id
    join pizzas as p on p.pizza_id = od.pizza_id
	group by o.order_date) as t
    
    -- Top 3 pizzas in each category on basis of revenue
    
    Select 
		category,
        name,
        revenue, 
        rank_revenue 
	from 
        (
        Select 
			pt.name, 
			pt.category, 
			sum(p.price*od.quantity) as revenue,
			rank () over (PARTITION BY pt.category order by sum(p.price*od.quantity) desc) as rank_revenue
		from pizza_types as pt
    join
    pizzas as p on pt.pizza_type_id = p.pizza_type_id
    join
    order_details as od on p.pizza_id = od.pizza_id
    group by pt.name, pt.category
    ) t
    WHERE rank_revenue <= 3;
    

   
  
    
   
   
	
  
  

    
   
    
