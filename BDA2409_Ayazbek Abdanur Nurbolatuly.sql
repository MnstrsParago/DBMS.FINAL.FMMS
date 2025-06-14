-- I. Database Implementation
CREATE TABLE Vendors (
    VendorID SERIAL PRIMARY KEY,
    VendorName VARCHAR(100) NOT NULL,
    ContactDetails VARCHAR(255),
    ProductCategory VARCHAR(100),
    StallLocation VARCHAR(50)
);

CREATE TABLE Products (
    ProductID SERIAL PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(100),
    Price DECIMAL(10, 2) NOT NULL,
    QuantityAvailable INT CHECK (QuantityAvailable >= 0),
    VendorID INT,
    FOREIGN KEY (VendorID) REFERENCES Vendors(VendorID) ON DELETE CASCADE
);

ALTER TABLE Products
ALTER COLUMN QuantityAvailable SET DEFAULT 0;

CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    ContactDetails VARCHAR(255)
);

ALTER TABLE Customers
ADD CONSTRAINT Unique_CustomerContact UNIQUE (ContactDetails);

CREATE TABLE Sales (
    SaleID SERIAL PRIMARY KEY,
    VendorID INT,
    ProductID INT,
    CustomerID INT,
    QuantitySold INT CHECK (QuantitySold > 0),
    SaleDate DATE DEFAULT CURRENT_DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (VendorID) REFERENCES Vendors(VendorID) ON DELETE SET NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE SET NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE SET NULL
);

ALTER TABLE Sales
ADD CONSTRAINT Check_TotalAmount CHECK (TotalAmount >= 0);

CREATE TABLE Feedback (
    FeedbackID SERIAL PRIMARY KEY,
    CustomerID INT,
    VendorID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    FeedbackDate DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE,
    FOREIGN KEY (VendorID) REFERENCES Vendors(VendorID) ON DELETE CASCADE
);

ALTER TABLE Feedback
ADD CONSTRAINT Unique_FeedbackEntry UNIQUE (CustomerID, VendorID);

