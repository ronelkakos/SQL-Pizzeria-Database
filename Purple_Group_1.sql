-- ITCS-1170-O1650 --
-- Group Purple --
-- Ronel Kakos, Tariq Jabbar, Zachary Huey, David Jovoski --

-- Four Corners Pizzeria --
use master
go
drop database GroupPurple;
go
--Creating the database--
create database GroupPurple;
go
--Loading the database--
use GroupPurple;
go


create table Employee (
    EmployeeID			 int          identity(1000,1),
	FirstName			 char(15)	  Not Null,
	LastName		     char(15)	  Not Null,
    HireDate			 date		  Not Null,
    TerminationDate      date		  Not Null,
    SSN					 char(10)     Not Null,
    DOB					 date		  Not Null,
    DriverLicense        char(10)     Not Null,
    --constraints
    --primary key
    constraint Employee_EmployeeID_pk primary key(EmployeeID),
    --Unique
	constraint Employee_ssn_uk unique(SSN),
    constraint Employee_drivlic_uk unique(DriverLicense)
);
go
--populating Employee table
SET IDENTITY_INSERT Employee ON;
INSERT into Employee
	(EmployeeID, FirstName, LastName, HireDate, TerminationDate, SSN, DOB, DriverLicense)
	VALUES
	(1001, 'Jackson', 'Smith', '05-15-2023', null, '782-89-0067', '06-15-2001', 'DK139080'),
	(1002, 'Sammy', 'Kahn', '07-22-2023', null, '465-23-3020', '03-28-1998', 'DK231659'),
	(1003, 'Michael', 'Johnson', '11-25-2022', '06-20-2023', '782-89-0067', '06-15-2001', 'DL604387'),
	(1004, 'Jameson', 'Williams', '01-20-2023', null, '456-78-0123', '08-19-2002', 'DK100233'),
	(1005, 'Angie', 'Garcia', '08-15-2022', null, '239-37-9889', '08-24-1999', 'DK090867'),
	(1006, 'David', 'Carter', '05-20-2023', null, '459-03-0098', '02-09-2000', 'DL345643'),
	(1007, 'Daniel', 'Adams', '08-15-2022', '08-01-2023', '923-89-0034', '02-13-1998', 'GF290465'),
	(1008, 'Ava', 'Earhart', '03-15-2022', null, '345-09-7878', '02-13-2003', 'GF348764'),
	(1009, 'Olivia', 'Campbell', '04-01-2023', null, '896-45-9076', '04-09-2000', 'DK097890'),
	(1010, 'Jack', 'Jones', '12-05-2022', '09-02-2023', '456-31-9783', '05-18-1997', 'GF187465'),
	(1011, 'Martin', 'Miller', '01-01-2023', '07-01-2023', '980-32-4532', '11-24-2003', 'DL072234'),
	(1012, 'Cooper', 'Lewis', '04-15-2022', '12-10-2022', '722-45-0055', '10-31-1995', 'DK109801'),
	(1013, 'Jo', 'Collins', '01-08-2023', null, '345-77-2343', '09-29-1999', 'DK145376'),
	(1014, 'Sophie', 'Lee', '02-01-2022', '05-01-2023', '344-66-8733', '01-23-2004', 'DK147851'),
	(1015, 'Josh', 'Allen', '11-20-2022', '09-28-2023', '221-54-7790', '12-28-2000', 'DK950132');
SET IDENTITY_INSERT Employee OFF;

