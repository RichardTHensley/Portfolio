IF NOT EXISTS(SELECT name FROM master.dbo.sysdatabases			
	WHERE name = N'DPeakPerformanceDM')
	
	CREATE DATABASE DPeakPerformanceDM--Created for Data Warehousing Project 
--10/10/23
--

--CrBASE DPeakPerformanceDM
GO

USE DPeakPerformanceDM
GO
--
--Drop the tables if exist
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'FactMembershipPurchase')

	DROP TABLE FactMembershipPurchase;
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'DimFitnessAdvisor')

	DROP TABLE DimFitnessAdvisor;
--
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'DimMembership')

	DROP TABLE DimMembership;
-- 
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'DimMember')

	DROP TABLE DimMember;
-- 
IF EXISTS(
	SELECT *
	FROM sys.tables
	WHERE NAME = N'DimDate')

	DROP TABLE DimDate;
-- 




CREATE TABLE DimDate
	(
	PurchaseDate				INT PRIMARY KEY, 
	Date				DATE,
	FullDate			NCHAR(10),-- Date in MM-dd-yyyy format
	DayOfMonth			INT, -- Field will hold day number of Month
	DayName				NVARCHAR(9), -- Contains name of the day, Sunday, Monday 
	DayOfWeek			INT,-- First Day Sunday=1 and Saturday=7
	DayOfWeekInMonth	INT, -- 1st Monday or 2nd Monday in Month
	DayOfWeekInYear		INT,
	DayOfQuarter		INT,
	DayOfYear			INT,
	WeekOfMonth			INT,-- Week Number of Month 
	WeekOfQuarter		INT, -- Week Number of the Quarter
	WeekOfYear			INT,-- Week Number of the Year
	Month				INT, -- Number of the Month 1 to 12{}
	MonthName			NVARCHAR(9),-- January, February etc
	MonthOfQuarter		INT,-- Month Number belongs to Quarter
	Quarter				NCHAR(2),
	QuarterName			NVARCHAR(9),-- First,Second..
	Year				INT,-- Year value of Date stored in Row
	YearName			CHAR(7), -- CY 2017,CY 2018
	MonthYear			CHAR(10), -- Jan-2018,Feb-2018
	MMYYYY				INT,
	FirstDayOfMonth		DATE,
	LastDayOfMonth		DATE,
	FirstDayOfQuarter	DATE,
	LastDayOfQuarter	DATE,
	FirstDayOfYear		DATE,
	LastDayOfYear		DATE,
	IsHoliday			BIT,-- Flag 1=National Holiday, 0-No National Holiday
	IsWeekday			BIT,-- 0=Week End ,1=Week Day
	Holiday				NVARCHAR(50),--Name of Holiday in US
	Season				NVARCHAR(10)--Name of Season
	);
--
CREATE TABLE DimMember
	(
	Member_SK		INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
	Member_AK		INT NOT NULL,
	MemberFirstName	NVARCHAR(100)  NOT NULL,
	MemberLastName	NVARCHAR(100) NOT NULL,
	MemberGender		NVARCHAR(7) NOT NULL,
	MemberAge      INT NOT NULL,
	IsStudent        INT NOT NULL
	);
--
CREATE TABLE DimMembership
	(
	Membership_SK			INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Membership_AK			INT NOT NULL,
	MembershipType			NVARCHAR(20) NOT NULL,
	MembershipCost			MONEY NOT NULL
	--MembershipJoinedDate				NCHAR(10) NOT NULL,-- Date in MM-dd-yyyy format
	--IsRenewal			INT NOT NULL
	);
--
CREATE TABLE DimFitnessAdvisor
	(
	Advisor_SK			INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Advisor_AK			INT NOT NULL,
	AdvisorFirstName	NVARCHAR(100)  NOT NULL,
	AdvisorLastName	NVARCHAR(100) NOT NULL,
	AdvisorAge			INT NOT NULL,
	AdvisorGender       NVARCHAR(7) NOT NULL
	);
--
CREATE TABLE FactMembershipPurchase
	(
	Member_SK		INT NOT NULL,
	Membership_SK			INT NOT NULL,
	Advisor_SK			INT NOT NULL,
	PurchaseDate				INT NOT NULL,
	TransactionID				INT NOT NULL,
	TransactionFee       MONEY NOT NULL
	CONSTRAINT pk_TransactionID PRIMARY KEY (Member_SK,Membership_SK,Advisor_Sk,PurchaseDate,TransactionID),
	CONSTRAINT fk_FactMembershipPurchase_DimDate FOREIGN KEY (PurchaseDate) REFERENCES DimDate(PurchaseDate),
	CONSTRAINT fk_FactMembershipPurchase_DimMember FOREIGN KEY (Member_SK) REFERENCES DimMember(Member_SK),
	CONSTRAINT fk_FactMembershipPurchase_DimMembership FOREIGN KEY (Membership_SK) REFERENCES DimMembership(Membership_SK),
	CONSTRAINT fk_FactMembershipPurchase_DimAdvisor FOREIGN KEY (Advisor_SK) REFERENCES DimFitnessAdvisor(Advisor_SK)
	);