-- II. Data Population
insert into Vendors (VendorID, VendorName, ContactDetails, ProductCategory, StallLocation) values (1, 'Mason', 'mbirney0@reddit.com', 'Crafts', '12273 Luster Center');
insert into Vendors (VendorID, VendorName, ContactDetails, ProductCategory, StallLocation) values (2, 'Jamison', 'jmccolgan1@slideshare.net', 'Bakery', '991 Riverside Place');
insert into Vendors (VendorID, VendorName, ContactDetails, ProductCategory, StallLocation) values (3, 'Scot', 'slitt2@printfriendly.com', 'Vegetables', '4603 Golf Course Lane');
insert into Vendors (VendorID, VendorName, ContactDetails, ProductCategory, StallLocation) values (4, 'Myrtle', 'monion3@tmall.com', 'Vegetables', '481 Graedel Terrace');
insert into Vendors (VendorID, VendorName, ContactDetails, ProductCategory, StallLocation) values (5, 'Barnie', 'bching4@foxnews.com', 'Fruits', '2521 Shasta Parkway');
insert into Vendors (VendorID, VendorName, ContactDetails, ProductCategory, StallLocation) values (6, 'Fiorenze', 'fgritten5@nifty.com', 'Meat', '4 Riverside Center');
insert into Vendors (VendorID, VendorName, ContactDetails, ProductCategory, StallLocation) values (7, 'Kliment', 'kfearn6@washingtonpost.com', 'Honey', '6 Briar Crest Road');
insert into Vendors (VendorID, VendorName, ContactDetails, ProductCategory, StallLocation) values (8, 'Vin', 'vjobbins7@disqus.com', 'Eggs', '9 High Crossing Parkway');
insert into Vendors (VendorID, VendorName, ContactDetails, ProductCategory, StallLocation) values (9, 'Ynez', 'ypenwright8@fema.gov', 'Bakery', '58266 South Circle');
insert into Vendors (VendorID, VendorName, ContactDetails, ProductCategory, StallLocation) values (10, 'Gearalt', 'gwadsworth9@g.co', 'Herbs', '5 Pepper Wood Place');
insert into Vendors (VendorID, VendorName, ContactDetails, ProductCategory, StallLocation) values (11, 'Ashia', 'aolleya@vinaora.com', 'Dairy', '91844 Continental Court');
insert into Vendors (VendorID, VendorName, ContactDetails, ProductCategory, StallLocation) values (12, 'Freddy', 'fnadinb@engadget.com', 'Dairy', '4 Gale Plaza');
insert into Vendors (VendorID, VendorName, ContactDetails, ProductCategory, StallLocation) values (13, 'Far', 'fcolesonc@flickr.com', 'Meat', '503 Chinook Alley');
insert into Vendors (VendorID, VendorName, ContactDetails, ProductCategory, StallLocation) values (14, 'Sam', 'smcmanamend@technorati.com', 'Bakery', '0223 Briar Crest Park');
insert into Vendors (VendorID, VendorName, ContactDetails, ProductCategory, StallLocation) values (15, 'Tiphani', 'trapseye@shop-pro.jp', 'Flowers', '32 Muir Park');
insert into Vendors (VendorID, VendorName, ContactDetails, ProductCategory, StallLocation) values (16, 'Philippa', 'pwinspearef@hexun.com', 'Crafts', '5 Dennis Plaza');
insert into Vendors (VendorID, VendorName, ContactDetails, ProductCategory, StallLocation) values (17, 'Barbette', 'bbarnishg@youku.com', 'Meat', '7 Carey Way');
insert into Vendors (VendorID, VendorName, ContactDetails, ProductCategory, StallLocation) values (18, 'Lee', 'lhuddlestoneh@meetup.com', 'Herbs', '0110 Red Cloud Crossing');
insert into Vendors (VendorID, VendorName, ContactDetails, ProductCategory, StallLocation) values (19, 'Evita', 'eohagertyi@friendfeed.com', 'Honey', '940 Kenwood Plaza');
insert into Vendors (VendorID, VendorName, ContactDetails, ProductCategory, StallLocation) values (20, 'Bennett', 'bmcvityj@mail.ru', 'Vegetables', '3472 Thierer Plaza');
insert into Vendors (VendorID, VendorName, ContactDetails, ProductCategory, StallLocation) values (21, 'Anestassia', 'aterrazzok@jiathis.com', 'Dairy', '335 Fulton Drive');
insert into Vendors (VendorID, VendorName, ContactDetails, ProductCategory, StallLocation) values (22, 'Aurelea', 'atodarellol@addthis.com', 'Meat', '29 Brown Court');
insert into Vendors (VendorID, VendorName, ContactDetails, ProductCategory, StallLocation) values (23, 'Germayne', 'gprattym@sun.com', 'Vegetables', '13 Columbus Parkway');
insert into Vendors (VendorID, VendorName, ContactDetails, ProductCategory, StallLocation) values (24, 'Barbe', 'bwillingalen@telegraph.co.uk', 'Honey', '3 Laurel Alley');
insert into Vendors (VendorID, VendorName, ContactDetails, ProductCategory, StallLocation) values (25, 'Margalo', 'mrozziero@de.vu', 'Meat', '48 Golden Leaf Alley');
insert into Vendors (VendorID, VendorName, ContactDetails, ProductCategory, StallLocation) values (26, 'Bancroft', 'bgerhtsp@blogs.com', 'Bakery', '1970 Golf Way');
insert into Vendors (VendorID, VendorName, ContactDetails, ProductCategory, StallLocation) values (27, 'Codie', 'cthorq@mozilla.org', 'Crafts', '30 Ridge Oak Plaza');
insert into Vendors (VendorID, VendorName, ContactDetails, ProductCategory, StallLocation) values (28, 'Godfree', 'gseccomber@fastcompany.com', 'Eggs', '38443 Memorial Hill');
insert into Vendors (VendorID, VendorName, ContactDetails, ProductCategory, StallLocation) values (29, 'Lind', 'llemins@slashdot.org', 'Bakery', '232 Crowley Point');
insert into Vendors (VendorID, VendorName, ContactDetails, ProductCategory, StallLocation) values (30, 'Matias', 'mdunfordt@ask.com', 'Dairy', '893 1st Lane');