create table Customer (
    CustomerID    int          identity(3000,1),
    FirstName     char(15)     Not Null,
    LastName      char(15)     Not Null,
    Address       char(25)     Not Null,
    City          char(20)     Not Null,
    State         char(2)      Not Null     default 'MI',
    Zip           char(10)     Not Null,
    Phone         char(10)     Not Null		default 'No Phone', 
    Email         varchar(25)  Not Null		default 'No Email',
    --constraints
    --primary key
    constraint Customer_CustomerID_pk primary key(CustomerID),
);
go
--populating Customer table
SET IDENTITY_INSERT Customer ON;
INSERT into Customer
	(CustomerID, FirstName, LastName, Address, City, State, Zip, Phone, Email)
	VALUES
	(3001, 'John', 'Michaels', '33752 Clifton Dr', 'Sterling Heights', 'MI', '48311', '586-481-2149', 'No Email'),
	(3002, 'Buno', 'Harris', '924 Lone Pine Rd', 'Bloomfield Twp', 'MI', '48302', '592-974-1543', 'johnm78@yahoo.com'),
	(3003, 'Douglas', 'McRoberts', '3731 Koper Dr', 'Sterling Heights', 'MI', '48310', '581-265-8512', 'mcbob1946@gmail.com'),
	(3004, 'Jenny', 'Leibowitz', '18274 Malyn Blvd', 'Fraser', 'MI', '48026', '248-952-3353', 'J3nnyw1tz@gmail.com'),
	(3005, 'Keith', 'Richardson', '17852 Charlevoix Ave', 'Grosse Pointe', 'MI', '48231', 'No Phone', 'rich@keithm.net'),
	(3006, 'Faysal', 'Chowdhury', '14500 Prospect St', 'Dearborn', 'MI', '48123', '581-265-8512', 'No Email'),
	(3007, 'Angelica', 'Lopez', '654 N Barnard St', 'Howell', 'MI', '48845', '324-591-2491', 'angelclopez@outlook.com'),
	(3008, 'Brian', 'Jones', '3712 Kern Rd', 'Lake Orion', 'MI', '48357', '352-657-6285', 'jones52brian@yahoo.com'),
	(3009, 'Wayne', 'Washington', '1612 Traver St', 'Ann Arbor', 'MI', '48102', '485-482-5711', 'jones52brian@yahoo.com'),
	(3010, 'Gerardo', 'Lopez', '654 N Barnard St', 'Howell', 'MI', '48845', '324-591-2491', 'lgerardo@aol.com');
SET IDENTITY_INSERT Customer OFF;

create table Orders (
    OrderID			int          identity(2000,1),
    OrderDate		date		 Not Null,
    OrderTime		datetime2    Not Null,
    PaymentType		char(10)     Not Null,
    EmployeeID		int			 Not Null,
    CustomerID		int			 Not Null,
    --constraints
    --primary key
    constraint Order_OrderID_pk primary key(OrderID),
    --foreign key
    constraint Order_EmployeeID_fk foreign key(EmployeeID) references Employee(EmployeeID)
        on update cascade
        on delete no action,
	constraint Order_CustomerID_fk foreign key(CustomerID) references Customer(CustomerID)
        on update cascade
        on delete no action
);
go
--populating Orders table
SET IDENTITY_INSERT Orders ON;
INSERT into Orders
	(OrderID, OrderDate, OrderTime, PaymentType, EmployeeID, CustomerID)
	VALUES
	(2001, '2023-09-15', '2023-09-15 08:47:15', 'Cash', 1010, 3007),
	(2002, '2018-07-25', '2018-07-25 19:15:58', 'Credit', 1002, 3004),
	(2003, '2018-07-30', '2018-07-30 12:52:34', 'Debit', 1005, 3004),
	(2004, '2018-07-25', '2018-07-25 19:20:46', 'Cash', 1005, 3002),
	(2005, '2023-05-04', '2023-05-04 19:15:58', 'Credit', 1002, 3004),
	(2006, '2022-02-14', '2022-02-14 15:47:32', 'Debit', 1002, 3010),
	(2007, '2019-11-03', '2019-11-03 16:17:13', 'Credit', 1015, 3001),
	(2008, '2019-10-14', '2019-10-14 20:05:42', 'Debit', 1008, 3002),
	(2009, '2022-04-06', '2022-04-06 09:42:00', 'Credit', 1007, 3004),
	(2010, '2022-12-23', '2022-12-23 11:27:49', 'Credit', 1004, 3010),
	(2011, '2020-10-28', '2020-10-28 10:33:48', 'Cash', 1015, 3006),
	(2012, '2023-09-12', '2023-09-12 14:00:53', 'Debit', 1001, 3002),
	(2013, '2022-01-01', '2022-01-01 17:05:02', 'Debit', 1003, 3009),
	(2014, '2023-06-11', '2023-06-11 10:37:35', 'Cash', 1011, 3010),
	(2015, '2021-05-24', '2021-05-24 21:35:41', 'Debit', 1002, 3002);
SET IDENTITY_INSERT Orders OFF;

