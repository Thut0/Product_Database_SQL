use ProductDB;
GO

--71. Display products whose product name starts with the letter `L`.

SELECT *
FROM ProductDB.dbo.Products
WHERE ProductName LIKE 'L%'

--72. Display products whose product name starts with the word `Laptop`.

SELECT *
FROM ProductDB.dbo.Products
WHERE ProductName LIKE 'Laptop%'

--73. Display products whose product name contains the word `Cable`.

SELECT *
FROM ProductDB.dbo.Products
WHERE ProductName LIKE '%Cable%'

--74. Display products whose product name contains the word `Monitor`.

SELECT *
FROM ProductDB.dbo.Products
WHERE ProductName LIKE '%Monitor%'

--75. Display products whose product name ends with the word `er`.

SELECT *
FROM ProductDB.dbo.Products
WHERE ProductName LIKE '%er'

--76. Display products whose supplier name starts with `Tech`.

SELECT *
FROM ProductDB.dbo.Products
WHERE Supplier LIKE 'Tech%'

--77. Display products whose product name contains the word `Printer`.

SELECT *
FROM ProductDB.dbo.Products
WHERE ProductName LIKE '%Printer%'

--78. Display products whose product name starts with `Office`.

SELECT *
FROM ProductDB.dbo.Products
WHERE ProductName LIKE 'Office%'

--79. Display products whose product name contains the word `Speaker`.

SELECT *
FROM ProductDB.dbo.Products
WHERE ProductName LIKE '%Speaker%'

--80. Display products whose product name contains the letter `o`.

SELECT *
FROM ProductDB.dbo.Products
WHERE ProductName LIKE '%o%'

--81. Display products where the category is either `Electronics`, `Furniture`, or `Accessories`.

SELECT *
FROM ProductDB.dbo.Products
WHERE Category IN ('Electronics','Furniture','Accessories')

--82. Display products supplied by either `TechWorld`, `OfficePro`, or `OfficeMart`.

SELECT *
FROM ProductDB.dbo.Products
WHERE Supplier IN ('TechWorld','OfficePro','OfficeMart')

--83. Display products where the status is either `Active` or `Inactive`.

SELECT *
FROM ProductDB.dbo.Products
WHERE Status IN ('Active','Inactive')

--84. Display products where the category is either `Storage` or `Office Supplies`.

SELECT *
FROM ProductDB.dbo.Products
WHERE Category IN ('Storage' , 'Office Supplies')

--85. Display products supplied by either `SoundMax`, `CableTech`, or `MobileHub`.

SELECT *
FROM ProductDB.dbo.Products
WHERE Supplier IN ('SoundMax', 'CableTech', 'MobileHub')

--86. Display products where the ProductID is either `101`, `105`, `110`, or `120`.

SELECT *
FROM ProductDB.dbo.Products
WHERE ProductID IN (101,105,110,120)

--87. Display products where the price is either `180.00`, `350.00`, or `950.00`.

SELECT *
FROM ProductDB.dbo.Products
WHERE Price IN (180.00,350.00,950.00)

--88. Display all the unique product categories.

SELECT DISTINCT Category
FROM ProductDB.dbo.Products

--89. Display all the unique suppliers.

SELECT DISTINCT Supplier
FROM ProductDB.dbo.Products

--90. Display all the unique product statuses.

SELECT DISTINCT Status
FROM ProductDB.dbo.Products

--91. Display all the unique prices.

SELECT DISTINCT Price
FROM ProductDB.dbo.Products

--92. Display the unique combinations of Category and Supplier.

SELECT DISTINCT Category , Supplier
FROM ProductDB.dbo.Products

--93. Display the unique combinations of Category and Status.

SELECT DISTINCT Category , Status
FROM ProductDB.dbo.Products

--94. Display all products ordered by price from lowest to highest.

SELECT *
FROM ProductDB.dbo.Products
ORDER BY Price ASC

--95. Display all products ordered by price from highest to lowest.

SELECT *
FROM ProductDB.dbo.Products
ORDER BY Price DESC

--96. Display all products ordered by ProductName alphabetically.

SELECT *
FROM ProductDB.dbo.Products
ORDER BY ProductName ASC

--97. Display all products ordered by StockQuantity from lowest to highest.

SELECT *
FROM ProductDB.dbo.Products
ORDER BY StockQuantity ASC

--98. Display all products ordered by StockQuantity from highest to lowest.

SELECT *
FROM ProductDB.dbo.Products
ORDER BY StockQuantity DESC

--99. Display all products ordered by Category alphabetically.

SELECT *
FROM ProductDB.dbo.Products
ORDER BY Category ASC

--100. Display all products ordered by Supplier alphabetically and Price from highest to lowest.

