# MySQL project
Authors: Wooyoung Jeong and Jisu Kim

# Research Questions
1. To grow the business, which state to focus the advertisement
2. Analysis on growth rate of the business based on the employeement and the order rate
3. What are the features of the different types of ordered product per each season

# Footwear Business Analysis (Project_2) Abstract
In this data set, there is randomly generated data for merchandizing company. There are total 10 tables that have customer, employee, product and other infomration. Based on the relationship between tables, we wrote the code that can analyze the trend of the business including hidden deparment information about employee department.

# Countries States Cities DataBase
Dataset: https://download.data.world/datapackage/thegove/redcat

# Schemas Roadmap

# Sample MYSQL code
Customer Grade Function
```SQL

```

### Sale Season Function
```SQL 
CREATE DEFINER=`root`@`localhost` FUNCTION `SALE_SEASON`(
	MONTH VARCHAR(20)
    ) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE sale_season VARCHAR(20);
	If (MONTH = 'March' OR MONTH = 'April' OR MONTH = 'May') THEN
      SET sale_season = 'Spring';
	ELSEIF (MONTH = 'June' OR MONTH = 'July'OR MONTH = 'August') THEN
      SET sale_season = 'Summer';
	ELSEIF (MONTH = 'September' OR MONTH = 'October'OR MONTH = 'November') THEN
      SET sale_season = 'Fall';
	ELSEIF (MONTH = 'December' OR MONTH = 'January'OR MONTH = 'February') THEN
      SET sale_season = 'Winter';
	END IF;
RETURN sale_season;
END
```
Set the four seasons

### Number of Order Seasons Procedure
```SQL
CREATE DEFINER=`root`@`localhost` PROCEDURE `CATEGORY_SEASON`(
	IN four_season VARCHAR(25)
)
BEGIN
	SELECT p.category, COUNT(p.category) as num_order
	FROM sale_item si
	JOIN sale s 
		ON si.sale_id = s.sale_id
	JOIN product p 
		ON si.product_id = p.productid
    WHERE SALE_SEASON(MONTHNAME(s.sale_date)) = four_season
	GROUP BY p.category;

	
END
```
```SQL
CALL CATEGORY_SEASON('Winter')
```
Get the number of order of each product during Winter

# Results

1. Analysis on single table.
We first started analysis on single tables before going deep using multiple tables.

### Cusotmer table
<img src = "Graph/Number of Customer per State.png" width="1000" height="400">
There were total 4371 customers since this footwear business started. We organized number of customers per state. Based on the number of customers, business can detmine which area to focus the advertisement and which area to withdraw.

### Employee table
<img src = "Graph/Employee hired per year.png" width="1000" height="400">
In employee table, number of cities where employees live and the name of cities can be found.
Also the hiring trend of the company was noticeable. Company was established in 2005, but after hiring a few people until 2010, they are keep reducing hire.

### Ivnentory item table
we could find number of items that are not in inventory. Based on this information, we were able to find only 0.3% of products were not in inventory, which shows good status of inventory. Also, number of shoe sizes were able to find, too.

### Product table
<img src = "Graph/Number of product based on gender.png" width="1000" height="400">
In product table, general information such as number of total product, number of items based on gender and items based on categories were able to find. There were slightly more male item compare to female item and the sneakers were very dominant in cateogy based table.

### Purchase table
In purchase table, we found that purchasing items started on 2014. Based on the information, even though employees were hired between 2000 and 2013, actual business started 2014.. This can be mean that there was very long period of time to start the actual business. Also, the number of items per manufacturers were very even which means item were very diversed in this footwear business.

### Purchase item table
In purchase item table, most noticeable data was the average quantity of product in each purchase. The average number of quantiy was 1.2224. This can be analyzed that this business ordered almost the exact amount of the product when orders were received. In addition, the most purchased products were able to find including total number of purchased. 

### Sale table
In sale table, meaningful information was able to find. First sale started on 2013/12 even though first purchase started on 2014. This means that the this footwear business received the money from the customer and purchase the product after order was received. Also, to find the trend of the month sale, we calculated sale per month as well.

### Sale item table
In sale item table, we could not find any important analytic results. We calculated minimum and maximum product price.

2. Using multiple tables to analyize

### Average Shipping Price per State
<img src = "Graph/Average Shipping Price per State.png" width="700" height="400">
The customers from Montana and Rhode Island tend to chose the basic shipping option(the least expensive shipment). 

### Number of Sale per Month && Top Eight Categories per Season
<img src = "Graph/Number of Sale per Month.png" width="700" height="400">
<img src = "Graph/Top Eight Categories per Season.png" width="700" height="400">
According to the graph 'Top Eight Categories per Season’, the most ordered product is ‘sneakers' regardless of the seasons. In Addition, the top eight products have been ordered most during summer. Hence the graph may conclude that summer is the best selling season. However, the graph ’Number of Sale per Month’ shows that winter is the best selling season. Therefore we can conclude that non-best selling products are also fatal to the high sales performance.

### Purchasing employee
<img src = "Graph/Employees who purchased product.png" width="300" height="100">
Among 21 employees in the company, we wnanted to find who are in charge of purchasing products.
Based on the code, we could find only 3 designated people purchased product. First we assumed that these 3 people were in purchasing department, however, all 3 people had 3 different manager id which means they were in different department. 


# Conclusion

Based on the information on the randomly generated, we could analyze the trend of simulated footwear business. This business was estabilshed on 2000 and now have 21 employees. With 21 employees, they started footwear sale business on 2014. For their first few orders, they tend to purchase after receive order. However, they built 191734 pairs of shoes ininventory system during two years with only 0.3% of missing products in inventory. Their main portion of sale is sneakers and has highest sale on December. We have graded customer who spend more than 1000 as 'A', between 500 and 1000 as 'B', and below 500 as 'C'. In 4371 customers, there are only 1.7% of 'A' customers. However, 1.7% of customers spent 8.19% of total cusotomer's spent money. According to the SALE_SEASON function and CATEGORY_SEASON procedure, the products which are not best sellings are also important to the business since summer is the best selling season with top eight products while winter is the best selling season with every products.
