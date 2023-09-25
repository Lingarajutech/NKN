CREATE TABLE dbo.[Country] (
   ID int NOT NULL PRIMARY KEY IDENTITY (1,1),
   State varchar(255) NOT NULL,
   Country varchar(255) NOT NULL,
   CreatedUserId INT,
   CreatedDateTime DATETIME Default Getdate(),
   UpdatedUserId INT,
   UpdatedDateTime DATETIME Default Getdate(),
   Version INT Default 1
);

CREATE TABLE dbo.[Tenant] (
   ID int NOT NULL PRIMARY KEY IDENTITY (1,1),
   TenantName varchar(255) NOT NULL,
   AddressLine1 varchar(200),
   AddressLine2 varchar(200),
   City varchar(200),
   ZipCode Varchar(10),
   CountryID int,
   CreatedUserId INT,
   CreatedDateTime DATETIME Default Getdate(),
   UpdatedUserId INT,
   UpdatedDateTime DATETIME Default Getdate(),
   Version INT Default 1 ,
   FOREIGN KEY (CountryID) REFERENCES Country(ID)
);


CREATE TABLE dbo.[Company] (
   ID int NOT NULL PRIMARY KEY IDENTITY (1,1),
   CompanyCode varchar(50) NOT NULL,
   TenantID int NOT NULL,
   CompanyName varchar(255) NOT NULL,
   Discipline varchar(255) NOT NULL,
   AddressLine1 varchar(200),
   AddressLine2 varchar(200),
   City varchar(200),
   ZipCode Varchar(10),
   CountryID int,
   CreatedUserId INT,
   CreatedDateTime DATETIME Default Getdate(),
   UpdatedUserId INT,
   UpdatedDateTime DATETIME Default Getdate(),
   Version INT Default 1,
   FOREIGN KEY (CountryID) REFERENCES Country(ID),
   FOREIGN KEY (TenantID) REFERENCES Tenant(ID)
);

CREATE TABLE dbo.[Codes] (
   ID int NOT NULL PRIMARY KEY IDENTITY (1,1),
   GroupName varchar(50) NOT NULL,
   Code int NOT NULL,
   Description varchar(255) NOT NULL,
   CreatedUserId INT,
   CreatedDateTime DATETIME Default Getdate(),
   UpdatedUserId INT,
   UpdatedDateTime DATETIME Default Getdate(),
   Version INT Default 1
);

CREATE TABLE dbo.[user] (
    ID int NOT NULL PRIMARY KEY IDENTITY (1,1),
    UserName varchar(50) NOT NULL,
	AuthProviderCodeID int NOT NULL,
	Status varchar(10) NOT NULL,
	CompanyId int NOT NULL,
	LastName varchar(100),
    FirstName varchar(100),
	AddressLine1 varchar(200),
	AddressLine2 varchar(200),
	City varchar(200),
	ZipCode Varchar(10),
	CountryID int,
	Phonenumber varchar(12),
	CreatedUserId INT,
    CreatedDateTime DATETIME Default Getdate(),
	UpdatedUserId INT,
	UpdatedDateTime DATETIME Default Getdate(),
	Version INT Default 1
    FOREIGN KEY (CompanyId) REFERENCES Company(ID)
);

CREATE TABLE dbo.[Role] (
   ID int NOT NULL PRIMARY KEY IDENTITY (1,1),
   RoleName varchar(100) NOT NULL,
   Description varchar(255),
   CreatedUserId INT,
   CreatedDateTime DATETIME Default Getdate(),
   UpdatedUserId INT,
   UpdatedDateTime DATETIME Default Getdate(),
   Version INT Default 1
);

CREATE TABLE dbo.[UserRole] (
   ID int NOT NULL PRIMARY KEY IDENTITY (1,1),
   UserId int NOT NULL,
   RoleID int NOT NULL,
   CreatedUserId INT,
   CreatedDateTime DATETIME Default Getdate(),
   UpdatedUserId INT,
   UpdatedDateTime DATETIME Default Getdate(),
   Version INT Default 1,
   FOREIGN KEY (UserId) REFERENCES [User](ID),
   FOREIGN KEY (RoleID) REFERENCES [Role](ID)
);

CREATE TABLE dbo.[Entitlement] (
   ID int NOT NULL PRIMARY KEY IDENTITY (1,1),
   EntitlementName varchar(100) NOT NULL,
   Description varchar(255),
   CreatedUserId INT,
   CreatedDateTime DATETIME Default Getdate(),
   UpdatedUserId INT,
   UpdatedDateTime DATETIME Default Getdate(),
   Version INT Default 1
);

CREATE TABLE dbo.[RoleEntitlement] (
   ID int NOT NULL PRIMARY KEY IDENTITY (1,1),
   RoleID int NOT NULL,
   EntitlementID int NOT NULL,
   CreatedUserId INT,
   CreatedDateTime DATETIME Default Getdate(),
   UpdatedUserId INT,
   UpdatedDateTime DATETIME Default Getdate(),
   Version INT Default 1,
   FOREIGN KEY (EntitlementID) REFERENCES Entitlement(ID),
   FOREIGN KEY (RoleID) REFERENCES [Role](ID)
);