SELECT *
FROM ProductDB.dbo.Products
ORDER BY Supplier ASC , Price DESC

--101. Display all products ordered by Status and then by Price from lowest to highest.

SELECT *
FROM ProductDB.dbo.Products
ORDER BY Status , Price ASC

--102. Display the number of products in each category.

SELECT Category
,COUNT(*) AS Num_Of_Products
FROM ProductDB.dbo.Products
GROUP BY Category

--103. Display the number of products supplied by each supplier.

SELECT Supplier , COUNT(*) AS Num_Of_Products_By_Each_Supplier
FROM ProductDB.dbo.Products
GROUP BY Supplier

--104. Display the number of products for each status.

SELECT Status , COUNT(*) AS Num_Of_Products_By_Status
FROM ProductDB.dbo.Products
GROUP BY Status

--105. Display the average price for each category.

SELECT Category,
AVG(Price) AS Avg_Price_Per_Category
FROM ProductDB.dbo.Products
GROUP BY Category

--106. Display the average price for each supplier.

SELECT Supplier,
AVG(Price) AS Avg_Price_Per_Supplier
FROM ProductDB.dbo.Products
GROUP BY Supplier

--107. Display the total stock quantity for each category.

SELECT Category,
SUM(StockQuantity) AS Total_Stock_Quantity
FROM ProductDB.dbo.Products
GROUP BY Category

--108. Display the total stock quantity for each supplier.

SELECT Supplier,
SUM(StockQuantity) AS Total_Stock_Quantity
FROM ProductDB.dbo.Products
GROUP BY Supplier

--109. Display the number of products in each category and status.

SELECT Category,
Status,
COUNT(StockQuantity) AS Number_of_Products
FROM ProductDB.dbo.Products
GROUP BY Category , Status

--110. Display the average price for each category and status.

SELECT Category,
Status,
AVG(Price) AS Avg_Price_Per_Category
FROM ProductDB.dbo.Products
GROUP BY Category, Status

--111. Display categories that have more than 5 products.

SELECT Category,
COUNT(*) AS Prod_Count
FROM ProductDB.dbo.Products
GROUP BY Category
HAVING COUNT(*)  > 5


--112. Display suppliers that have more than 3 products.

SELECT Supplier,
COUNT(*) AS Prod_Count
FROM ProductDB.dbo.Products
GROUP BY Supplier
HAVING COUNT(*)  > 3

--113. Display categories where the average price is greater than 2,000.

SELECT Category,
AVG(Price) AS Avg_Price
FROM ProductDB.dbo.Products
GROUP BY Category
HAVING AVG(Price) > 2000

--114. Display suppliers where the average product price is greater than 2,000.

SELECT Supplier,
AVG(Price) AS Avg_Price
FROM ProductDB.dbo.Products
GROUP BY Supplier
HAVING AVG(Price) > 2000

--115. Display categories where the total stock quantity is greater than 100.

SELECT Category,
SUM(StockQuantity) AS Total_Stock_Quantity
FROM ProductDB.dbo.Products
GROUP BY Category
HAVING SUM(StockQuantity) > 100

--116. Display suppliers where the total stock quantity is greater than 100.

SELECT Supplier,
SUM(StockQuantity) AS Total_Stock_Quantity
FROM ProductDB.dbo.Products
GROUP BY Supplier
HAVING SUM(StockQuantity) > 100

--117. Display statuses that have more than 30 products.

SELECT Status,
COUNT(*) AS Prod_Count
FROM ProductDB.dbo.Products
GROUP BY Status
HAVING COUNT(*) > 30

--118. Display categories that have more than 5 products and an average price greater than 1,000.

SELECT Category,
COUNT(*) AS Prod_Count,
AVG(Price) AS Avg_Price
FROM ProductDB.dbo.Products
GROUP BY Category
HAVING COUNT(*) > 5 AND AVG(Price) > 1000

--119. Display suppliers that have more than 2 products and an average price greater than 1,000.

SELECT Supplier,
COUNT(*) AS Prod_Count,
AVG(Price) AS Avg_Price
FROM ProductDB.dbo.Products
GROUP BY Supplier
HAVING COUNT(*) > 2 AND AVG(Price) > 1000

--120. Display categories where the total stock quantity is less than 100.

SELECT Category,
SUM(StockQuantity) AS Total_Stock_Quantity
FROM ProductDB.dbo.Products
GROUP BY Category
HAVING SUM(StockQuantity) < 100

--121. Count the total number of products.

SELECT COUNT(*) AS Total_Num_Of_Prod
FROM ProductDB.dbo.Products

--122. Count the number of products in the Electronics category.

SELECT COUNT(*) AS Total_Num_Of_Prod
FROM ProductDB.dbo.Products
WHERE Category IN ('Electronics')

