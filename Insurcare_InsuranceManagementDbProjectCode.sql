/* Version table
V1 - Table creation - Hitarth and Mithlaish
V2 - Records Insertion - Anshul 
V3 - Additional table and error debugging (Final SQL script with complete tables and records) - Anshul and Hitarth
V4 - Added all the major queries, functions and stored programs.
*/

-- Database creation
UNLOCK TABLES;
DROP database IF EXISTS InsuranceManagementDB;
CREATE database IF NOT EXISTS InsuranceManagementDB;
use InsuranceManagementDB;

-- Table creation

-- 1. Master Customer Table
DROP TABLE IF EXISTS `t_MasterCustomer`;
CREATE TABLE `t_MasterCustomer`(
	`Cust_ID` INT NOT NULL AUTO_INCREMENT,
	`FirstName` VARCHAR(100) NOT NULL,
	`LastName` VARCHAR(100) NOT NULL,
	`DOB` DATE NOT NULL,
	`Gender` ENUM('MALE','FEMALE','OTHERS') NOT NULL,
	`Nominees` VARCHAR(100),
	`Dependents` INT,
	`MaritalStatus` ENUM('SINGLE','MARRIED','DIVORCED','WIDOWED'),
	`Occupation` VARCHAR(100),
	PRIMARY KEY (`Cust_ID`)
);
-- select * from t_MasterCustomer;
-- Inserting records into t_MasterCustomer table
LOCK TABLES `t_MasterCustomer` WRITE;
INSERT INTO t_MasterCustomer (Cust_ID, FirstName, LastName, DOB, Gender, Nominees, Dependents, MaritalStatus, Occupation)
VALUES
(1, 'John', 'Doe', '1990-05-15', 'Male', 'Jane Doe', 2, 'Married', 'Engineer'),
(2, 'Alice', 'Smith', '1985-08-20', 'Female', 'Bob Smith', 1, 'Married', 'Doctor'),
(3, 'Michael', 'Johnson', '1978-12-10', 'Male', 'Mary Johnson', 3, 'Married', 'Teacher'),
(4, 'Emily', 'Brown', '1995-03-25', 'Female', 'Tom Brown', 0, 'Single', 'Artist'),
(5, 'David', 'Wilson', '1982-07-08', 'Male', 'Sara Wilson', 2, 'Married', 'Accountant'),
(6, 'Sophia', 'Martinez', '1999-11-30', 'Female', 'Chris Martinez', 0, 'Single', 'Student'),
(7, 'James', 'Taylor', '1975-09-18', 'Male', 'Linda Taylor', 1, 'Married', 'Lawyer'),
(8, 'Olivia', 'Jackson', '1989-06-12', 'Female', 'Alex Jackson', 2, 'Married', 'Manager'),
(9, 'William', 'Anderson', '1993-04-02', 'Male', 'Emma Anderson', 0, 'Single', 'Consultant'),
(10, 'Emma', 'Thomas', '1980-10-05', 'Female', 'Daniel Thomas', 2, 'Married', 'Engineer'),
(11, 'Daniel', 'Clark', '1987-09-21', 'Male', 'Jessica Clark', 1, 'Married', 'Engineer'),
(12, 'Ella', 'White', '1992-12-15', 'Female', 'Andrew White', 0, 'Single', 'Nurse'),
(13, 'Ryan', 'Harris', '1980-06-28', 'Male', 'Sophie Harris', 2, 'Married', 'Entrepreneur'),
(14, 'Ava', 'King', '1997-03-12', 'Female', 'Michael King', 0, 'Single', 'Designer'),
(15, 'Mason', 'Lee', '1973-11-07', 'Male', 'Grace Lee', 3, 'Married', 'Architect'),
(16, 'Scarlett', 'Scott', '1991-08-04', 'Female', 'Jack Scott', 1, 'Married', 'Writer'),
(17, 'Ethan', 'Green', '1984-05-18', 'Male', 'Ava Green', 2, 'Married', 'Developer'),
(18, 'Madison', 'Adams', '1990-10-30', 'Female', 'William Adams', 0, 'Single', 'Consultant'),
(19, 'Logan', 'Baker', '1988-04-03', 'Male', 'Olivia Baker', 1, 'Married', 'Manager'),
(20, 'Chloe', 'Evans', '1995-02-09', 'Female', 'Liam Evans', 0, 'Single', 'Student'),
(21, 'Elijah', 'Perez', '1982-07-23', 'Male', 'Isabella Perez', 2, 'Married', 'Lawyer'),
(22, 'Grace', 'Gonzalez', '1989-01-17', 'Female', 'Noah Gonzalez', 1, 'Married', 'Accountant'),
(23, 'Jackson', 'Hall', '1993-06-05', 'Male', 'Sophia Hall', 0, 'Single', 'Artist'),
(24, 'Nora', 'Rivera', '1976-04-28', 'Female', 'Ethan Rivera', 3, 'Married', 'Teacher'),
(25, 'Liam', 'Wright', '1986-12-02', 'Male', 'Avery Wright', 2, 'Married', 'Doctor'),
(26, 'Lily', 'Mitchell', '1998-10-14', 'Female', 'Benjamin Mitchell', 0, 'Single', 'Engineer'),
(27, 'Aiden', 'Young', '1983-08-11', 'Male', 'Charlotte Young', 1, 'Married', 'Manager'),
(28, 'Zoe', 'Lee', '1994-03-25', 'Female', 'Jackson Lee', 0, 'Single', 'Developer'),
(29, 'Lucas', 'Parker', '1979-09-08', 'Male', 'Amelia Parker', 2, 'Married', 'Consultant'),
(30, 'Hailey', 'Allen', '1981-05-31', 'Female', 'Henry Allen', 1, 'Married', 'Entrepreneur'),
(31, 'Carter', 'Roberts', '1996-02-16', 'Male', 'Mia Roberts', 0, 'Single', 'Lawyer'),
(32, 'Sophie', 'Cook', '1985-11-20', 'Female', 'Sebastian Cook', 1, 'Married', 'Artist'),
(33, 'Henry', 'Morales', '1980-07-04', 'Male', 'Emily Morales', 2, 'Married', 'Doctor'),
(34, 'Aria', 'Bailey', '1991-04-19', 'Female', 'Gabriel Bailey', 0, 'Single', 'Writer'),
(35, 'Owen', 'Reed', '1987-12-13', 'Male', 'Harper Reed', 1, 'Married', 'Accountant'),
(36, 'Emma', 'Cooper', '1993-09-27', 'Female', 'Andrew Cooper', 0, 'Single', 'Manager'),
(37, 'Wyatt', 'Ross', '1974-06-08', 'Male', 'Sophia Ross', 3, 'Married', 'Developer'),
(38, 'Avery', 'James', '1988-03-02', 'Female', 'Liam James', 1, 'Married', 'Engineer'),
(39, 'Levi', 'Morgan', '1995-01-05', 'Male', 'Olivia Morgan', 0, 'Single', 'Student'),
(40, 'Aubrey', 'Edwards', '1983-08-17', 'Female', 'Noah Edwards', 2, 'Married', 'Lawyer'),
(41, 'Gavin', 'Hill', '1989-05-11', 'Male', 'Mia Hill', 1, 'Married', 'Accountant'),
(42, 'Brooklyn', 'Barnes', '1997-02-24', 'Female', 'Liam Barnes', 0, 'Single', 'Artist'),
(43, 'Hudson', 'Coleman', '1978-10-18', 'Male', 'Emily Coleman', 2, 'Married', 'Doctor'),
(44, 'Paisley', 'Sanders', '1994-07-21', 'Female', 'Jack Sanders', 0, 'Single', 'Writer'),
(45, 'Nathan', 'Price', '1981-04-04', 'Male', 'Olivia Price', 1, 'Married', 'Manager'),
(46, 'Savannah', 'Bryant', '1992-01-08', 'Female', 'Ethan Bryant', 0, 'Single', 'Developer'),
(47, 'Eli', 'Alexander', '1977-05-12', 'Male', 'Ava Alexander', 3, 'Married', 'Engineer'),
(48, 'Audrey', 'Foster', '1990-09-26', 'Female', 'Liam Foster', 1, 'Married', 'Student'),
(49, 'Nolan', 'Simmons', '1986-06-29', 'Male', 'Harper Simmons', 2, 'Married', 'Lawyer'),
(50, 'Claire', 'Washington', '1998-03-03', 'Female', 'Noah Washington', 0, 'Single', 'Accountant');
UNLOCK TABLES;
-- Select * from t_MasterCustomer;