insert into customers (CustomerID, CustomerName, ContactDetails) values (1, 'Georgeanna Cuttin', '94-540-6270');
insert into customers (CustomerID, CustomerName, ContactDetails) values (2, 'Olwen de Leon', '60-171-7504');
insert into customers (CustomerID, CustomerName, ContactDetails) values (3, 'Auria Bever', '20-653-9161');
insert into customers (CustomerID, CustomerName, ContactDetails) values (4, 'Carver Midgley', '16-367-6417');
insert into customers (CustomerID, CustomerName, ContactDetails) values (5, 'Vlad Flood', '74-909-2107');
insert into customers (CustomerID, CustomerName, ContactDetails) values (6, 'Johnna Calcutt', '78-859-6203');
insert into customers (CustomerID, CustomerName, ContactDetails) values (7, 'Amye Wiffill', '66-182-8339');
insert into customers (CustomerID, CustomerName, ContactDetails) values (8, 'Raviv Bennell', '85-592-2552');
insert into customers (CustomerID, CustomerName, ContactDetails) values (9, 'Brett Ingarfill', '32-918-4349');
insert into customers (CustomerID, CustomerName, ContactDetails) values (10, 'Constanta Baroche', '27-675-2792');
insert into customers (CustomerID, CustomerName, ContactDetails) values (11, 'Maximilianus Lautie', '97-738-5933');
insert into customers (CustomerID, CustomerName, ContactDetails) values (12, 'Colet Leathley', '22-810-1010');
insert into customers (CustomerID, CustomerName, ContactDetails) values (13, 'Kirstin Harlick', '85-991-5501');
insert into customers (CustomerID, CustomerName, ContactDetails) values (14, 'Bunny Gilstoun', '41-491-2615');
insert into customers (CustomerID, CustomerName, ContactDetails) values (15, 'Louise McCay', '66-592-8153');
insert into customers (CustomerID, CustomerName, ContactDetails) values (16, 'Addy Karlsson', '44-977-7864');
insert into customers (CustomerID, CustomerName, ContactDetails) values (17, 'Ruby Cunliffe', '64-764-6488');
insert into customers (CustomerID, CustomerName, ContactDetails) values (18, 'Adoree Saunders', '93-606-2199');
insert into customers (CustomerID, CustomerName, ContactDetails) values (19, 'Austen Madison', '14-697-1089');
insert into customers (CustomerID, CustomerName, ContactDetails) values (20, 'Josiah Balderstone', '06-024-7131');
insert into customers (CustomerID, CustomerName, ContactDetails) values (21, 'Tobe Winton', '94-950-7573');
insert into customers (CustomerID, CustomerName, ContactDetails) values (22, 'Woodrow Absalom', '13-795-3307');
insert into customers (CustomerID, CustomerName, ContactDetails) values (23, 'Beryle Leger', '96-610-5516');
insert into customers (CustomerID, CustomerName, ContactDetails) values (24, 'Adelheid Fridlington', '94-404-5984');
insert into customers (CustomerID, CustomerName, ContactDetails) values (25, 'Layne Stopp', '46-624-1272');
insert into customers (CustomerID, CustomerName, ContactDetails) values (26, 'Dion Spurdens', '14-286-9720');
insert into customers (CustomerID, CustomerName, ContactDetails) values (27, 'Cleon Jeannon', '68-717-7897');
insert into customers (CustomerID, CustomerName, ContactDetails) values (28, 'Marquita Richings', '79-974-0287');
insert into customers (CustomerID, CustomerName, ContactDetails) values (29, 'Wilton MacMenamy', '66-369-7899');
insert into customers (CustomerID, CustomerName, ContactDetails) values (30, 'Latashia Quinnelly', '99-481-7244');