--123. Count the number of products in the Accessories category.

SELECT COUNT(*) AS Total_Num_Of_Prod
FROM ProductDB.dbo.Products
WHERE Category IN ('Accessories')

--124. Count the number of Active products.

SELECT COUNT(*) AS Total_Num_Of_Prod
FROM ProductDB.dbo.Products
WHERE Status IN ('Active')

--125. Count the number of Inactive products.

SELECT COUNT(*) AS Total_Num_Of_Prod
FROM ProductDB.dbo.Products
WHERE Status IN ('Inactive')

--126. Count the number of products supplied by TechWorld.

SELECT COUNT(*) AS Total_Num_Of_Prod
FROM ProductDB.dbo.Products
WHERE Supplier IN ('TechWorld')

--127. Count the number of products supplied by OfficeMart.

SELECT COUNT(*) AS Total_Num_Of_Prod
FROM ProductDB.dbo.Products
WHERE Supplier IN ('OfficeMart')

--128. Count the number of products where the stock quantity is greater than 20.

SELECT COUNT(*) AS Total_Num_Of_Prod
FROM ProductDB.dbo.Products
WHERE StockQuantity > 20

--129. Count the number of products where the price is greater than 1,000.

SELECT COUNT(*) AS Total_Num_Of_Prod
FROM ProductDB.dbo.Products
WHERE Price > 1000

--130. Count the number of products where the price is less than 500.


SELECT COUNT(*) AS Total_Num_Of_Prod
FROM ProductDB.dbo.Products
WHERE Price < 500

--131. Calculate the total stock quantity of all products.

SELECT SUM(StockQuantity) AS Total_Stock_Quantity
FROM ProductDB.dbo.Products

--132. Calculate the total stock quantity of Electronics products.

SELECT SUM(StockQuantity) AS Total_Stock_Quantity
FROM ProductDB.dbo.Products
WHERE Category IN ('Electronics')

--133. Calculate the total stock quantity of Accessories products.

SELECT SUM(StockQuantity) AS Total_Stock_Quantity
FROM ProductDB.dbo.Products
WHERE Category IN ('Accessories')

--134. Calculate the total stock quantity of Furniture products.

SELECT SUM(StockQuantity) AS Total_Stock_Quantity
FROM ProductDB.dbo.Products
WHERE Category IN ('Furniture')

--135. Calculate the total stock quantity of products supplied by TechWorld.

SELECT SUM(StockQuantity) AS Total_Stock_Quantity
FROM ProductDB.dbo.Products
WHERE Supplier IN ('TechWorld')

--136. Calculate the total stock quantity of Active products.

SELECT SUM(StockQuantity) AS Total_Stock_Quantity
FROM ProductDB.dbo.Products
WHERE Status IN ('Active')

--137. Calculate the total stock quantity of products with a price greater than 1,000.

SELECT SUM(StockQuantity) AS Total_Stock_Quantity
FROM ProductDB.dbo.Products
WHERE Price > 1000

--138. Calculate the total stock quantity of products with a price less than 500.

SELECT SUM(StockQuantity) AS Total_Stock_Quantity
FROM ProductDB.dbo.Products
WHERE Price > 500

--139. Calculate the average price of all products.

SELECT AVG(Price) AS avg_price_of_all_products
FROM ProductDB.dbo.Products

--140. Calculate the average price of Electronics products.

SELECT AVG(Price) AS avg_price_of_electronic_products
FROM ProductDB.dbo.Products
WHERE Category IN ('Electronics')

--141. Calculate the average price of Accessories products.

SELECT AVG(Price) AS avg_price_of_accessories_products
FROM ProductDB.dbo.Products
WHERE Category IN ('Accessories')

--142. Calculate the average price of Furniture products.

SELECT AVG(Price) AS avg_price_of_furniture_products
FROM ProductDB.dbo.Products
WHERE Category IN ('Furniture')

--143. Calculate the average price of products supplied by TechWorld.

SELECT AVG(Price) AS avg_price_of_TechWorld_products
FROM ProductDB.dbo.Products
WHERE Supplier IN ('TechWorld')

--144. Calculate the average price of Active products.

SELECT AVG(Price) AS avg_price_of_Active_products
FROM ProductDB.dbo.Products
WHERE Status IN ('Active')

--145. Calculate the average stock quantity of all products.

SELECT AVG(StockQuantity) AS avg_stock_quantity
FROM ProductDB.dbo.Products

--146. Calculate the average stock quantity of Electronics products.

SELECT AVG(StockQuantity) AS avg_stock_quantity
FROM ProductDB.dbo.Products
WHERE Category IN ('Electronics')

--147. Find the lowest product price.

