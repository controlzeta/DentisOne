USE [master]
GO
/****** Object:  Database [DentisOneDB]    Script Date: 21/02/2017 10:41:50 p. m. ******/
CREATE DATABASE [DentisOneDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DentisOneDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DentisOneDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DentisOneDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DentisOneDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DentisOneDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DentisOneDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DentisOneDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DentisOneDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DentisOneDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DentisOneDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DentisOneDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DentisOneDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DentisOneDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DentisOneDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DentisOneDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DentisOneDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DentisOneDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DentisOneDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DentisOneDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DentisOneDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DentisOneDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DentisOneDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DentisOneDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DentisOneDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DentisOneDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DentisOneDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DentisOneDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DentisOneDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DentisOneDB] SET RECOVERY FULL 
GO
ALTER DATABASE [DentisOneDB] SET  MULTI_USER 
GO
ALTER DATABASE [DentisOneDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DentisOneDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DentisOneDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DentisOneDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DentisOneDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DentisOneDB', N'ON'
GO
USE [DentisOneDB]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 21/02/2017 10:41:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[idAppointment] [int] IDENTITY(1,1) NOT NULL,
	[Treatment] [nvarchar](50) NULL,
	[Date] [date] NULL,
	[Time] [time](7) NULL,
	[Reminder] [bit] NULL,
	[idPatient] [int] NULL,
	[Comment] [nvarchar](500) NULL,
 CONSTRAINT [PK_Appointments] PRIMARY KEY CLUSTERED 
(
	[idAppointment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Balances]    Script Date: 21/02/2017 10:41:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Balances](
	[idBalance] [int] IDENTITY(1,1) NOT NULL,
	[idPatient] [int] NULL,
	[Balance] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Balances] PRIMARY KEY CLUSTERED 
(
	[idBalance] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClinicalStories]    Script Date: 21/02/2017 10:41:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClinicalStories](
	[idClinicalStory] [int] IDENTITY(1,1) NOT NULL,
	[CurrentCondition] [nvarchar](200) NULL,
 CONSTRAINT [PK_ClinicalStories] PRIMARY KEY CLUSTERED 
(
	[idClinicalStory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Heritage]    Script Date: 21/02/2017 10:41:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Heritage](
	[idHeritage] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Heritage] PRIMARY KEY CLUSTERED 
(
	[idHeritage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Patients]    Script Date: 21/02/2017 10:41:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[idPatient] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Age] [int] NULL,
	[PhoneNumber] [nchar](10) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Email] [nvarchar](80) NULL,
	[Folder] [nvarchar](50) NULL,
	[PreferredContactForm] [int] NULL,
	[idClinicalStory] [int] NULL,
	[Birthday] [date] NULL,
	[UserRegistration] [datetime] NULL,
	[Avatar] [nvarchar](50) NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[idPatient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payments]    Script Date: 21/02/2017 10:41:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[idPayment] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[Pay] [decimal](18, 0) NULL,
	[idBalance] [int] NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[idPayment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Patients] FOREIGN KEY([idPatient])
REFERENCES [dbo].[Patients] ([idPatient])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Patients]
GO
ALTER TABLE [dbo].[Balances]  WITH CHECK ADD  CONSTRAINT [FK_Balances_Patients] FOREIGN KEY([idPatient])
REFERENCES [dbo].[Patients] ([idPatient])
GO
ALTER TABLE [dbo].[Balances] CHECK CONSTRAINT [FK_Balances_Patients]
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_ClinicalStories] FOREIGN KEY([idClinicalStory])
REFERENCES [dbo].[ClinicalStories] ([idClinicalStory])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_Patients_ClinicalStories]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Balances] FOREIGN KEY([idBalance])
REFERENCES [dbo].[Balances] ([idBalance])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Balances]
GO
USE [master]
GO
ALTER DATABASE [DentisOneDB] SET  READ_WRITE 
GO