insert into Feedback (FeedbackID, CustomerID, VendorID, Rating, Comment, FeedbackDate) values (1, 1, 1, 2, 'Great for managing market layout', '2021-04-25 18:53:52');
insert into Feedback (FeedbackID, CustomerID, VendorID, Rating, Comment, FeedbackDate) values (2, 2, 2, 4, 'Great app', '2024-04-11 21:21:50');
insert into Feedback (FeedbackID, CustomerID, VendorID, Rating, Comment, FeedbackDate) values (3, 3, 3, 2, 'Great for managing market layout', '2021-03-31 09:19:04');
insert into Feedback (FeedbackID, CustomerID, VendorID, Rating, Comment, FeedbackDate) values (4, 4, 4, 3, 'Great for tracking customer feedback', '2022-07-26 04:15:02');
insert into Feedback (FeedbackID, CustomerID, VendorID, Rating, Comment, FeedbackDate) values (5, 5, 5, 5, 'Great app', '2019-07-11 14:29:19');
insert into Feedback (FeedbackID, CustomerID, VendorID, Rating, Comment, FeedbackDate) values (6, 6, 6, 2, 'Great for organizing market events', '2021-07-13 07:33:48');
insert into Feedback (FeedbackID, CustomerID, VendorID, Rating, Comment, FeedbackDate) values (7, 7, 7, 3, 'Useful for tracking vendor performance', '2021-10-25 12:20:38');
insert into Feedback (FeedbackID, CustomerID, VendorID, Rating, Comment, FeedbackDate) values (8, 8, 8, 1, 'Great for managing multiple markets', '2020-11-22 15:48:09');
insert into Feedback (FeedbackID, CustomerID, VendorID, Rating, Comment, FeedbackDate) values (9, 9, 9, 5, 'Great for organizing market events', '2022-06-25 02:29:06');
insert into Feedback (FeedbackID, CustomerID, VendorID, Rating, Comment, FeedbackDate) values (10, 10, 10, 4, 'Needs better integration with social media', '2021-07-29 02:43:30');
insert into Feedback (FeedbackID, CustomerID, VendorID, Rating, Comment, FeedbackDate) values (11, 11, 11, 2, 'Great for tracking customer feedback', '2025-02-07 10:43:50');
insert into Feedback (FeedbackID, CustomerID, VendorID, Rating, Comment, FeedbackDate) values (12, 12, 12, 4, 'Could use better customer support', '2022-12-24 22:24:13');
insert into Feedback (FeedbackID, CustomerID, VendorID, Rating, Comment, FeedbackDate) values (13, 13, 13, 2, 'Needs more features for tracking sales', '2023-06-18 14:01:52');
insert into Feedback (FeedbackID, CustomerID, VendorID, Rating, Comment, FeedbackDate) values (14, 14, 14, 4, 'Great for managing multiple markets', '2019-07-05 23:18:03');
insert into Feedback (FeedbackID, CustomerID, VendorID, Rating, Comment, FeedbackDate) values (15, 15, 15, 5, 'Love the design and layout', '2021-08-31 07:33:54');
insert into Feedback (FeedbackID, CustomerID, VendorID, Rating, Comment, FeedbackDate) values (16, 16, 16, 4, 'Needs better support for different languages', '2019-08-11 20:43:16');
insert into Feedback (FeedbackID, CustomerID, VendorID, Rating, Comment, FeedbackDate) values (17, 17, 17, 5, 'Could use better customer support', '2020-01-09 20:50:51');
insert into Feedback (FeedbackID, CustomerID, VendorID, Rating, Comment, FeedbackDate) values (18, 18, 18, 1, 'Helpful for managing vendor applications', '2018-07-25 06:29:38');
insert into Feedback (FeedbackID, CustomerID, VendorID, Rating, Comment, FeedbackDate) values (19, 19, 19, 2, 'Great for managing multiple markets', '2023-11-17 10:07:04');
insert into Feedback (FeedbackID, CustomerID, VendorID, Rating, Comment, FeedbackDate) values (20, 20, 20, 5, 'Love the integration with payment systems', '2023-03-06 06:57:40');
insert into Feedback (FeedbackID, CustomerID, VendorID, Rating, Comment, FeedbackDate) values (21, 21, 21, 2, 'Great for managing multiple markets', '2019-12-07 10:32:55');
insert into Feedback (FeedbackID, CustomerID, VendorID, Rating, Comment, FeedbackDate) values (22, 22, 22, 4, 'Helpful for managing vendor applications', '2020-10-24 04:28:44');
insert into Feedback (FeedbackID, CustomerID, VendorID, Rating, Comment, FeedbackDate) values (23, 23, 23, 5, 'Could use more marketing tools', '2019-02-05 06:26:20');
insert into Feedback (FeedbackID, CustomerID, VendorID, Rating, Comment, FeedbackDate) values (24, 24, 24, 4, 'Love the mobile app version', '2020-11-11 16:47:22');
insert into Feedback (FeedbackID, CustomerID, VendorID, Rating, Comment, FeedbackDate) values (25, 25, 25, 4, 'Could use more analytics features', '2019-02-02 20:47:58');
insert into Feedback (FeedbackID, CustomerID, VendorID, Rating, Comment, FeedbackDate) values (26, 26, 26, 1, 'Love the scheduling features', '2021-01-10 17:46:49');
insert into Feedback (FeedbackID, CustomerID, VendorID, Rating, Comment, FeedbackDate) values (27, 27, 27, 5, 'Love the integration with payment systems', '2024-04-14 05:40:21');
insert into Feedback (FeedbackID, CustomerID, VendorID, Rating, Comment, FeedbackDate) values (28, 28, 28, 2, 'Helpful for managing inventory', '2020-05-26 10:07:22');
insert into Feedback (FeedbackID, CustomerID, VendorID, Rating, Comment, FeedbackDate) values (29, 29, 29, 3, 'Love the design and layout', '2019-12-19 21:17:49');
insert into Feedback (FeedbackID, CustomerID, VendorID, Rating, Comment, FeedbackDate) values (30, 30, 30, 1, 'Useful for tracking vendor performance', '2023-10-30 13:29:40');