create table Orders_Pizza (
    OrderID        int,
    PizzaID        int,
	MenuID	       int,
	Quantity	   int			    not null,
    --constraints
    --primary key
    constraint OrdersPizza_OrdersPizzaID_pk primary key(OrderID, PizzaID, MenuID),
    --foreign keys
    constraint OrdersPizza_OrderID_fk foreign key (OrderID) references Orders(OrderID)
        on update cascade
        on delete no action,
    --constraint OrdersPizza_PizzaID_fk foreign key (PizzaID) references Pizza(PizzaID)
     --   on update cascade
      --  on delete no action,
	--constraint orderspizza_MenuID_fk foreign key (MenuID) references Menu(MenuID)
    --    on update cascade
     --   on delete no action
);
go
--populating Orders_Pizza table
INSERT into Orders_Pizza
	(OrderID, MenuID, Quantity)
	VALUES
	(2001, 4001, 2),
	(2002, 4002, 1),
	(2003, 4003, 1),
	(2004, 4004, 3),
	(2005, 4005, 1),
	(2006, 4006, 2),
	(2007, 4007, 5),
	(2008, 4008, 2),
	(2009, 4009, 1),
	(2010, 4010, 4),
	(2011, 4011, 1),
	(2012, 4012, 1),
	(2013, 4013, 3),
	(2014, 4014, 2),
	(2015, 4015, 1);


--Ronel K second page edit--

create table Menu (
    MenuID              int           identity(4000, 1),
    Name                char(25)      Not Null,
    Description         char(30)      Not Null,
    Calories            decimal(6,2)  Not Null,
    Price               decimal(5,2)  Not Null,
    FoodSize            char(1)       Not Null default 'S'
    --constraints
	--primary key
    constraint Menu_MenuID_pk primary key(MenuID)
);
go
--populating Menu table
INSERT into Menu
	(MenuID, Name, Description, Calories, Price, FoodSize)
	VALUES
	---ADD VALUES---
	(4001, 'Pepperoni Pizza', 'Thin Style', 2050, 12.99, 'S'),
	(4002, 'Pepperoni Pizza', 'Stuffed Style', 2750, 14.99, 'S'),
	(4003, 'Pepperoni Pizza', 'Deep Dish Style', 2550, 16.99, 'S'),
	(4004, 'Veggie Pizza', 'Thin Style', 1760, 11.99, 'S'),
	(4005, 'Veggie Pizza', 'Stuffed Style', 2430, 13.99, 'S'),
	(4006, 'Veggie Pizza', 'Deep Dish Style', 2150, 15.99, 'S'),
	(4007, 'Cheese Pizza', 'Thin Style', 2380, 11.99, 'S'),
	(4008, 'Cheese Pizza', 'Stuffed Style', 2835, 13.99, 'S'),
	(4009, 'Cheese Pizza', 'Deep Dish Style', 2600, 15.99, 'S'),
	(4010, 'Extra Cheese Pizza', 'Thin Style', 2475, 13.99, 'S'),
	(4011, 'Extra Cheese Pizza', 'Stuffed Style', 3125, 15.99, 'S'),
	(4012, 'Extra Cheese Pizza', 'Deep Dish Style', 2750, 17.99, 'S'),
	(4013, 'All Meat Pizza', 'Thin Style', 2660, 16.99, 'S'),
	(4014, 'All Meat Pizza', 'Stuffed Style', 3050, 18.99, 'S'), 
	(4015, 'All Meat Pizza', 'Deep Dish Style', 2830, 20.99, 'S');

create table Order_Promotion (
    OrderID             int           Not Null,
    PromotionID         int           Not Null,
    --constraints
	--primary key
    constraint Order_Promotion_PK primary key(OrderID, PromotionID),
    --foreign key
    constraint Order_Promotion_OrderID_FK foreign key(OrderID) references Orders(OrderID),
    --constraint Order_Promotion_PromotionID_FK foreign key(PromotionID) references Promotion(PromotionID)
);
go
--populating Order_Promotion table
INSERT into Order_Promotion
	(OrderID, PromotionID)
	VALUES
	(2001, 6009),
	(2002, 6004),
	(2005, 6005),
	(2006, 6006),
	(2007, 6010),
	(2008, 6003),
	(2010, 6007),
	(2011, 6003),
	(2013, 6002),
	(2014, 6004),
	(2015, 6009);