-- 2. Customer Address table
DROP TABLE IF EXISTS `t_CustomerAddress`;
CREATE TABLE `t_CustomerAddress`(
	`Address_ID` INT NOT NULL AUTO_INCREMENT,
    `Cust_ID` INT NOT NULL,
    `Street` VARCHAR(255) NOT NULL,
    `Apartment` VARCHAR(50),
    `City` VARCHAR(100) NOT NULL,
    `State` VARCHAR(100) NOT NULL,
    `Country` VARCHAR(100) NOT NULL,
    `ZipCode` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`Address_ID`), 
	FOREIGN KEY (`Cust_ID`) REFERENCES `t_MasterCustomer`(`Cust_ID`)
);
-- select * from t_CustomerAddress;
-- Inserting records into t_MasterCustomer table
LOCK TABLES `t_CustomerAddress` WRITE;
INSERT INTO t_CustomerAddress (Address_ID, Cust_ID, Street, Apartment, City, State, Country, ZipCode)
VALUES
(1, 1, '123 Main St', 'Apt 101', 'New York', 'NY', 'USA', '10001'),
(2, 2, '456 Elm St', 'Apt 202', 'Los Angeles', 'CA', 'USA', '90001'),
(3, 3, '789 Oak St', 'Apt 303', 'Chicago', 'IL', 'USA', '60001'),
(4, 4, '101 Pine St', 'Apt 404', 'Houston', 'TX', 'USA', '77001'),
(5, 5, '222 Maple St', 'Apt 505', 'Miami', 'FL', 'USA', '33101'),
(6, 6, '333 Cedar St', 'Apt 606', 'Boston', 'MA', 'USA', '02201'),
(7, 7, '444 Walnut St', 'Apt 707', 'San Francisco', 'CA', 'USA', '94101'),
(8, 8, '555 Birch St', 'Apt 808', 'Seattle', 'WA', 'USA', '98101'),
(9, 9, '666 Ash St', 'Apt 909', 'Dallas', 'TX', 'USA', '75201'),
(10, 10, '777 Spruce St', 'Apt 1010', 'Atlanta', 'GA', 'USA', '30301'), --
(11, 11, '124 Elm St', 'Apt 102', 'New York', 'NY', 'USA', '10002'),
(12, 12, '457 Oak St', 'Apt 203', 'Los Angeles', 'CA', 'USA', '90002'),
(13, 13, '790 Maple St', 'Apt 304', 'Chicago', 'IL', 'USA', '60002'),
(14, 14, '102 Pine St', 'Apt 405', 'Houston', 'TX', 'USA', '77002'),
(15, 15, '223 Cedar St', 'Apt 506', 'Miami', 'FL', 'USA', '33102'),
(16, 16, '334 Walnut St', 'Apt 607', 'Boston', 'MA', 'USA', '02202'),
(17, 17, '445 Birch St', 'Apt 708', 'San Francisco', 'CA', 'USA', '94102'),
(18, 18, '556 Ash St', 'Apt 809', 'Seattle', 'WA', 'USA', '98102'),
(19, 19, '667 Spruce St', 'Apt 910', 'Dallas', 'TX', 'USA', '75202'),
(20, 20, '778 Oak St', 'Apt 1011', 'Atlanta', 'GA', 'USA', '30302'),   --
(21, 21, '112 Main St', 'Apt 103', 'New York', 'NY', 'USA', '10003'),
(22, 22, '225 Elm St', 'Apt 204', 'Los Angeles', 'CA', 'USA', '90003'),
(23, 23, '338 Oak St', 'Apt 305', 'Chicago', 'IL', 'USA', '60003'),
(24, 24, '451 Maple St', 'Apt 406', 'Houston', 'TX', 'USA', '77003'),
(25, 25, '564 Pine St', 'Apt 507', 'Miami', 'FL', 'USA', '33103'),
(26, 26, '677 Cedar St', 'Apt 608', 'Boston', 'MA', 'USA', '02203'),
(27, 27, '790 Walnut St', 'Apt 709', 'San Francisco', 'CA', 'USA', '94103'),
(28, 28, '891 Birch St', 'Apt 810', 'Seattle', 'WA', 'USA', '98103'),
(29, 29, '902 Ash St', 'Apt 911', 'Dallas', 'TX', 'USA', '75203'),
(30, 30, '113 Spruce St', 'Apt 1012', 'Atlanta', 'GA', 'USA', '30303'),   --
(31, 31, '125 Main St', 'Apt 104', 'New York', 'NY', 'USA', '10004'),
(32, 32, '238 Elm St', 'Apt 205', 'Los Angeles', 'CA', 'USA', '90004'),
(33, 33, '341 Oak St', 'Apt 306', 'Chicago', 'IL', 'USA', '60004'),
(34, 34, '454 Maple St', 'Apt 407', 'Houston', 'TX', 'USA', '77004'),
(35, 35, '567 Pine St', 'Apt 508', 'Miami', 'FL', 'USA', '33104'),
(36, 36, '680 Cedar St', 'Apt 609', 'Boston', 'MA', 'USA', '02204'),
(37, 37, '793 Walnut St', 'Apt 710', 'San Francisco', 'CA', 'USA', '94104'),
(38, 38, '894 Birch St', 'Apt 811', 'Seattle', 'WA', 'USA', '98104'),
(39, 39, '905 Ash St', 'Apt 912', 'Dallas', 'TX', 'USA', '75204'),
(40, 40, '116 Spruce St', 'Apt 1013', 'Atlanta', 'GA', 'USA', '30304'),  --
(41, 41, '127 Main St', 'Apt 105', 'New York', 'NY', 'USA', '10005'),
(42, 42, '240 Elm St', 'Apt 206', 'Los Angeles', 'CA', 'USA', '90005'),
(43, 43, '343 Oak St', 'Apt 307', 'Chicago', 'IL', 'USA', '60005'),
(44, 44, '456 Maple St', 'Apt 408', 'Houston', 'TX', 'USA', '77005'),
(45, 45, '569 Pine St', 'Apt 509', 'Miami', 'FL', 'USA', '33105'),
(46, 46, '682 Cedar St', 'Apt 610', 'Boston', 'MA', 'USA', '02205'),
(47, 47, '795 Walnut St', 'Apt 711', 'San Francisco', 'CA', 'USA', '94105'),
(48, 48, '896 Birch St', 'Apt 812', 'Seattle', 'WA', 'USA', '98105'),
(49, 49, '907 Ash St', 'Apt 913', 'Dallas', 'TX', 'USA', '75205'),
(50, 50, '118 Spruce St', 'Apt 1014', 'Atlanta', 'GA', 'USA', '30305');  --
UNLOCK TABLES;
-- Select * from t_Customeraddress;

-- 3. Insurance Company table
DROP TABLE IF EXISTS `t_InsuranceCompany`;
CREATE TABLE `t_InsuranceCompany`(
	`Company_ID` INT NOT NULL AUTO_INCREMENT,
    `Company_Name` VARCHAR(100),
    `Company_Website` VARCHAR(255),
    PRIMARY KEY (`Company_ID`)
);
-- select * from t_InsuranceCompany;
-- Inserting records into t_InsuranceCompany table
LOCK TABLES `t_InsuranceCompany` WRITE;
INSERT INTO t_InsuranceCompany (Company_ID, Company_Name, Company_Website)
VALUES
(1, 'ABC Insurance', 'www.abcinsurance.com'),
(2, 'XYZ Insurance', 'www.xyzinsurance.com'),
(3, '123 Insurance', 'www.123insurance.com'),
(4, 'PQR Insurance', 'www.pqrinsurance.com'),
(5, 'LMN Insurance', 'www.lmninsurance.com'),
(6, '456 Insurance', 'www.456insurance.com'),
(7, 'DEF Insurance', 'www.definsurance.com'),
(8, 'GHI Insurance', 'www.ghiinsurance.com'),
(9, 'JKL Insurance', 'www.jklinsurance.com'),
(10, 'MNO Insurance', 'www.mnoinsurance.com'),
(11, 'STU Insurance', 'www.stuinsurance.com'),
(12, 'VWX Insurance', 'www.vwxinsurance.com'),
(13, 'YZA Insurance', 'www.yzainsurance.com'),
(14, 'BCD Insurance', 'www.bcdinsurance.com'),
(15, 'EFG Insurance', 'www.efginsurance.com'),
(16, 'HIJ Insurance', 'www.hijinsurance.com'),
(17, 'KLM Insurance', 'www.klminsurance.com'),
(18, 'NOP Insurance', 'www.nopinsurance.com'),
(19, 'QRS Insurance', 'www.qrsinsurance.com'),
(20, 'TUV Insurance', 'www.tuvinsurance.com'),
(21, 'WXY Insurance', 'www.wxyinsurance.com'),
(22, 'ZAB Insurance', 'www.zabinsurance.com'),
(23, 'CDE Insurance', 'www.cdeinsurance.com'),
(24, 'FGH Insurance', 'www.fghinsurance.com'),
(25, 'IJK Insurance', 'www.ijkinsurance.com'),
(26, 'LMN Insurance', 'www.lmninsurance.com'),
(27, 'OPQ Insurance', 'www.opqinsurance.com'),
(28, 'RST Insurance', 'www.rstinsurance.com'),
(29, 'UVW Insurance', 'www.uvwinsurance.com'),
(30, 'XYZ Insurance', 'www.xyzinsurance.com'),
(31, 'ABC Insurance', 'www.abcinsurance.com'),
(32, '123 Insurance', 'www.123insurance.com'),
(33, '456 Insurance', 'www.456insurance.com'),
(34, '789 Insurance', 'www.789insurance.com'),
(35, '012 Insurance', 'www.012insurance.com'),
(36, '345 Insurance', 'www.345insurance.com'),
(37, '678 Insurance', 'www.678insurance.com'),
(38, '901 Insurance', 'www.901insurance.com'),
(39, '234 Insurance', 'www.234insurance.com'),
(40, '567 Insurance', 'www.567insurance.com'),
(41, '890 Insurance', 'www.890insurance.com'),
(42, '123 Insurance', 'www.123insurance.com'),
(43, '456 Insurance', 'www.456insurance.com'),
(44, '789 Insurance', 'www.789insurance.com'),
(45, '012 Insurance', 'www.012insurance.com'),
(46, '345 Insurance', 'www.345insurance.com'),
(47, '678 Insurance', 'www.678insurance.com'),
(48, '901 Insurance', 'www.901insurance.com'),
(49, '234 Insurance', 'www.234insurance.com'),
(50, '567 Insurance', 'www.567insurance.com');
UNLOCK TABLES;
-- Select * from t_InsuranceCompany;

-- 4. Policy Details Table
DROP TABLE IF EXISTS `t_PolicyDetails`;
CREATE TABLE `t_PolicyDetails`(
	`Policy_ID` INT NOT NULL AUTO_INCREMENT,
    `Company_ID` INT NOT NULL,
    `PolicyName` VARCHAR(255) NOT NULL,
    `Policy_type` VARCHAR(50) NOT NULL,
    `BasePremium` DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (`Policy_ID`),
    FOREIGN KEY (`Company_ID`)  REFERENCES `t_InsuranceCompany`(`Company_ID`)
);
-- select * from t_PolicyDetails;
-- Inserting records into t_PolicyDetails table
LOCK TABLES `t_PolicyDetails` WRITE;
INSERT INTO t_PolicyDetails (Policy_ID, Company_ID, PolicyName, Policy_type, BasePremium)
VALUES
(1, 1, 'Life Insurance', 'Life', 500),
(2, 2, 'Car Insurance', 'Auto', 300),
(3, 3, 'Health Insurance', 'Health', 400),
(4, 4, 'Home Insurance', 'Property', 600),
(5, 5, 'Travel Insurance', 'Travel', 200),
(6, 6, 'Pet Insurance', 'Pet', 100),
(7, 7, 'Business Insurance', 'Business', 700),
(8, 8, 'Accident Insurance', 'Accident', 250),
(9, 9, 'Disability Insurance', 'Disability', 450),
(10, 10, 'Renters Insurance', 'Property', 350),
(11, 11, 'Life Insurance', 'Life', 500),
(12, 12, 'Car Insurance', 'Auto', 300),
(13, 13, 'Health Insurance', 'Health', 400),
(14, 14, 'Home Insurance', 'Property', 600),
(15, 15, 'Travel Insurance', 'Travel', 200),
(16, 16, 'Pet Insurance', 'Pet', 100),
(17, 17, 'Business Insurance', 'Business', 700),
(18, 18, 'Accident Insurance', 'Accident', 250),
(19, 19, 'Disability Insurance', 'Disability', 450),
(20, 20, 'Renters Insurance', 'Property', 350),
(21, 21, 'Life Insurance', 'Life', 500),
(22, 22, 'Car Insurance', 'Auto', 300),
(23, 23, 'Health Insurance', 'Health', 400),
(24, 24, 'Home Insurance', 'Property', 600),
(25, 25, 'Travel Insurance', 'Travel', 200),
(26, 26, 'Pet Insurance', 'Pet', 100),
(27, 27, 'Business Insurance', 'Business', 700),
(28, 28, 'Accident Insurance', 'Accident', 250),
(29, 29, 'Disability Insurance', 'Disability', 450),
(30, 30, 'Renters Insurance', 'Property', 350),
(31, 31, 'Life Insurance', 'Life', 500),
(32, 32, 'Car Insurance', 'Auto', 300),
(33, 33, 'Health Insurance', 'Health', 400),
(34, 34, 'Home Insurance', 'Property', 600),
(35, 35, 'Travel Insurance', 'Travel', 200),
(36, 36, 'Pet Insurance', 'Pet', 100),
(37, 37, 'Business Insurance', 'Business', 700),
(38, 38, 'Accident Insurance', 'Accident', 250),
(39, 39, 'Disability Insurance', 'Disability', 450),
(40, 40, 'Renters Insurance', 'Property', 350),
(41, 41, 'Life Insurance', 'Life', 500),
(42, 42, 'Car Insurance', 'Auto', 300),
(43, 43, 'Health Insurance', 'Health', 400),
(44, 44, 'Home Insurance', 'Property', 600),
(45, 45, 'Travel Insurance', 'Travel', 200),
(46, 46, 'Pet Insurance', 'Pet', 100),
(47, 47, 'Business Insurance', 'Business', 700),
(48, 48, 'Accident Insurance', 'Accident', 250),
(49, 49, 'Disability Insurance', 'Disability', 450),
(50, 50, 'Renters Insurance', 'Property', 350);
UNLOCK TABLES;

