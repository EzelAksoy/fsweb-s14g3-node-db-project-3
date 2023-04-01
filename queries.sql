-- Multi-Table Sorgu Pratiği
select ProductName,CategoryName from Product
join Category on Product.CategoryId=Category.Id
-- Tüm ürünler(product) için veritabanındaki ProductName ve CategoryName'i listeleyin. (77 kayıt göstermeli)
select Id,CompanyName from [Order]
join Customer on [Order].CustomerId=Customer.Id
where OrderDate<"2012-08-09"
-- 9 Ağustos 2012 öncesi verilmiş tüm siparişleri(order) için sipariş id'si (Id) ve gönderici şirket adını(CompanyName)'i listeleyin. (429 kayıt göstermeli)
select Quantity,ProductName from OrderDetail
join Product on OrderDetail.ProductId=Product.Id
where OrderId=10251
-- Id'si 10251 olan siparişte verilen tüm ürünlerin(product) sayısını ve adını listeleyin. ProdcutName'e göre sıralayın. (3 kayıt göstermeli)
select [Order].Id,CompanyName,Employee.LastName from [Order]
join Customer on [Order].CustomerId=Customer.Id
join Employee on [Order].EmployeeId=Employee.Id
-- Her sipariş için OrderId, Müşteri'nin adını(Company Name) ve çalışanın soyadını(employee's LastName). Her sütun başlığı doğru bir şekilde isimlendirilmeli. (16.789 kayıt göstermeli)




SELECT [Orders].CustomerID,CustomerName, count (Customers.CustomerID)   FROM [Orders]
Join Customers on [Orders].CustomerID=Customers.CustomerID
group by Customers.CustomerID

-- Her gönderici tarafından gönderilen gönderi sayısını bulun.
SELECT Employees.LastName,Employees.firstName,count (Employees.EmployeeID) as "SİPARİŞ" FROM [Orders]
Inner join Employees on [Orders].EmployeeID= Employees.EmployeeID
group by Employees.EmployeeID
order by "SİPARİŞ" DESC
Limit 5
-- Sipariş sayısına göre ölçülen en iyi performans gösteren ilk 5 çalışanı bulun.
SELECT  Orders.EmployeeID,Employees.LastName,Employees.FirstName,SUM(Price) as "SİPARİŞ ÜCRETİ" FROM [OrderDetails]
join Products on OrderDetails.ProductID=Products.ProductID
join Orders on OrderDetails.OrderID=Orders.OrderID
join Employees on Orders.EmployeeID=Employees.EmployeeID
group by Employees.EmployeeID
order by "SİPARİŞ ÜCRETİ" DESC
limit 5

-- Gelir olarak ölçülen en iyi performans gösteren ilk 5 çalışanı bulun.
SELECT  Products.ProductID,Products.ProductName, SUM(Price) as "GELİR" FROM [Products]
join Categories on Products.CategoryID=Categories.CategoryID
join OrderDetails on Products.ProductID=OrderDetails.ProductID
group by Products.ProductID
order by "GELİR" ASC
Limit 1
-- En az gelir getiren kategoriyi bulun.
SELECT Customers.Country,Count (OrderID) as "Sipariş Sayısı"FROM [Orders]
join Customers on Orders.CustomerID=Customers.CustomerID
group by Customers.CustomerID
order by "Sipariş Sayısı" DESC
Limit 1
-- En çok siparişi olan müşteri ülkesini bulun.