create table Order_Delivery (
    OrderID             int           identity(2000, 1),
    DeliveryID          int           Not Null,
    OrderMethod         char(10)      Not Null, -- "In-Store", "Phone", or "Online"
    OrderType           char(8)       Not Null, -- "Pickup" or "Delivery"
    --PaymentMethod       char(6)       Not Null, -- Cash, Debit, or Credit (Not Really Necessary, is already in order table)
    --constraints
	--primary key
    constraint Order_Delivery_PK primary key(OrderID),
    --foreign key
    --constraint Order_Delivery_DeliveryID_FK foreign key(DeliveryID) references Delivery(DeliveryID)
);
go
--populating Order_Delivery table
INSERT into Order_Delivery
	(OrderID, DeliveryID, OrderMethod, OrderType)
	VALUES
	(2001, 5001, 'In-Store', 'Delivery'),
	(2002, 5002, 'In-Store', 'Delivery'),
	(2003, 5003, 'In-Store', 'Delivery'),
	(2004, 5004, 'Online', 'Pickup'),
	(2005, 5005, 'In-Store', 'Pickup'),
	(2006, 5006, 'Phone', 'Delivery'),
	(2007, 5007, 'In-Store', 'Pickup'),
	(2008, 5008, 'Phone', 'Pickup'),
	(2009, 5009, 'In-Store', 'Delivery'),
	(2010, 5010, 'In-Store', 'Pickup'),
	(2011, 5011, 'In-Store', 'Pickup'),
	(2012, 5012, 'In-Store', 'Delivery'),
	(2013, 5013, 'Online', 'Delivery'),
	(2014, 5014, 'In-Store', 'Pickup'),
	(2015, 5015, 'Online', 'Pickup');


create table Delivery (
    DeliveryID          int           identity(5000, 1),
    DeliveryDate        date          Not Null,
    DeliveryTime        datetime2     Not Null,
    DelivererID         int           Not Null, -- Another employee may deliver the order
    --constraints
	--primary key
    constraint Delivery_DeliveryID_pk primary key(DeliveryID)
);
go
--populating Delivery table
INSERT into Delivery 
	(DeliveryID, DeliveryDate, DeliveryTime, DelivererID)
	VALUES
	(5001, '2023-09-15', '2023-09-15 09:22:47', 1010),
	(5002, '2018-07-25', '2018-07-25 19:42:05', 1004), 
	(5003, '2018-07-30', '2018-07-30 13:14:28', 1005),
	(5004, '2018-07-25', '2018-07-25 19:32:01', 1005),
	(5005, '2023-05-04', '2023-05-04 19:28:14', 1002), 
	(5006, '2022-02-14', '2022-02-14 16:22:35', 1007),
	(5007, '2019-11-03', '2019-11-03 16:43:58', 1015), 
	(5008, '2019-10-14', '2019-10-14 20:19:09', 1008),
	(5009, '2022-04-06', '2022-04-06 10:18:43', 1014), 
	(5010, '2022-12-23', '2022-12-23 11:43:25', 1004), 
	(5011, '2020-10-28', '2020-10-28 10:59:46', 1003),
	(5012, '2023-09-12', '2023-09-12 14:41:22', 1001),
	(5013, '2022-01-01', '2022-01-01 17:48:18', 1006),
	(5014, '2023-06-11', '2023-06-11 10:53:15', 1011),
	(5015, '2021-05-24', '2021-05-24 22:04:07', 1002);

create table Promotion (
    PromotionID         int           identity(6000, 1),
    PromotionName       char(25)      Not Null,
    Discount            decimal(2,1)  Not Null,
    --constraints
	--primary key
    constraint Promotion_PromotionID_pk primary key(PromotionID)
);
go
--populating Promotion table
INSERT into Promotion
	(PromotionID, PromotionName, Discount)
	VALUES
	(6001, 'Valentines Day', 0.25),
	(6002, 'New Years Day', 0.05),
	(6003, 'Breast Cancer Awareness', 0.15),
	(6004, 'Buy 1, Get 1 Free', 0.5),
	(6005, 'Buy 2, Get 1 Free', 0.33),
	(6006, 'Valentines Day', 0.15),
	(6007, 'Happy Holidays', 0.1),
	(6008, '50% Off Discount', 0.5),
	(6009, '20% Off MCC Discount', 0.2),
	(6010, '25% Off Veteran Discount', 0.25);