-- 5. Company Address
DROP TABLE IF EXISTS `t_CompanyAddress`;
CREATE TABLE `t_CompanyAddress`(
	`Company_ID` INT NOT NULL,
    `Street` VARCHAR(255) NOT NULL,
	`Apartment` VARCHAR(50),
	`City` VARCHAR(100) NOT NULL,
	`State` VARCHAR(100) NOT NULL,
	`Country` VARCHAR(100) NOT NULL,
	`ZipCode` VARCHAR(20) NOT NULL,
	PRIMARY KEY (`Company_ID`),
	FOREIGN KEY (`Company_ID`) REFERENCES `t_InsuranceCompany`(`Company_ID`)
);
-- select * from t_CompanyAddress;
-- Inserting records into t_CompanyAddress table
LOCK TABLES `t_CompanyAddress` WRITE;
INSERT INTO t_CompanyAddress (Company_ID, Street, Apartment, City, State, Country, ZipCode)
VALUES
(1, '111 Oak St', 'Suite 100', 'New York', 'NY', 'USA', '10001'),
(2, '222 Elm St', 'Suite 200', 'Los Angeles', 'CA', 'USA', '90001'),
(3, '333 Maple St', 'Suite 300', 'Chicago', 'IL', 'USA', '60001'),
(4, '113 Cedar St', 'Suite 101', 'New York', 'NY', 'USA', '10006'),
(5, '226 Walnut St', 'Suite 201', 'Los Angeles', 'CA', 'USA', '90006'),
(6, '339 Birch St', 'Suite 301', 'Chicago', 'IL', 'USA', '60006'),
(7, '452 Ash St', 'Suite 401', 'Houston', 'TX', 'USA', '77006'),
(8, '565 Spruce St', 'Suite 501', 'Miami', 'FL', 'USA', '33106'),
(9, '678 Oak St', 'Suite 601', 'Boston', 'MA', 'USA', '02206'),
(10, '791 Elm St', 'Suite 701', 'San Francisco', 'CA', 'USA', '94106'),
(11, '902 Maple St', 'Suite 801', 'Seattle', 'WA', 'USA', '98106'),
(12, '115 Pine St', 'Suite 901', 'Dallas', 'TX', 'USA', '75206'),
(13, '228 Cedar St', 'Suite 1001', 'Atlanta', 'GA', 'USA', '30306'),
(14, '341 Walnut St', 'Suite 102', 'New York', 'NY', 'USA', '10007'),
(15, '454 Birch St', 'Suite 202', 'Los Angeles', 'CA', 'USA', '90007'),
(16, '567 Ash St', 'Suite 302', 'Chicago', 'IL', 'USA', '60007'),
(17, '680 Spruce St', 'Suite 402', 'Houston', 'TX', 'USA', '77007'),
(18, '793 Oak St', 'Suite 502', 'Miami', 'FL', 'USA', '33107'),
(19, '906 Elm St', 'Suite 602', 'Boston', 'MA', 'USA', '02207'),
(20, '119 Maple St', 'Suite 702', 'San Francisco', 'CA', 'USA', '94107'),
(21, '232 Pine St', 'Suite 802', 'Seattle', 'WA', 'USA', '98107'),
(22, '345 Cedar St', 'Suite 902', 'Dallas', 'TX', 'USA', '75207'),
(23, '458 Walnut St', 'Suite 1002', 'Atlanta', 'GA', 'USA', '30307'),
(24, '571 Birch St', 'Suite 103', 'New York', 'NY', 'USA', '10008'),
(25, '684 Ash St', 'Suite 203', 'Los Angeles', 'CA', 'USA', '90008'),
(26, '797 Spruce St', 'Suite 303', 'Chicago', 'IL', 'USA', '60008'),
(27, '910 Oak St', 'Suite 403', 'Houston', 'TX', 'USA', '77008'),
(28, '123 Elm St', 'Suite 503', 'Miami', 'FL', 'USA', '33108'),
(29, '236 Maple St', 'Suite 603', 'Boston', 'MA', 'USA', '02208'),
(30, '349 Pine St', 'Suite 703', 'San Francisco', 'CA', 'USA', '94108'),
(31, '462 Cedar St', 'Suite 803', 'Seattle', 'WA', 'USA', '98108'),
(32, '575 Walnut St', 'Suite 903', 'Dallas', 'TX', 'USA', '75208'),
(33, '688 Birch St', 'Suite 1003', 'Atlanta', 'GA', 'USA', '30308'),
(34, '801 Cedar St', 'Suite 104', 'New York', 'NY', 'USA', '10009'),
(35, '914 Pine St', 'Suite 204', 'Los Angeles', 'CA', 'USA', '90009'),
(36, '127 Elm St', 'Suite 304', 'Chicago', 'IL', 'USA', '60009'),
(37, '240 Maple St', 'Suite 404', 'Houston', 'TX', 'USA', '77009'),
(38, '353 Oak St', 'Suite 504', 'Miami', 'FL', 'USA', '33109'),
(39, '466 Spruce St', 'Suite 604', 'Boston', 'MA', 'USA', '02209'),
(40, '579 Pine St', 'Suite 704', 'San Francisco', 'CA', 'USA', '94109'),
(41, '692 Cedar St', 'Suite 804', 'Seattle', 'WA', 'USA', '98109'),
(42, '805 Walnut St', 'Suite 904', 'Dallas', 'TX', 'USA', '75209'),
(43, '918 Birch St', 'Suite 1004', 'Atlanta', 'GA', 'USA', '30309'),
(44, '131 Cedar St', 'Suite 105', 'New York', 'NY', 'USA', '10010'),
(45, '244 Pine St', 'Suite 205', 'Los Angeles', 'CA', 'USA', '90010'),
(46, '357 Elm St', 'Suite 305', 'Chicago', 'IL', 'USA', '60010'),
(47, '470 Maple St', 'Suite 405', 'Houston', 'TX', 'USA', '77010'),
(48, '583 Ash St', 'Suite 505', 'Miami', 'FL', 'USA', '33110'),
(49, '696 Spruce St', 'Suite 605', 'Boston', 'MA', 'USA', '02210'),
(50, '809 Pine St', 'Suite 705', 'San Francisco', 'CA', 'USA', '94110');
UNLOCK TABLES;

-- 6. Agent table
DROP TABLE IF EXISTS `t_AgentDetails`;
CREATE TABLE `t_AgentDetails`(
	`Agent_ID` INT NOT NULL AUTO_INCREMENT,
    `First_Name` VARCHAR(100),
    `Last_Name` VARCHAR(100),
    PRIMARY KEY (`Agent_ID`)
);
-- select * from t_AgentDetails;
-- Inserting records into t_AgentDetails table
LOCK TABLES `t_AgentDetails` WRITE; 
INSERT INTO t_AgentDetails (Agent_ID, First_Name, Last_Name)
VALUES
(1, 'Mark', 'Johnson'),
(2, 'Sarah', 'Williams'),
(3, 'Chris', 'Brown'),
(4, 'Zaki','Khan'),
(5, 'Osama','Biden'),
(6, 'Lucas', 'Smith'),
(7, 'Zoe', 'Anderson'),
(8, 'Nathan', 'Wright'),
(9, 'Eva', 'Taylor'),
(10, 'Owen', 'Thomas'),
(11, 'Layla', 'Harris'),
(12, 'Adam', 'Martin'),
(13, 'Sophia', 'Jackson'),
(14, 'Evan', 'White'),
(15, 'Leah', 'Thompson'),
(16, 'Lucas', 'Smith'),
(17, 'Zoe', 'Anderson'),
(18, 'Nathan', 'Wright'),
(19, 'Eva', 'Taylor'),
(20, 'Owen', 'Thomas'),
(21, 'Layla', 'Harris'),
(22, 'Adam', 'Martin'),
(23, 'Sophia', 'Jackson'),
(24, 'Evan', 'White'),
(25, 'Leah', 'Thompson'),
(26, 'Lucas', 'Smith'),
(27, 'Zoe', 'Anderson'),
(28, 'Nathan', 'Wright'),
(29, 'Eva', 'Taylor'),
(30, 'Owen', 'Thomas'),
(31, 'Layla', 'Harris'),
(32, 'Adam', 'Martin'),
(33, 'Sophia', 'Jackson'),
(34, 'Evan', 'White'),
(35, 'Leah', 'Thompson'),
(36, 'Lucas', 'Smith'),
(37, 'Zoe', 'Anderson'),
(38, 'Nathan', 'Wright'),
(39, 'Eva', 'Taylor'),
(40, 'Owen', 'Thomas'),
(41, 'Layla', 'Harris'),
(42, 'Adam', 'Martin'),
(43, 'Sophia', 'Jackson'),
(44, 'Evan', 'White'),
(45, 'Leah', 'Thompson'),
(46, 'Lucas', 'Smith'),
(47, 'Zoe', 'Anderson'),
(48, 'Nathan', 'Wright'),
(49, 'Eva', 'Taylor'),
(50, 'Owen', 'Thomas');
UNLOCK TABLES;

