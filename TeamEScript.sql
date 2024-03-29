USE [13th Aug CLoud PT Immersive]
GO
/****** Object:  Table [TeamE].[Admin]    Script Date: 06-11-2019 09:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamE].[Admin](
	[AdminID] [uniqueidentifier] NOT NULL,
	[AdminName] [varchar](50) NOT NULL,
	[Email] [varchar](20) NOT NULL,
	[AdminPassword] [varchar](15) NOT NULL,
	[CreationDateTime] [datetime] NULL DEFAULT (sysdatetime()),
	[LastModifiedDatetime] [datetime] NULL DEFAULT (sysdatetime()),
 CONSTRAINT [PK_EmployeeService_Admin_AdminID] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamE].[CarLoan]    Script Date: 06-11-2019 09:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamE].[CarLoan](
	[CarLoanID] [uniqueidentifier] NOT NULL,
	[CustomerID] [uniqueidentifier] NOT NULL,
	[CarLoanNumber] [char](4) NOT NULL,
	[LoanAmount] [money] NOT NULL DEFAULT ((0)),
	[LoanType] [varchar](20) NOT NULL,
	[LoanStatus] [varchar](10) NOT NULL,
	[LoanDuration] [decimal](18, 0) NOT NULL,
	[License] [char](15) NOT NULL,
	[CreationDateTime] [datetime] NOT NULL,
	[LastModifiedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_CarLoan_LoanID] PRIMARY KEY CLUSTERED 
(
	[CarLoanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamE].[ChequeBook]    Script Date: 06-11-2019 09:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamE].[ChequeBook](
	[ChequeBookID] [uniqueidentifier] NOT NULL,
	[AccountID] [uniqueidentifier] NULL,
	[AccountNo] [char](10) NOT NULL,
	[SeriesStart] [decimal](18, 0) NULL,
	[NumberOfLeaves] [int] NOT NULL,
	[ChequeBookStatus] [varchar](12) NOT NULL,
	[ChequeBookRequestDate] [datetime] NULL,
	[LastModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_CustomerService_ChequeBook_ChequeBookID] PRIMARY KEY CLUSTERED 
(
	[ChequeBookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_CustomerService_ChequeBook_SeriesStart] UNIQUE NONCLUSTERED 
(
	[SeriesStart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamE].[CreditCard]    Script Date: 06-11-2019 09:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamE].[CreditCard](
	[CreditCardID] [uniqueidentifier] NOT NULL,
	[CustomerID] [uniqueidentifier] NULL,
	[CustomerNameAsPerCard] [varchar](50) NOT NULL,
	[CardNumber] [char](12) NULL,
	[CreditLimit] [decimal](18, 0) NOT NULL,
	[ExpiryMMYYYY] [varchar](7) NOT NULL,
	[CardType] [varchar](20) NOT NULL,
	[CardStatus] [varchar](12) NOT NULL,
	[CardIssueDate] [datetime] NULL DEFAULT (sysdatetime()),
	[LastModifiedDate] [datetime] NULL DEFAULT (sysdatetime()),
 CONSTRAINT [PK_TeamE_CreditCard_CreditCardID] PRIMARY KEY CLUSTERED 
(
	[CreditCardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_TeamE_CreditCard_CardNumber] UNIQUE NONCLUSTERED 
(
	[CardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamE].[Customer]    Script Date: 06-11-2019 09:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamE].[Customer](
	[CustomerID] [uniqueidentifier] NOT NULL,
	[CustomerNumber] [char](6) NOT NULL,
	[CustomerName] [varchar](40) NOT NULL,
	[CustomerMobile] [char](10) NOT NULL,
	[CustomerAddress] [varchar](200) NOT NULL,
	[CustomerAadharNumber] [char](12) NOT NULL,
	[CustomerPANNumber] [char](10) NOT NULL,
	[CustomerGender] [varchar](12) NOT NULL,
	[CustomerDOB] [datetime] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[WorkExperience] [decimal](18, 0) NOT NULL,
	[AnnualIncome] [decimal](18, 0) NOT NULL,
	[CreationDateTime] [datetime] NOT NULL DEFAULT (sysdatetime()),
	[LastModified] [datetime] NOT NULL DEFAULT (sysdatetime()),
 CONSTRAINT [PK_Customer_CustomerID] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamE].[DebitCard]    Script Date: 06-11-2019 09:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamE].[DebitCard](
	[DebitCardID] [uniqueidentifier] NOT NULL,
	[AccountID] [uniqueidentifier] NULL,
	[CustomerNameAsPerCard] [varchar](50) NOT NULL,
	[CardNumber] [char](12) NULL,
	[ExpiryMMYYYY] [varchar](7) NOT NULL,
	[CardType] [varchar](20) NOT NULL,
	[CardStatus] [varchar](12) NOT NULL,
	[CardIssueDate] [datetime] NULL DEFAULT (sysdatetime()),
	[LastModifiedDate] [datetime] NULL DEFAULT (sysdatetime()),
 CONSTRAINT [PK_CustomerService_DebitCard_DebitCardID] PRIMARY KEY CLUSTERED 
(
	[DebitCardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_CustomerService_DebitCard_CardNumber] UNIQUE NONCLUSTERED 
(
	[CardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamE].[EducationLoan]    Script Date: 06-11-2019 09:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamE].[EducationLoan](
	[EducationLoanID] [uniqueidentifier] NOT NULL,
	[CustomerID] [uniqueidentifier] NOT NULL,
	[EducationLoanNumber] [int] NOT NULL,
	[LoanAmount] [money] NOT NULL,
	[LoanStatus] [varchar](10) NOT NULL,
	[LoanDuration] [decimal](18, 0) NOT NULL,
	[Collateral] [money] NOT NULL,
	[CreationDateTime] [datetime] NOT NULL,
	[LastModifiedTime] [datetime] NOT NULL,
	[LoanType] [varchar](20) NOT NULL,
	[CollegeName] [varchar](50) NOT NULL,
	[AdmissionID] [varchar](50) NOT NULL,
	[Sponseror] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EducationLoan_LoanID] PRIMARY KEY CLUSTERED 
(
	[EducationLoanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamE].[Employees]    Script Date: 06-11-2019 09:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamE].[Employees](
	[EmployeeID] [uniqueidentifier] NOT NULL,
	[EmployeeName] [varchar](50) NOT NULL,
	[Email] [varchar](20) NOT NULL,
	[EmployeePassword] [varchar](15) NOT NULL,
	[CreationDateTime] [datetime] NULL DEFAULT (sysdatetime()),
	[LastModifiedDatetime] [datetime] NULL DEFAULT (sysdatetime()),
 CONSTRAINT [PK_EmployeeService_Employee_EmployeeID] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamE].[FixedAccount]    Script Date: 06-11-2019 09:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamE].[FixedAccount](
	[AccountID] [uniqueidentifier] NOT NULL,
	[CustomerID] [uniqueidentifier] NOT NULL,
	[AccountNo] [char](10) NOT NULL,
	[CurrentBalance] [money] NULL DEFAULT ((0)),
	[AccountType] [varchar](10) NOT NULL DEFAULT ('Fixed'),
	[Branch] [varchar](30) NOT NULL,
	[Tenure] [decimal](18, 0) NOT NULL,
	[FDDeposit] [money] NOT NULL,
	[Status] [char](10) NOT NULL DEFAULT ('Active'),
	[MinimumBalance] [money] NOT NULL DEFAULT ((500)),
	[InterestRate] [decimal](18, 0) NOT NULL DEFAULT ((3.5)),
	[CreationDateTime] [datetime] NOT NULL DEFAULT (sysdatetime()),
	[LastModifiedDateTime] [datetime] NOT NULL DEFAULT (sysdatetime()),
 CONSTRAINT [PK_FixedAccount_AccountID] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[AccountNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamE].[HomeLoan]    Script Date: 06-11-2019 09:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamE].[HomeLoan](
	[HomeLoanID] [uniqueidentifier] NOT NULL,
	[CustomerID] [uniqueidentifier] NOT NULL,
	[HomeLoanNumber] [int] NOT NULL,
	[LoanAmount] [money] NOT NULL DEFAULT ((0)),
	[LoanStatus] [varchar](10) NOT NULL,
	[LoanDuration] [decimal](18, 0) NOT NULL,
	[Collateral] [money] NOT NULL,
	[CreationDateTime] [datetime] NOT NULL,
	[LastModifiedTime] [datetime] NOT NULL,
	[LoanType] [varchar](20) NOT NULL,
 CONSTRAINT [PK_HomeLoan_LoanID] PRIMARY KEY CLUSTERED 
(
	[HomeLoanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamE].[PersonalLoan]    Script Date: 06-11-2019 09:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamE].[PersonalLoan](
	[PersonalLoanID] [uniqueidentifier] NOT NULL,
	[CustomerID] [uniqueidentifier] NOT NULL,
	[PersonalLoanNumber] [int] NOT NULL,
	[LoanAmount] [money] NOT NULL DEFAULT ((0)),
	[LoanStatus] [varchar](10) NOT NULL,
	[LoanDuration] [decimal](18, 0) NOT NULL,
	[Collateral] [money] NOT NULL,
	[CreationDateTime] [datetime] NOT NULL,
	[LastModifiedTime] [datetime] NOT NULL,
	[LoanType] [varchar](20) NOT NULL,
 CONSTRAINT [PK_PersonalLoan_LoanID] PRIMARY KEY CLUSTERED 
(
	[PersonalLoanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamE].[RegularAccount]    Script Date: 06-11-2019 09:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamE].[RegularAccount](
	[AccountID] [uniqueidentifier] NOT NULL,
	[CustomerID] [uniqueidentifier] NOT NULL,
	[AccountNo] [char](10) NOT NULL,
	[CurrentBalance] [money] NOT NULL DEFAULT ((0)),
	[AccountType] [varchar](10) NOT NULL,
	[Branch] [varchar](30) NOT NULL,
	[Status] [char](10) NOT NULL DEFAULT ('Active'),
	[MinimumBalance] [money] NOT NULL DEFAULT ((500)),
	[InterestRate] [decimal](18, 0) NOT NULL DEFAULT ((3.5)),
	[CreationDateTime] [datetime] NOT NULL DEFAULT (sysdatetime()),
	[LastModifiedDateTime] [datetime] NOT NULL DEFAULT (sysdatetime()),
 CONSTRAINT [PK_RegularAccount_AccountID] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[AccountNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[AccountNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [TeamE].[Transactions]    Script Date: 06-11-2019 09:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamE].[Transactions](
	[TransactionID] [uniqueidentifier] NOT NULL,
	[CreditAccountNumber] [char](10) NULL,
	[DebitAccountNumber] [char](10) NULL,
	[Ammount] [money] NOT NULL,
	[TransactionType] [varchar](10) NOT NULL,
	[TransactionDateTime] [datetime] NOT NULL DEFAULT (sysdatetime()),
 CONSTRAINT [PK_Transactions_TransactionID] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [TeamE].[EducationLoan] ADD  DEFAULT ((0)) FOR [LoanAmount]
GO
ALTER TABLE [TeamE].[CarLoan]  WITH CHECK ADD  CONSTRAINT [FK_CarLoan_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [TeamE].[Customer] ([CustomerID])
GO
ALTER TABLE [TeamE].[CarLoan] CHECK CONSTRAINT [FK_CarLoan_CustomerID]
GO
ALTER TABLE [TeamE].[ChequeBook]  WITH CHECK ADD  CONSTRAINT [FK_ChequeBook_RegularAccount_AccountID] FOREIGN KEY([AccountID])
REFERENCES [TeamE].[RegularAccount] ([AccountID])
GO
ALTER TABLE [TeamE].[ChequeBook] CHECK CONSTRAINT [FK_ChequeBook_RegularAccount_AccountID]
GO
ALTER TABLE [TeamE].[CreditCard]  WITH CHECK ADD  CONSTRAINT [FK_CreditCard_Customer_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [TeamE].[Customer] ([CustomerID])
GO
ALTER TABLE [TeamE].[CreditCard] CHECK CONSTRAINT [FK_CreditCard_Customer_CustomerID]
GO
ALTER TABLE [TeamE].[DebitCard]  WITH CHECK ADD  CONSTRAINT [FK_DebitCard_RegularAccount_AccountID] FOREIGN KEY([AccountID])
REFERENCES [TeamE].[RegularAccount] ([AccountID])
GO
ALTER TABLE [TeamE].[DebitCard] CHECK CONSTRAINT [FK_DebitCard_RegularAccount_AccountID]
GO
ALTER TABLE [TeamE].[EducationLoan]  WITH CHECK ADD  CONSTRAINT [FK_EducationLoan_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [TeamE].[Customer] ([CustomerID])
GO
ALTER TABLE [TeamE].[EducationLoan] CHECK CONSTRAINT [FK_EducationLoan_CustomerID]
GO
ALTER TABLE [TeamE].[FixedAccount]  WITH CHECK ADD  CONSTRAINT [FK_FixedAccount_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [TeamE].[Customer] ([CustomerID])
GO
ALTER TABLE [TeamE].[FixedAccount] CHECK CONSTRAINT [FK_FixedAccount_CustomerID]
GO
ALTER TABLE [TeamE].[HomeLoan]  WITH CHECK ADD  CONSTRAINT [FK_HomeLoan_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [TeamE].[Customer] ([CustomerID])
GO
ALTER TABLE [TeamE].[HomeLoan] CHECK CONSTRAINT [FK_HomeLoan_CustomerID]
GO
ALTER TABLE [TeamE].[PersonalLoan]  WITH CHECK ADD  CONSTRAINT [FK_PersonalLoan_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [TeamE].[Customer] ([CustomerID])
GO
ALTER TABLE [TeamE].[PersonalLoan] CHECK CONSTRAINT [FK_PersonalLoan_CustomerID]
GO
ALTER TABLE [TeamE].[RegularAccount]  WITH CHECK ADD  CONSTRAINT [FK_RegularAccount_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [TeamE].[Customer] ([CustomerID])
GO
ALTER TABLE [TeamE].[RegularAccount] CHECK CONSTRAINT [FK_RegularAccount_CustomerID]
GO
ALTER TABLE [TeamE].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_CreditAccountNO] FOREIGN KEY([CreditAccountNumber])
REFERENCES [TeamE].[RegularAccount] ([AccountNo])
GO
ALTER TABLE [TeamE].[Transactions] CHECK CONSTRAINT [FK_Transaction_CreditAccountNO]
GO
ALTER TABLE [TeamE].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_DebitAccountNO] FOREIGN KEY([DebitAccountNumber])
REFERENCES [TeamE].[RegularAccount] ([AccountNo])
GO
ALTER TABLE [TeamE].[Transactions] CHECK CONSTRAINT [FK_Transaction_DebitAccountNO]
GO
ALTER TABLE [TeamE].[CarLoan]  WITH CHECK ADD CHECK  (([LoanAmount]>=(0)))
GO
ALTER TABLE [TeamE].[CarLoan]  WITH CHECK ADD CHECK  (([LoanDuration]>=(0)))
GO
ALTER TABLE [TeamE].[CarLoan]  WITH CHECK ADD CHECK  (([LoanStatus]='Pending' OR [LoanStatus]='Approved' OR [LoanStatus]='Rejected'))
GO
ALTER TABLE [TeamE].[Customer]  WITH CHECK ADD CHECK  (([AnnualIncome]>(0)))
GO
ALTER TABLE [TeamE].[Customer]  WITH CHECK ADD CHECK  (([WorkExperience]>(0)))
GO
ALTER TABLE [TeamE].[EducationLoan]  WITH CHECK ADD CHECK  (([LoanAmount]>=(0)))
GO
ALTER TABLE [TeamE].[EducationLoan]  WITH CHECK ADD CHECK  (([LoanDuration]>=(0)))
GO
ALTER TABLE [TeamE].[EducationLoan]  WITH CHECK ADD CHECK  (([LoanStatus]='Pending' OR [LoanStatus]='Approved' OR [LoanStatus]='Rejected'))
GO
ALTER TABLE [TeamE].[FixedAccount]  WITH CHECK ADD CHECK  ((len([AccountNo])=(10)))
GO
ALTER TABLE [TeamE].[FixedAccount]  WITH CHECK ADD CHECK  (([Branch]='Delhi' OR [Branch]='Mumbai' OR [Branch]='Chennai' OR [Branch]='Bengaluru'))
GO
ALTER TABLE [TeamE].[FixedAccount]  WITH CHECK ADD CHECK  (([CurrentBalance]>=(0)))
GO
ALTER TABLE [TeamE].[FixedAccount]  WITH CHECK ADD CHECK  (([FDDeposit]>(0)))
GO
ALTER TABLE [TeamE].[FixedAccount]  WITH CHECK ADD CHECK  (([InterestRate]>=(0)))
GO
ALTER TABLE [TeamE].[FixedAccount]  WITH CHECK ADD CHECK  (([MinimumBalance]>=(0)))
GO
ALTER TABLE [TeamE].[FixedAccount]  WITH CHECK ADD CHECK  (([Status]='Active' OR [Status]='Closed'))
GO
ALTER TABLE [TeamE].[FixedAccount]  WITH CHECK ADD CHECK  (([tenure]>(0)))
GO
ALTER TABLE [TeamE].[HomeLoan]  WITH CHECK ADD CHECK  (([LoanAmount]>=(0)))
GO
ALTER TABLE [TeamE].[HomeLoan]  WITH CHECK ADD CHECK  (([LoanDuration]>=(0)))
GO
ALTER TABLE [TeamE].[HomeLoan]  WITH CHECK ADD CHECK  (([LoanStatus]='Pending' OR [LoanStatus]='Approved' OR [LoanStatus]='Rejected'))
GO
ALTER TABLE [TeamE].[PersonalLoan]  WITH CHECK ADD CHECK  (([LoanAmount]>=(0)))
GO
ALTER TABLE [TeamE].[PersonalLoan]  WITH CHECK ADD CHECK  (([LoanDuration]>=(0)))
GO
ALTER TABLE [TeamE].[PersonalLoan]  WITH CHECK ADD CHECK  (([LoanStatus]='Pending' OR [LoanStatus]='Approved' OR [LoanStatus]='Rejected'))
GO
ALTER TABLE [TeamE].[RegularAccount]  WITH CHECK ADD CHECK  ((len([AccountNo])=(10)))
GO
ALTER TABLE [TeamE].[RegularAccount]  WITH CHECK ADD CHECK  (([AccountType]='Savings' OR [AccountType]='Current'))
GO
ALTER TABLE [TeamE].[RegularAccount]  WITH CHECK ADD CHECK  (([Branch]='Delhi' OR [Branch]='Mumbai' OR [Branch]='Chennai' OR [Branch]='Bengaluru'))
GO
ALTER TABLE [TeamE].[RegularAccount]  WITH CHECK ADD CHECK  (([CurrentBalance]>=(0)))
GO
ALTER TABLE [TeamE].[RegularAccount]  WITH CHECK ADD CHECK  (([InterestRate]>=(0)))
GO
ALTER TABLE [TeamE].[RegularAccount]  WITH CHECK ADD CHECK  (([MinimumBalance]>=(0)))
GO
ALTER TABLE [TeamE].[RegularAccount]  WITH CHECK ADD CHECK  (([Status]='Active' OR [Status]='Closed'))
GO
ALTER TABLE [TeamE].[Transactions]  WITH CHECK ADD CHECK  (([Ammount]>(0)))
GO
ALTER TABLE [TeamE].[Transactions]  WITH CHECK ADD CHECK  (([TransactionType]='Credit' OR [TransactionType]='Debit' OR [TransactionType]='Transfer'))
GO
/****** Object:  StoredProcedure [TeamE].[AddChequeBook]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[AddCreditCard]    Script Date: 06-11-2019 09:43:53 ******/
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
		select @@RowCount as Column1,@cardNumber as Column2,@creditCardID as Column3
	end try
	begin catch
		throw;
	end catch
