Insert into dbo.[Country] (State,Country,CreatedUserId,UpdatedUserId)
Select 'Florida', 'USA', 1,1

Insert into dbo.[Tenant] (TenantName,AddressLine1,City,ZipCode,CountryID,CreatedUserId,UpdatedUserId)
Select 'Nateshwaree Kuchipudi Nrutyalaya', '3176 NW 83rd Way','Cooper City','33024',1,1,1

Insert into dbo.[Company] (CompanyCode,TenantID, CompanyName,AddressLine1,City,ZipCode,CountryID,Discipline,CreatedUserId,UpdatedUserId)
Select 'NKN', 1, 'NKN1','8685 Stirling Rd','Cooper City','33328',1,'Kuchipudi Dance',1,1

Insert into dbo.[Codes] (GroupName,Code,Description,CreatedUserId,UpdatedUserId)
Select 'Authentication Provider', '1','Google',1,1
Union
Select 'Authentication Provider', '2','Microsoft',1,1

Insert into dbo.[user] (LastName,FirstName,UserName,AuthProviderCodeID,Status,CompanyId,AddressLine1,City,ZipCode,CountryID,PhoneNumber,CreatedUserId,UpdatedUserId)
select  'Super User', 'Super User', 'slasu@gmail.com', 1,'Active', 1,'3176 NW 83rd Way','Cooper City', 33024,1,'954-423-2635',1,1

Insert into dbo.[user] (LastName,FirstName,UserName,AuthProviderCodeID,Status,CompanyId,AddressLine1,City,ZipCode,CountryID,PhoneNumber,CreatedUserId,UpdatedUserId)
select  'Eunni', 'Mythreyee', 'eunnimythi@gmail.com', 1,'Active', 1,'3176 NW 83rd Way','Cooper City', 33024,1,'313-268-3548',1,1
union
select  'Lingaraju','Naga','anipersonalemail@gmail.com',1,'Active', 1,'3176 NW 83rd Way','Cooper City', 33024,1,'313-268-0906',1,1

Insert into dbo.[Role] (RoleName,Description,CreatedUserId,UpdatedUserId)
Select 'Super User', 'Super User',1,1
Union
Select 'Admin', 'Administrator',1,1

Insert into dbo.[UserRole] (UserId,RoleID,CreatedUserId,UpdatedUserId)
Select 1,1,1,1
Union
Select 2,2,1,1
Union
Select 3,2,1,1

Insert into dbo.[Entitlement] (EntitlementName,Description,CreatedUserId,UpdatedUserId)
Select 'All','Admin',1,1

Insert into dbo.[RoleEntitlement] (RoleID,EntitlementID,CreatedUserId,UpdatedUserId)
Select 1,1,1,1
Union
Select 2,1,1,1

Select * from Country
select * from Tenant
select * from Company
select * from codes
select * from [user]
select * from Role
select * from [UserRole]
select * from Entitlement
select * from RoleEntitlement

--to drop tables
--Drop table [UserRole]
--Drop table RoleEntitlement
--Drop table [user]
--Drop table [Role]
--Drop table Entitlement
--Drop table Company
--Drop table Tenant
--Drop table Country
--Drop table codes
