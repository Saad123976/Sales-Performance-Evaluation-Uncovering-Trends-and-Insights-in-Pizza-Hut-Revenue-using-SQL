

**Introduction**

This project aims to analyze sales data from a pizza restaurant, specifically focusing on various metrics such as total orders, revenue generation, popular pizza types, and order distribution patterns. By leveraging SQL queries to extract and manipulate data, we gain valuable insights into customer preferences and sales performance, which can inform business decisions and marketing strategies.

**Methodology**

The analysis was conducted using a structured database named pizzahut, which contains tables for orders, pizzas, pizza types, and order details. The methodology involved the following steps:

**Total Orders and Revenue Calculation:**

Calculated the total number of orders placed and the total revenue generated from sales by aggregating data from the orders, pizzas, and order_details tables.

**Pizza Price Analysis:**

Identified the pizza with the highest price to understand pricing strategies.

**Order Size Analysis:**

Determined the most common pizza size ordered by aggregating sizes from the pizzas table.

**Top Pizzas by Quantity Ordered:**

Extracted the top 5 pizzas based on the quantity ordered, utilizing joins between relevant tables.

**Orders per Category:**

Analyzed total orders by pizza category to gauge popularity.

**Hourly Distribution of Orders:**

Examined order distribution by hour to identify peak ordering times.

**Category-Wise Distribution of Pizzas:**

Counted the number of pizzas available in each category to assess variety.

**Average Orders Per Day:**

Calculated the average number of orders per day to evaluate business performance over time.

**Top Pizzas by Revenue:**

Identified the top 3 pizzas ordered based on revenue generated.

**Percentage Contribution of Pizza Types:**

Calculated the percentage contribution of each pizza type to the total revenue using both subqueries and Common Table Expressions (CTEs).

**Cumulative Revenue by Date:**

Analyzed cumulative revenue over time to understand sales growth.

**Top 3 Pizzas in Each Category:**

Ranked pizzas by revenue within their respective categories to identify the best-sellers.

**Results**

**The SQL queries yielded several key insights:**

The total number of orders placed and the revenue generated provided a baseline for overall performance.

The most expensive pizza highlighted pricing strategies, while the most common size ordered indicated customer preferences.

The top 5 pizzas by quantity and the top 3 pizzas by revenue showcased popular choices and potential promotional focus.

The analysis of orders per category revealed trends in consumer preferences, guiding inventory and marketing strategies.

The hourly distribution of orders helped identify peak business hours, allowing for better staffing and resource allocation.

The cumulative revenue analysis provided insights into sales trends over time, indicating growth or decline patterns.

**Conclusions**

This project effectively utilized SQL to extract meaningful insights from the pizza sales data. The findings not only reflect customer preferences and sales trends but also provide actionable recommendations for enhancing marketing efforts and operational efficiency. Future work could involve integrating additional data sources, such as customer demographics, to deepen the analysis and refine strategies further.

This analysis serves as a valuable resource for stakeholders in the pizza restaurant industry, aiding in data-driven decision-making and strategic planning. The SQL scripts are available in the repository for further exploration and enhancement.