insert into Products (ProductID, ProductName, Category, Price, QuantityAvailable, VendorID) values (1, 'Fresh Eggs', 'Fruits', 19.0, 1, 1);
insert into Products (ProductID, ProductName, Category, Price, QuantityAvailable, VendorID) values (2, 'Handmade Soap', 'Honey', 15.37, 9, 2);
insert into Products (ProductID, ProductName, Category, Price, QuantityAvailable, VendorID) values (3, 'Organic Apples', 'Dairy', 79.96, 7, 3);
insert into Products (ProductID, ProductName, Category, Price, QuantityAvailable, VendorID) values (4, 'Handcrafted Jewelry', 'Sauces', 20.62, 6, 4);
insert into Products (ProductID, ProductName, Category, Price, QuantityAvailable, VendorID) values (5, 'Farm-Fresh Milk', 'Baked Goods', 46.3, 13, 5);
insert into Products (ProductID, ProductName, Category, Price, QuantityAvailable, VendorID) values (6, 'Handwoven Baskets', 'Herbs', 43.22, 6, 6);
insert into Products (ProductID, ProductName, Category, Price, QuantityAvailable, VendorID) values (7, 'Homemade Jam', 'Honey', 75.43, 12, 7);
insert into Products (ProductID, ProductName, Category, Price, QuantityAvailable, VendorID) values (8, 'Artisan Bread', 'Soaps', 90.18, 13, 8);
insert into Products (ProductID, ProductName, Category, Price, QuantityAvailable, VendorID) values (9, 'Local Honey', 'Meat', 23.13, 2, 9);
insert into Products (ProductID, ProductName, Category, Price, QuantityAvailable, VendorID) values (10, 'Organic Apples', 'Fruits', 17.8, 5, 10);
insert into Products (ProductID, ProductName, Category, Price, QuantityAvailable, VendorID) values (11, 'Handwoven Baskets', 'Pickles', 81.31, 1, 11);
insert into Products (ProductID, ProductName, Category, Price, QuantityAvailable, VendorID) values (12, 'Homemade Jam', 'Dairy', 15.67, 9, 12);
insert into Products (ProductID, ProductName, Category, Price, QuantityAvailable, VendorID) values (13, 'Handwoven Baskets', 'Dairy', 26.19, 9, 13);
insert into Products (ProductID, ProductName, Category, Price, QuantityAvailable, VendorID) values (14, 'Natural Skincare Products', 'Soaps', 9.36, 12, 14);
insert into Products (ProductID, ProductName, Category, Price, QuantityAvailable, VendorID) values (15, 'Gourmet Sausages', 'Sauces', 36.45, 3, 15);
insert into Products (ProductID, ProductName, Category, Price, QuantityAvailable, VendorID) values (16, 'Herbal Tea Blends', 'Jams and Jellies', 89.25, 6, 16);
insert into Products (ProductID, ProductName, Category, Price, QuantityAvailable, VendorID) values (17, 'Fresh Eggs', 'Crafts', 95.97, 3, 17);
insert into Products (ProductID, ProductName, Category, Price, QuantityAvailable, VendorID) values (18, 'Local Honey', 'Vegetables', 21.16, 8, 18);
insert into Products (ProductID, ProductName, Category, Price, QuantityAvailable, VendorID) values (19, 'Local Honey', 'Crafts', 51.48, 15, 19);
insert into Products (ProductID, ProductName, Category, Price, QuantityAvailable, VendorID) values (20, 'Fresh Eggs', 'Honey', 42.82, 7, 20);
insert into Products (ProductID, ProductName, Category, Price, QuantityAvailable, VendorID) values (21, 'Gourmet Sausages', 'Fruits', 88.64, 7, 21);
insert into Products (ProductID, ProductName, Category, Price, QuantityAvailable, VendorID) values (22, 'Artisan Bread', 'Jams and Jellies', 24.76, 14, 22);
insert into Products (ProductID, ProductName, Category, Price, QuantityAvailable, VendorID) values (23, 'Homemade Jam', 'Eggs', 55.31, 6, 23);
insert into Products (ProductID, ProductName, Category, Price, QuantityAvailable, VendorID) values (24, 'Handcrafted Jewelry', 'Eggs', 25.15, 12, 24);
insert into Products (ProductID, ProductName, Category, Price, QuantityAvailable, VendorID) values (25, 'Natural Skincare Products', 'Sauces', 97.99, 12, 25);
insert into Products (ProductID, ProductName, Category, Price, QuantityAvailable, VendorID) values (26, 'Hand-poured Candles', 'Eggs', 11.44, 6, 26);
insert into Products (ProductID, ProductName, Category, Price, QuantityAvailable, VendorID) values (27, 'Fresh Eggs', 'Pickles', 7.71, 6, 27);
insert into Products (ProductID, ProductName, Category, Price, QuantityAvailable, VendorID) values (28, 'Handwoven Baskets', 'Crafts', 14.29, 12, 28);
insert into Products (ProductID, ProductName, Category, Price, QuantityAvailable, VendorID) values (29, 'Fresh Eggs', 'Dairy', 40.23, 15, 29);
insert into Products (ProductID, ProductName, Category, Price, QuantityAvailable, VendorID) values (30, 'Farmhouse Cheese', 'Soaps', 81.24, 5, 30);

