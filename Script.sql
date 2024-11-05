create database Ecommerce_Demo
use Ecommerce_Demo

-- Tạo bảng Product
CREATE TABLE Product (
    ProductId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    Description NVARCHAR(255),
    Price DECIMAL(10, 2),
    Stock INT,
    ImageUrl NVARCHAR(255)
);

-- Tạo bảng Category
CREATE TABLE Category (
    CategoryId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    Description NVARCHAR(255)
);

-- Tạo bảng ProductCategory
CREATE TABLE ProductCategory (
    ProductId INT FOREIGN KEY REFERENCES Product(ProductId),
    CategoryId INT FOREIGN KEY REFERENCES Category(CategoryId),
    PRIMARY KEY (ProductId, CategoryId)
);

-- Tạo bảng Customer
CREATE TABLE Customer (
    CustomerId INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100),
    Email NVARCHAR(100),
    PhoneNumber NVARCHAR(15),
    Address NVARCHAR(255)
);

-- Tạo bảng Order
CREATE TABLE [Order] (
    OrderId INT PRIMARY KEY IDENTITY(1,1),
    CustomerId INT FOREIGN KEY REFERENCES Customer(CustomerId),
    OrderDate DATETIME,
    TotalAmount DECIMAL(10, 2),
    Status NVARCHAR(50)
);

-- Tạo bảng OrderItem
CREATE TABLE OrderItem (
    OrderItemId INT PRIMARY KEY IDENTITY(1,1),
    OrderId INT FOREIGN KEY REFERENCES [Order](OrderId),
    ProductId INT FOREIGN KEY REFERENCES Product(ProductId),
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    TotalPrice DECIMAL(10, 2)
);

-- Tạo bảng Cart
CREATE TABLE Cart (
    CartId INT PRIMARY KEY IDENTITY(1,1),
    CustomerId INT FOREIGN KEY REFERENCES Customer(CustomerId)
);

-- Tạo bảng CartItem
CREATE TABLE CartItem (
    CartItemId INT PRIMARY KEY IDENTITY(1,1),
    CartId INT FOREIGN KEY REFERENCES Cart(CartId),
    ProductId INT FOREIGN KEY REFERENCES Product(ProductId),
    Quantity INT,
    UnitPrice DECIMAL(10, 2)
);

-- Tạo bảng User
CREATE TABLE [User] (
    UserId INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50),
    PasswordHash NVARCHAR(255),
    Email NVARCHAR(100),
    Role NVARCHAR(20)
);

-- Tạo bảng Payment
CREATE TABLE Payment (
    PaymentId INT PRIMARY KEY IDENTITY(1,1),
    OrderId INT FOREIGN KEY REFERENCES [Order](OrderId),
    PaymentDate DATETIME,
    Amount DECIMAL(10, 2),
    PaymentMethod NVARCHAR(50)
);

-- Tạo bảng Shipping
CREATE TABLE Shipping (
    ShippingId INT PRIMARY KEY IDENTITY(1,1),
    OrderId INT FOREIGN KEY REFERENCES [Order](OrderId),
    ShippingAddress NVARCHAR(255),
    ShippingDate DATETIME,
    DeliveryStatus NVARCHAR(50)
);

-- Tạo bảng AuditLog
CREATE TABLE AuditLog (
    LogId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT FOREIGN KEY REFERENCES [User](UserId) NULL,
    Action NVARCHAR(50),
    Timestamp DATETIME,
    Details NVARCHAR(255)
);


-- Thêm dữ liệu vào bảng Product
INSERT INTO Product (Name, Description, Price, Stock, ImageUrl) VALUES
('Laptop', 'High-performance laptop', 1200.00, 10, 'http://example.com/laptop.jpg'),
('Smartphone', 'Latest smartphone model', 800.00, 25, 'http://example.com/smartphone.jpg'),
('Tablet', 'Lightweight tablet for browsing', 400.00, 15, 'http://example.com/tablet.jpg');

-- Thêm dữ liệu vào bảng Category
INSERT INTO Category (Name, Description) VALUES
('Electronics', 'All kinds of electronic devices'),
('Home Appliances', 'Appliances for home use');

-- Thêm dữ liệu vào bảng ProductCategory
INSERT INTO ProductCategory (ProductId, CategoryId) VALUES
(1, 1), -- Laptop -> Electronics
(2, 1), -- Smartphone -> Electronics
(3, 1); -- Tablet -> Electronics

-- Thêm dữ liệu vào bảng Customer
INSERT INTO Customer (FullName, Email, PhoneNumber, Address) VALUES
('John Doe', 'john@example.com', '123456789', '123 Main St'),
('Jane Smith', 'jane@example.com', '987654321', '456 Oak Ave');

-- Thêm dữ liệu vào bảng Order
INSERT INTO [Order] (CustomerId, OrderDate, TotalAmount, Status) VALUES
(1, GETDATE(), 2000.00, 'Processing'),
(2, GETDATE(), 800.00, 'Delivered');

-- Thêm dữ liệu vào bảng OrderItem
INSERT INTO OrderItem (OrderId, ProductId, Quantity, UnitPrice, TotalPrice) VALUES
(1, 1, 1, 1200.00, 1200.00), -- Order 1 includes 1 Laptop
(1, 3, 2, 400.00, 800.00), -- Order 1 includes 2 Tablets
(2, 2, 1, 800.00, 800.00); -- Order 2 includes 1 Smartphone

-- Thêm dữ liệu vào bảng Cart
INSERT INTO Cart (CustomerId) VALUES
(1), -- John Doe's cart
(2); -- Jane Smith's cart

-- Thêm dữ liệu vào bảng CartItem
INSERT INTO CartItem (CartId, ProductId, Quantity, UnitPrice) VALUES
(1, 1, 1, 1200.00), -- John Doe's cart has 1 Laptop
(2, 2, 1, 800.00); -- Jane Smith's cart has 1 Smartphone

-- Thêm dữ liệu vào bảng User
INSERT INTO [User] (Username, PasswordHash, Email, Role) VALUES
('admin', 'hashedpassword', 'admin@example.com', 'admin'),
('customer1', 'hashedpassword', 'customer1@example.com', 'customer');

-- Thêm dữ liệu vào bảng Payment
INSERT INTO Payment (OrderId, PaymentDate, Amount, PaymentMethod) VALUES
(1, GETDATE(), 2000.00, 'Credit Card'),
(2, GETDATE(), 800.00, 'Cash on Delivery');

-- Thêm dữ liệu vào bảng Shipping
INSERT INTO Shipping (OrderId, ShippingAddress, ShippingDate, DeliveryStatus) VALUES
(1, '123 Main St', GETDATE(), 'In Transit'),
(2, '456 Oak Ave', GETDATE(), 'Delivered');

-- Thêm dữ liệu vào bảng AuditLog
INSERT INTO AuditLog (UserId, Action, Timestamp, Details) VALUES
(1, 'Login', GETDATE(), 'Admin logged in'),
(2, 'Order Created', GETDATE(), 'Customer created order 1');