-- 7. Customer Insurance
DROP TABLE IF EXISTS `t_CustomerInsurance`;
CREATE TABLE `t_CustomerInsurance`(
	`Cust_ID` INT NOT NULL,
    `Policy_ID` INT NOT NULL,
    `Policy_Type` VARCHAR(100) NOT NULL,
    `Start_Date` DATE NOT NULL,
    `End_Date` DATE NOT NULL,
    `Agent_ID` INT NOT NULL,
	`BasePremium` DECIMAL(10, 2) NOT NULL,
	`CoverageAmount` DECIMAL(10, 2) NOT NULL,
	PRIMARY KEY (`Cust_ID`, `Policy_ID`),
	FOREIGN KEY (`Cust_ID`) REFERENCES `t_MasterCustomer`(`Cust_ID`),
	FOREIGN KEY (`Policy_ID`) REFERENCES `t_PolicyDetails`(`Policy_ID`),
	FOREIGN KEY (`Agent_ID`) REFERENCES `t_AgentDetails`(`Agent_ID`)
);
-- select * from t_CustomerInsurance;
-- Inserting records into t_CustomerInsurance table
LOCK TABLES `t_CustomerInsurance` WRITE; 
INSERT INTO t_CustomerInsurance (Cust_ID, Policy_ID, Policy_Type, Start_Date, End_Date, Agent_ID, BasePremium, CoverageAmount)
VALUES
(1, 7, 'Property', '2023-01-15', '2024-05-24', 1, 700, 800000),
(1, 4, 'Property', '2023-01-15', '2023-12-31', 1, 600, 200000),
(1, 5, 'Travel', '2023-02-15', '2023-12-31', 2, 200, 10000),
(1, 6, 'Pet', '2023-03-15', '2023-12-31', 9, 100, 5000),
(2, 6, 'Pet', '2023-04-01', '2023-12-31', 3, 100, 5000),
(3, 9, 'Disability', '2023-07-01', '2024-05-31', 4, 450, 90000),
(3, 1, 'Life', '2023-09-01', '2023-12-31', 7, 500, 100000),
(4, 3, 'Health', '2023-11-01', '2023-12-31', 7, 400, 75000),
(4, 4, 'Property', '2023-12-01', '2023-12-31', 1, 600, 200000),
(5, 5, 'Travel', '2024-01-01', '2024-12-31', 2, 200, 10000),
(6, 8, 'Accident', '2024-04-01', '2024-12-31', 2, 250, 15000),
(6, 10, 'Property', '2024-06-01', '2024-12-31', 8, 350, 120000),
(7, 1, 'Life', '2024-07-01', '2024-12-31', 10, 500, 100000),
(7, 2, 'Auto', '2024-08-01', '2024-12-31', 1, 300, 50000),
(7, 3, 'Health', '2024-09-01', '2024-12-31', 1, 400, 75000),
(8, 4, 'Property', '2024-01-01', '2024-05-31', 5, 600, 200000),
(9, 8, 'Accident', '2024-02-01', '2024-12-31', 2, 250, 15000),
(9, 9, 'Disability', '2024-03-01', '2024-12-31', 3, 450, 90000),
(10,10,'Property','2024-04-01','2024-12-31',5,350,120000),                                                                                            
(12, 2, 'Auto', '2023-02-01', '2023-12-31', 5, 300, 50000),
(12, 3, 'Health', '2023-03-01', '2023-12-31', 3, 400, 75000),
(13, 4, 'Property', '2023-04-01', '2023-12-31', 1, 600, 200000),
(14, 5, 'Travel', '2023-05-01', '2023-12-31', 5, 200, 10000),
(15, 6, 'Pet', '2023-06-01', '2023-12-31', 3, 100, 5000),
(16, 8, 'Accident', '2023-08-01', '2023-12-31', 2, 250, 15000),
(16, 9, 'Disability', '2023-09-01', '2023-12-31', 4, 450, 90000),
(17, 10, 'Property', '2023-10-01', '2023-12-31' ,4, 350, 120000),
(17, 1, 'Life', '2023-11-01', '2024-05-31', 2, 500, 100000),
(18, 3, 'Health', '2024-01-01', '2024-12-31', 1, 400, 75000),
(19, 4, 'Property', '2024-02-01', '2024-12-31', 1, 600, 200000),
(19, 5, 'Travel', '2024-03-01', '2024-12-31', 2, 200, 10000),
(20, 6, 'Pet', '2024-04-01', '2024-12-31', 3, 100, 5000),
(20, 7, 'Business', '2024-05-01', '2024-06-30',10, 700, 300000),
(21, 8, 'Accident', '2024-06-01', '2024-12-31', 2, 250, 15000),
(21, 9, 'Disability', '2024-07-01', '2024-12-31', 3, 450, 90000),
(22, 1, 'Life', '2023-09-01', '2024-06-30', 4, 500, 100000),
(23, 2, 'Auto', '2024-10-01', '2024-12-31', 3, 300, 50000),
(23, 3, 'Health', '2024-11-01', '2024-12-31', 1, 400, 75000),
(24, 4, 'Property', '2024-12-01', '2024-12-31', 2, 600, 200000),
(25, 6, 'Pet', '2023-02-01', '2023-12-31', 3, 100, 5000),
(26, 8, 'Accident', '2023-04-01', '2023-12-31', 2, 250, 15000),
(26, 9, 'Disability', '2023-05-01', '2023-12-31', 4, 450, 90000),
(27, 10, 'Property', '2023-06-01', '2023-12-31', 1, 350, 120000),
(27, 1, 'Life', '2023-07-01', '2023-07-31', 2, 500, 100000),
(28, 2, 'Auto', '2023-08-01', '2023-12-31', 9, 300, 50000),
(29, 5, 'Travel', '2023-11-01', '2023-12-31', 2, 200, 10000),
(30, 7, 'Business', '2024-01-01', '2024-12-31', 1, 700, 300000),
(31, 9, 'Disability', '2024-03-01', '2024-12-31', 9, 450, 90000),
(32, 10, 'Property', '2024-04-01', '2024-12-31', 1, 350, 120000),
(32, 1, 'Life', '2024-05-01', '2024-07-31', 2, 500, 100000),
(33, 2, 'Auto', '2024-06-01', '2024-12-31', 3, 300, 50000),
(33, 3, 'Health', '2024-07-01', '2024-07-31', 7, 400, 75000),
(34, 4, 'Property', '2024-08-01', '2024-12-31', 1, 600, 200000),
(34, 5, 'Travel', '2024-09-01', '2024-12-31', 2, 200, 10000),
(35, 7, 'Business', '2024-11-01', '2024-12-31', 4, 700, 300000),
(36, 8, 'Accident', '2024-12-01', '2024-12-31', 2, 250, 15000),
(36, 9, 'Disability', '2023-01-01', '2023-12-31', 5, 450, 90000),
(37, 10, 'Property', '2023-02-01', '2023-12-31', 10, 350, 120000),
(37, 1, 'Life', '2023-03-01', '2023-12-31', 2, 500, 100000),
(38, 2, 'Auto', '2023-04-01', '2023-06-30', 5, 300, 50000),
(38, 3, 'Health', '2023-05-01', '2023-12-31', 10, 400, 75000),
(39, 4, 'Property', '2023-06-01', '2023-12-31', 1, 600, 200000),
(39, 5, 'Travel', '2023-07-01', '2023-12-31', 2, 200, 10000),
(40, 6, 'Pet', '2023-08-01', '2023-12-31', 3, 100, 5000),
(40, 7, 'Business', '2023-09-01', '2024-06-30', 1, 700, 300000),
(41, 8, 'Accident', '2023-10-01', '2023-12-31', 5, 250, 15000),
(41, 9, 'Disability', '2023-11-01', '2023-12-31', 3, 450, 90000),
(42, 10, 'Property', '2023-12-01', '2023-12-31', 1, 350, 120000),
(42, 1, 'Life', '2024-01-01', '2024-06-30',5, 500, 100000),
(43, 2, 'Auto', '2024-02-01', '2024-12-31',7, 300, 50000),
(44, 5, 'Travel', '2024-05-01', '2024-12-31', 2, 200, 10000),
(45, 6, 'Pet', '2024-06-01', '2024-12-31',7, 100, 5000),
(45, 7, 'Business', '2024-07-01', '2024-12-31', 1, 700, 300000),
(46, 9, 'Disability', '2024-09-01', '2024-12-31', 3, 450, 90000),
(47, 10, 'Property', '2024-10-01', '2024-12-31',7, 350, 120000),
(48, 2, 'Auto', '2023-12-01', '2024-06-30', 3, 300, 50000),
(48, 3, 'Health', '2023-01-01', '2023-12-31', 1, 400, 75000),
(49, 4, 'Property', '2023-02-01', '2023-12-31',7, 600, 200000),
(50, 6, 'Pet', '2023-04-01', '2023-06-30', 3, 100, 5000),
(50, 7, 'Business', '2023-05-01', '2023-12-31', 10, 700, 300000);
UNLOCK TABLES;

-- 8. Claims table
DROP TABLE IF EXISTS `t_Claims`;
CREATE TABLE `t_Claims`(
	`Claim_ID` INT NOT NULL AUTO_INCREMENT,
    `Cust_ID` INT NOT NULL,
    `Policy_ID` INT NOT NULL,
    `ClaimAmount` DECIMAL(10,2) NOT NULL,
    `Status` VARCHAR(100) NOT NULL,
    `Claim_Date` date not null,
    PRIMARY KEY (`Claim_ID`),
    KEY `Fk` (`Policy_ID`),
	FOREIGN KEY (`Cust_ID`) REFERENCES `t_MasterCustomer`(`Cust_ID`),
	FOREIGN KEY (`Policy_ID`) REFERENCES `t_PolicyDetails`(`Policy_ID`)
);
-- select * from t_Claims;
-- Inserting records into t_Claims table
LOCK TABLES `t_Claims` WRITE; 
INSERT INTO t_Claims (Cust_ID, Policy_ID, Claim_ID, ClaimAmount, Status, Claim_date)
VALUES
(37, 37, 3, 8000, 'Settled', '2022-07-09'),
(15, 6, 46, 3000, 'Pending', '2023-11-19'),
(10, 9, 1, 10000, 'Settled', '2022-06-28'),
(2, 46, 38, 9000, 'Denied', '2022-11-04'),
(42, 19, 7, 7000, 'Denied', '2024-01-20'),
(35, 20, 8, 9000, 'Pending', '2023-11-20'),
(35, 18, 6, 3000, 'Settled', '2023-04-08'),
(40, 27, 5, 2000, 'Pending', '2024-07-29'),
(47, 4, 42, 5000, 'Settled', '2023-09-20'),
(20, 32, 19, 11000, 'Denied', '2024-04-30'),
(34, 3, 27, 7000, 'Settled', '2023-07-23'),
(2, 48, 10, 15000, 'Settled', '2024-05-24'),
(9, 33, 11, 10000, 'Settled', '2023-09-11'),
(39, 31, 13, 8000, 'Denied', '2024-12-21'),
(11, 49, 25, 2000, 'Settled', '2022-09-15'),
(21, 20, 34, 12000, 'Pending', '2023-12-03'),
(47, 32, 41, 10000, 'Pending', '2022-05-27'),
(14, 2, 20, 15000, 'Denied', '2024-09-12'),
(10, 17, 29, 11000, 'Denied', '2022-07-29'),
(1, 46, 36, 3000, 'Pending', '2023-10-06'),
(25, 13, 16, 3000, 'Denied', '2024-08-08'),
(38, 25, 48, 9000, 'Settled', '2024-02-27'),
(38, 14, 28, 9000, 'Pending', '2024-10-21'),
(36, 3, 30, 15000, 'Denied', '2023-06-18'),
(9, 29, 9, 11000, 'Settled', '2023-07-24'),
(29, 19, 45, 2000, 'Denied', '2022-01-11'),
(33, 27, 4, 12000, 'Denied', '2022-09-19'),
(20, 23, 17, 7000, 'Settled', '2024-05-02'),
(30, 36, 47, 7000, 'Pending', '2022-08-20'),
(36, 33, 26, 3000, 'Denied', '2023-09-18'),
(11, 5, 31, 10000, 'Settled', '2024-10-08'),
(15, 12, 37, 7000, 'Pending', '2024-07-23'),
(2, 1, 40, 15000, 'Denied', '2022-09-12'),
(28, 5, 49, 11000, 'Pending', '2023-12-02'),
(49, 25, 14, 12000, 'Denied', '2023-02-13'),
(8, 40, 2, 5000, 'Pending', '2022-12-24'),
(44, 14, 35, 2000, 'Pending', '2023-05-23'),
(34, 13, 22, 5000, 'Denied', '2023-08-05'),
(29, 15, 32, 5000, 'Pending', '2023-07-02'),
(7, 15, 18, 9000, 'Pending', '2024-08-02'),
(44, 9, 39, 11000, 'Pending', '2024-08-28'),
(8, 4, 44, 12000, 'Denied', '2024-12-09'),
(8, 29, 12, 5000, 'Settled', '2024-03-17'),
(31, 43, 43, 8000, 'Settled', '2024-07-25'),
(41, 33, 21, 10000, 'Denied', '2022-02-25'),
(14, 4, 33, 8000, 'Settled', '2023-02-18'),
(50, 27, 50, 15000, 'Pending', '2024-01-12'),
(18, 10, 23, 8000, 'Pending', '2023-02-18'),
(23, 43, 15, 2000, 'Pending', '2023-06-27'),
(33, 23, 24, 12000, 'Settled', '2023-04-11');
UNLOCK TABLES;

-- 9. Claim Settlement
DROP TABLE IF EXISTS `t_ClaimSettlement`;
CREATE TABLE `t_ClaimSettlement`(
	`Transaction_ID` INT NOT NULL AUTO_INCREMENT,
	`Claim_ID` INT NOT NULL,
	`SettledAmount` DECIMAL(10,2) NOT NULL,
    `SettlementDate` Date not null,
	PRIMARY KEY (`Transaction_ID`),
	FOREIGN KEY (`Claim_ID`) REFERENCES `t_Claims`(`Claim_ID`)
);
-- select * from t_ClaimSettlement;
-- Inserting records into t_ClaimSettlement table
LOCK TABLES `t_ClaimSettlement` WRITE;
INSERT INTO t_ClaimSettlement (Transaction_ID, Claim_ID, SettledAmount, SettlementDate)
VALUES
(1,1,10000.00,'2022-06-28'),
(2,3,8000.00,'2022-07-09'),
(3,6,3000.00,'2023-04-08'),
(4,9,11000.00,'2023-07-24'),
(5,10,15000.00,'2024-05-24'),
(6,11,10000.00,'2023-09-11'),
(7,12,5000.00,'2024-03-17'),
(8,17,7000.00,'2024-05-02'),
(9,24,12000.00,'2023-04-11'),
(10,25,2000.00,'2022-09-15'),
(11,27,7000.00,'2023-07-23'),
(12,31,10000.00,'2024-10-08'),
(13,33,8000.00,'2023-02-18'),
(14,42,5000.00,'2023-09-20'),
(15,43,8000.00,'2024-07-25'),
(16,48,9000.00,'2024-02-27');
UNLOCK TABLES;