insert into Sales (SaleID, VendorID, ProductID, CustomerID, QuantitySold, SaleDate, TotalAmount) values (1, 1, 1, 1, 15, '2023-06-22 09:52:41', 47.87);
insert into Sales (SaleID, VendorID, ProductID, CustomerID, QuantitySold, SaleDate, TotalAmount) values (2, 2, 2, 2, 7, '2023-09-30 21:38:26', 18.22);
insert into Sales (SaleID, VendorID, ProductID, CustomerID, QuantitySold, SaleDate, TotalAmount) values (3, 3, 3, 3, 3, '2023-03-20 09:27:17', 44.5);
insert into Sales (SaleID, VendorID, ProductID, CustomerID, QuantitySold, SaleDate, TotalAmount) values (4, 4, 4, 4, 6, '2023-03-12 07:01:54', 31.09);
insert into Sales (SaleID, VendorID, ProductID, CustomerID, QuantitySold, SaleDate, TotalAmount) values (5, 5, 5, 5, 8, '2022-02-21 03:46:56', 13.33);
insert into Sales (SaleID, VendorID, ProductID, CustomerID, QuantitySold, SaleDate, TotalAmount) values (6, 6, 6, 6, 2, '2024-12-24 06:04:22', 6.47);
insert into Sales (SaleID, VendorID, ProductID, CustomerID, QuantitySold, SaleDate, TotalAmount) values (7, 7, 7, 7, 6, '2022-01-13 08:56:07', 21.31);
insert into Sales (SaleID, VendorID, ProductID, CustomerID, QuantitySold, SaleDate, TotalAmount) values (8, 8, 8, 8, 13, '2024-08-23 11:37:03', 8.37);
insert into Sales (SaleID, VendorID, ProductID, CustomerID, QuantitySold, SaleDate, TotalAmount) values (9, 9, 9, 9, 5, '2024-12-01 19:10:15', 43.35);
insert into Sales (SaleID, VendorID, ProductID, CustomerID, QuantitySold, SaleDate, TotalAmount) values (10, 10, 10, 10, 15, '2023-02-08 06:00:38', 33.28);
insert into Sales (SaleID, VendorID, ProductID, CustomerID, QuantitySold, SaleDate, TotalAmount) values (11, 11, 11, 11, 7, '2023-01-31 06:10:17', 35.9);
insert into Sales (SaleID, VendorID, ProductID, CustomerID, QuantitySold, SaleDate, TotalAmount) values (12, 12, 12, 12, 15, '2023-04-10 00:29:49', 5.29);
insert into Sales (SaleID, VendorID, ProductID, CustomerID, QuantitySold, SaleDate, TotalAmount) values (13, 13, 13, 13, 3, '2024-09-13 15:44:12', 3.52);
insert into Sales (SaleID, VendorID, ProductID, CustomerID, QuantitySold, SaleDate, TotalAmount) values (14, 14, 14, 14, 6, '2023-06-26 20:37:18', 21.2);
insert into Sales (SaleID, VendorID, ProductID, CustomerID, QuantitySold, SaleDate, TotalAmount) values (15, 15, 15, 15, 8, '2023-07-20 11:47:47', 8.42);
insert into Sales (SaleID, VendorID, ProductID, CustomerID, QuantitySold, SaleDate, TotalAmount) values (16, 16, 16, 16, 7, '2023-11-28 09:06:12', 30.97);
insert into Sales (SaleID, VendorID, ProductID, CustomerID, QuantitySold, SaleDate, TotalAmount) values (17, 17, 17, 17, 8, '2023-01-11 08:13:12', 32.94);
insert into Sales (SaleID, VendorID, ProductID, CustomerID, QuantitySold, SaleDate, TotalAmount) values (18, 18, 18, 18, 14, '2024-12-03 18:11:53', 14.51);
insert into Sales (SaleID, VendorID, ProductID, CustomerID, QuantitySold, SaleDate, TotalAmount) values (19, 19, 19, 19, 4, '2023-07-20 06:27:30', 43.74);
insert into Sales (SaleID, VendorID, ProductID, CustomerID, QuantitySold, SaleDate, TotalAmount) values (20, 20, 20, 20, 3, '2023-09-07 11:30:54', 15.11);
insert into Sales (SaleID, VendorID, ProductID, CustomerID, QuantitySold, SaleDate, TotalAmount) values (21, 21, 21, 21, 11, '2023-09-05 06:32:48', 14.01);
insert into Sales (SaleID, VendorID, ProductID, CustomerID, QuantitySold, SaleDate, TotalAmount) values (22, 22, 22, 22, 6, '2022-01-04 12:36:30', 42.25);
insert into Sales (SaleID, VendorID, ProductID, CustomerID, QuantitySold, SaleDate, TotalAmount) values (23, 23, 23, 23, 1, '2024-05-23 22:17:50', 50.02);
insert into Sales (SaleID, VendorID, ProductID, CustomerID, QuantitySold, SaleDate, TotalAmount) values (24, 24, 24, 24, 1, '2025-01-05 15:09:00', 15.34);
insert into Sales (SaleID, VendorID, ProductID, CustomerID, QuantitySold, SaleDate, TotalAmount) values (25, 25, 25, 25, 12, '2023-09-22 00:49:14', 6.58);
insert into Sales (SaleID, VendorID, ProductID, CustomerID, QuantitySold, SaleDate, TotalAmount) values (26, 26, 26, 26, 14, '2024-10-30 05:39:15', 24.75);
insert into Sales (SaleID, VendorID, ProductID, CustomerID, QuantitySold, SaleDate, TotalAmount) values (27, 27, 27, 27, 13, '2022-08-14 06:38:20', 11.47);
insert into Sales (SaleID, VendorID, ProductID, CustomerID, QuantitySold, SaleDate, TotalAmount) values (28, 28, 28, 28, 1, '2022-01-31 21:58:19', 21.55);
insert into Sales (SaleID, VendorID, ProductID, CustomerID, QuantitySold, SaleDate, TotalAmount) values (29, 29, 29, 29, 2, '2024-01-07 16:20:17', 35.06);
insert into Sales (SaleID, VendorID, ProductID, CustomerID, QuantitySold, SaleDate, TotalAmount) values (30, 30, 30, 30, 8, '2022-11-27 11:11:39', 43.36);

