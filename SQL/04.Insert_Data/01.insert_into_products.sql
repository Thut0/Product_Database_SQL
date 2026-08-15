USE ProductDB;
GO

-- INSERT data into the Products table

INSERT INTO ProductDB.dbo.Products(ProductID,ProductName,Category,Price,StockQuantity,Supplier,Status)
VALUES (101,'Laptop','Electronics',12500.00,15,'TechWorld','Active'),
(102,'Wireless Mouse','Accessories',350.00,50,'TechWorld','Active'),
(103,'Keyboard','Accessories',550.00,35,'TechWorld','Active'),
(104,'Office Chair','Furniture',2800.00,12,'OfficePro','Active'),
(105,'Desk','Furniture',4500.00,8,'OfficePro','Active'),
(106,'Monitor','Electronics',4200.00,20,'ScreenTech','Active'),
(107,'Printer','Electronics',3200.00,10,'PrintPlus','Active'),
(108,'Headphones','Accessories',850.00,25,'SoundMax','Active'),
(109,'USB Cable','Accessories',120.00,100,'CableTech','Active'),
(110,'Webcam','Electronics',1500.00,18,'TechWorld','Inactive'),
(111,'Tablet','Electronics',1500.00,18,'TechWorld','Inactive'),
(112,'Smartphone','Electronics',9800.00,30,'MobileHub','Active'),
(113,'Laptop Bag','Accessories',750.00,40,'BagWorld','Active'),
(114,'External Hard Drive','Storage',1800.00,27,'DataStore','Active'),
(115,'Flash Drive 64GB','Storage',250.00,75,'DataStore','Active'),
(116,'Flash Drive 128GB','Storage',400.00,60,'DataStore','Active'),
(117,'Office Desk Lamp','Furniture',650.00,14,'OfficePro','Active'),
(118,'Bookshelf','Furniture',2200.00,6,'OfficePro','Active'),
(119,'Filing Cabinet','Furniture',3500.00,9,'OfficePro','Inactive'),
(120,'Projector','Electronics',7200.00,7,'VisionTech','Active'),
(121,'Projector Screen','Accessories',1900.00,11,'VisionTech','Active'),
(122,'Speakers','Electronics',1250.00,32,'SoundMax','Active'),
(123,'Bluetooth Speaker','Electronics',950.00,28,'SoundMax','Active'),
(124,'Microphone','Electronics',1100.00,16,'SoundMax','Active'),
(125,'HDMI Cable','Accessories',180.00,85,'CableTech','Active'),
(126,'Ethernet Cable','Accessories',150.00,90,'CableTech','Active'),
(127,'Power Bank','Electronics',700.00,45,'MobileHub','Active'),
(128,'Smartphone Charger','Accessories',450.00,65,'MobileHub','Active'),
(129,'Laptop Charger','Accessories',900.00,20,'TechWorld','Active'),
(130,'Graphics Tablet','Electronics',3800.00,13,'DesignTech','Active'),
(131,'Barcode Scanner','Electronics',2400.00,17,'RetailTech','Active'),
(132,'Label Printer','Electronics',2100.00,8,'PrintPlus','Active'),
(133,'Calculator','Office Supplies',180.00,55,'OfficeMart','Active'),
(134,'Notebook','Office Supplies',85.00,120,'OfficeMart','Active'),
(135,'Stapler','Office Supplies',65.00,80,'OfficeMart','Active'),
(136,'Printer Paper','Office Supplies',95.00,200,'OfficeMart','Active'),
(137,'Whiteboard','Office Supplies',1200.00,10,'OfficeMart','Active'),
(138,'Whiteboard Marker Set','Office Supplies',180.00,70,'TechWorld','Active'),
(139,'Ergonomic Keyboard','Accessories',950.00,19,'TechWorld','Active'),
(140,'Gaming Monitor','Electronics',8500.00,5,'ScreenTech','Inactive');

-- Query the table

SELECT *
FROM ProductDB.dbo.Products