-- 10. Customer Payment table
DROP TABLE IF EXISTS `t_CustomerPayment`;
CREATE TABLE `t_CustomerPayment`(
	`Transaction_ID` INT NOT NULL AUTO_INCREMENT,
	`Cust_ID` INT NOT NULL,
	`Policy_ID` INT NOT NULL,
	`AmountReceived` DECIMAL(10, 2) NOT NULL,
	`PaymentDate` DATE NOT NULL,
	`PaymentStatus` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`Transaction_ID`),
	FOREIGN KEY (`Cust_ID`) REFERENCES `t_MasterCustomer`(`Cust_ID`),
	FOREIGN KEY (`Policy_ID`) REFERENCES `t_PolicyDetails`(`Policy_ID`)
);
-- select * from t_CustomerPayment;
-- Inserting records into t_CustomerPayment table
LOCK TABLES `t_CustomerPayment` WRITE;
INSERT INTO t_CustomerPayment (Transaction_ID, Cust_ID, Policy_ID, AmountReceived, PaymentDate, PaymentStatus)
VALUES
(1,1,4,600,'2024-01-15','Paid'),
(2,1,5,200,'2024-02-15','Paid'),
(3,1,6,010,'2024-03-15','Cancelled'),
(4,1,7,700,'2024-04-15','Cancelled'),
(5,2,6,010,'2024-04-15','Paid'),
(6,3,1,500,'2024-04-15','Paid'),
(7,3,9,450,'2024-04-18','Cancelled'),
(8,4,3,400,'2024-04-13','Paid'),
(9,4,4,600,'2024-04-13','Cancelled'),
(10,5,5,200,'2024-04-15','Paid'),
(11,6,8,250,'2024-03-15','Paid'),
(12,6,01,350,'2024-04-15','Cancelled'),
(13,7,1,500,'2024-03-15','Paid'),
(14,7,2,300,'2024-04-15','Paid'),
(15,7,3,400,'2024-03-15','Cancelled'),
(16,8,4,600,'2024-04-15','Cancelled'),
(17,9,8,250,'2024-03-15','Paid'),
(18,9,9,450,'2024-04-15','Cancelled'),
(19,01,01,350,'2024-03-15','Paid'),
(20,11,1,500,'2024-04-15','Cancelled'),
(21,12,2,300,'2024-02-15','Paid'),
(22,12,3,400,'2024-01-15','Paid'),
(23,13,4,600,'2024-04-15','Cancelled'),
(24,14,5,200,'2024-03-15','Paid'),
(25,15,6,010,'2024-01-15','Paid'),
(26,16,8,250,'2024-02-15','Cancelled'),
(27,16,9,450,'2024-03-15','Paid'),
(28,17,1,500,'2024-04-15','Paid'),
(29,17,01,350,'2024-03-15','Cancelled'),
(30,18,3,400,'2024-04-15','Paid'),
(31,19,4,600,'2024-03-15','Cancelled'),
(32,19,5,200,'2024-04-15','Paid'),
(33,20,6,010,'2024-02-15','Paid'),
(34,20,7,700,'2024-01-15','Cancelled'),
(35,21,8,250,'2024-04-15','Paid'),
(36,21,9,450,'2024-03-15','Paid'),
(37,22,1,500,'2024-01-15','Cancelled'),
(38,23,2,300,'2024-02-15','Paid'),
(39,23,3,400,'2024-03-15','Paid'),
(40,24,4,600,'2024-04-15','Cancelled'),
(41,25,6,010,'2024-03-15','Paid'),
(42,26,8,250,'2024-04-15','Cancelled'),
(43,26,9,450,'2024-03-15','Paid'),
(44,27,1,500,'2024-04-15','Paid'),
(45,27,01,350,'2024-02-15','Cancelled'),
(46,28,2,300,'2024-01-15','Paid'),
(47,29,5,200,'2024-04-15','Paid'),
(48,30,7,700,'2024-03-15','Cancelled'),
(49,31,9,450,'2028-01-15','Paid'),
(50,32,1,500,'2028-02-15','Paid'),
(51,1,7,700,'2024-05-15','Cancelled'),
(52,2,6,010,'2024-05-15','Paid'),
(53,3,1,500,'2024-05-15','Paid'),
(54,3,9,450,'2024-05-18','Cancelled'),
(55,4,3,400,'2024-05-13','Paid'),
(56,4,4,600,'2024-05-13','Cancelled'),
(57,5,5,200,'2024-05-15','Paid'),
(58,18,3,400,'2024-05-15','Paid');
UNLOCK TABLES;

-- 11. User Credentials table
DROP TABLE IF EXISTS `t_UserCredential`;
CREATE TABLE `t_UserCredential`(
	`UserName` VARCHAR(255) NOT NULL,
	`Cust_ID` INT NOT NULL,
	`Password` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`UserName`),
	FOREIGN KEY (`Cust_ID`) REFERENCES `t_MasterCustomer`(`Cust_ID`)
);
-- select * from t_UserCredential;
-- Inserting records into t_UserCredential table
LOCK TABLES `t_UserCredential` WRITE;
INSERT INTO t_UserCredential (UserName, Cust_ID, Password)
VALUES
('john_doe_1', 1, 'password1'),
('alice_smith_2', 2, 'password2'),
('michael_johnson_3', 3, 'password3'),
('emily_brown_4', 4, 'password4'),
('david_wilson_5', 5, 'password5'),
('sophia_martinez_6', 6, 'password6'),
('james_taylor_7', 7, 'password7'),
('olivia_jackson_8', 8, 'password8'),
('william_anderson_9', 9, 'password9'),
('emma_thomas_10', 10, 'password10'),
('harry_wilson_11',11, 'password11'),
('ava_miller_12',12,'password12'),
('alexander_davis_13',13,'password13'),
('mia_garcia_14',14,'password14'),
('charlotte_rodriguez_15',15,'password15'),
('noah_martinez_16',16,'password16'),
('isabella_lopez_17',17,'password17'),
('ethan_hernandez_18',18,'password18'),
('amelia_gonzalez_19',19,'password19'),
('jacob_perez_20',20,'password20'),
('mia_gonzalez_21',21,'password21'),
('ethan_hunt_22',22,'password22'),
('isabella_ciao_23',23,'password23'),
('noah_martinez_24',24,'password24'),
('charlotte_rodriguez_25',25,'password25'),
('alexander_davis_26',26,'password26'),
('ava_miller_27',27,'password27'),
('harry_wilson_28',28,'password28'),
('amelia_gonzalez_29',29,'password29'),
('jacob_perez_30',30,'password30'),
('mia_garcia_31',31,'password31'),
('oliver_torres_32',32,'password32'),
('sophia_martin_33',33,'password33'),
('william_richardson_34',34,'password34'),
('emma_morales_35',35,'password35'),
('james_cooper_36',36,'password36'),
('isabella_edwards_37',37,'password37'),
('olivia_cox_38',38,'password38'),
('michael_ward_39',39,'password39'),
('hannah_brooks_40',40,'password40'),
('john_watson_41',41,'password41'),
('emily_king_42',42,'password42'),
('daniel_campbell_43',43,'password43'),
('abigail_bennett_44',44,'password44'),
('lucas_kelly_45',45,'password45'),
('victoria_hughes_46',46,'password46'),
('matthew_wood_47',47,'password47'),
('aubrey_russell_48',48,'password48'),
('david_meyer_49',49,'password49'),
('olivia_brooks_50',50,'password50');
UNLOCK TABLES;

-- 12. Customer Contact table
DROP TABLE IF EXISTS `t_CustomerContact`;
CREATE TABLE `t_CustomerContact`(
	`Cust_ID` INT NOT NULL,
	`Mobile` VARCHAR(20) NOT NULL,
	`Email_ID` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`Cust_ID`),
	FOREIGN KEY (`Cust_ID`) REFERENCES `t_MasterCustomer`(`Cust_ID`)
);
-- select * from t_CustomerContact;
-- Inserting records into t_CustomerContact table
LOCK TABLES `t_CustomerContact` WRITE;
INSERT INTO t_CustomerContact (Cust_ID, Mobile, Email_ID)
VALUES
(1, '123-456-7890', 'john.doe@example.com'),
(2, '234-567-8901', 'alice.smith@example.com'),
(3, '345-678-9012', 'michael.johnson@example.com'),
(4, '456-789-0123', 'emily.brown@example.com'),
(5, '567-890-1234', 'david.wilson@example.com'),
(6, '678-901-2345', 'sophia.martinez@example.com'),
(7, '789-012-3456', 'james.taylor@example.com'),
(8, '890-123-4567', 'olivia.jackson@example.com'),
(9, '901-234-5678', 'william.anderson@example.com'),
(10, '012-345-6789', 'emma.thomas@example.com'),
(11, '111-222-3333', 'harry.wilson@example.com'),
(12, '222-333-4444', 'ava.miller@example.com'),
(13, '333-444-5555', 'alexander.davis@example.com'),
(14, '444-555-6666', 'mia.garcia@example.com'),
(15, '555-666-7777', 'charlotte.rodriguez@example.com'),
(16, '666-777-8888', 'noah.martinez@example.com'),
(17, '777-888-9999', 'isabella.lopez@example.com'),
(18, '888-999-0000', 'ethan.hernandez@example.com'),
(19, '999-000-1111', 'amelia.gonzalez@example.com'),
(20, '000-111-2222', 'jacob.perez@example.com'),
(21, '111-222-3334', 'mia.gonzalez@example.com'),
(22, '222-333-4445', 'ethan.hernandez@example.com'),
(23, '333-444-5556', 'isabella.lopez@example.com'),
(24, '444-555-6667', 'noah.martinez@example.com'),
(25, '555-666-7778', 'charlotte.rodriguez@example.com'),
(26, '666-777-8889', 'alexander.davis@example.com'),
(27, '777-888-9990', 'ava.miller@example.com'),
(28, '888-999-0001', 'harry.wilson@example.com'),
(29, '999-000-1112', 'amelia.gonzalez@example.com'),
(30, '000-111-2223', 'jacob.perez@example.com'),
(31, '111-222-3335', 'mia.garcia@example.com'),
(32, '222-333-4446', 'oliver.torres@example.com'),
(33, '333-444-5557', 'sophia.martin@example.com'),
(34, '444-555-6668', 'william.richardson@example.com'),
(35, '555-666-7779', 'emma.morales@example.com'),
(36, '666-777-8890', 'james.cooper@example.com'),
(37, '777-888-9991', 'isabella.edwards@example.com'),
(38, '888-999-0002', 'olivia.cox@example.com'),
(39, '999-000-1113', 'michael.ward@example.com'),
(40, '000-111-2224', 'hannah.brooks@example.com'),
(41, '111-222-3336', 'john.watson@example.com'),
(42, '222-333-4447', 'emily.king@example.com'),
(43, '333-444-5558', 'daniel.campbell@example.com'),
(44, '444-555-6669', 'abigail.bennett@example.com'),
(45, '555-666-7780', 'lucas.kelly@example.com'),
(46, '666-777-8891', 'victoria.hughes@example.com'),
(47, '777-888-9992', 'matthew.wood@example.com'),
(48, '888-999-0003', 'aubrey.russell@example.com'),
(49, '999-000-1114', 'david.meyer@example.com'),
(50, '000-111-2225', 'olivia.brooks@example.com');
UNLOCK TABLES;