end

GO
/****** Object:  StoredProcedure [TeamE].[AddDebitCard]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[AddEmployee]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[AddsCustomer]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[ChangeFixedAccountBranch]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[ChangeRegularAccountBranch]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[ChangeRegularAccountType]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[CreateCarLoan]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[CreateEducationLoan]    Script Date: 06-11-2019 09:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [TeamE].[CreateEducationLoan]
( @CustomerID uniqueidentifier,@LoanID uniqueidentifier,  @LoanAmount money,
	@LoanDuration decimal,@Collateral money , @CollegeName varchar(20), @AdmissionID varchar(20) ,@Sponseror varchar(20))
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
	if @Collateral < 0
	throw 50004, 'Collateral Cannot be less than 0',5

   ---THROWING EXCEPTION IF  College Name IS NULL OR INVALID
	if @CollegeName is null or @CollegeName = ' ' 
		throw 50005, 'Invalid Customer No',3

	---THROWING EXCEPTION IF Admission ID IS NULL OR INVALID
	if @AdmissionID is null or @AdmissionID = ' ' 
		throw 50006, 'Invalid Customer No',3

	---THROWING EXCEPTION IF  Sponseror IS NULL OR INVALID
	if @Sponseror is null or @Sponseror = ' ' 
		throw 50007, 'Invalid Customer No',3
	
	---Declaring Auto Genrated Values like ID Date Time---
declare @Creationdate date,@Modificationdate date , @LoanStatus varchar(10) , @LoanType varchar(20 ) , @EducationLoanNumber int , @cn int
 
set @cn = (Select Count(*) from TeamE.EducationLoan)
set @EducationLoanNumber = 8000 +  @cn
set @Creationdate = SysDateTime()
set @Modificationdate = SysDateTime()
set @LoanStatus = 'Pending'   
set @LoanType = 'Education'
 ---Inserting Into Values---
Insert Into TeamE.EducationLoan(EducationLoanNumber, EducationLoanID , CustomerID  , LoanAmount , LoanStatus , LoanDuration , Collateral , CreationDateTime, LastModifiedTime, LoanType ,CollegeName , AdmissionID , Sponseror) Values (@EducationLoanNumber, @LoanId , @CustomerID  , @LoanAmount , @LoanStatus , @LoanDuration , @Collateral , @Creationdate, @Modificationdate , @LoanType , @CollegeName , @AdmissionID , @Sponseror)
Select @@RowCount  , @EducationLoanNumber 
end

GO
/****** Object:  StoredProcedure [TeamE].[CreateFixedAccount]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[CreateHomeLoan]    Script Date: 06-11-2019 09:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE procedure [TeamE].[CreateHomeLoan]
( @CustomerID uniqueidentifier,  @LoanAmount money,
	@LoanDuration decimal,@Collateral money)
as
begin
	---THROWING EXCEPTION IF  Customer Number IS NULL OR INVALID
	if @CustomerID is null or @CustomerID IN (select CustomerID from TeamE.HomeLoan )
		throw 50001, 'Invalid Customer No',3

	---THROWING EXCEPTION IF Amount of Loan IS NULL OR LESS THAN 0
	if @LoanAmount < 0 
	throw 50002, 'Invalid Amount of Loan',5
		
   ---THROWING EXCEPTION IF LoanDuration IS INVALID 
	if @LoanDuration < 0 
	throw 50003, 'Invalid Tenure',5

   ---THROWING EXCEPTION IF License IS NULL OR INVALID---
	if @Collateral < 0
	throw 50004, 'Collateral Cannot be less than 0',5

	---Declaring Auto Genrated Values like ID Date Time---
declare @Creationdate date,@Modificationdate date , @LoanStatus varchar(10) , @LoanType varchar(20 ) , @HomeLoanNumber int , @cn int , @LoanID uniqueidentifier
 
 set @LoanID = NEWID()
set @cn = (Select Count(*) from TeamE.HomeLoan)
set @HomeLoanNumber = 7000 +  @cn
set @Creationdate = SysDateTime()
set @Modificationdate = SysDateTime()
set @LoanStatus = 'Pending'   
set @LoanType = 'Home'
 ---Inserting Into Values---
Insert Into TeamE.HomeLoan(HomeLoanNumber, HomeLoanID , CustomerID  , LoanAmount , LoanStatus , LoanDuration , Collateral , CreationDateTime, LastModifiedTime, LoanType) Values (@HomeLoanNumber, @LoanId , @CustomerID  , @LoanAmount , @LoanStatus , @LoanDuration , @Collateral , @Creationdate, @Modificationdate , @LoanType)
Select @@RowCount as Column1 ,  @HomeLoanNumber as Column2 
end
GO
/****** Object:  StoredProcedure [TeamE].[CreatePersonalLoan]    Script Date: 06-11-2019 09:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	Create procedure [TeamE].[CreatePersonalLoan]
( @CustomerID uniqueidentifier,@LoanID uniqueidentifier,  @LoanAmount money,
	@LoanDuration decimal,@Collateral money)
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
	if @Collateral < 0
	throw 50004, 'Invalid License',5

	---Declaring Auto Genrated Values like ID Date Time---
declare @Creationdate date,@Modificationdate date , @LoanStatus varchar(10) , @LoanType varchar(20 ) , @PersonalLoanNumber int , @cn int
 
set @cn = (Select Count(*) from TeamE.PersonalLoan)
set @PersonalLoanNumber = 9000 +  @cn
set @Creationdate = SysDateTime()
set @Modificationdate = SysDateTime()
set @LoanStatus = 'Pending'   
set @LoanType = 'Personal'
 ---Inserting Into Values---
Insert Into TeamE.PersonalLoan(PersonalLoanNumber, PersonalLoanID , CustomerID  , LoanAmount , LoanStatus , LoanDuration , Collateral , CreationDateTime, LastModifiedTime, LoanType) Values (@PersonalLoanNumber, @LoanId , @CustomerID  , @LoanAmount , @LoanStatus , @LoanDuration , @Collateral , @Creationdate, @Modificationdate , @LoanType)
Select @@RowCount  , @PersonalLoanNumber 
end
GO
/****** Object:  StoredProcedure [TeamE].[CreateRegularAccount]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[Credit]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[Debit]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[DeleteEducationLoanByCustomerID]    Script Date: 06-11-2019 09:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---To Delete Car Loan By Loan ID 
Create Procedure [TeamE].[DeleteEducationLoanByCustomerID](@CustomerID uniqueidentifier)
as begin 

   ---THROWING EXCEPTION IF Loan ID IS INVALID OR NULL
	if @CustomerID is null 
		throw 500006,'Invalid Status',8

Delete from TeamE.EducationLoan
Where CustomerID = @CustomerID
end

GO
/****** Object:  StoredProcedure [TeamE].[DeleteEmployee]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[DeleteFixedAccount]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[DeleteHomeLoanByCustomerID]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[DeleteHomeLoanByLoanID]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[DeleteLoanByLoanID]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[DeletePersonalLoanByCustomerID]    Script Date: 06-11-2019 09:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---To Delete Car Loan By Loan ID 
CREATE Procedure [TeamE].[DeletePersonalLoanByCustomerID](@CustomerID uniqueidentifier)
as begin 

   ---THROWING EXCEPTION IF Loan ID IS INVALID OR NULL
	if @CustomerID is null OR @CustomerID NOT IN(Select CustomerID from TeamE.PersonalLoan)
		throw 500006,'Invalid Status',8

Delete from TeamE.PersonalLoan
Where CustomerID = @CustomerID
end

GO
/****** Object:  StoredProcedure [TeamE].[DeleteRegularAccount]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetAllChequeBooks]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetAllCreditCards]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetAllDebitCards]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[getAllEmployees]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetAllFixedAccounts]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetAllRegularAccounts]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetChequeBookByChequeBookID]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetChequeBookBySeriesStart]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetChequeBooksByAccountID]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetChequeBooksByAccountIDAndStatus]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetChequeBooksByRequestedDate]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetCreditCardByCreditCardNumber]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetCreditCardsByCustomerID]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetCreditCardsByCustomerIDAndStatus]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetCreditCardsByIssuedDate]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetCustomerByCustomerAadharNumber]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetCustomerByCustomerID]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetCustomerByCustomerMobile]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetCustomerByCustomerPANNumber]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetCustomerByEmail]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetCustomersByCustomerName]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetDebitCardByDebitCardNumber]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetDebitCardsByAccountID]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetDebitCardsByAccountIDAndStatus]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetFixedAccountByAccountNo]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetFixedAccountByCustomerID]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetFixedAccountsByAccountOpeningDate]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetFixedAccountsByBranch]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetFixedAccountsByCustomerID]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetRegularAccountByAccountNo]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetRegularAccountsByAccountOpeningDate]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetRegularAccountsByAccountType]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetRegularAccountsByBranch]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetRegularAccountsByCustomerID]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[GetsAllCustomer]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[ShowAllEducationLoan]    Script Date: 06-11-2019 09:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---To Show All Car Loan data
Create Procedure [TeamE].[ShowAllEducationLoan]
as begin 
Select * from TeamE.EducationLoan
end

GO
/****** Object:  StoredProcedure [TeamE].[ShowAllHomeLoan]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[ShowAllLoan]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[ShowAllPersonalLoan]    Script Date: 06-11-2019 09:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---To Show All Car Loan data
Create Procedure [TeamE].[ShowAllPersonalLoan]
as begin 
Select * from TeamE.PersonalLoan
end

GO
/****** Object:  StoredProcedure [TeamE].[ShowCarLoanByCustomerID]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[ShowCustomerByCustomerNumber]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[ShowEducationLoanByLoanID]    Script Date: 06-11-2019 09:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [TeamE].[ShowEducationLoanByLoanID](@CustomerID uniqueidentifier)
as begin
   ---THROWING EXCEPTION IF Loan ID IS INVALID OR NULL
	if  @CustomerID is null
		throw 500006,'Invalid Status',8
 
--- Selecting Value Based on Loan ID---
Select * from TeamE.EduactioLoan
Where CustomerID = @CustomerID
end

GO
/****** Object:  StoredProcedure [TeamE].[ShowEducationLoanByLoanStatus]    Script Date: 06-11-2019 09:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [TeamE].[ShowEducationLoanByLoanStatus](@LoanStatus varchar(10))
as begin 

		---THROWING EXCEPTION IF Loan Status IS INVALID OR NULL
		if @LoanStatus = null OR @LoanStatus = ''OR @LoanStatus NOT IN('Pending','Approved','Rejected')
			throw 500005,'Invalid Status',7

Select * from TeamE.EducationLoan
Where LoanStatus = @LoanStatus
end
GO
/****** Object:  StoredProcedure [TeamE].[ShowHomeLoanByLoanID]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[ShowHomeLoanByLoanStatus]    Script Date: 06-11-2019 09:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [TeamE].[ShowHomeLoanByLoanStatus](@LoanStatus varchar(10))
as begin 

		---THROWING EXCEPTION IF Loan Status IS INVALID OR NULL
		if @LoanStatus is null OR @LoanStatus = ''OR @LoanStatus NOT IN('Pending','Approved','Rejected')
			throw 500005,'Invalid Status',7

Select * from TeamE.HomeLoan
Where LoanStatus = @LoanStatus
end
GO
/****** Object:  StoredProcedure [TeamE].[ShowLoanByCustomerID]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[ShowLoanByLoanID]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[ShowLoanByLoanStatus]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[ShowPersonalLoanByLoanID]    Script Date: 06-11-2019 09:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---To Show Loan By Car Loan ID---
CREATE Procedure [TeamE].[ShowPersonalLoanByLoanID](@CustomerID uniqueidentifier)
as begin
   ---THROWING EXCEPTION IF Loan ID IS INVALID OR NULL
	if  @CustomerID is null
		throw 500006,'Invalid Status',8
 
--- Selecting Value Based on Loan ID---
Select * from TeamE.PersonalLoan
Where CustomerID = @CustomerID
end

GO
/****** Object:  StoredProcedure [TeamE].[ShowPersonalLoanByLoanStatus]    Script Date: 06-11-2019 09:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [TeamE].[ShowPersonalLoanByLoanStatus](@LoanStatus varchar(10))
as begin 

		---THROWING EXCEPTION IF Loan Status IS INVALID OR NULL
		if @LoanStatus is null OR @LoanStatus = ''OR @LoanStatus NOT IN('Pending','Approved','Rejected')
			throw 500005,'Invalid Status',7

Select * from TeamE.PersonalLoan
Where LoanStatus = @LoanStatus
end

GO
/****** Object:  StoredProcedure [TeamE].[Transfers]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[UpdateCarLoanByLoanID]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[UpdateChequeBookStatus]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[UpdateCreditCard]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[UpdateCreditCardStatus]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[UpdateDebitCardStatus]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[UpdateEducationLoanBycustomerID]    Script Date: 06-11-2019 09:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---To Update Car Loan By using Loan ID
Create Procedure [TeamE].[UpdateEducationLoanBycustomerID] (@CustomerID uniqueidentifier,  @LoanAmount money,
	@LoanDuration decimal,@Collateral money , @CollegeName varchar(20), @AdmissionID varchar(20) ,@Sponseror varchar(20))
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

		---THROWING EXCEPTION IF  College Name IS NULL OR INVALID
	if @CollegeName is null or @CollegeName = ' ' 
		throw 50005, 'Invalid Customer No',3

	---THROWING EXCEPTION IF Admission ID IS NULL OR INVALID
	if @AdmissionID is null or @AdmissionID = ' ' 
		throw 50006, 'Invalid Customer No',3

	---THROWING EXCEPTION IF  Sponseror IS NULL OR INVALID
	if @Sponseror is null or @Sponseror = ' ' 
		throw 50007, 'Invalid Customer No',3
	

	---Updating Values---

	
Update TeamE.EducationLoan

Set LoanAmount = @LoanAmount,
    LoanDuration = @LoanDuration,
	Collateral = @Collateral,
	CollegeName = @CollegeName,
	AdmissionID = @AdmissionID,
	Sponseror = @Sponseror
Where CustomerID = @CustomerID
end

GO
/****** Object:  StoredProcedure [TeamE].[UpdateEmployee]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[UpdateHomeLoanBycustomerID]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[updateHomeStatus]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[UpdateLoanByLoanID]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[UpdatePersonalLoanByLoanID]    Script Date: 06-11-2019 09:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---To Update Car Loan By using Loan ID
CREATE Procedure [TeamE].[UpdatePersonalLoanByLoanID] (@CustomerID uniqueidentifier,  @LoanAmount money,
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
		throw 50004, 'Invalid License',5

	---THROWING EXCEPTION IF Loan ID IS INVALID OR NULL
	if @CustomerID = null OR  @CustomerID NOT IN(Select CustomerID from TeamE.PersonalLoan)
		throw 500006,'Invalid Status',8

	---Updating Values---

	
Update TeamE.PersonalLoan

Set LoanAmount = @LoanAmount,
    LoanDuration = @LoanDuration,
	Collateral = @Collateral
Where CustomerID = @CustomerID
end
GO
/****** Object:  StoredProcedure [TeamE].[UpdatesCustomer]    Script Date: 06-11-2019 09:43:53 ******/
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
/****** Object:  StoredProcedure [TeamE].[updateStatus]    Script Date: 06-11-2019 09:43:53 ******/
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
