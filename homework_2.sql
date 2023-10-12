1. Вывести название и стоимость в USD одного самого дорогого проданного товара
  
SELECT 
    Products.ProductName,
    Products.Price * 1.06 AS PriceInUSD -- курс на сегодня))
FROM Products
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
ORDER BY PriceInUSD DESC
LIMIT 1

2. Вывести два самых дорогих товара из категории Beverages из USA

SELECT 
Products.ProductID,
Products.ProductName,
Suppliers.Country,
Products.Unit,
Products.Price
FROM Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE 
    Categories.CategoryName = 'Beverages'
  AND
    Suppliers.Country = 'USA'  
ORDER BY Price DESC
LIMIT 2;

3. Удалить товары с ценой менее 5 EUR

DELETE FROM Products
WHERE Price < 50;

4. Вывести список стран, которые поставляют морепродукты

SELECT DISTINCT
    Suppliers.Country

FROM Products

JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
JOIN Categories ON Products.CategoryID=Categories.CategoryID

WHERE
    Categories.CategoryName='Seefood'

5. Очистить поле ContactName у всех клиентов не из China

UPDATE Customers
SET ContactName = ''
WHERE 
	Country <> 'China';