-- III. Data Querying & Manipulation 
-- WHERE filtration
SELECT * FROM Vendors WHERE StallLocation = '12273 Luster Center';
SELECT * FROM Products WHERE Price < 20;
SELECT * FROM Products WHERE QuantityAvailable > 10;
SELECT * FROM Vendors WHERE VendorName LIKE 'M%';
SELECT * FROM Sales WHERE SaleDate = '2023-09-22';
-- String Functions
SELECT UPPER(VendorName) AS uppercased_name FROM Vendors;
SELECT SUBSTRING(ProductName, 1, 3) AS product_code FROM Products;
SELECT REPLACE(VendorName, 'Mason', 'Jonathan') AS updated_name FROM Vendors;
SELECT ProductName, LENGTH(ProductName) AS name_length FROM Products;
SELECT CONCAT(VendorName, ' - ', StallLocation) AS vendor_location FROM Vendors;
-- Date Fucntions
SELECT SaleDate, EXTRACT(YEAR FROM SaleDate) AS sale_year FROM Sales;
SELECT SaleDate, CURRENT_DATE - SaleDate AS days_since_sale FROM Sales;
SELECT SaleDate, TO_CHAR(SaleDate, 'DD-Month-YYYY') AS formatted_date FROM Sales;
SELECT SaleDate, TO_CHAR(SaleDate, 'Month') AS sale_month FROM Sales;
SELECT SaleDate, SaleDate + INTERVAL '7 days' AS next_week FROM Sales;
-- Data Modification
UPDATE Products SET Price = 4.0 WHERE ProductID = 2;
UPDATE Products SET QuantityAvailable = QuantityAvailable + 50 WHERE ProductID = 3;
UPDATE Products SET QuantityAvailable = 0 WHERE ProductID = 4;
UPDATE Vendors SET ContactDetails = '987-654-3210' WHERE VendorID = 1;
UPDATE Sales SET QuantitySold = 15, TotalAmount = 45.0 WHERE SaleID = 5;
-- Data Deletion
DELETE FROM Products WHERE ProductID = 5;
DELETE FROM Vendors WHERE VendorID = 3;
DELETE FROM Sales WHERE ProductID = 2;
DELETE FROM products WHERE price_per_unit < 5;
DELETE FROM Vendors WHERE StallLocation = 'Old Town';

-- IV. SQL JOINs & Data Retrieval 
-- Full Join
SELECT v.VendorName, p.ProductName, p.Category FROM Vendors v INNER JOIN Products p ON v.VendorID = p.VendorID;
SELECT p.ProductName, s.QuantitySold, s.TotalAmount, s.SaleDate FROM Products p INNER JOIN Sales s ON p.ProductID = s.ProductID;
SELECT v.VendorName, p.ProductName, s.QuantitySold, s.TotalAmount FROM Vendors v FULL JOIN Products p ON v.VendorID = p.VendorID FULL JOIN Sales s ON p.ProductID = s.ProductID;
-- Left Join
SELECT v.VendorName, p.ProductName, p.Category FROM Vendors v LEFT JOIN Products p ON v.VendorID = p.VendorID;
SELECT p.ProductName, s.QuantitySold, s.TotalAmount, s.SaleDate FROM Products p LEFT JOIN Sales s ON p.ProductID = s.ProductID;
SELECT v.VendorName, p.ProductName, s.QuantitySold, s.TotalAmount FROM Vendors v LEFT JOIN Products p ON v.VendorID = p.VendorID LEFT JOIN Sales s ON p.ProductID = s.ProductID;
-- Right Join
SELECT p.ProductName, v.VendorName FROM Products p RIGHT JOIN Vendors v ON p.VendorID = v.VendorID;
SELECT s.SaleDate, s.QuantitySold, p.ProductName FROM Sales s RIGHT JOIN Products p ON s.ProductID = p.ProductID;
SELECT s.SaleDate, s.QuantitySold, v.VendorName FROM Sales s RIGHT JOIN Products p ON s.ProductID = p.ProductID RIGHT JOIN Vendors v ON p.VendorID = v.VendorID;
-- Cross Join
SELECT v.VendorName, p.ProductName FROM Vendors v CROSS JOIN Products p;
SELECT p.ProductName, c.CustomerName FROM Products p CROSS JOIN Customers c;
SELECT v.VendorName, c.CustomerName FROM Vendors v CROSS JOIN Customers c;
-- Natural Join
SELECT p.ProductName, v.VendorName FROM Products p NATURAL JOIN Vendors v;
SELECT s.SaleDate, s.QuantitySold, p.ProductName FROM Sales s NATURAL JOIN Products p;
SELECT v.VendorName, p.ProductName, s.SaleDate, s.QuantitySold FROM Vendors v NATURAL JOIN Products p NATURAL JOIN Sales s;
-- Self Join
SELECT v1.VendorName AS Vendor1, v2.VendorName AS Vendor2, v1.StallLocation FROM Vendors v1 JOIN Vendors v2 ON v1.StallLocation = v2.StallLocation WHERE v1.VendorID < v2.VendorID;
SELECT p1.ProductName AS Product1, p2.ProductName AS Product2, p1.Category FROM Products p1 JOIN Products p2 ON p1.Category = p2.Category WHERE p1.ProductID < p2.ProductID;
SELECT c1.CustomerName AS Customer1, c2.CustomerName AS Customer2, c1.ContactDetails FROM Customers c1 JOIN Customers c2 ON c1.ContactDetails = c2.ContactDetails WHERE c1.CustomerID < c2.CustomerID;

