# MySQL project
Authors: Wooyoung Jeong and Jisu Kim

# Research Questions
1. 
2. 


# Footwear Business Analysis (Project_2) Abstract
In this data set, there is randomly generated data for merchandizing company. There are total 10 tables that have customer, employee, product and other infomration. Based on the relationship between tables, we wrote the code that can analyze the trend of the business including hidden deparment information about employee department.

# Countries States Cities DataBase
Dataset: https://download.data.world/datapackage/thegove/redcat

# Schemas Roadmap

# Sample MYSQL code

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
According to the graph 'Top Eight Categories per Season’, the most ordered product is ‘sneakers' regardless of the seasons. In Addition, the top eight products have been ordered most during summer. Hence the graph may conclude that summer is best selling season. However, the graph ’Number of Sale per Month’ shows that winter is the best selling season. Therefore we can conclude that non-best selling products are also fatal to the high sales performance.

### Purchasing employee
<img src = "Graph/Employees who purchased product.png" width="300" height="100">
Among 21 employees in the company, we wnanted to find who are in charge of purchasing products.
Based on the code, we could find only 3 designated people purchased product. First we assumed that these 3 people were in purchasing department, however, all 3 people had 3 different manager id which means they were in different department. 
