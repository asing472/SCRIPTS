USE [13th Aug CLoud PT Immersive]
GO
/****** Object:  Table [TeamE].[HomeLoan]    Script Date: 14-11-2019 15:06:52 ******/
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
/****** Object:  Table [TeamF].[CarLoan]    Script Date: 14-11-2019 15:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [TeamF].[CarLoan](
	[LoanID] [uniqueidentifier] NOT NULL,
	[CustomerID] [uniqueidentifier] NULL,
	[AmountApplied] [money] NULL,
	[InterestRate] [decimal](10, 2) NULL,
	[EMI_amount] [money] NULL,
	[RepaymentPeriod] [tinyint] NULL,
	[DateOfApplication] [datetime] NULL,
	[LoanStatus] [varchar](15) NULL,
	[Occupation] [varchar](15) NULL,
	[GrossIncome] [money] NULL,
	[SalaryDeduction] [money] NULL,
	[VehicleType] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[LoanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [TeamE].[HomeLoan]  WITH CHECK ADD  CONSTRAINT [FK_HomeLoan_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [TeamE].[Customer] ([CustomerID])
GO
ALTER TABLE [TeamE].[HomeLoan] CHECK CONSTRAINT [FK_HomeLoan_CustomerID]
GO
ALTER TABLE [TeamF].[CarLoan]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [TeamF].[Customers] ([CustomerID])
ON UPDATE CASCADE
GO
ALTER TABLE [TeamE].[HomeLoan]  WITH CHECK ADD CHECK  (([LoanAmount]>=(0)))
GO
ALTER TABLE [TeamE].[HomeLoan]  WITH CHECK ADD CHECK  (([LoanAmount]>=(0)))
GO
ALTER TABLE [TeamE].[HomeLoan]  WITH CHECK ADD CHECK  (([LoanDuration]>=(0)))
GO
ALTER TABLE [TeamE].[HomeLoan]  WITH CHECK ADD CHECK  (([LoanDuration]>=(0)))
GO
ALTER TABLE [TeamE].[HomeLoan]  WITH CHECK ADD CHECK  (([LoanStatus]='Pending' OR [LoanStatus]='Approved' OR [LoanStatus]='Rejected'))
GO
ALTER TABLE [TeamE].[HomeLoan]  WITH CHECK ADD CHECK  (([LoanStatus]='Pending' OR [LoanStatus]='Approved' OR [LoanStatus]='Rejected'))
GO
