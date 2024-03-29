USE [13th Aug CLoud PT Immersive]
GO
/****** Object:  StoredProcedure [TeamE].[AddChequeBook]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamE].[AddChequeBook]
 (@accountID uniqueidentifier,@accountNo char(10),@seriesStart decimal,@numberOfLeaves int,@chequeBookStatus varchar(12),@chequeBookRequestDate  DateTime,
		@lastModifiedDate Datetime)
 as
 begin
 DECLARE @chequeBookID uniqueidentifier
set @chequeBookID=NEWID();
 begin try
 
 
--throws error if number of leaves is not multiple of five
if(@numberOfLeaves%5!=0)
	throw 3000,'Number of leaves should me multiple of 5',1;
--throws error if cheque book status is not one among requested or approved
if(@chequeBookStatus!='Requested' and @chequeBookStatus!='Approved')
	throw 3000,'Status of cheque book should be either requested or approved',2;
insert into TeamE.ChequeBook(ChequeBookID ,AccountID,AccountNo,SeriesStart,NumberOfLeaves,ChequeBookStatus,ChequeBookRequestDate,
		LastModifiedDate ) values (@chequeBookID ,@accountID,@accountNo,@seriesStart,@numberOfLeaves,@chequeBookStatus,@chequeBookRequestDate,
		@lastModifiedDate )
		select @@RowCount as column1,@chequeBookID as column2
	end try
begin catch
	throw;
end catch
end 

GO
/****** Object:  StoredProcedure [TeamE].[AddCreditCard]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamE].[AddCreditCard]
( @custID uniqueidentifier, @custName varchar(50),@creditLimit decimal(18,0),@expiry varchar(7),@cardType varchar(20),@cardStatus varchar(12),@cardIssueDate DateTime,@lastModifiedDate Datetime)
as
begin
	declare @creditCardID uniqueidentifier,@cardNumber char(12),@cn int
	set @creditCardID=NEWID();
	
	set @cn=(Select count(*) from TeamE.CreditCard);
	set @cardNumber=(select convert(char(12),(100010001000+@cn)));
	
	
	begin try

		--throws error if customer does not exist


		--throws error if length of customer name is less than 2 or greater than 40
		if ((len(@custName)<=2) or (len(@custName)>=40))
			throw 50100,'Customer name should be beween 2 and 40 characters',1;

		--throws error if length of card number is not equal to 12
		if(len(@cardNumber)!=12)
			 throw 53000,'InvalID card number',1;

		--throws error if credit limit is negative
		

		--throws error if card type is not one among Platinum plus or Visa signature or Infinia
		if(@cardType!='Platinum Plus' and @cardType!='Visa Signature' and @cardType!='Infinia')
			 throw 53000,'Card Type should be Platinum Plus  or Visa Signature or Infinia',1;

		--throws error if card type is not either active or blokced
		if(@cardStatus!='Active' and @cardStatus!='Blocked')
		throw 53000,'Card status should be Active or blocked',1;


		insert into TeamE.CreditCard(CreditCardID,CustomerID,CustomerNameAsPerCard,CardNumber,CreditLimit,ExpiryMMYYYY,
		CardType,CardStatus,CardIssueDate, LastModifiedDate) 
		values(@creditCardID,@custID,@custName,@cardNumber,@creditLimit,
			@expiry,@cardType,@cardStatus,@cardIssueDate,@lastModifiedDate)
		select @@RowCount as Column1,@cardNumber as Column2,@creditCardID as column3
	end try
	begin catch
		throw;
	end catch
end

GO
/****** Object:  StoredProcedure [TeamE].[AddDebitCard]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamE].[AddDebitCard]
( @accountID uniqueidentifier,@custName varchar(50),@expiry varchar(7),@cardType varchar(20),@cardStatus varchar(12),@cardIssueDate DateTime,
        @lastModifiedDate Datetime)
as
begin
DECLARE @debitCardID uniqueidentifier,@cardNumber char(12),@cn int
set @debitCardID=NEWID();
set @cn=(Select count(*) from TeamE.DebitCard);
	set @cardNumber=(select convert(char(12),(100010001000+@cn)));

begin try

--throws error if length of customer name is less than 12 or greater than 40
if (2>=len(@custName) or len(@custName)>=40)
	throw 50000,'Customer name should be beween 2 and 40 characters',1;

--throws error if length of card number is not equal to 12
if(len(@cardNumber)!=12)
     throw 53000,'Invalid card number',1;

--throws error if card type is not one among below mentioned card types
if(@cardType!='Rupay' and @cardType!='VISA' and @cardType!='Maestro' and @cardType!='MasterCard')
throw 53000,'Card Type should be Rupay or VISA or maestro or mastercard ',1;

--throws error if card type is not either active or blokced
if(@cardStatus!='Active' and @cardStatus!='Blocked')
throw 53000,'Card status should be active or blocked',1;

insert into TeamE.DebitCard(DebitCardID,AccountID,CustomerNameAsPerCard,CardNumber,ExpiryMMYYYY,CardType,CardStatus,CardIssueDate,
        LastModifiedDate) values(@debitCardID,@accountID,@custName,@cardNumber,@expiry,@cardType,@cardStatus,@cardIssueDate,
        @lastModifiedDate)
select @@RowCount as column1,@cardNumber as column2,@debitCardID as column3
end try
begin catch
	throw;
end catch
end 

GO
/****** Object:  StoredProcedure [TeamE].[AddEmployee]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamE].[AddEmployee] ( @empName varchar(50), @email varchar(20), @password varchar(15),@creationTime DateTime, @modifiedTime DateTime)
as

begin

begin try
if(len(@empName)<2 or len(@empName)>40)
	throw 100, 'Employee Name should be between 2 and 40 characters', 1;

if(exists(select * from TeamE.Employees where Email= @email))
	throw 5000,'Email Id Alraedy Exists',1;

Insert Into TeamE.Employees(EmployeeID, EmployeeName, Email,EmployeePassword, CreationDateTime, LastModifiedDatetime) values(NEWID(),@empName, @email,@password,@creationTime,@modifiedTime)
end try

begin catch
	throw
end catch
select  @@ROWCOUNT
end
GO
/****** Object:  StoredProcedure [TeamE].[AddsCustomer]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE procedure 
  [TeamE].[AddsCustomer](@CustomerName varchar(40) ,@CustomerMobile char(10) ,@CustomerAddress varchar(200),@CustomerAadharNumber char(12) ,@CustomerPANNumber char(10),@CustomerGender varchar(12) , @CustomerDOB DateTime ,@Email varchar(50),@WorkExperience decimal,@AnnualIncome decimal)
  as
begin 
declare @CustomerID uniqueidentifier , @CustomerNumber char(6) , @cn int ,@CreationDateTime datetime ,@LastModified datetime 
set @CustomerID = NewID()
set @cn = (Select Count(*) from TeamE.Customer)
set @CustomerNumber = (SELECT CONVERT(char(6), (100000 + @cn))) 
set @CreationDateTime = SYSDATETIME()
set @LastModified = SYSDATETIME()
   

	insert into TeamE.Customer(CustomerID,CustomerNumber,CustomerName,CustomerMobile,CustomerAddress,CustomerAadharNumber,CustomerPANNumber,CustomerGender,CustomerDOB,Email,WorkExperience,AnnualIncome,CreationDateTime,LastModified)
		values (@CustomerID,@CustomerNumber,@CustomerName,@CustomerMobile,@CustomerAddress,@CustomerAadharNumber,@CustomerPANNumber,@CustomerGender,@CustomerDOB,@Email,@WorkExperience,@AnnualIncome,@CreationDateTime,@LastModified)
SELECT @@RowCount as Column1 ,@CustomerNumber as Column2
end

GO
/****** Object:  StoredProcedure [TeamE].[ChangeFixedAccountBranch]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamE].[ChangeFixedAccountBranch](@AccountNo char(10),@Branch varchar(30))

as 
begin

		
		---THROWING EXCEPTION IF THE ACCOUNT DOESN'T EXISTS
		if NOT EXISTS(SELECT * from TeamE.FixedAccount WHERE AccountNo = @AccountNo) AND (len(@AccountNo) = 10) AND (@AccountNo LIKE '2%')
			throw 50001,'Account does not exists',1

		---THROWING EXCEPTION IF ACCOUNT No IS NULL OR INVALID
		if @AccountNo is null OR (len(@AccountNo) <> 10) 
			throw 50001,'Invalid Account No',1


		---THROWING EXCEPTION IF THE HOME BRANCH ENTERED IS NOT VALID
		if @Branch NOT IN ('Mumbai','Delhi','Chennai','Bengaluru')
			throw 50001,'Home branch entered is invalid',1

		---CHANGING THE HOME BRANCH IF ACCOUNT NO MATCHES
		update TeamE.FixedAccount
		set Branch = @Branch where ((AccountNo = @AccountNo)AND(Branch IN ('Mumbai','Delhi','Chennai','Bengaluru')))

		update TeamE.FixedAccount
		set LastModifiedDateTime = SYSDATETIME() where AccountNo = @AccountNo;

end


GO
/****** Object:  StoredProcedure [TeamE].[ChangeRegularAccountBranch]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamE].[ChangeRegularAccountBranch](@AccountNo char(10),@Branch varchar(30))

as 
begin

		
		---THROWING EXCEPTION IF THE ACCOUNT DOESN'T EXISTS
		if NOT EXISTS(SELECT * from TeamE.RegularAccount WHERE AccountNo = @AccountNo) AND (len(@AccountNo) = 10) AND (@AccountNo LIKE '1%')
			throw 50001,'Account does not exists',1

		---THROWING EXCEPTION IF ACCOUNT No IS NULL OR INVALID
		if @AccountNo is null OR (len(@AccountNo) <> 10) 
			throw 50001,'Invalid Account No',1


		---THROWING EXCEPTION IF THE HOME BRANCH ENTERED IS NOT VALID
		if @Branch NOT IN ('Mumbai','Delhi','Chennai','Bengaluru')
			throw 50001,'Home branch entered is invalid',1

		---CHANGING THE HOME BRANCH IF ACCOUNT NO MATCHES
		update TeamE.RegularAccount
		set Branch = @Branch where ((AccountNo = @AccountNo)AND(Branch IN ('Mumbai','Delhi','Chennai','Bengaluru')))

		update TeamE.RegularAccount
		set LastModifiedDateTime = SYSDATETIME() where AccountNo = @AccountNo;

end


GO
/****** Object:  StoredProcedure [TeamE].[ChangeRegularAccountType]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamE].[ChangeRegularAccountType](@AccountNo char(10),@AccountType varchar(10))

as 
begin
		
		---THROWING EXCEPTION IF THE ACCOUNT NO ENTERED BELONGS TO FIXED ACCOUNT TABLE
		if EXISTS(SELECT * from TeamE.FixedAccount WHERE AccountNo = @AccountNo) 
			throw 50001,'Fixed accounts cannot be modified into other account types',1

		
		---THROWING EXCEPTION IF THE ACCOUNT DOESN'T EXISTS
		if NOT EXISTS(SELECT * from TeamE.RegularAccount WHERE AccountNo = @AccountNo) AND (len(@AccountNo) = 10) AND (@AccountNo LIKE '1%')
			throw 50001,'Account does not exists',1

		---THROWING EXCEPTION IF ACCOUNT No IS NULL OR INVALID
		if @AccountNo is null OR (len(@AccountNo) <> 10) 
			throw 50001,'Invalid Account No',1


		---THROWING EXCEPTION IF THE ACCOUNT TYPE ENTERED IS NOT VALID
		if @AccountType NOT IN ('SAVINGS','CURRENT')
			throw 50001,'Account Type entered is invalid',1

		---CHANGING THE ACCOUNT TYPE IF ACCOUNT NO MATCHES
		update TeamE.RegularAccount
		set AccountType = @AccountType where ((AccountNo = @AccountNo)AND(AccountType IN ('Savings','Current')))


		update TeamE.RegularAccount
		set LastModifiedDateTime = SYSDATETIME() where AccountNo = @AccountNo;

end


GO
/****** Object:  StoredProcedure [TeamE].[CreateCarLoan]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [TeamE].[CreateCarLoan]
( @CustomerID uniqueidentifier,  @LoanAmount money,
	@LoanDuration decimal,@License char(15))
as
begin
	---THROWING EXCEPTION IF  Customer Number IS NULL OR INVALID
	if @CustomerID is null 
		throw 50001, 'Invalid Customer No',3

	---THROWING EXCEPTION IF Amount of Loan IS NULL OR LESS THAN 0
	if @LoanAmount < 0 
	throw 50002, 'Invalid Amount of Loan',5
		
   ---THROWING EXCEPTION IF LoanDuration IS INVALID 
	if @LoanDuration < 0 
	throw 50003, 'Invalid Tenure',5

   ---THROWING EXCEPTION IF License IS NULL OR INVALID---
	
	
	---Declaring Auto Genrated Values like ID Date Time---
declare @Creationdate datetime,@Modificationdate datetime , @LoanStatus varchar(10) , @LoanType varchar(20 ) , @CarLoanNumber int , @cn int ,@LoanID uniqueidentifier
 set @LoanID = NewID()
set @cn = (Select Count(*) from TeamE.CarLoan)
set @CarLoanNumber = 6000 +  @cn
set @Creationdate = SYSDATETIME()
set @Modificationdate = SYSDATETIME()
set @LoanStatus = 'Pending'   
set @LoanType = 'Car'
 ---Inserting Into Values---
Insert Into CarLoan(CarLoanNumber, CarLoanID , CustomerID  , LoanAmount , LoanStatus , LoanDuration , License , CreationDateTime, LastModifiedTime, LoanType) Values (@CarLoanNumber, @LoanId , @CustomerID  , @LoanAmount , @LoanStatus , @LoanDuration , @License , @Creationdate, @Modificationdate , @LoanType)

end
GO
/****** Object:  StoredProcedure [TeamE].[CreateFixedAccount]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamE].[CreateFixedAccount]
(@CustomerID uniqueidentifier,@Branch varchar(30),@Tenure decimal,@FDDeposit money,@MinimumBalance money,@InterestRate decimal)
as
begin

		---THROWING EXCEPTION IF CUSTOMER ID IS NULL
		if @CustomerID IS null
			throw 50001,'Invalid Customer ID',1

		---GENERATING ACCOUNT ID
		declare @AccountID uniqueidentifier
			set @AccountID = NEWID()
		
		---GENERATING ACCOUNT NO
		declare @acount int,@AccountNo char(10)
			set @acount = (select count(*) from TeamE.FixedAccount)
			set @AccountNo = (SELECT CONVERT(char(10),(2000000001 + @acount)))

		---THROWING EXCEPTION IF HOME BRANCH IS INVALID OR NULL
		if @Branch NOT IN('Mumbai','Delhi','Chennai','Bengaluru')
			throw 50001,'Invalid Branch',7

		---THROWING EXCEPTION IF TENURE IS INVALID 
		if @Tenure <= 0 
			throw 50001, 'Invalid Tenure',5

		---THROWING EXCEPTION IF FDDEPOSIT AMOUNT IS INVALID 
		if @FDDeposit <= 0 
			throw 50001, 'Invalid FDDeposit Amount',5

			INSERT INTO TeamE.FixedAccount(AccountID, CustomerID, AccountNo,Branch,Tenure,FDDeposit,MinimumBalance,InterestRate)VALUES(@AccountID, @CustomerID, @AccountNo,
	@Branch,@Tenure,@FDDeposit,@MinimumBalance,@InterestRate)

	SELECT @@ROWCOUNT as Column1,@AccountNo as Column2
end
GO
/****** Object:  StoredProcedure [TeamE].[CreateRegularAccount]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [TeamE].[CreateRegularAccount]
(@CustomerID uniqueidentifier,@AccountType varchar(10),@Branch varchar(30),@MinimumBalance money,@InterestRate decimal)
as
begin

		---THROWING EXCEPTION IF CUSTOMER ID IS NULL
		if @CustomerID IS null
			throw 50001,'Invalid Customer ID',1
		
		---GENERATING ACCOUNT ID
		declare @AccountID uniqueidentifier
			set @AccountID = NEWID()
		
		---GENERATING ACCOUNT NO
		declare @acount int,@AccountNo char(10)
			set @acount = (select count(*) from TeamE.RegularAccount)
			set @AccountNo = (SELECT CONVERT(char(10),(1000000001 + @acount)))

		---THROWING EXCEPTION IF ACCOUNT TYPE IS NOT SAVINGS OR CURRENT
		if @AccountType NOT IN('Savings','Current')
			throw 50001,'Invalid Account Type',6

		---THROWING EXCEPTION IF HOME BRANCH IS INVALID OR NULL
		if @Branch NOT IN('Mumbai','Delhi','Chennai','Bengaluru')
			throw 50001,'Invalid Branch',7

			INSERT INTO TeamE.RegularAccount(AccountID, CustomerID, AccountNo,
	AccountType ,Branch,MinimumBalance,InterestRate)VALUES(@AccountID, @CustomerID, @AccountNo,
	@AccountType ,@Branch,@MinimumBalance,@InterestRate)

	SELECT @@ROWCOUNT as Column1,@AccountNo as Column2
end

GO
/****** Object:  StoredProcedure [TeamE].[Credit]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [TeamE].[Credit]( @creditAcc char(10), @ammount money, @tranTime datetime)
as
begin


if(not exists(select AccountNo from RegularAccount where AccountNo= @creditAcc))
throw 5000,'Email Id Alraedy Exists',1;

if(@ammount < 0)
throw 5000,'Ammount Not valid',1;

declare @balance money, @newBalance money
set @balance = (select CurrentBalance from RegularAccount where AccountNo= @creditAcc)
set @newBalance = @balance + @ammount

declare @err int, @maxerr int
set @maxerr = 0
begin transaction

update RegularAccount
set CurrentBalance = @newBalance
where AccountNo = @creditAcc

set @err =@@ERROR
if @err> @maxerr
set @maxerr = @err

insert into Transactions values (NEWID(),@creditAcc,null, @ammount,'Credit',@tranTime)

set @err= @@ERROR
if @err> @maxerr
set @maxerr = @err

if @maxerr <> 0

RollBack

else
Commit


end

GO
/****** Object:  StoredProcedure [TeamE].[Debit]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamE].[Debit]( @debitAcc char(10), @ammount money, @tranTime datetime)
as
begin


if(not exists(select AccountNo from RegularAccount where AccountNo= @debitAcc))
throw 5000,'Email Id Alraedy Exists',1;

if(@ammount < 0)
throw 5000,'Ammount Not valid',1;

declare @balance money, @newBalance money
set @balance = (select CurrentBalance from RegularAccount where AccountNo= @debitAcc)
if @balance < @ammount
throw 5000,'Not Enough balance',1;
set @newBalance = @balance - @ammount

declare @err int, @maxerr int
set @maxerr = 0
begin transaction

update RegularAccount
set CurrentBalance = @newBalance
where AccountNo = @debitAcc

set @err =@@ERROR
if @err> @maxerr
set @maxerr = @err

insert into Transactions values (NEWID(),null,@debitAcc, @ammount,'Debit',@tranTime)

set @err= @@ERROR
if @err> @maxerr
set @maxerr = @err

if @maxerr <> 0

RollBack

else
Commit


end

GO
/****** Object:  StoredProcedure [TeamE].[DeleteEmployee]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamE].[DeleteEmployee] (@empID uniqueIdentifier)
as 
begin
 delete from TeamE.Employees where EmployeeID=@empID;
select  @@ROWCOUNT
end
GO
/****** Object:  StoredProcedure [TeamE].[DeleteFixedAccount]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamE].[DeleteFixedAccount](@AccountNo char(10))

as 
begin

		
		---THROWING EXCEPTION IF THE ACCOUNT DOESN'T EXISTS
		if NOT EXISTS(SELECT * from TeamE.FixedAccount WHERE AccountNo = @AccountNo) AND (len(@AccountNo) = 10) AND (@AccountNo LIKE '2%')
			throw 50001,'Account does not exists',1

		---THROWING EXCEPTION IF ACCOUNT No IS NULL OR INVALID
		if @AccountNo is null OR (len(@AccountNo) <> 10) 
			throw 50001,'Invalid Account No',1

		---SETTING THE VALUE OF STATUS FROM "ACTIVE" TO "CLOSED"
		update TeamE.FixedAccount
		set Status = 'Closed' where AccountNo = @AccountNo;

		update TeamE.FixedAccount
		set LastModifiedDateTime = SYSDATETIME() where AccountNo = @AccountNo;

end


GO
/****** Object:  StoredProcedure [TeamE].[DeleteHomeLoanByCustomerID]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [TeamE].[DeleteHomeLoanByCustomerID](@LoanNumber char(6))
as begin 

   ---THROWING EXCEPTION IF Loan ID IS INVALID OR NULL
	if @LoanNumber is null 
		throw 500006,'Invalid Status',8

Delete from TeamE.HomeLoan
Where HomeLoanNumber = @LoanNumber
end
GO
/****** Object:  StoredProcedure [TeamE].[DeleteHomeLoanByLoanID]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [TeamE].[DeleteHomeLoanByLoanID](@LoanNumber char(6))
as begin 

   ---THROWING EXCEPTION IF Loan ID IS INVALID OR NULL
	if @LoanNumber = null 
		throw 500006,'Invalid Status',8

Delete from TeamE.HomeLoan
Where HomeLoanNumber = @LoanNumber
end
GO
/****** Object:  StoredProcedure [TeamE].[DeleteLoanByLoanID]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [TeamE].[DeleteLoanByLoanID](@LoanNumber char(6))
as begin 

   ---THROWING EXCEPTION IF Loan ID IS INVALID OR NULL
	if @LoanNumber = null 
		throw 500006,'Invalid Status',8

Delete from TeamE.CarLoan
Where CarLoanNumber = @LoanNumber
end
GO
/****** Object:  StoredProcedure [TeamE].[DeleteRegularAccount]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamE].[DeleteRegularAccount](@AccountNo char(10))

as 
begin

		
		---THROWING EXCEPTION IF THE ACCOUNT DOESN'T EXISTS
		if NOT EXISTS(SELECT * from TeamE.RegularAccount WHERE AccountNo = @AccountNo) AND (len(@AccountNo) = 10) AND (@AccountNo LIKE '1%')
			throw 50001,'Account does not exists',1

		---THROWING EXCEPTION IF ACCOUNT No IS NULL OR INVALID
		if @AccountNo is null OR (len(@AccountNo) <> 10) 
			throw 50001,'Invalid Account No',1

		---SETTING THE VALUE OF STATUS FROM "ACTIVE" TO "CLOSED"
		update TeamE.RegularAccount
		set Status = 'Closed' where AccountNo = @AccountNo;

		update TeamE.RegularAccount
		set LastModifiedDateTime = SYSDATETIME() where AccountNo = @AccountNo;

end


GO
/****** Object:  StoredProcedure [TeamE].[GetAllChequeBooks]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamE].[GetAllChequeBooks]
as
begin
select * from TeamE.ChequeBook 
end

GO
/****** Object:  StoredProcedure [TeamE].[GetAllCreditCards]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamE].[GetAllCreditCards]
as
begin
	select * from TeamE.CreditCard 
end

GO
/****** Object:  StoredProcedure [TeamE].[GetAllDebitCards]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamE].[GetAllDebitCards]
as
begin
select * from TeamE.DebitCard 
end

GO
/****** Object:  StoredProcedure [TeamE].[getAllEmployees]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [TeamE].[getAllEmployees]
as
begin

 select * from TeamE.Employees;
end


GO
/****** Object:  StoredProcedure [TeamE].[GetAllFixedAccounts]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamE].[GetAllFixedAccounts]
as
begin

		SELECT c.CustomerName,c.CustomerNumber,a.* from TeamE.FixedAccount a, TeamE.Customer c WHERE (c.CustomerID = a.CustomerID) 

end
GO
/****** Object:  StoredProcedure [TeamE].[GetAllRegularAccounts]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamE].[GetAllRegularAccounts]
as
begin

		SELECT c.CustomerName,c.CustomerNumber,a.* from TeamE.RegularAccount a, TeamE.Customer c WHERE (c.CustomerID = a.CustomerID) 
	
end


GO
/****** Object:  StoredProcedure [TeamE].[GetChequeBookByChequeBookID]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamE].[GetChequeBookByChequeBookID](@chequeBookID uniqueIdentifier)
 as
 begin
 select * from TeamE.ChequeBook 
 where ChequeBookID=@chequeBookID
 end

GO
/****** Object:  StoredProcedure [TeamE].[GetChequeBookBySeriesStart]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 create procedure [TeamE].[GetChequeBookBySeriesStart](@seriesStart decimal)
 as
 begin
 select  * from TeamE.ChequeBook 
 where SeriesStart=@seriesStart
 end

GO
/****** Object:  StoredProcedure [TeamE].[GetChequeBooksByAccountID]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamE].[GetChequeBooksByAccountID](@accountID uniqueidentifier)
 as
 begin
select * from TeamE.ChequeBook 
 where AccountID=@accountID
 end

GO
/****** Object:  StoredProcedure [TeamE].[GetChequeBooksByAccountIDAndStatus]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamE].[GetChequeBooksByAccountIDAndStatus](@accountID uniqueidentifier,@chequeBookStatus varchar(12))
 as
 begin
select * from TeamE.ChequeBook 
 where AccountID=@accountID and ChequeBookStatus=@chequeBookStatus
 end

GO
/****** Object:  StoredProcedure [TeamE].[GetChequeBooksByRequestedDate]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamE].[GetChequeBooksByRequestedDate](@StartDate datetime,@EndDate datetime)
as
begin
		select *from TeamE.ChequeBook  WHERE ((ChequeBookRequestDate >= @StartDate) 
		AND (LastModifiedDate <= @EndDate))

end

GO
/****** Object:  StoredProcedure [TeamE].[GetCreditCardByCreditCardNumber]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamE].[GetCreditCardByCreditCardNumber](@cardNumber char(12))
 as
 begin
	 select * from TeamE.CreditCard 
 where CardNumber=@cardNumber
 end

GO
/****** Object:  StoredProcedure [TeamE].[GetCreditCardsByCustomerID]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamE].[GetCreditCardsByCustomerID](@custID uniqueIdentifier)
as
begin
	select *from TeamE.CreditCard 
 where CustomerID=@custID
 end

GO
/****** Object:  StoredProcedure [TeamE].[GetCreditCardsByCustomerIDAndStatus]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamE].[GetCreditCardsByCustomerIDAndStatus](@custID uniqueIdentifier,@cardStatus varchar(12))
as
begin
	select *from TeamE.CreditCard 
 where CustomerID=@custID and CardStatus=@cardStatus
 end

GO
/****** Object:  StoredProcedure [TeamE].[GetCreditCardsByIssuedDate]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamE].[GetCreditCardsByIssuedDate](@StartDate datetime,@EndDate datetime)
as
begin
		select *from TeamE.CreditCard  WHERE ((CardIssueDate >= @StartDate) 
		AND (LastModifiedDate <= @EndDate))

end
GO
/****** Object:  StoredProcedure [TeamE].[GetCustomerByCustomerAadharNumber]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamE].[GetCustomerByCustomerAadharNumber](@CustomerAadharNumber char(12))
as
begin
select* from TeamE.Customer
where CustomerAadharNumber=@CustomerAadharNumber
END
GO
/****** Object:  StoredProcedure [TeamE].[GetCustomerByCustomerID]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamE].[GetCustomerByCustomerID](@customerID uniqueIdentifier)
as
begin
select* from TeamE.Customer
where CustomerID=@CustomerID
END
GO
/****** Object:  StoredProcedure [TeamE].[GetCustomerByCustomerMobile]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamE].[GetCustomerByCustomerMobile](@CustomerMobile char(10))
as
begin
select* from TeamE.Customer
where CustomerMobile=@CustomerMobile
END
GO
/****** Object:  StoredProcedure [TeamE].[GetCustomerByCustomerPANNumber]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamE].[GetCustomerByCustomerPANNumber](@CustomerPANNumber char(10))
as
begin
select* from TeamE.Customer
where CustomerPANNumber=@CustomerPANNumber
END
GO
/****** Object:  StoredProcedure [TeamE].[GetCustomerByEmail]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamE].[GetCustomerByEmail](@Email varchar(50))
as
begin
select* from TeamE.Customer
where Email=@Email
END
GO
/****** Object:  StoredProcedure [TeamE].[GetCustomersByCustomerName]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamE].[GetCustomersByCustomerName](@CustomerName varchar(40))
as
begin
select* from TeamE.Customer
where CustomerName=@CustomerName
END
GO
/****** Object:  StoredProcedure [TeamE].[GetDebitCardByDebitCardNumber]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamE].[GetDebitCardByDebitCardNumber](@cardNumber char(12))
 as
 begin
 select * from TeamE.DebitCard 
 where CardNumber=@cardNumber
 end

GO
/****** Object:  StoredProcedure [TeamE].[GetDebitCardsByAccountID]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamE].[GetDebitCardsByAccountID](@accountID uniqueidentifier)
as
begin
select * from TeamE.DebitCard 
 where AccountID=@accountID
 end

GO
/****** Object:  StoredProcedure [TeamE].[GetDebitCardsByAccountIDAndStatus]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamE].[GetDebitCardsByAccountIDAndStatus](@accountID uniqueIdentifier,@cardStatus varchar(12))
as
begin
	select *from TeamE.DebitCard 
 where AccountID=@accountID and CardStatus=@cardStatus
 end

GO
/****** Object:  StoredProcedure [TeamE].[GetFixedAccountByAccountNo]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamE].[GetFixedAccountByAccountNo](@AccountNo char(10)) 
as
begin

		
		---THROWING EXCEPTION IF THE ACCOUNT DOESN'T EXISTS
		if NOT EXISTS(SELECT * from TeamE.FixedAccount WHERE AccountNo = @AccountNo) AND (len(@AccountNo) = 10) AND (@AccountNo LIKE '2%')
			throw 50001,'Account does not exists',1


		---THROWING EXCEPTION IF ACCOUNT No IS NULL OR INVALID
		if @AccountNo is null OR (len(@AccountNo) <> 10) 
			throw 50001,'Invalid Account No',1



		SELECT c.CustomerName,c.CustomerNumber,a.* from TeamE.FixedAccount a, TeamE.Customer c WHERE (AccountNo = @AccountNo) 
		AND (c.CustomerID = a.CustomerID )

end



GO
/****** Object:  StoredProcedure [TeamE].[GetFixedAccountByCustomerID]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [TeamE].[GetFixedAccountByCustomerID](@CustomerID uniqueIdentifier)
as
begin

		SELECT c.CustomerName,c.CustomerNumber,a.* from TeamE.FixedAccount a INNER JOIN TeamE.Customer c ON ((c.CustomerID = a.CustomerID)AND(@CustomerID = a.CustomerID ))
end


GO
/****** Object:  StoredProcedure [TeamE].[GetFixedAccountsByAccountOpeningDate]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamE].[GetFixedAccountsByAccountOpeningDate](@StartDate datetime,@EndDate datetime)
as
begin
		
		---THROWING EXCEPTION IF END DATE IS LATER THAN TODAY
		if (@EndDate > = GETDATE())
			throw 50001,'End date cannot be later than today',1

		
		SELECT c.CustomerName,c.CustomerNumber,a.* from TeamE.FixedAccount a, TeamE.Customer c WHERE ((a.CreationDateTime >= @StartDate) 
		AND (a.CreationDateTime <= @EndDate)) AND (c.CustomerID = a.CustomerID) 

end
GO
/****** Object:  StoredProcedure [TeamE].[GetFixedAccountsByBranch]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamE].[GetFixedAccountsByBranch](@Branch varchar(10)) 
as
begin


		SELECT c.CustomerName,c.CustomerNumber,a.* from TeamE.FixedAccount a, TeamE.Customer c WHERE (Branch = @Branch) 
		

end
GO
/****** Object:  StoredProcedure [TeamE].[GetFixedAccountsByCustomerID]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamE].[GetFixedAccountsByCustomerID](@CustomerID uniqueIdentifier)
as
begin

		---THROWING EXCEPTION IF THE CUSTOMER ID ENTERED IS NOT VALID
	    if @CustomerID NOT IN (SELECT CustomerID from TeamE.Customer where CustomerID = @CustomerID)
					throw 50001,'Customer does not exists',1


		SELECT c.CustomerName,c.CustomerNumber,a.* from TeamE.FixedAccount a INNER JOIN TeamE.Customer c ON ((c.CustomerID = a.CustomerID)AND(@CustomerID = a.CustomerID ))
end


GO
/****** Object:  StoredProcedure [TeamE].[GetRegularAccountByAccountNo]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamE].[GetRegularAccountByAccountNo](@AccountNo char(10))
as
begin

		
		---THROWING EXCEPTION IF THE ACCOUNT DOESN'T EXISTS
		if NOT EXISTS(SELECT * from TeamE.RegularAccount WHERE AccountNo = @AccountNo) AND (len(@AccountNo) = 10) AND (@AccountNo LIKE '1%')
			throw 50001,'Account does not exists',1

		---THROWING EXCEPTION IF ACCOUNT No IS NULL OR INVALID
		if @AccountNo is null OR (len(@AccountNo) <> 10) 
			throw 50001,'Invalid Account No',1

		
		SELECT c.CustomerName,c.CustomerNumber,a.* from TeamE.RegularAccount a, TeamE.Customer c WHERE (AccountNo = @AccountNo) 
		AND (c.CustomerID = a.CustomerID )

end

GO
/****** Object:  StoredProcedure [TeamE].[GetRegularAccountsByAccountOpeningDate]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamE].[GetRegularAccountsByAccountOpeningDate](@StartDate datetime,@EndDate datetime)
as
begin
		
		---THROWING EXCEPTION IF END DATE IS LATER THAN TODAY
		if (@EndDate > = GETDATE())
			throw 50001,'End date cannot be later than today',1

		SELECT c.CustomerName,c.CustomerNumber,a.* from TeamE.RegularAccount a, TeamE.Customer c WHERE ((a.CreationDateTime >= @StartDate) 
		AND (a.CreationDateTime <= @EndDate)) AND (c.CustomerID = a.CustomerID) 

end
GO
/****** Object:  StoredProcedure [TeamE].[GetRegularAccountsByAccountType]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamE].[GetRegularAccountsByAccountType](@AccountType varchar(10))
as
begin

		---THROWING EXCEPTION IF THE ACCOUNT TYPE ENTERED IS NOT VALID
				if @AccountType NOT IN ('SAVINGS','CURRENT')
					throw 50001,'Account Type entered is invalid',1

		SELECT c.CustomerName,c.CustomerNumber,a.* from TeamE.RegularAccount a, TeamE.Customer c WHERE (AccountType = @AccountType) 
		AND (c.CustomerID = a.CustomerID )

end


GO
/****** Object:  StoredProcedure [TeamE].[GetRegularAccountsByBranch]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamE].[GetRegularAccountsByBranch](@Branch varchar(30))
as
begin

		
		
		SELECT c.CustomerName,c.CustomerNumber,a.* from TeamE.RegularAccount a, TeamE.Customer c WHERE (Branch = @Branch) 
		AND (c.CustomerID = a.CustomerID )

end


GO
/****** Object:  StoredProcedure [TeamE].[GetRegularAccountsByCustomerID]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamE].[GetRegularAccountsByCustomerID](@CustomerID uniqueIdentifier)
as
begin
		
		---THROWING EXCEPTION IF THE CUSTOMER ID ENTERED IS NOT VALID
	    if @CustomerID NOT IN (SELECT CustomerID from TeamE.Customer where CustomerID = @CustomerID)
					throw 50001,'Customer does not exists',1


		SELECT c.CustomerName,c.CustomerNumber,a.* from TeamE.RegularAccount a INNER JOIN TeamE.Customer c ON ((c.CustomerID = a.CustomerID)AND(@CustomerID = a.CustomerID ))

end

GO
/****** Object:  StoredProcedure [TeamE].[GetsAllCustomer]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Created by Asmita Chandrakar
--Procedure to View all customer
Create Procedure [TeamE].[GetsAllCustomer]
  AS
  BEGIN
  Select * From TeamE.Customer
  End


GO
/****** Object:  StoredProcedure [TeamE].[ShowAllHomeLoan]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---To Show All Car Loan data
Create Procedure [TeamE].[ShowAllHomeLoan]
as begin 
Select * from TeamE.HomeLoan
end

GO
/****** Object:  StoredProcedure [TeamE].[ShowAllLoan]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---To Show All Car Loan data
Create Procedure [TeamE].[ShowAllLoan]
as begin 
Select * from TeamE.CarLoan
end

GO
/****** Object:  StoredProcedure [TeamE].[ShowCarLoanByCustomerID]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [TeamE].[ShowCarLoanByCustomerID](@LoanID uniqueidentifier)
as begin
   ---THROWING EXCEPTION IF Loan ID IS INVALID OR NULL
	if @LoanID is null 
		throw 500006,'Invalid Status',8
 
--- Selecting Value Based on Loan ID---
Select * from TeamE.CarLoan
Where CustomerID = @LoanID
end
GO
/****** Object:  StoredProcedure [TeamE].[ShowCustomerByCustomerNumber]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamE].[ShowCustomerByCustomerNumber](@CustomerNumber char(6)) 
as
begin 
	select * from TeamE.Customer where CustomerNumber= @CustomerNumber
end
GO
/****** Object:  StoredProcedure [TeamE].[ShowHomeLoanByLoanID]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [TeamE].[ShowHomeLoanByLoanID](@CustomerID uniqueidentifier)
as begin
   ---THROWING EXCEPTION IF Loan ID IS INVALID OR NULL
	if  @CustomerID NOT IN(Select CustomerID from TeamE.HomeLoan)
		throw 500006,'Invalid Status',8
 
--- Selecting Value Based on Loan ID---
Select * from TeamE.HomeLoan
Where CustomerID = @CustomerID
end

GO
/****** Object:  StoredProcedure [TeamE].[ShowLoanByCustomerID]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [TeamE].[ShowLoanByCustomerID](@LoanID uniqueidentifier)
as begin
   ---THROWING EXCEPTION IF Loan ID IS INVALID OR NULL
	if @LoanID is null 
		throw 500006,'Invalid Status',8
 
--- Selecting Value Based on Loan ID---
Select * from TeamE.CarLoan
Where CustomerID = @LoanID
end
GO
/****** Object:  StoredProcedure [TeamE].[ShowLoanByLoanID]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [TeamE].[ShowLoanByLoanID](@LoanID uniqueidentifier)
as begin
   ---THROWING EXCEPTION IF Loan ID IS INVALID OR NULL
	if @LoanID is null OR @LoanID NOT IN(Select CarLoanID from TeamE.CarLoan)
		throw 500006,'Invalid Status',8
 
--- Selecting Value Based on Loan ID---
Select * from TeamE.CarLoan
Where CarLoanID = @LoanID
end

GO
/****** Object:  StoredProcedure [TeamE].[ShowLoanByLoanStatus]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [TeamE].[ShowLoanByLoanStatus](@LoanStatus varchar(10))
as begin 

		---THROWING EXCEPTION IF Loan Status IS INVALID OR NULL
		if @LoanStatus is null OR @LoanStatus = ''OR @LoanStatus NOT IN('Pending','Approved','Rejected')
			throw 500005,'Invalid Status',7

Select * from TeamE.CarLoan
Where LoanStatus = @LoanStatus
end

GO
/****** Object:  StoredProcedure [TeamE].[Transfers]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [TeamE].[Transfers] ( @creditAcc char(10),@debitAcc char(10), @ammount money, @tranTime datetime)
as
begin


if(not exists(select AccountNo from RegularAccount where AccountNo= @creditAcc))
throw 5000,'Account not Exists',1;
if(not exists(select AccountNo from RegularAccount where AccountNo= @debitAcc))
throw 5000,'Account not Exists',1;

if(@ammount < 0)
throw 5000,'Ammount Not valid',1;


declare @currBalance money, @newCurrBalance money,  @debBalance money, @newDebBalance money
set @currBalance = (select CurrentBalance from RegularAccount where AccountNo= @creditAcc)
set @debBalance = (select CurrentBalance from RegularAccount where AccountNo= @debitAcc)
if @debBalance < @ammount
throw 5000,'Not Enough balance',1;
declare @err int, @maxerr int
set @maxerr = 0
begin transaction
set @newDebBalance= @debBalance -@ammount
set @newCurrBalance= @currBalance + @ammount
update RegularAccount
set CurrentBalance = @newDebBalance
where AccountNo = @debitAcc

set @err =@@ERROR
if @err> @maxerr
set @maxerr = @err

update RegularAccount
set CurrentBalance = @newCurrBalance
where AccountNo = @creditAcc

set @err =@@ERROR
if @err> @maxerr
set @maxerr = @err

insert into Transactions values (NEWID(),@creditAcc,@debitAcc, @ammount,'Transfer',@tranTime)

set @err= @@ERROR
if @err> @maxerr
set @maxerr = @err

if @maxerr <> 0

RollBack

else
Commit


end
GO
/****** Object:  StoredProcedure [TeamE].[UpdateCarLoanByLoanID]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---To Update Car Loan By using Loan ID
CREATE Procedure [TeamE].[UpdateCarLoanByLoanID] (@CustomerID uniqueidentifier,  @LoanAmount money,
	@LoanDuration decimal,@License char(15))
	as begin
	

	---THROWING EXCEPTION IF Amount of Loan IS NULL OR LESS THAN 0
	 if @LoanAmount < 0 
		throw 50002, 'Invalid Amount of Loan',5

	---THROWING EXCEPTION IF LoanDuration IS INVALID 
	 if @LoanDuration < 0 
		throw 50003, 'Invalid Tenure',5

	

	---THROWING EXCEPTION IF Loan ID IS INVALID OR NULL
	if @CustomerID is null 
		throw 500006,'Invalid Status',8

	---Updating Values---

	
	
Update TeamE.CarLoan

Set LoanAmount = @LoanAmount,
    LoanDuration = @LoanDuration,
	License = @License,
    LoanStatus = 'Pending'   
Where CustomerID = @CustomerID
end
GO
/****** Object:  StoredProcedure [TeamE].[UpdateChequeBookStatus]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamE].[UpdateChequeBookStatus](@seriesStart decimal,@chequeBookStatus varchar(12),@lastModifiedDate datetime)
as
begin
update TeamE.ChequeBook
set
ChequeBookStatus=@chequeBookStatus,
LastModifiedDate=@lastModifiedDate
where SeriesStart=@seriesStart
end

GO
/****** Object:  StoredProcedure [TeamE].[UpdateCreditCard]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamE].[UpdateCreditCard](@cardNumber char(12) ,@cardStatus varchar(12),@lastModifiedDate datetime)
as
begin
update TeamE.CreditCard
set
CardStatus=@cardStatus,
LastModifiedDate=@lastModifiedDate
where CardNumber=@cardNumber
end

GO
/****** Object:  StoredProcedure [TeamE].[UpdateCreditCardStatus]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamE].[UpdateCreditCardStatus](@cardNumber char(12) ,@cardStatus varchar(12),@lastModifiedDate datetime)
as
begin
update TeamE.CreditCard
set
CardStatus=@cardStatus
where CardNumber=@cardNumber
end

GO
/****** Object:  StoredProcedure [TeamE].[UpdateDebitCardStatus]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamE].[UpdateDebitCardStatus](@cardNumber char(12),@cardStatus varchar(12),@lastModifiedDate datetime)
as
begin
update TeamE.DebitCard
set
CardStatus=@cardStatus,
LastModifiedDate=@lastModifiedDate
where CardNumber=@cardNumber
end

GO
/****** Object:  StoredProcedure [TeamE].[UpdateEmployee]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [TeamE].[UpdateEmployee]( @empID uniqueidentifier, @empName varchar(40), @email varchar(20), @modifiedTime DateTime)
as
begin
if(not exists(select * from TeamE.Employees where EmployeeID= @empID))
	throw 5000, 'Employee not found', 1;
if(len(@empName)<2 or len(@empName)>40)
	throw 100, 'Customer Name should be between 2 and 40 characters', 1;


update TeamE.Employees
	set
		EmployeeName=@empName,
		Email=@email,
		
		LastModifiedDateTime=@modifiedTime

		where EmployeeID = @empID
select @@ROWCOUNT
end


GO
/****** Object:  StoredProcedure [TeamE].[UpdateHomeLoanBycustomerID]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---To Update Car Loan By using Loan ID
CREATE Procedure [TeamE].[UpdateHomeLoanBycustomerID] (@CustomerID uniqueidentifier,  @LoanAmount money,
	@LoanDuration decimal,@Collateral money)
	as begin
	

	---THROWING EXCEPTION IF Amount of Loan IS NULL OR LESS THAN 0
	 if @LoanAmount < 0 
		throw 50002, 'Invalid Amount of Loan',5

	---THROWING EXCEPTION IF LoanDuration IS INVALID 
	 if @LoanDuration < 0 
		throw 50003, 'Invalid Tenure',5

	---THROWING EXCEPTION IF License IS NULL OR INVALID---
	 if @Collateral < 0
		throw 50004, 'Collateral Cannot be less than 0',5

	---THROWING EXCEPTION IF Loan ID IS INVALID OR NULL
	if @CustomerID is null 
		throw 500006,'Invalid Status',8

	---Updating Values---
	declare @LoanStatus varchar(20 )
	
Update TeamE.HomeLoan

Set LoanAmount = @LoanAmount,
    LoanDuration = @LoanDuration,
	Collateral = @Collateral,
	@LoanStatus = 'Pending' 
Where CustomerID = @CustomerID
end
GO
/****** Object:  StoredProcedure [TeamE].[updateHomeStatus]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [TeamE].[updateHomeStatus](@LoanStatus varchar(10) , @CustomerID uniqueidentifier)
as
Update TeamE.HomeLoan
Set LoanStatus = @LoanStatus
where CustomerID = @CustomerID
GO
/****** Object:  StoredProcedure [TeamE].[UpdateLoanByLoanID]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---To Update Car Loan By using Loan ID
CREATE Procedure [TeamE].[UpdateLoanByLoanID] (@LoanID1 uniqueidentifier,  @LoanAmount money,
	@LoanDuration decimal,@License char(15))
	as begin
	

	---THROWING EXCEPTION IF Amount of Loan IS NULL OR LESS THAN 0
	 if @LoanAmount < 0 
		throw 50002, 'Invalid Amount of Loan',5

	---THROWING EXCEPTION IF LoanDuration IS INVALID 
	 if @LoanDuration < 0 
		throw 50003, 'Invalid Tenure',5

	

	---THROWING EXCEPTION IF Loan ID IS INVALID OR NULL
	if @LoanID1 is null 
		throw 500006,'Invalid Status',8

	---Updating Values---

	declare @LoanStatus varchar(10)
	
Update TeamE.CarLoan

Set LoanAmount = @LoanAmount,
    LoanDuration = @LoanDuration,
	License = @License,
    @LoanStatus = 'Pending'   
Where CarLoanID = @LoanID1
end
GO
/****** Object:  StoredProcedure [TeamE].[UpdatesCustomer]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [TeamE].[UpdatesCustomer](@CustomerNumber char(6),@CustomerName varchar(40),@CustomerMobile char(10) ,@Email varchar(50),@CustomerAddress varchar(200) ) 
as
begin 

	 update TeamE.Customer
		set

		CustomerName=@CustomerName,
		CustomerMobile=@CustomerMobile,
		Email=@Email,
		CustomerAddress=@CustomerAddress,
		LastModified=sysdatetime()
		

        where CustomerNumber=@CustomerNumber
end
GO
/****** Object:  StoredProcedure [TeamE].[updateStatus]    Script Date: 06-11-2019 11:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [TeamE].[updateStatus](@LoanStatus varchar(10) , @CustomerID uniqueidentifier)
as
Update TeamE.CarLoan
Set LoanStatus = @LoanStatus
where CustomerID = @CustomerID
GO