-- 13. Company Contact
DROP TABLE IF EXISTS `t_CompanyContact`;
CREATE TABLE `t_CompanyContact`(
	`Company_ID` INT NOT NULL,
	`Mobile` VARCHAR(20) NOT NULL,
	`Email_ID` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`Company_ID`),
	FOREIGN KEY (`Company_ID`) REFERENCES `t_InsuranceCompany`(`Company_ID`)
);
-- select * from t_CompanyContact;
-- Inserting records into t_CompanyContact table
LOCK TABLES `t_CompanyContact` WRITE;
INSERT INTO t_CompanyContact (Company_ID, Mobile, Email_ID)
VALUES
(1, '111-222-3333', 'info@abcinsurance.com'),
(2, '222-333-4444', 'info@xyzinsurance.com'),
(3, '333-444-5555', 'info@123insurance.com'),
(4, '444-555-6666', 'info@insureco.com'),
(5, '555-666-7777', 'contact@insurenow.com'),
(6, '666-777-8888', 'support@insurancecorp.com'),
(7, '777-888-9999', 'customerservice@secureinsure.com'),
(8, '888-999-0000', 'info@globalinsurance.com'),
(9, '999-000-1111', 'contact@unitedinsure.com'),
(10, '000-111-2222', 'service@nationwideinsurance.com'),
(11, '111-222-3334', 'info@libertyinsurance.com'),
(12, '222-333-4445', 'customerservice@safeguardinsurance.com'),
(13, '333-444-5556', 'support@protectinsurance.com'),
(14, '444-555-6667', 'info@shieldinsurance.com'),
(15, '555-666-7778', 'contact@reliableinsure.com'),
(16, '666-777-8889', 'service@securenow.com'),
(17, '777-888-9990', 'customerservice@alliedinsure.com'),
(18, '888-999-0001', 'info@coastalinsurance.com'),
(19, '999-000-1112', 'contact@sureinsure.com'),
(20, '000-111-2223', 'support@guaranteeinsurance.com'),
(21, '111-222-3335', 'info@stellarinsurance.com'),
(22, '222-333-4446', 'customerservice@insurewise.com'),
(23, '333-444-5557', 'support@coveragecorp.com'),
(24, '444-555-6668', 'info@protectsure.com'),
(25, '555-666-7779', 'contact@dependableinsure.com'),
(26, '666-777-8890', 'service@securityinsurance.com'),
(27, '777-888-9991', 'customerservice@insuregroup.com'),
(28, '888-999-0002', 'info@assuranceinsurance.com'),
(29, '999-000-1113', 'contact@insuremax.com'),
(30, '000-111-2224', 'support@coverallinsurance.com'),
(31, '111-222-3336', 'info@protectline.com'),
(32, '222-333-4447', 'customerservice@insureall.com'),
(33, '333-444-5558', 'support@insuresure.com'),
(34, '444-555-6669', 'info@insurify.com'),
(35, '555-666-7780', 'contact@insurepro.com'),
(36, '666-777-8891', 'service@insureme.com'),
(37, '777-888-9992', 'customerservice@insureconnect.com'),
(38, '888-999-0003', 'info@insurecoast.com'),
(39, '999-000-1114', 'contact@insureup.com'),
(40, '000-111-2225', 'support@insurewise.com'),
(41, '111-222-3337', 'info@insuremax.com'),
(42, '222-333-4448', 'customerservice@insuregroup.com'),
(43, '333-444-5559', 'support@insureline.com'),
(44, '444-555-6670', 'info@insureit.com'),
(45, '555-666-7781', 'contact@insuresecure.com'),
(46, '666-777-8892', 'service@insurenow.com'),
(47, '777-888-9993', 'customerservice@insuretrust.com'),
(48, '888-999-0004', 'info@insurewise.com'),
(49, '999-000-1115', 'contact@insuresure.com'),
(50, '000-111-2226', 'support@insureline.com');
UNLOCK tables;

-- 14. Interaction table
DROP TABLE IF EXISTS `t_Interaction`;
CREATE TABLE `t_Interaction`(
	`Interaction_ID` INT NOT NULL auto_increment,
    `Customer_ID` INT NOT NULL,
	`Interaction_Type` VARCHAR(20) NOT NULL,
	`Interaction_details` VARCHAR(50) NOT NULL,
    `InteractionDate` DATE NOT NULL,
	PRIMARY KEY (`Interaction_ID`),
	FOREIGN KEY (`Customer_ID`) REFERENCES `t_MasterCustomer`(`Cust_ID`)
);

-- Inserting records into t_Interaction table
INSERT INTO t_Interaction (Interaction_ID, Customer_ID, Interaction_Type, Interaction_details, InteractionDate)
VALUES
(1,4,'Inquiry','Details for interaction 51','2023-11-04'),
(2,6,'Inquiry','Details for interaction 38','2024-04-03'),
(3,9,'Complaint','Details for interaction 72','2024-02-22'),
(4,5,'Inquiry','Details for interaction 90','2023-04-14'),
(5,2,'Inquiry','Details for interaction 9','2023-08-09'),
(6,1,'Complaint','Details for interaction 67','2023-05-10'),
(7,6,'Inquiry','Details for interaction 71','2023-04-07'),
(8,9,'Complaint','Details for interaction 63','2023-10-22'),
(9,4,'Complaint','Details for interaction 34','2024-01-21'),
(10,1,'Complaint','Details for interaction 17','2023-10-01'),
(11,1,'Inquiry','Details for interaction 48','2024-01-26'),
(12,6,'Complaint','Details for interaction 64','2024-03-18'),
(13,4,'Inquiry','Details for interaction 65','2023-08-13'),
(14,3,'Complaint','Details for interaction 37','2023-09-25'),
(15,6,'Complaint','Details for interaction 63','2024-03-31'),
(16,2,'Inquiry','Details for interaction 61','2023-09-21'),
(17,9,'Inquiry','Details for interaction 26','2023-04-18'),
(18,1,'Complaint','Details for interaction 27','2023-09-29'),
(19,8,'Complaint','Details for interaction 27','2023-11-10'),
(20,2,'Inquiry','Details for interaction 99','2023-06-08'),
(21,2,'Complaint','Details for interaction 2','2024-01-31'),
(22,9,'Inquiry','Details for interaction 89','2023-11-18'),
(23,3,'Complaint','Details for interaction 36','2023-06-29'),
(24,8,'Complaint','Details for interaction 11','2024-02-22'),
(25,3,'Inquiry','Details for interaction 80','2024-01-05'),
(26,9,'Complaint','Details for interaction 86','2023-05-26'),
(27,8,'Complaint','Details for interaction 2','2023-04-24'),
(28,7,'Inquiry','Details for interaction 12','2023-08-12'),
(29,9,'Complaint','Details for interaction 78','2023-11-03'),
(30,8,'Inquiry','Details for interaction 63','2023-11-27'),
(31,9,'Complaint','Details for interaction 32','2023-11-09'),
(32,1,'Complaint','Details for interaction 3','2024-03-26'),
(33,1,'Complaint','Details for interaction 61','2023-09-06'),
(34,1,'Inquiry','Details for interaction 97','2023-05-13'),
(35,6,'Complaint','Details for interaction 52','2023-06-20'),
(36,5,'Inquiry','Details for interaction 32','2023-11-01'),
(37,2,'Inquiry','Details for interaction 61','2024-02-07'),
(38,10,'Complaint','Details for interaction 43','2023-11-16'),
(39,7,'Complaint','Details for interaction 16','2023-06-29'),
(40,4,'Complaint','Details for interaction 14','2023-11-18'),
(41,5,'Complaint','Details for interaction 84','2023-11-01'),
(42,7,'Inquiry','Details for interaction 95','2023-10-16'),
(43,5,'Complaint','Details for interaction 100','2023-07-26'),
(44,5,'Complaint','Details for interaction 94','2023-05-22'),
(45,6,'Complaint','Details for interaction 88','2024-03-14'),
(46,7,'Complaint','Details for interaction 91','2023-04-16'),
(47,2,'Inquiry','Details for interaction 33','2023-11-03'),
(48,1,'Complaint','Details for interaction 87','2023-08-21'),
(49,6,'Inquiry','Details for interaction 13','2023-11-11'),
(50,7,'Inquiry','Details for interaction 54','2024-03-14');

-- 15. Feedback table
DROP TABLE IF EXISTS `t_CustomerFeedback`;
CREATE TABLE `t_CustomerFeedback`(
	`Feedback_ID` INT NOT NULL auto_increment,
    `Customer_ID` INT NOT NULL,
    `Policy_ID` INT NOT NULL,
	`Rating` INT NOT NULL,
	`Comments` VARCHAR(50) NOT NULL,
    `FeedbackDate` DATE NOT NULL,
	PRIMARY KEY (`Feedback_ID`),
	FOREIGN KEY (`Customer_ID`) REFERENCES `t_MasterCustomer`(`Cust_ID`),
    FOREIGN KEY (`Policy_ID`) REFERENCES `t_PolicyDetails`(`Policy_ID`)
);
-- Inserting records into t_CustomerFeedback table
INSERT INTO t_CustomerFeedback(Feedback_ID,Customer_ID,Policy_ID,Rating,Comments,FeedbackDate)
VALUES
(1,7,3,1,'Feedback comment 69','2024-01-20'),
(2,10,3,2,'Feedback comment 90','2023-10-02'),
(3,9,7,4,'Feedback comment 77','2023-08-23'),
(4,8,1,4,'Feedback comment 81','2023-07-16'),
(64,6,1,3,'Feedback comment 49','2023-05-21'),
(65,10,2,4,'Feedback comment 2','2024-03-15'),
(66,3,3,2,'Feedback comment 7','2024-01-02'),
(67,2,8,3,'Feedback comment 30','2023-05-18'),
(68,6,3,3,'Feedback comment 64','2023-07-11'),
(69,9,9,5,'Feedback comment 87','2023-08-19'),
(70,6,1,3,'Feedback comment 29','2023-04-23'),
(71,10,9,3,'Feedback comment 51','2023-12-15'),
(72,1,3,1,'Feedback comment 51','2023-11-16'),
(73,5,2,2,'Feedback comment 27','2023-12-26'),
(74,7,4,4,'Feedback comment 76','2023-09-22'),
(75,5,6,4,'Feedback comment 31','2023-08-09'),
(76,5,2,2,'Feedback comment 18','2023-04-20'),
(77,4,7,3,'Feedback comment 21','2023-07-31'),
(78,9,1,4,'Feedback comment 74','2023-12-05'),
(79,6,5,5,'Feedback comment 24','2023-11-26'),
(80,2,5,1,'Feedback comment 78','2023-07-07'),
(81,5,10,3,'Feedback comment 63','2023-08-30'),
(82,2,10,3,'Feedback comment 38','2023-10-23'),
(83,2,6,5,'Feedback comment 38','2023-04-29'),
(84,6,2,1,'Feedback comment 57','2023-06-19'),
(85,4,2,5,'Feedback comment 22','2024-01-22'),
(86,5,5,5,'Feedback comment 31','2023-07-08'),
(87,9,1,3,'Feedback comment 36','2023-12-07'),
(88,7,1,4,'Feedback comment 84','2023-12-20'),
(89,10,1,3,'Feedback comment 83','2023-05-22'),
(90,10,1,2,'Feedback comment 77','2023-07-20'),
(91,3,3,3,'Feedback comment 73','2024-03-09'),
(92,3,10,1,'Feedback comment 90','2023-04-23'),
(93,2,8,2,'Feedback comment 33','2023-07-17'),
(94,7,1,2,'Feedback comment 56','2023-07-12'),
(95,1,10,4,'Feedback comment 79','2023-07-28'),
(96,2,7,4,'Feedback comment 25','2023-11-25'),
(97,2,5,1,'Feedback comment 63','2024-03-07'),
(98,6,7,2,'Feedback comment 75','2023-06-19'),
(99,8,5,1,'Feedback comment 64','2024-02-09'),
(100,9,10,2,'Feedback comment 12','2023-04-30'),
(101,4,1,1,'Feedback comment 1','2023-04-15'),
(102,9,6,5,'Feedback comment 82','2023-10-23'),
(103,9,10,1,'Feedback comment 37','2023-07-12'),
(104,7,9,3,'Feedback comment 58','2023-08-29'),
(105,4,8,4,'Feedback comment 5','2023-12-10'),
(106,5,5,5,'Feedback comment 91','2023-05-06'),
(107,10,9,2,'Feedback comment 15','2023-07-07'),
(108,4,5,2,'Feedback comment 32','2023-09-27'),
(109,7,9,3,'Feedback comment 31','2023-12-06'),
(110,8,9,5,'Feedback comment 89','2023-07-01'),
(111,3,8,1,'Feedback comment 24','2023-05-20'),
(112,8,10,4,'Feedback comment 64','2024-04-04'),
(113,2,8,2,'Feedback comment 64','2024-04-07');

