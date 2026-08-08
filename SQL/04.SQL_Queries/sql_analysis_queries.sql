USE ProductDB;
GO

--1. Display all records from the `Product` table.

SELECT * 
FROM ProductDB.dbo.Products

--2. Display only the `ProductName` column.

SELECT ProductName
FROM ProductDB.dbo.Products

--3. Display `ProductName` and `Price`.

SELECT ProductName , Price
FROM ProductDB.dbo.Products

--4. Display `ProductName`, `Category`, and `StockQuantity`.

SELECT ProductName , Category, StockQuantity
FROM ProductDB.dbo.Products

--5. Display `ProductID`, `ProductName`, `Supplier`, and `Status`.

SELECT ProductID , ProductName,Supplier,Status
FROM ProductDB.dbo.Products

--6. Display `ProductName`, `Price`, and `Status`.

SELECT ProductName , Price , Status
FROM ProductDB.dbo.Products

--7. Display `ProductName`, `Category`, `Price`, and `StockQuantity`.

SELECT ProductName , Category, Price, StockQuantity
FROM ProductDB.dbo.Products

--8. Display all columns for the product with `ProductID` 105.

SELECT *
FROM ProductDB.dbo.Products
WHERE ProductID IN (105)

--9. Display products where the category is Electronics.

SELECT *
FROM ProductDB.dbo.Products
WHERE Category IN ('Electronics')

--10. Display products where the category is Furniture.

SELECT *
FROM ProductDB.dbo.Products
WHERE Category IN ('Furniture')

--11. Display products where the category is Accessories.

SELECT *
FROM ProductDB.dbo.Products
WHERE Category IN ('Accessories')

--12. Display products supplied by TechWorld.

SELECT *
FROM ProductDB.dbo.Products
WHERE Supplier IN ('TechWorld')

--13. Display products supplied by OfficePro.

SELECT *
FROM ProductDB.dbo.Products
WHERE Supplier IN ('OfficePro')

--14. Display products with a status of Active.

SELECT *
FROM ProductDB.dbo.Products
WHERE Status IN ('Active')

--15. Display products with a status of Inactive.

SELECT *
FROM ProductDB.dbo.Products
WHERE Status IN ('Inactive')

--16. Display the product where ProductName is Laptop.

SELECT *
FROM ProductDB.dbo.Products
WHERE ProductName IN ('Laptop')

--17. Display products with a price greater than 1,000.

SELECT *
FROM ProductDB.dbo.Products
WHERE Price > 1000

--18. Display products with a price greater than 5,000.

SELECT *
FROM ProductDB.dbo.Products
WHERE Price > 5000

--19. Display products with a stock quantity greater than 50.

SELECT *
FROM ProductDB.dbo.Products
WHERE StockQuantity > 50

--20. Display products with a stock quantity greater than 100.

SELECT *
FROM ProductDB.dbo.Products
WHERE StockQuantity > 100

--21. Display Electronics products with a price greater than 5,000.

--22. Display Accessories products with a price greater than 500.

--23. Display products supplied by TechWorld with a price greater than 1,000.

--24. Display products with a price less than 500.

--25. Display products with a price less than 1,000.

--26. Display products with a stock quantity less than 20.

--27. Display products with a stock quantity less than 10.

--28. Display Electronics products with a stock quantity less than 20.

--29. Display Accessories products with a price less than 500.

--30. Display Active products with a stock quantity less than 20.

--31. Display products with a price greater than or equal to 1,000.

--32. Display products with a stock quantity greater than or equal to 50.

--33. Display products with a price greater than or equal to 5,000.

--34. Display Electronics products with a price greater than or equal to 4,000.

--35. Display products with a price less than or equal to 500.

--36. Display products with a stock quantity less than or equal to 10.

--37. Display products with a price less than or equal to 1,000.

--38. Display Accessories products with a price less than or equal to 500.

--39. Display all products that are not in the Electronics category.

--40. Display all products that are not supplied by TechWorld.

--41. Display all products whose status is not Inactive.

--42. Display all products whose price is not equal to 500.

--43. Display all products whose stock quantity is not equal to 20.

--44. Display products that are Electronics AND have a price greater than 5,000.

--45. Display products that are Accessories AND have a stock quantity less than 30.

--46. Display products that are Active AND have a price greater than 2,000.

--47. Display products supplied by TechWorld AND have a price less than 2,000.

--48. Display products that are either Electronics OR Furniture.

--49. Display products supplied by either TechWorld OR OfficePro.

--50. Display products where the price is less than 500 OR greater than 5,000.

--51. Update the price of the Wireless Mouse to 400.00.

--52. Update the stock quantity of the Laptop to 10.

--53. Change the status of the Webcam from Inactive to Active.

--54. Update the price of the Office Chair to 3000.00.

--55. Update the supplier of the Laptop Bag to TechWorld.

--56. Increase the price of the Keyboard to 650.00.

--57. Change the stock quantity of the Printer to 15.

--58. Change the status of the Filing Cabinet to Active.

--59. Update both the price and stock quantity of the Monitor to 4500.00 and 25.

--60. Update the supplier and price of the Projector to VisionTech and 7500.00.

--61. Delete the product with ProductID = 109.

--62. Delete the Webcam product.

--63. Delete the product supplied by RetailTech.

--64. Delete the product with ProductID = 135.

--65. Delete the Gaming Monitor.

--66. Delete the product where ProductName = 'Printer Paper'.

--67. Delete products where the status is Inactive.

--68. Delete products where the stock quantity is less than 10.

--69. Delete the product where the price is equal to 85.00.

--70. Delete the product where ProductID = 140.