SELECT MIN(Price) AS lowest_prod_price
FROM ProductDB.dbo.Products

--148. Find the lowest product price among Electronics products.

SELECT MIN(Price) AS lowest_prod_price
FROM ProductDB.dbo.Products
WHERE Category = 'Electronics'

--149. Find the lowest product price among Accessories products.

SELECT MIN(Price) AS lowest_prod_price
FROM ProductDB.dbo.Products
WHERE Category = 'Accessories'

--150. Find the lowest stock quantity.

SELECT MIN(StockQuantity) AS lowest_stock_quantity
FROM ProductDB.dbo.Products

--151. Find the lowest stock quantity among Electronics products.

SELECT MIN(StockQuantity) AS lowest_stock_quantity
FROM ProductDB.dbo.Products
WHERE Category IN ('Electronics')

--152. Find the lowest stock quantity among Active products.

SELECT MIN(StockQuantity) AS lowest_stock_quantity
FROM ProductDB.dbo.Products
WHERE Status IN ('Active')

--153. Find the highest product price.

SELECT MAX(Price) AS highest_prod_price
FROM ProductDB.dbo.Products

--154. Find the highest product price among Electronics products.

SELECT MAX(Price) AS highest_prod_price
FROM ProductDB.dbo.Products
WHERE Category IN ('Electronics')

--155. Find the highest product price among Accessories products.

SELECT MAX(Price) AS highest_prod_price
FROM ProductDB.dbo.Products
WHERE Category IN ('Accessories')

--156. Find the highest stock quantity.

SELECT MAX(StockQuantity) AS highest_stock_quantity
FROM ProductDB.dbo.Products

--157. Find the highest stock quantity among Electronics products.

SELECT MAX(StockQuantity) AS highest_stock_quantity
FROM ProductDB.dbo.Products
WHERE Category IN ('Electronics')

--158. Find the highest stock quantity among Active products.

SELECT MAX(StockQuantity) AS highest_stock_quantity
FROM ProductDB.dbo.Products
WHERE Status IN ('Active')

--159. Display the total number of products, average price, lowest price, and highest price.

SELECT COUNT(*) AS total_num_of_products,
AVG(Price) AS avg_price,
MIN(Price) AS lowest_price,
MAX(Price) AS highest_price
FROM ProductDB.dbo.Products

--160. Display the total stock quantity, average stock quantity, lowest stock quantity, and highest stock quantity.

SELECT SUM(StockQuantity) AS total_stock_quantity,
AVG(StockQuantity) AS avg_stock_quantity,
MIN(StockQuantity) AS lowest_stock_quantity,
MAX(StockQuantity) AS highest_stock_quantity
FROM ProductDB.dbo.Products

--161. Display the number of Electronics products and their average price.

SELECT
COUNT(*) AS num_of_elec_prod,
AVG(Price) AS avg_price
FROM ProductDB.dbo.Products
WHERE Category = 'Electronics'

--162. Display the number of Accessories products and their average price.

SELECT
COUNT(*) AS num_of_accessory_prod,
AVG(Price) AS avg_price
FROM ProductDB.dbo.Products
WHERE Category = 'Accessories'

--163. Display the number of Active products, their average price, and their total stock quantity.

SELECT
COUNT(*) AS num_of_active_prod,
AVG(Price) AS avg_price,
SUM(StockQuantity) AS total_stock_qty
FROM ProductDB.dbo.Products
WHERE Status = 'Active'

--164. Display the number of Inactive products, their average price, and their total stock quantity.

SELECT
COUNT(*) AS num_of_inactive_prod,
AVG(Price) AS avg_price,
SUM(StockQuantity) AS total_stock_qty
FROM ProductDB.dbo.Products
WHERE Status = 'Inactive'

--165. Display the number of products supplied by TechWorld, their average price, and their total stock quantity.

SELECT
COUNT(*) AS num_of_active_prod,
AVG(Price) AS avg_price,
SUM(StockQuantity) AS total_stock_qty
FROM ProductDB.dbo.Products
WHERE Supplier = 'TechWorld'

--166. Display the number of products with a price greater than 1,000, together with their average price.

SELECT COUNT(*) AS num_of_prods,
AVG(Price) AS avg_price
FROM ProductDB.dbo.Products
WHERE Price > 1000

--167. Display the number of products with a stock quantity less than 20, together with their average stock quantity.

SELECT COUNT(*) AS num_of_prods,
AVG(StockQuantity) AS avg_stock_qty
FROM ProductDB.dbo.Products
WHERE StockQuantity < 20

--168. Display the lowest and highest price of products in the Electronics category.

SELECT MIN(Price) AS lowest_price,
MAX(Price) AS highest_price
FROM ProductDB.dbo.Products
WHERE Category = 'Electronics'