-- MAJOR QUERIES 

-- 1. List all policies along with the insurance company details.(company name, address, contact information) 
SELECT 
    PD.Policy_ID,
    PD.PolicyName,
    IC.Company_Name,
    CA.Street AS Company_Street,
    CA.Apartment AS Company_Apartment,
    CA.City AS Company_City,
    CA.State AS Company_State,
    CA.Country AS Company_Country,
    CA.ZipCode AS Company_ZipCode,
    CC.Mobile AS Company_Mobile,
    CC.Email_ID AS Company_Email
FROM 
    t_PolicyDetails PD
INNER JOIN 
    t_InsuranceCompany IC ON PD.Company_ID = IC.Company_ID
INNER JOIN 
    t_CompanyAddress CA ON PD.Company_ID = CA.Company_ID
INNER JOIN 	
    t_CompanyContact CC ON PD.Company_ID = CC.Company_ID;

-- select * from t_PolicyDetails;
-- select * from t_InsuranceCompany;

-- 2.Get the count of policies of each type sold in a specific city.

SELECT 
    PD.Policy_type,
    COUNT(*) AS Policy_Count
FROM 
    t_PolicyDetails PD
JOIN 
    t_CustomerInsurance CI ON PD.Policy_ID = CI.Policy_ID
JOIN 
    t_MasterCustomer MC ON CI.Cust_ID = MC.Cust_ID
JOIN 
    t_CustomerAddress CA ON MC.Cust_ID = CA.Cust_ID
WHERE 
    CA.City = 'Atlanta'
GROUP BY 
    PD.Policy_type;

-- Select * from t_customerinsurance;

-- 3.Calculate the total premium collected for each policy type.
SELECT 
    pd.Policy_type,
    COUNT(pd.Policy_ID) AS NumberOfPolicies,
    SUM(ci.BasePremium) AS TotalPremiumCollected
FROM 
    t_PolicyDetails as pd
INNER JOIN 
    t_CustomerInsurance as ci 
    ON pd.Policy_ID = ci.Policy_ID
GROUP BY 
    pd.Policy_type
Order by 
	TotalPremiumCollected desc;

-- 4.Find customers who have not made any claims yet
    SELECT 
    mc.Cust_ID,
    mc.FirstName,
    mc.LastName
FROM 
    t_MasterCustomer as mc
LEFT JOIN 
    t_Claims as cl 
    ON mc.Cust_ID = cl.Cust_ID
WHERE 
    cl.Cust_ID is null;

-- 5.List all customers who have policies that are due for renewal next month

SELECT CI.cust_ID,(SELECT 
    concat(mc.FirstName,' ',mc.LastName)
FROM 
    t_MasterCustomer MC where MC.cust_ID=CI.cust_ID) as Customer_Name,CI.Policy_ID
FROM t_CustomerInsurance CI
WHERE MONTH(End_Date) = MONTH(DATE_ADD(CURRENT_DATE, INTERVAL 1 MONTH))
AND YEAR(End_Date) = YEAR(DATE_ADD(CURRENT_DATE, INTERVAL 1 MONTH));

-- 6.List all customers who have policies with a coverage amount greater than the average coverage amount.
-- Here we have takne average of all the policies having specific coverage amount of different customers 
SELECT ci.Cust_ID, ci.Policy_ID, mc.FirstName, mc.LastName, ci.CoverageAmount, (select AVG(CoverageAmount)
    FROM t_customerinsurance) as Avg_coverage
FROM t_customerinsurance ci
-- Using the INNER JOIN, it matches the Cust_ID between the t_customerinsurance and t_MasterCustomer tables to retrieve customer information
INNER JOIN t_MasterCustomer mc
on ci.Cust_ID=mc.Cust_Id
-- Filters the result set to include only rows where the CoverageAmount in ci is greater than the average coverage amount calculated in the subquery.
WHERE CoverageAmount > (
    SELECT AVG(CoverageAmount)
    FROM t_customerinsurance
);

-- select * from t_customerinsurance;

-- 7 This query identifies customers who have more than one active policy and retrieves their details. 

SELECT
    MC.Cust_ID,
    MC.FirstName,
    MC.LastName,
    MC.DOB,
    MC.Gender,
    MC.Nominees,
    MC.Dependents,
    MC.MaritalStatus,
    MC.Occupation,
-- This counts the number of active policies for each customer in the t_CustomerInsurance table (CI) and gives it an alias ActivePolicies in the result set.
    COUNT(CI.Policy_ID) AS ActivePolicies
FROM
    t_MasterCustomer MC
-- now joining two tables based on cust id and this ensures that only records with matching Cust_ID values are included in the result set
    JOIN t_CustomerInsurance CI ON MC.Cust_ID = CI.Cust_ID
WHERE
    CI.End_Date > CURDATE()
-- The GROUP BY clause ensures that the COUNT function operates on each group of Cust_ID values.
GROUP BY
    MC.Cust_ID
HAVING
    COUNT(CI.Policy_ID) > 1;

-- select * from t_MasterCustomer;
-- select * from t_CustomerInsurance;

-- 8.This query retrieves statistics for each policy, including the total number of claims,- total claim amount, and average claim amount

SELECT
    PD.Policy_ID,
    PD.PolicyName,
-- Counts the number of claims for each policy
	Count(C.Policy_ID) AS TotalClaims,
    SUM(C.ClaimAmount) AS TotalClaimAmount,
    AVG(C.ClaimAmount) AS AverageClaimAmount
FROM
    t_Claims C
    JOIN t_PolicyDetails PD ON C.Policy_ID = PD.Policy_ID
GROUP BY
    PD.Policy_ID, PD.PolicyName;

-- select * from t_claims;
-- select * from t_policydetails;

 -- 9.	Query to Retrieve Customer Information along with Policy Details and Agent Details
 
SELECT
    c.Cust_ID,
    c.FirstName AS Customer_FirstName,
    c.LastName AS Customer_LastName,
    c.DOB AS Customer_DOB,
    c.Gender AS Customer_Gender,
    c.Occupation AS Customer_Occupation,
    a.First_Name AS Agent_FirstName,
    a.Last_Name AS Agent_LastName,
    p.Policy_ID,
    p.PolicyName AS Policy_Name,
    p.Policy_type AS Policy_Type,
    p.BasePremium AS Base_Premium,
    ci.Start_Date AS Policy_Start_Date,
    ci.End_Date AS Policy_End_Date,
    ci.CoverageAmount AS Policy_CoverageAmount
FROM
    t_MasterCustomer c
-- Joins the t_CustomerInsurance table (ci) with the t_MasterCustomer table (c) based on the Cust_ID.
JOIN
    t_CustomerInsurance ci ON c.Cust_ID = ci.Cust_ID
JOIN
    t_PolicyDetails p ON ci.Policy_ID = p.Policy_ID
JOIN
    t_AgentDetails a ON ci.Agent_ID = a.Agent_ID
ORDER BY
    c.Cust_ID;

-- 10.List all customers along with the total amount of claims they have made.
SELECT
    MC.Cust_ID,
    MC.FirstName,
    MC.LastName,
-- calculating claim id for each cust id  from t_claims
    COUNT(C.Claim_ID) AS TotalClaimsMade
FROM
    t_MasterCustomer MC
	JOIN t_Claims C ON MC.Cust_ID = C.Cust_ID
GROUP BY
    MC.Cust_ID;

-- Select * from t_mastercustomer;
-- select * from t_claims;


-- FUNCTIONS

-- 1. Function to calculate the number of claims filed for a specific policy.

Drop function if exists GetClaimCountForPolicy;
DELIMITER //
CREATE FUNCTION GetClaimCountForPolicy(policyID INT)
 RETURNS INT
 Deterministic
BEGIN
    DECLARE claimCount INT;

    SELECT COUNT(*) INTO claimCount
    FROM t_Claims
    WHERE Policy_ID = policyID;

    RETURN claimCount;
END //
DELIMITER ;

 -- To use this function:
SELECT GetClaimCountForPolicy(3);
SELECT 
    Policy_ID,
    PolicyName,
    Policy_type,
    BasePremium,
    GetClaimCountForPolicy(Policy_ID) AS NumClaims
FROM 
    t_PolicyDetails;

-- 2 Calculate a customer's age based on their date of birth.

Drop function if exists CalculateCustomerAge;
DELIMITER //
CREATE FUNCTION CalculateCustomerAge(DOB DATE)
RETURNS INT
Deterministic
BEGIN
    DECLARE age INT;
    DECLARE today DATE;
    
    -- Get the current date
    SET today = CURDATE();
    
    -- Calculate the difference in years between the current date and the date of birth
    SET age = YEAR(today) - YEAR(DOB);
    
    -- Adjust the age if the birthday hasn't occurred yet this year
    IF DATE_FORMAT(today, '%m-%d') < DATE_FORMAT(DOB, '%m-%d') THEN
        SET age = age - 1;
    END IF;
    
    -- Return the calculated age
    RETURN age;
END//
DELIMITER ;

SELECT
    c.Cust_ID,
    c.FirstName,
    c.LastName,
    c.DOB,
    CalculateCustomerAge(c.DOB) AS Customer_Age
FROM
    t_MasterCustomer c
ORDER BY
    c.Cust_ID;
    
-- 3. Show policy status based on renewal dates. i.e if its past renewal data status is closed, otherwise running.

drop function if exists show_policy_status;
delimiter //
create function show_policy_status(
customerId int,
policyId int
)
returns varchar(30)
deterministic
BEGIN
declare policy_status_var varchar(30);
select case 
		when end_date>sysdate() then 'Active'
        else 'Inactive'
	   end 
into policy_status_var
from t_customerinsurance 
where policy_id=policyId and cust_id=customerId;
return (policy_status_var);
end //
delimiter ;

select *,show_policy_status(cust_id,policy_id) 
from t_customerinsurance;