-- V. Query Execution & Results Analysis
-- Grouping Data (GROUP BY Clause)
SELECT Category, SUM(QuantityAvailable) AS TotalStock FROM Products GROUP BY Category ORDER BY TotalStock DESC;
SELECT p.ProductName, s.SaleDate, AVG(s.QuantitySold) AS AvgQuantitySold FROM Sales s JOIN Products p ON s.ProductID = p.ProductID GROUP BY p.ProductName, s.SaleDate;
SELECT p.ProductName, SUM(s.QuantitySold) AS TotalQuantitySold FROM Sales s JOIN Products p ON s.ProductID = p.ProductID GROUP BY p.ProductName HAVING SUM(s.QuantitySold) > 20;
SELECT v.VendorName, SUM(p.QuantityAvailable) AS TotalStock FROM Vendors v JOIN Products p ON v.VendorID = p.VendorID GROUP BY v.VendorName ORDER BY TotalStock DESC;
-- Subqueries
SELECT ProductName, Price FROM Products WHERE Price > (SELECT AVG(Price) FROM Products);
SELECT VendorName FROM Vendors WHERE VendorID IN (SELECT DISTINCT VendorID FROM Products);
SELECT ProductName, Category, Price FROM Products p1 WHERE Price > (SELECT AVG(Price) FROM Products p2 WHERE p1.Category = p2.Category);
SELECT v.VendorName, v.StallLocation FROM Vendors v WHERE EXISTS (SELECT 1 FROM Products p WHERE p.VendorID = v.VendorID AND p.Category = 'Vegetables');
SELECT VendorID, TotalAmount FROM Sales WHERE TotalAmount > ALL (SELECT TotalAmount FROM Sales WHERE VendorID = 1);
SELECT VendorID, TotalAmount, SaleDate FROM Sales WHERE (VendorID, TotalAmount) = (SELECT VendorID, TotalAmount FROM Sales WHERE SaleDate = '2023-06-22' LIMIT 1);

-- VI. Advanced SQL Techniques
-- Window Functions
SELECT SaleID, VendorID, SaleDate, TotalAmount, LAG(TotalAmount) OVER (PARTITION BY VendorID ORDER BY SaleDate) AS PreviousAmount, TotalAmount - LAG(TotalAmount) OVER (PARTITION BY VendorID ORDER BY SaleDate) AS AmountDifference FROM Sales;
SELECT SaleID, TotalAmount, AVG(TotalAmount) OVER () AS AverageAmount, SUM(TotalAmount) OVER () AS TotalSales, (TotalAmount / SUM(TotalAmount) OVER ()) * 100 AS PercentageContribution FROM Sales;
SELECT SaleID, VendorID, SaleDate, TotalAmount, AVG(TotalAmount) OVER (PARTITION BY VendorID ORDER BY SaleDate ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS MovingAverage FROM Sales;
-- Advanced Grouping & Set Operations
SELECT VendorID, ProductID, SUM(TotalAmount) AS TotalSales FROM Sales GROUP BY GROUPING SETS ( (VendorID), (ProductID), (VendorID, ProductID), () );
SELECT VendorID, ProductID, COUNT(*) AS SalesCount, GROUPING(VendorID) AS VendorGrouping, GROUPING(ProductID) AS ProductGrouping FROM Sales GROUP BY GROUPING SETS ( (VendorID), (ProductID), () );
SELECT VendorID, ProductID, CustomerID, SUM(TotalAmount) AS TotalSales FROM Sales GROUP BY CUBE (VendorID, ProductID, CustomerID);
SELECT VendorID, ProductID, CustomerID, AVG(TotalAmount) AS AverageSales FROM Sales GROUP BY CUBE (VendorID, ProductID, CustomerID);
SELECT VendorID, ProductID, COUNT(*) AS SalesCount FROM Sales GROUP BY ROLLUP (VendorID, ProductID);
SELECT VendorID, SUM(TotalAmount) AS TotalSales, SUM(QuantitySold) AS TotalQuantitySold FROM Sales GROUP BY ROLLUP (VendorID);
SELECT CustomerID, CustomerName, TotalAmount FROM Sales JOIN Customers ON Sales.CustomerID = Customers.CustomerID WHERE CustomerName LIKE 'A%' INTERSECT SELECT CustomerID, CustomerName, TotalAmount FROM Sales JOIN Customers ON Sales.CustomerID = Customers.CustomerID WHERE TotalAmount < 50;