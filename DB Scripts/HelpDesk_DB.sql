USE [master]
GO
/****** Object:  Database [mwd]    Script Date: 02/15/2018 7:01:23 PM ******/
CREATE DATABASE [mwd]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mwd', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\mwd.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'mwd_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\mwd_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [mwd] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mwd].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mwd] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mwd] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mwd] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mwd] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mwd] SET ARITHABORT OFF 
GO
ALTER DATABASE [mwd] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mwd] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mwd] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mwd] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mwd] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mwd] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mwd] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mwd] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mwd] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mwd] SET  DISABLE_BROKER 
GO
ALTER DATABASE [mwd] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mwd] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mwd] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mwd] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mwd] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mwd] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mwd] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mwd] SET RECOVERY FULL 
GO
ALTER DATABASE [mwd] SET  MULTI_USER 
GO
ALTER DATABASE [mwd] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mwd] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mwd] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mwd] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [mwd] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'mwd', N'ON'
GO
ALTER DATABASE [mwd] SET QUERY_STORE = OFF
GO
USE [mwd]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [mwd]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 02/15/2018 7:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Department] [varchar](50) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[helpdesk]    Script Date: 02/15/2018 7:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[helpdesk](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SeverityID] [int] NULL,
	[StatusID] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[UserID] [int] NULL,
	[Comments] [varchar](50) NULL,
	[RowCreatedDateTime] [datetime] NULL,
	[RowModifiedDateTime] [datetime] NULL,
	[RowModifiedSYSUserID] [int] NULL,
	[RowCreatedSYSUserID] [int] NULL,
 CONSTRAINT [PK_helpdesk] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOOKUPRole]    Script Date: 02/15/2018 7:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOOKUPRole](
	[LOOKUPRoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](100) NULL,
	[RoleDescription] [varchar](500) NULL,
	[RowCreatedSYSUserID] [int] NOT NULL,
	[RowCreatedDateTime] [datetime] NULL,
	[RowModifiedSYSUserID] [int] NOT NULL,
	[RowModifiedDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LOOKUPRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Severity]    Script Date: 02/15/2018 7:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Severity](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Severity] [varchar](50) NULL,
 CONSTRAINT [PK_Severity] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Status]    Script Date: 02/15/2018 7:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SYSUser]    Script Date: 02/15/2018 7:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYSUser](
	[SYSUserID] [int] IDENTITY(1,1) NOT NULL,
	[LoginName] [varchar](50) NOT NULL,
	[PasswordEncryptedText] [varchar](200) NOT NULL,
	[RowCreatedSYSUserID] [int] NOT NULL,
	[RowCreatedDateTime] [datetime] NULL,
	[RowModifiedSYSUserID] [int] NOT NULL,
	[RowModifiedDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SYSUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SYSUserProfile]    Script Date: 02/15/2018 7:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYSUserProfile](
	[SYSUserProfileID] [int] IDENTITY(1,1) NOT NULL,
	[SYSUserID] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Gender] [char](1) NOT NULL,
	[RowCreatedSYSUserID] [int] NOT NULL,
	[RowCreatedDateTime] [datetime] NULL,
	[RowModifiedSYSUserID] [int] NOT NULL,
	[RowModifiedDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SYSUserProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SYSUserRole]    Script Date: 02/15/2018 7:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYSUserRole](
	[SYSUserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[SYSUserID] [int] NOT NULL,
	[LOOKUPRoleID] [int] NOT NULL,
	[IsActive] [bit] NULL,
	[RowCreatedSYSUserID] [int] NOT NULL,
	[RowCreatedDateTime] [datetime] NULL,
	[RowModifiedSYSUserID] [int] NOT NULL,
	[RowModifiedDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SYSUserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[helpdesk] ADD  CONSTRAINT [DF_helpdesk_RowCreatedDateTime]  DEFAULT (getdate()) FOR [RowCreatedDateTime]
GO
ALTER TABLE [dbo].[helpdesk] ADD  CONSTRAINT [DF_helpdesk_RowModifiedDateTime]  DEFAULT (getdate()) FOR [RowModifiedDateTime]
GO
ALTER TABLE [dbo].[LOOKUPRole] ADD  DEFAULT ('') FOR [RoleName]
GO
ALTER TABLE [dbo].[LOOKUPRole] ADD  DEFAULT ('') FOR [RoleDescription]
GO
ALTER TABLE [dbo].[LOOKUPRole] ADD  DEFAULT (getdate()) FOR [RowCreatedDateTime]
GO
ALTER TABLE [dbo].[LOOKUPRole] ADD  DEFAULT (getdate()) FOR [RowModifiedDateTime]
GO
ALTER TABLE [dbo].[SYSUser] ADD  DEFAULT (getdate()) FOR [RowCreatedDateTime]
GO
ALTER TABLE [dbo].[SYSUser] ADD  DEFAULT (getdate()) FOR [RowModifiedDateTime]
GO
ALTER TABLE [dbo].[SYSUserProfile] ADD  DEFAULT (getdate()) FOR [RowCreatedDateTime]
GO
ALTER TABLE [dbo].[SYSUserProfile] ADD  DEFAULT (getdate()) FOR [RowModifiedDateTime]
GO
ALTER TABLE [dbo].[SYSUserRole] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SYSUserRole] ADD  DEFAULT (getdate()) FOR [RowCreatedDateTime]
GO
ALTER TABLE [dbo].[SYSUserRole] ADD  DEFAULT (getdate()) FOR [RowModifiedDateTime]
GO
ALTER TABLE [dbo].[helpdesk]  WITH CHECK ADD  CONSTRAINT [FK_helpdesk_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[helpdesk] CHECK CONSTRAINT [FK_helpdesk_Department]
GO
ALTER TABLE [dbo].[helpdesk]  WITH CHECK ADD  CONSTRAINT [FK_helpdesk_Severity] FOREIGN KEY([SeverityID])
REFERENCES [dbo].[Severity] ([ID])
GO
ALTER TABLE [dbo].[helpdesk] CHECK CONSTRAINT [FK_helpdesk_Severity]
GO
ALTER TABLE [dbo].[helpdesk]  WITH CHECK ADD  CONSTRAINT [FK_helpdesk_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[helpdesk] CHECK CONSTRAINT [FK_helpdesk_Status]
GO
ALTER TABLE [dbo].[helpdesk]  WITH CHECK ADD  CONSTRAINT [FK_helpdesk_SYSUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[SYSUser] ([SYSUserID])
GO
ALTER TABLE [dbo].[helpdesk] CHECK CONSTRAINT [FK_helpdesk_SYSUser]
GO
ALTER TABLE [dbo].[SYSUserProfile]  WITH CHECK ADD FOREIGN KEY([SYSUserID])
REFERENCES [dbo].[SYSUser] ([SYSUserID])
GO
ALTER TABLE [dbo].[SYSUserRole]  WITH CHECK ADD FOREIGN KEY([LOOKUPRoleID])
REFERENCES [dbo].[LOOKUPRole] ([LOOKUPRoleID])
GO
ALTER TABLE [dbo].[SYSUserRole]  WITH CHECK ADD FOREIGN KEY([SYSUserID])
REFERENCES [dbo].[SYSUser] ([SYSUserID])
GO
/****** Object:  StoredProcedure [dbo].[spHelpDeskGetDepartments]    Script Date: 02/15/2018 7:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spHelpDeskGetDepartments]  AS 
BEGIN 

	SET NOCOUNT ON; 

	SELECT ID, Department 
	FROM Department
END 
GO
/****** Object:  StoredProcedure [dbo].[spHelpDeskGetSeverities]    Script Date: 02/15/2018 7:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spHelpDeskGetSeverities]  AS 
BEGIN 

	SET NOCOUNT ON; 

	SELECT ID, Severity 
	FROM Severity 
END 
GO
/****** Object:  StoredProcedure [dbo].[spHelpDeskGetStatuses]    Script Date: 02/15/2018 7:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spHelpDeskGetStatuses]  AS 
BEGIN 

	SET NOCOUNT ON; 

	SELECT ID, Status 
	FROM Status 
END 
GO
/****** Object:  StoredProcedure [dbo].[spInsertHelpDeskTicket]    Script Date: 02/15/2018 7:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertHelpDeskTicket] 
	-- Add the parameters for the stored procedure here
	@FName varchar(50),
	@LName varchar(50),
	@Email varchar(50),
	@SeverityID int,
	@StatusID int,
	@DepartmentID int,
	@Comments varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO HelpDesk(FName,LName,Email,SeverityID,StatusID,DepartmentID,Comments)VALUES(@FName,@LName,@Email,@SeverityID,@StatusID,@DepartmentID,@Comments)
END
GO
USE [master]
GO
ALTER DATABASE [mwd] SET  READ_WRITE 
GO