-- 4. Function to get the premium payment status
Drop function if exists CheckPremiumPayment;
DELIMITER //
CREATE FUNCTION CheckPremiumPayment(
    custid INT,
    policyid INT
) RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE premium_status VARCHAR(50);

    -- Check if the premium has been paid for the current month
    SELECT PaymentStatus INTO premium_status
    FROM t_CustomerPayment
    WHERE Cust_ID = custid
    AND Policy_ID = policyid
    AND MONTH(PaymentDate) = MONTH(CURRENT_DATE())
    AND YEAR(PaymentDate) = YEAR(CURRENT_DATE())
    LIMIT 1;

    -- If premium_status is not NULL then return premium_status
    IF premium_status IS NOT NULL THEN
        RETURN premium_status;
    ELSE
        RETURN 'Premium Not Paid';
    END IF;
END//
DELIMITER ;

select CheckPremiumPayment(4,3);
select CheckPremiumPayment(3,9);
select CheckPremiumPayment(7,1);

-- 5.Determine the duration between policy start and end dates

Drop function if exists CalculatePolicyDuration;
DELIMITER //
CREATE FUNCTION CalculatePolicyDuration(Start_Date DATE, End_Date DATE)
RETURNS INT
Deterministic
BEGIN
    DECLARE duration INT;
    
    -- Calculate the difference in days between End_Date and Start_Date
    SET duration = DATEDIFF(End_Date, Start_Date);
    
    -- Return the duration in days
    RETURN duration;
END//
DELIMITER ;

SELECT
	ci.cust_id,
    ci.Policy_ID,
    ci.Start_Date,
    ci.End_Date,
    CalculatePolicyDuration(ci.Start_Date, ci.End_Date) AS Policy_Duration_Days
FROM
    t_CustomerInsurance ci
ORDER BY
    ci.Policy_ID;
    
    
-- Stored Procedures.

--  1. To get all the details of the policies sold by a specific agent.
DROP PROCEDURE IF EXISTS GetPoliciesSoldByAgent;
DELIMITER //
CREATE PROCEDURE GetPoliciesSoldByAgent(IN agentID INT)
BEGIN
    SELECT 
        PD.Policy_ID,
        PD.PolicyName,
        IC.Company_Name,
        CI.Start_Date,
        CI.End_Date,
        CI.BasePremium,
        CI.CoverageAmount,
        CI.Cust_ID
    FROM 
        t_CustomerInsurance CI
    JOIN 
        t_PolicyDetails PD ON CI.Policy_ID = PD.Policy_ID
    JOIN 
        t_InsuranceCompany IC ON PD.Company_ID = IC.Company_ID
    WHERE 
        CI.Agent_ID = agentID;
END //
DELIMITER ;	

-- To use this stored procedure:
CALL GetPoliciesSoldByAgent(1);

-- 2.Calculate the total premium collected between specified dates

DROP PROCEDURE IF EXISTS CalculatePremiumBetweenDates;
DELIMITER //
CREATE PROCEDURE CalculatePremiumBetweenDates(IN start_date DATE, IN end_date DATE)
BEGIN
    SELECT 
        SUM(ci.BasePremium) AS TotalPremiumCollected
    FROM 
        t_CustomerInsurance ci
    WHERE 
        ci.Start_Date >= start_date
        AND ci.Start_Date <= end_date;
END //
DELIMITER ;
CALL CalculatePremiumBetweenDates('2023-01-01', '2023-03-31');

-- 3.	Retrieve the count of policies sold to customers in a specific age group. 

drop procedure if exists total_policies_by_age_group;
Delimiter //
create procedure total_policies_by_age_group(
smaller_age INT,
bigger_age INT
)
BEGIN
 -- declare total_policies_var INT;
 select policy_type,count(Cust_ID) as policy_count
 from t_customerinsurance
 where Cust_ID 
 in (select Cust_ID
 from t_masterCustomer
  where CalculateCustomerAge(DOB) between smaller_age and bigger_age)
 group by policy_type;
end //
delimiter ;

call total_policies_by_age_group(25,45);

-- 4 -- Generate a monthly summary report of claims settled. Ie.total amount of claims applied, claims settled, balance. 

DROP PROCEDURE IF EXISTS MonthlyClaimsSummaryReport;
DELIMITER //
CREATE PROCEDURE MonthlyClaimsSummaryReport(IN month_year CHAR(7))
BEGIN
    DECLARE input_month INT;
    DECLARE input_year INT;
    DECLARE total_applied DECIMAL(10, 2);
    DECLARE total_settled DECIMAL(10, 2);
    DECLARE balance DECIMAL(10, 2);

    -- Extract month and year from input parameter
    SET input_month = MONTH(STR_TO_DATE(CONCAT(month_year, '-01'), '%Y-%m-%d'));
    SET input_year = YEAR(STR_TO_DATE(CONCAT(month_year, '-01'), '%Y-%m-%d'));

    -- Calculate total amount of claims applied in the given month and year
    SELECT COALESCE(SUM(ClaimAmount), 0) INTO total_applied
    FROM t_Claims
    WHERE MONTH(Claim_date) = input_month AND YEAR(Claim_date) = input_year;

    -- Calculate total amount of claims settled in the given month and year
    SELECT COALESCE(SUM(SettledAmount), 0) INTO total_settled
    FROM t_ClaimSettlement
    JOIN t_Claims ON t_ClaimSettlement.Claim_ID = t_Claims.Claim_ID
    WHERE MONTH(SettlementDate) = input_month AND YEAR(SettlementDate) = input_year;

    -- Calculate balance
    SET balance = total_applied - total_settled;

    -- Display the summary report
    SELECT CONCAT('Monthly Summary Report for ', month_year) AS 'Month',
           total_applied AS 'Total Amount of Claims Applied',
           total_settled AS 'Total Amount of Claims Settled',
           balance AS 'Balance';
END //
DELIMITER ;

CALL MonthlyClaimsSummaryReport('2024-04');
CALL MonthlyClaimsSummaryReport('2024-03');
CALL MonthlyClaimsSummaryReport('2023-06');

-- 5.	Assign policies to agents based on certain criteria. i.e identify the most number of policy sold by a agents and suggest those policy to that agent.

DROP PROCEDURE IF EXISTS AssignPoliciesToAgents;
DELIMITER //

CREATE PROCEDURE AssignPoliciesToAgents()
BEGIN
    -- Temporary table to hold the results
    CREATE TEMPORARY TABLE MaxSoldPolicyTypePerAgent (
        Agent_ID INT,
        Policy_Type VARCHAR(100),
        Max_Sold_Count INT
    );

    -- Insert the agent ID and the policy type with the maximum sold count for each agent
    INSERT INTO MaxSoldPolicyTypePerAgent (Agent_ID, Policy_Type, Max_Sold_Count)
    SELECT ci.Agent_ID, ci.Policy_Type, COUNT(*) AS Max_Sold_Count
    FROM t_CustomerInsurance ci
    GROUP BY ci.Agent_ID, ci.Policy_Type
    HAVING COUNT(*) = (
        SELECT MAX(SoldCount)
        FROM (
            SELECT Agent_ID, Policy_Type, COUNT(*) AS SoldCount
            FROM t_CustomerInsurance
            GROUP BY Agent_ID, Policy_Type
        ) AS Subquery
        WHERE Subquery.Agent_ID = ci.Agent_ID
    );

    -- Select the results from the temporary table
  SELECT 
    m.Agent_ID,
    Concat (a.First_Name,' ',
    a.Last_Name) as Agent_Name,
    m.Policy_Type,
    m.Max_Sold_Count
FROM 
    MaxSoldPolicyTypePerAgent m
JOIN 
    t_AgentDetails a ON m.Agent_ID = a.Agent_ID;

    -- Drop the temporary table
    DROP TEMPORARY TABLE IF EXISTS MaxSoldPolicyTypePerAgent;
END //
DELIMITER ;

call AssignPoliciesToAgents();


-- Trigger

-- 1. DELETION TRIGGER : If we delete a customer payment from the customer payment table then it gets stored in the audit table

DROP TABLE IF EXISTS `t_CustomerPayment_audit`;
CREATE TABLE `t_CustomerPayment_audit`(
	`Transaction_ID` INT NOT NULL AUTO_INCREMENT,
	`Cust_ID` INT NOT NULL,
	`Policy_ID` INT NOT NULL,
	`AmountReceived` DECIMAL(10, 2) NOT NULL,
	`PaymentDate` DATE NOT NULL,
	`PaymentStatus` VARCHAR(50) NOT NULL,
    `Action` Varchar(50) Default null,
    `ChangeDate` Varchar(50) Default null,
	PRIMARY KEY (`Transaction_ID`)
    );
drop trigger if exists before_customer_payment_delete;
Create trigger before_customer_payment_delete 
	-- Specifies that the trigger should activate before a record is deleted from the 
    Before Delete on t_CustomerPayment
    for each row
    Insert into t_CustomerPayment_audit
    set Action = 'Delete',
    Transaction_ID = old.Transaction_ID,
	Cust_ID = Old.Cust_ID,
	Policy_ID = old.Policy_ID,
	AmountReceived = old.AmountReceived,
	PaymentDate = old.PaymentDate,
    PaymentStatus = old.PaymentStatus,
    ChangeDate = NOW();
    
    Delete from t_CustomerPayment where Transaction_ID = 2;
    Select * from t_CustomerPayment_audit;
    Select * from t_CustomerPayment;
    
    
-- 2. INSERT TRIGGER - Update the claim status in the claims tables as soon as there is an entry for that claim in claim_settlement table
-- Claims audit table
DROP TABLE IF EXISTS `t_Claims_aud`;
CREATE TABLE `t_Claims_aud`(
	`Claim_ID` INT NOT NULL AUTO_INCREMENT,
    `Cust_ID` INT NOT NULL,
    `Policy_ID` INT NOT NULL,
    `ClaimAmount` DECIMAL(10,2) NOT NULL,
    `Status` VARCHAR(100) NOT NULL,
    `Claim_date` DATE NOT NULL,
    PRIMARY KEY (`Claim_ID`)
);

drop trigger if exists update_claim_status;
delimiter //
create trigger update_claim_status
		after insert on t_claimsettlement
        for each row
        BEGIN
    -- Check if there is an entry in the claims settlement table for the claim being settled
    IF EXISTS (
        SELECT 1
        FROM t_claimsettlement
        WHERE claim_id = NEW.claim_id
    ) THEN
        -- Update the claim status to settled
        Insert into t_claims_aud select * from t_claims where claim_id=NEW.claim_id;
        UPDATE t_claims
        SET status = 'settled'
        WHERE claim_id = NEW.claim_id;
    END IF;
END //
delimiter ;
-- INSERT INTO t_ClaimSettlement (Transaction_ID, Claim_ID, SettledAmount, SettlementDate) VALUES (9,11000.00,'2022-06-28');
-- select * from t_claims where claim_id=9;
-- select * from t_claims_aud where claim_id=9;

-- 3. UPDATION TRIGGER: If the customer updates his contact info then their old contact gets stored in the audit table
-- Customer Contact audit table
DROP TABLE IF EXISTS t_CustomerContactAudit;
CREATE TABLE `t_CustomerContactAudit`(
	`Cust_ID` INT NOT NULL,
	`Mobile` VARCHAR(20) NOT NULL,
	`Email_ID` VARCHAR(255) NOT NULL,
	PRIMARY KEY (Cust_ID)
);

DROP TRIGGER IF EXISTS trg_update_customer_payment;
DELIMITER //
CREATE TRIGGER trg_update_customer_payment
AFTER UPDATE ON `t_CustomerContact`
FOR EACH ROW
BEGIN
    -- Insert the change into the audit table
    INSERT INTO `t_CustomerContactAudit` 
   select * from t_CustomerContact where Cust_ID=OLD.cust_id;
END;
//
DELIMITER ;

-- Update the mobile number for a specific customer
UPDATE `t_CustomerContact` SET `Mobile` = '7006527928' WHERE `Cust_ID` = 2;
select * from t_customercontact;
select * from t_customercontactaudit;
















