 USE [master]
GO
/****** Object:  Database [XtremeOESM]    Script Date: 2/2/2024 1:56:55 AM ******/
CREATE DATABASE [XtremeOESM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'XtremeOESM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.RAHIM\MSSQL\DATA\XtremeOESM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'XtremeOESM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.RAHIM\MSSQL\DATA\XtremeOESM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [XtremeOESM] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [XtremeOESM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [XtremeOESM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [XtremeOESM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [XtremeOESM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [XtremeOESM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [XtremeOESM] SET ARITHABORT OFF 
GO
ALTER DATABASE [XtremeOESM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [XtremeOESM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [XtremeOESM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [XtremeOESM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [XtremeOESM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [XtremeOESM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [XtremeOESM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [XtremeOESM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [XtremeOESM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [XtremeOESM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [XtremeOESM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [XtremeOESM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [XtremeOESM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [XtremeOESM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [XtremeOESM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [XtremeOESM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [XtremeOESM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [XtremeOESM] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [XtremeOESM] SET  MULTI_USER 
GO
ALTER DATABASE [XtremeOESM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [XtremeOESM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [XtremeOESM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [XtremeOESM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [XtremeOESM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [XtremeOESM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [XtremeOESM] SET QUERY_STORE = OFF
GO
USE [XtremeOESM]
GO
/****** Object:  Table [dbo].[TblCategory]    Script Date: 2/2/2024 1:56:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblCategory](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NULL,
 CONSTRAINT [PK_TblCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblCLass]    Script Date: 2/2/2024 1:56:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblCLass](
	[ClassID] [bigint] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](20) NULL,
	[IsActive] [bit] NULL,
	[InsertedDate] [datetime] NULL,
	[InsertedBy] [bigint] NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateBy] [bigint] NULL,
	[Notes] [nvarchar](500) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_TblCLass] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblExamClass]    Script Date: 2/2/2024 1:56:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblExamClass](
	[ExamID] [bigint] NOT NULL,
	[ClassID] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblExamQuestions]    Script Date: 2/2/2024 1:56:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblExamQuestions](
	[ExamID] [bigint] NOT NULL,
	[QuestionID] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ExamID] ASC,
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblExams]    Script Date: 2/2/2024 1:56:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblExams](
	[ExamID] [bigint] NOT NULL,
	[ExamName] [varchar](100) NOT NULL,
	[Description] [nvarchar](300) NULL,
	[DurationMinuts] [int] NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[TotalMarks] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK__TblExams__297521A7F7EF5E2E] PRIMARY KEY CLUSTERED 
(
	[ExamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblExamSubject]    Script Date: 2/2/2024 1:56:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblExamSubject](
	[ExamID] [bigint] NOT NULL,
	[SubjectID] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblMenues]    Script Date: 2/2/2024 1:56:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblMenues](
	[MenueID] [bigint] NOT NULL,
	[MenueName] [nvarchar](1000) NOT NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MenueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblOptions]    Script Date: 2/2/2024 1:56:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblOptions](
	[OptionID] [bigint] IDENTITY(1,1) NOT NULL,
	[QuestionID] [bigint] NULL,
	[OptionText] [varchar](max) NOT NULL,
	[IsCorrect] [bit] NOT NULL,
 CONSTRAINT [PK__TblOptio__92C7A1DF69FA7CDE] PRIMARY KEY CLUSTERED 
(
	[OptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblQuestionAnswers]    Script Date: 2/2/2024 1:56:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblQuestionAnswers](
	[AnswerID] [bigint] NOT NULL,
	[UserID] [bigint] NULL,
	[QuestionID] [bigint] NULL,
	[AnswerText] [varchar](max) NOT NULL,
	[IsCorrect] [bit] NOT NULL,
	[MarksObtained] [bigint] NULL,
	[AnswerDateTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblQuestions]    Script Date: 2/2/2024 1:56:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblQuestions](
	[QuestionID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NULL,
	[QuestionText] [varchar](max) NOT NULL,
	[QuestionTypeID] [bigint] NOT NULL,
	[SubjectID] [bigint] NOT NULL,
	[Marks] [int] NOT NULL,
	[StatusID] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[Notes] [nvarchar](500) NULL,
 CONSTRAINT [PK__TblQuest__0DC06F8C6B369792] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblQuestionTypes]    Script Date: 2/2/2024 1:56:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblQuestionTypes](
	[QuestionTypeID] [bigint] NOT NULL,
	[QuestionTypeName] [varchar](50) NOT NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblRoleMenues]    Script Date: 2/2/2024 1:56:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblRoleMenues](
	[RoleMenuesID] [bigint] NOT NULL,
	[RoleID] [bigint] NULL,
	[MenueID] [bigint] NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleMenuesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblRoles]    Script Date: 2/2/2024 1:56:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblRoles](
	[RoleID] [bigint] NOT NULL,
	[RoleName] [varchar](100) NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblShortAnswerQuestions]    Script Date: 2/2/2024 1:56:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblShortAnswerQuestions](
	[QuestionID] [bigint] NOT NULL,
	[MaxWordLimit] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblSubCategory]    Script Date: 2/2/2024 1:56:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblSubCategory](
	[SubCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[SubCategoryName] [nvarchar](100) NULL,
	[CategoryID] [int] NULL,
 CONSTRAINT [PK_TblSubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblSubjects]    Script Date: 2/2/2024 1:56:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblSubjects](
	[SubjectID] [bigint] IDENTITY(1,1) NOT NULL,
	[SubjectName] [varchar](20) NULL,
	[IsActive] [bit] NULL,
	[InsertedDate] [datetime] NULL,
	[InsertedBy] [bigint] NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateBy] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[Notes] [nvarchar](500) NULL,
 CONSTRAINT [PK_TblSubjects] PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblUserExamAssignedQuestions]    Script Date: 2/2/2024 1:56:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblUserExamAssignedQuestions](
	[AssignmentID] [bigint] NOT NULL,
	[UserID] [bigint] NULL,
	[AttemptID] [bigint] NULL,
	[QuestionID] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[AssignmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblUserExamAttempts]    Script Date: 2/2/2024 1:56:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblUserExamAttempts](
	[AttemptID] [bigint] NOT NULL,
	[UserID] [bigint] NULL,
	[ExamID] [bigint] NULL,
	[StartDateTime] [datetime] NOT NULL,
	[EndDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AttemptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblUserExamResponses]    Script Date: 2/2/2024 1:56:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblUserExamResponses](
	[ResponseID] [bigint] NOT NULL,
	[AttemptID] [bigint] NULL,
	[QuestionID] [bigint] NULL,
	[AnswerText] [varchar](max) NOT NULL,
	[IsCorrect] [bit] NOT NULL,
	[MarksObtained] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ResponseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblUserRoles]    Script Date: 2/2/2024 1:56:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblUserRoles](
	[RoleID] [bigint] NOT NULL,
	[UserID] [bigint] NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblUsers]    Script Date: 2/2/2024 1:56:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblUsers](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[FullName] [varchar](50) NULL,
	[FirstName] [varchar](25) NULL,
	[LastName] [varchar](25) NULL,
	[Password] [varchar](500) NULL,
	[Password_Salt] [varchar](500) NULL,
	[UniKey] [varchar](max) NULL,
	[UserTypeId] [bigint] NOT NULL,
	[ClassID] [bigint] NULL,
	[Email] [varchar](100) NOT NULL,
	[EmailConfirmed] [bit] NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[IDCardNumber] [nvarchar](50) NULL,
	[Gender] [int] NULL,
	[CountryId] [int] NULL,
	[CityId] [int] NULL,
	[PostalCode] [nvarchar](20) NULL,
	[FullAddress] [nvarchar](50) NULL,
	[DateOfBirth] [datetime] NULL,
	[EnrollmentYear] [date] NULL,
	[Code] [nvarchar](30) NULL,
	[RegistrationDate] [datetime] NULL,
	[LastLogin] [datetime] NULL,
	[IsActive] [int] NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK__TblUsers__1788CCAC53C66332] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TblCategory] ON 

INSERT [dbo].[TblCategory] ([CategoryID], [CategoryName]) VALUES (1, N'Gender')
INSERT [dbo].[TblCategory] ([CategoryID], [CategoryName]) VALUES (2, N'Status')
SET IDENTITY_INSERT [dbo].[TblCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[TblCLass] ON 

INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (9, N'Class-I', 1, NULL, NULL, CAST(N'2024-01-31T19:12:39.993' AS DateTime), NULL, N'SSFDSF', 1)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (10, N'Class-II', 1, NULL, NULL, CAST(N'2024-01-29T20:38:00.620' AS DateTime), NULL, N'FDSFS', 1)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (11, N'Class-III', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (12, N'Class-IV', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (13, N'Class-V', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (14, N'Class-VI', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (15, N'Class-VII', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (16, NULL, 1, CAST(N'2023-12-20T00:51:54.990' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (17, N'Test Class-2', 1, CAST(N'2023-12-20T00:56:09.613' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (18, N'Test Class-3', 0, CAST(N'2023-12-20T00:56:42.050' AS DateTime), NULL, CAST(N'2023-12-23T00:31:35.667' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (19, N'Test Class-4', 1, CAST(N'2023-12-20T00:57:05.677' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (20, N'Test Class-5', 1, CAST(N'2023-12-20T00:58:27.093' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (21, N'Test Class-6', 1, CAST(N'2023-12-20T00:59:01.300' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (22, N'Test Class-7', 1, CAST(N'2023-12-20T00:59:24.897' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (23, N'Test Class-8', 1, CAST(N'2023-12-20T01:01:44.707' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (24, N'Test class-9', 1, CAST(N'2023-12-20T01:05:20.280' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (25, N'test class-10', 1, CAST(N'2023-12-20T01:06:53.860' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (26, N'test class-11', 0, CAST(N'2023-12-20T01:07:21.067' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (27, N'Test Class-123', 1, CAST(N'2023-12-20T19:44:02.797' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (28, N'G ClASS', 1, CAST(N'2023-12-20T19:52:47.647' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (29, N'Sahib Jan', 0, CAST(N'2023-12-20T20:03:30.330' AS DateTime), NULL, CAST(N'2023-12-20T20:03:45.700' AS DateTime), NULL, N'asdasd', 1)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (30, N'sdfsdf', 1, CAST(N'2023-12-21T22:34:57.357' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (31, N'kjhkjhkj', 1, CAST(N'2023-12-21T22:35:47.503' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (32, N'zafdsadsa', 0, CAST(N'2023-12-21T22:42:54.947' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (33, N'TTTTTTT', 0, CAST(N'2023-12-21T22:43:20.250' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (34, N'EEEE', 0, CAST(N'2023-12-23T00:35:08.770' AS DateTime), NULL, CAST(N'2023-12-23T00:37:05.617' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (35, N'WWWWW', 0, CAST(N'2023-12-23T00:38:23.463' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (36, N'QQQQQ', 0, CAST(N'2023-12-23T00:44:42.720' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (37, N'AAAA', 0, CAST(N'2023-12-23T00:46:38.663' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (38, N'ddddd', 0, CAST(N'2023-12-23T00:49:42.653' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (39, N'gggg', 0, CAST(N'2023-12-23T00:52:12.527' AS DateTime), NULL, CAST(N'2023-12-23T00:52:31.803' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TblCLass] OFF
GO
INSERT [dbo].[TblExamClass] ([ExamID], [ClassID]) VALUES (1, 9)
INSERT [dbo].[TblExamClass] ([ExamID], [ClassID]) VALUES (2, 10)
GO
INSERT [dbo].[TblExamQuestions] ([ExamID], [QuestionID]) VALUES (1, 3)
INSERT [dbo].[TblExamQuestions] ([ExamID], [QuestionID]) VALUES (2, 4)
GO
INSERT [dbo].[TblExams] ([ExamID], [ExamName], [Description], [DurationMinuts], [StartTime], [EndTime], [TotalMarks], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'Math Exam', NULL, NULL, CAST(N'2023-11-22T09:00:00.000' AS DateTime), CAST(N'2023-11-22T10:30:00.000' AS DateTime), 100, 1, 1, CAST(N'2023-11-20T08:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[TblExams] ([ExamID], [ExamName], [Description], [DurationMinuts], [StartTime], [EndTime], [TotalMarks], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'Science Exam', NULL, NULL, CAST(N'2023-11-22T11:00:00.000' AS DateTime), CAST(N'2023-11-22T12:30:00.000' AS DateTime), 120, 1, 1, CAST(N'2023-11-20T09:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[TblExamSubject] ([ExamID], [SubjectID]) VALUES (1, 9)
INSERT [dbo].[TblExamSubject] ([ExamID], [SubjectID]) VALUES (2, 10)
GO
SET IDENTITY_INSERT [dbo].[TblOptions] ON 

INSERT [dbo].[TblOptions] ([OptionID], [QuestionID], [OptionText], [IsCorrect]) VALUES (1, 1, N'Paris', 1)
INSERT [dbo].[TblOptions] ([OptionID], [QuestionID], [OptionText], [IsCorrect]) VALUES (2, 1, N'London', 0)
INSERT [dbo].[TblOptions] ([OptionID], [QuestionID], [OptionText], [IsCorrect]) VALUES (3, 1, N'Berlin', 0)
INSERT [dbo].[TblOptions] ([OptionID], [QuestionID], [OptionText], [IsCorrect]) VALUES (4, 1, N'Madrid', 0)
INSERT [dbo].[TblOptions] ([OptionID], [QuestionID], [OptionText], [IsCorrect]) VALUES (5, 3, N'Earth', 0)
INSERT [dbo].[TblOptions] ([OptionID], [QuestionID], [OptionText], [IsCorrect]) VALUES (6, 3, N'Mars', 1)
INSERT [dbo].[TblOptions] ([OptionID], [QuestionID], [OptionText], [IsCorrect]) VALUES (7, 3, N'Venus', 0)
INSERT [dbo].[TblOptions] ([OptionID], [QuestionID], [OptionText], [IsCorrect]) VALUES (8, 3, N'Jupiter', 0)
INSERT [dbo].[TblOptions] ([OptionID], [QuestionID], [OptionText], [IsCorrect]) VALUES (10, 1, N'A', 1)
INSERT [dbo].[TblOptions] ([OptionID], [QuestionID], [OptionText], [IsCorrect]) VALUES (11, 1, N'B', 0)
INSERT [dbo].[TblOptions] ([OptionID], [QuestionID], [OptionText], [IsCorrect]) VALUES (12, 1, N'C', 0)
INSERT [dbo].[TblOptions] ([OptionID], [QuestionID], [OptionText], [IsCorrect]) VALUES (13, 1, N'D', 1)
INSERT [dbo].[TblOptions] ([OptionID], [QuestionID], [OptionText], [IsCorrect]) VALUES (14, 2, N'sfdsf', 0)
INSERT [dbo].[TblOptions] ([OptionID], [QuestionID], [OptionText], [IsCorrect]) VALUES (15, 2, N'sdfsdfds', 0)
INSERT [dbo].[TblOptions] ([OptionID], [QuestionID], [OptionText], [IsCorrect]) VALUES (16, 3, N'sfdsfsd', 0)
INSERT [dbo].[TblOptions] ([OptionID], [QuestionID], [OptionText], [IsCorrect]) VALUES (17, 3, N'sfdsf', 0)
INSERT [dbo].[TblOptions] ([OptionID], [QuestionID], [OptionText], [IsCorrect]) VALUES (18, 3, N'fsdfdsf', 1)
INSERT [dbo].[TblOptions] ([OptionID], [QuestionID], [OptionText], [IsCorrect]) VALUES (19, 3, N'sdfdsf', 0)
SET IDENTITY_INSERT [dbo].[TblOptions] OFF
GO
SET IDENTITY_INSERT [dbo].[TblQuestions] ON 

INSERT [dbo].[TblQuestions] ([QuestionID], [UserID], [QuestionText], [QuestionTypeID], [SubjectID], [Marks], [StatusID], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Notes]) VALUES (1, 2, N'What is the capital of France?444', 3, 9, 10, 4, 1, 1, CAST(N'2023-11-20T10:00:00.000' AS DateTime), NULL, CAST(N'2024-02-01T23:36:55.157' AS DateTime), NULL, NULL)
INSERT [dbo].[TblQuestions] ([QuestionID], [UserID], [QuestionText], [QuestionTypeID], [SubjectID], [Marks], [StatusID], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Notes]) VALUES (2, 3, N'Solve for x: 2x + 5 = 15', 2, 9, 15, 4, 1, 1, CAST(N'2023-11-20T11:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[TblQuestions] ([QuestionID], [UserID], [QuestionText], [QuestionTypeID], [SubjectID], [Marks], [StatusID], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Notes]) VALUES (3, 2, N'Who wrote Romeo and Juliet?', 1, 10, 12, 4, 1, 1, CAST(N'2023-11-20T12:00:00.000' AS DateTime), NULL, CAST(N'2024-02-02T01:51:30.430' AS DateTime), NULL, NULL)
INSERT [dbo].[TblQuestions] ([QuestionID], [UserID], [QuestionText], [QuestionTypeID], [SubjectID], [Marks], [StatusID], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Notes]) VALUES (4, 3, N'What is the square root of 64?', 2, 10, 8, 4, 1, 1, CAST(N'2023-11-20T13:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[TblQuestions] ([QuestionID], [UserID], [QuestionText], [QuestionTypeID], [SubjectID], [Marks], [StatusID], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Notes]) VALUES (11, 1, N'test question', 1, 10, 10, 4, 1, NULL, CAST(N'2024-01-25T23:45:27.567' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[TblQuestions] ([QuestionID], [UserID], [QuestionText], [QuestionTypeID], [SubjectID], [Marks], [StatusID], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Notes]) VALUES (12, 1, N'TYTYYTY', 1, 10, 2000, 4, 1, NULL, CAST(N'2024-01-29T20:38:54.283' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[TblQuestions] ([QuestionID], [UserID], [QuestionText], [QuestionTypeID], [SubjectID], [Marks], [StatusID], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Notes]) VALUES (13, 1, N'Testasdsad', 1, 10, 20, NULL, 1, NULL, CAST(N'2024-01-30T23:13:43.587' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[TblQuestions] ([QuestionID], [UserID], [QuestionText], [QuestionTypeID], [SubjectID], [Marks], [StatusID], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Notes]) VALUES (14, 1, N'Testasdsad', 1, 10, 22, NULL, 1, NULL, CAST(N'2024-01-30T23:17:47.167' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[TblQuestions] ([QuestionID], [UserID], [QuestionText], [QuestionTypeID], [SubjectID], [Marks], [StatusID], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Notes]) VALUES (15, 1, N'asdas3www', 1, 10, 33, NULL, 1, NULL, CAST(N'2024-01-30T23:18:53.177' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[TblQuestions] ([QuestionID], [UserID], [QuestionText], [QuestionTypeID], [SubjectID], [Marks], [StatusID], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Notes]) VALUES (16, 1, N'Asd', 1, 10, 12, NULL, 1, NULL, CAST(N'2024-01-30T23:20:12.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[TblQuestions] ([QuestionID], [UserID], [QuestionText], [QuestionTypeID], [SubjectID], [Marks], [StatusID], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Notes]) VALUES (17, 1, N'jgjgj', 1, 10, 29, NULL, 1, NULL, CAST(N'2024-01-30T23:24:03.813' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[TblQuestions] ([QuestionID], [UserID], [QuestionText], [QuestionTypeID], [SubjectID], [Marks], [StatusID], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Notes]) VALUES (18, 1, N'wqerwerew', 1, 10, 99, NULL, 1, NULL, CAST(N'2024-01-30T23:27:19.100' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[TblQuestions] ([QuestionID], [UserID], [QuestionText], [QuestionTypeID], [SubjectID], [Marks], [StatusID], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Notes]) VALUES (19, 1, N'TYYYY', 1, 10, 212, NULL, 1, NULL, CAST(N'2024-01-30T23:30:48.857' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[TblQuestions] ([QuestionID], [UserID], [QuestionText], [QuestionTypeID], [SubjectID], [Marks], [StatusID], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Notes]) VALUES (20, 1, N'KKKKKK', 1, 10, 99, NULL, 1, NULL, CAST(N'2024-01-30T23:36:23.540' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[TblQuestions] ([QuestionID], [UserID], [QuestionText], [QuestionTypeID], [SubjectID], [Marks], [StatusID], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Notes]) VALUES (21, 1, N'QQWW', 2, 9, 33, NULL, 1, NULL, CAST(N'2024-01-30T23:40:44.793' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[TblQuestions] ([QuestionID], [UserID], [QuestionText], [QuestionTypeID], [SubjectID], [Marks], [StatusID], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Notes]) VALUES (22, 1, N'LKLK', 1, 9, 76, NULL, 1, NULL, CAST(N'2024-01-30T23:50:46.590' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[TblQuestions] ([QuestionID], [UserID], [QuestionText], [QuestionTypeID], [SubjectID], [Marks], [StatusID], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Notes]) VALUES (23, 1, N'FFFF', 2, 10, 20, NULL, 1, NULL, CAST(N'2024-01-30T23:56:24.620' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[TblQuestions] ([QuestionID], [UserID], [QuestionText], [QuestionTypeID], [SubjectID], [Marks], [StatusID], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Notes]) VALUES (24, 1, N'KLKLL', 2, 10, 20, NULL, 1, NULL, CAST(N'2024-01-31T00:02:48.533' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[TblQuestions] ([QuestionID], [UserID], [QuestionText], [QuestionTypeID], [SubjectID], [Marks], [StatusID], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Notes]) VALUES (25, 1, N'GGGGGGGG', 1, 10, 89, NULL, 1, NULL, CAST(N'2024-01-31T00:12:23.940' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[TblQuestions] ([QuestionID], [UserID], [QuestionText], [QuestionTypeID], [SubjectID], [Marks], [StatusID], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Notes]) VALUES (26, 1, N'KLK', 1, 10, 33, NULL, 1, NULL, CAST(N'2024-01-31T00:13:18.923' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[TblQuestions] ([QuestionID], [UserID], [QuestionText], [QuestionTypeID], [SubjectID], [Marks], [StatusID], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Notes]) VALUES (27, 1, N'JJJ', 1, 9, 77, NULL, 1, NULL, CAST(N'2024-01-31T00:16:29.407' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[TblQuestions] ([QuestionID], [UserID], [QuestionText], [QuestionTypeID], [SubjectID], [Marks], [StatusID], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [IsDeleted], [Notes]) VALUES (28, 1, N'asfdsad', 1, 10, 323, NULL, 1, NULL, CAST(N'2024-01-31T00:28:14.907' AS DateTime), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TblQuestions] OFF
GO
INSERT [dbo].[TblQuestionTypes] ([QuestionTypeID], [QuestionTypeName], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'Radio Button Question', 1, CAST(N'2023-11-20T12:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[TblQuestionTypes] ([QuestionTypeID], [QuestionTypeName], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'True/False', 1, CAST(N'2023-11-20T12:30:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[TblQuestionTypes] ([QuestionTypeID], [QuestionTypeName], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, N'Multiple Checkbox Question', 1, CAST(N'2023-11-20T12:30:00.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[TblRoles] ([RoleID], [RoleName], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'Admin', 1, CAST(N'2023-11-20T08:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[TblRoles] ([RoleID], [RoleName], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'Student', 1, CAST(N'2023-11-20T09:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[TblShortAnswerQuestions] ([QuestionID], [MaxWordLimit]) VALUES (4, 50)
GO
SET IDENTITY_INSERT [dbo].[TblSubCategory] ON 

INSERT [dbo].[TblSubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (1, N'Male', 1)
INSERT [dbo].[TblSubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (2, N'Female', 1)
INSERT [dbo].[TblSubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (3, N'Other', 1)
INSERT [dbo].[TblSubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (4, N'Active', 2)
INSERT [dbo].[TblSubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (5, N'inActive', 2)
SET IDENTITY_INSERT [dbo].[TblSubCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[TblSubjects] ON 

INSERT [dbo].[TblSubjects] ([SubjectID], [SubjectName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [IsDeleted], [Notes]) VALUES (9, N'Math-21', 1, NULL, NULL, CAST(N'2024-01-24T19:37:27.933' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[TblSubjects] ([SubjectID], [SubjectName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [IsDeleted], [Notes]) VALUES (10, N'English', 1, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TblSubjects] OFF
GO
INSERT [dbo].[TblUserExamAssignedQuestions] ([AssignmentID], [UserID], [AttemptID], [QuestionID]) VALUES (1, 2, 1, 1)
INSERT [dbo].[TblUserExamAssignedQuestions] ([AssignmentID], [UserID], [AttemptID], [QuestionID]) VALUES (2, 3, 2, 3)
GO
INSERT [dbo].[TblUserExamAttempts] ([AttemptID], [UserID], [ExamID], [StartDateTime], [EndDateTime]) VALUES (1, 2, 1, CAST(N'2023-11-22T09:15:00.000' AS DateTime), CAST(N'2023-11-22T10:15:00.000' AS DateTime))
INSERT [dbo].[TblUserExamAttempts] ([AttemptID], [UserID], [ExamID], [StartDateTime], [EndDateTime]) VALUES (2, 3, 2, CAST(N'2023-11-22T11:30:00.000' AS DateTime), CAST(N'2023-11-22T12:15:00.000' AS DateTime))
GO
INSERT [dbo].[TblUserExamResponses] ([ResponseID], [AttemptID], [QuestionID], [AnswerText], [IsCorrect], [MarksObtained]) VALUES (1, 1, 1, N'Paris', 1, 10)
INSERT [dbo].[TblUserExamResponses] ([ResponseID], [AttemptID], [QuestionID], [AnswerText], [IsCorrect], [MarksObtained]) VALUES (2, 2, 3, N'William Shakespeare', 1, 12)
GO
INSERT [dbo].[TblUserRoles] ([RoleID], [UserID], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblUserRoles] ([RoleID], [UserID], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, 2, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[TblUsers] ON 

INSERT [dbo].[TblUsers] ([UserID], [UserName], [FullName], [FirstName], [LastName], [Password], [Password_Salt], [UniKey], [UserTypeId], [ClassID], [Email], [EmailConfirmed], [PhoneNumber], [IDCardNumber], [Gender], [CountryId], [CityId], [PostalCode], [FullAddress], [DateOfBirth], [EnrollmentYear], [Code], [RegistrationDate], [LastLogin], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'admin_user', N'SSFF', N'SS', N'FF', N'123', NULL, NULL, 1, 0, N'rahimiit44@gmail.com', 1, N'234324', N'343242423', NULL, NULL, NULL, N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2023-01-01' AS Date), N'44444', CAST(N'2023-11-20T08:30:00.000' AS DateTime), NULL, 0, NULL, NULL, NULL, CAST(N'2024-01-29T20:36:44.120' AS DateTime))
INSERT [dbo].[TblUsers] ([UserID], [UserName], [FullName], [FirstName], [LastName], [Password], [Password_Salt], [UniKey], [UserTypeId], [ClassID], [Email], [EmailConfirmed], [PhoneNumber], [IDCardNumber], [Gender], [CountryId], [CityId], [PostalCode], [FullAddress], [DateOfBirth], [EnrollmentYear], [Code], [RegistrationDate], [LastLogin], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'student1222', N'', N'', N'', N'1231', NULL, NULL, 2, 9, N'student1@example.com', NULL, N'324324324', N'', NULL, NULL, NULL, N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, N'', CAST(N'2023-11-20T10:00:00.000' AS DateTime), NULL, 4, NULL, NULL, NULL, CAST(N'2024-02-01T22:20:59.340' AS DateTime))
INSERT [dbo].[TblUsers] ([UserID], [UserName], [FullName], [FirstName], [LastName], [Password], [Password_Salt], [UniKey], [UserTypeId], [ClassID], [Email], [EmailConfirmed], [PhoneNumber], [IDCardNumber], [Gender], [CountryId], [CityId], [PostalCode], [FullAddress], [DateOfBirth], [EnrollmentYear], [Code], [RegistrationDate], [LastLogin], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, N'student2', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, N'student2@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-11-20T11:00:00.000' AS DateTime), NULL, 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblUsers] ([UserID], [UserName], [FullName], [FirstName], [LastName], [Password], [Password_Salt], [UniKey], [UserTypeId], [ClassID], [Email], [EmailConfirmed], [PhoneNumber], [IDCardNumber], [Gender], [CountryId], [CityId], [PostalCode], [FullAddress], [DateOfBirth], [EnrollmentYear], [Code], [RegistrationDate], [LastLogin], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (6, N'hamadiit44', N'hamad khan', N'hamad', N'khan', N'123', NULL, NULL, 2, 12, N'hamad@gmail.com', NULL, N'213213', N'123123', NULL, NULL, NULL, N'123213', N'UAE', CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, N'12321123', CAST(N'2023-12-23T01:51:41.597' AS DateTime), NULL, 4, NULL, CAST(N'2023-12-23T01:51:41.597' AS DateTime), NULL, CAST(N'2024-01-25T22:58:42.553' AS DateTime))
INSERT [dbo].[TblUsers] ([UserID], [UserName], [FullName], [FirstName], [LastName], [Password], [Password_Salt], [UniKey], [UserTypeId], [ClassID], [Email], [EmailConfirmed], [PhoneNumber], [IDCardNumber], [Gender], [CountryId], [CityId], [PostalCode], [FullAddress], [DateOfBirth], [EnrollmentYear], [Code], [RegistrationDate], [LastLogin], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10004, N'salman22', N'Salman Khan', N'Salman', N'Khan', N'123', NULL, NULL, 2, 21, N'salman@gmail.com', 1, N'033222233', N'1122', NULL, NULL, NULL, N'223', N'Pkistan', CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, N'10001', CAST(N'2024-01-23T18:33:56.120' AS DateTime), NULL, 4, NULL, CAST(N'2024-01-23T18:33:56.120' AS DateTime), NULL, CAST(N'2024-01-25T22:55:52.213' AS DateTime))
INSERT [dbo].[TblUsers] ([UserID], [UserName], [FullName], [FirstName], [LastName], [Password], [Password_Salt], [UniKey], [UserTypeId], [ClassID], [Email], [EmailConfirmed], [PhoneNumber], [IDCardNumber], [Gender], [CountryId], [CityId], [PostalCode], [FullAddress], [DateOfBirth], [EnrollmentYear], [Code], [RegistrationDate], [LastLogin], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10005, N'salman2266', N'Salman Khan', N'Salman', N'Khan', N'123', NULL, NULL, 2, 9, N'salman@gmail.com', 1, N'213213', N'100023', NULL, NULL, NULL, N'pakistan', N'pakistan', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-01' AS Date), N'10002323', CAST(N'2024-01-23T18:45:46.080' AS DateTime), NULL, 4, NULL, CAST(N'2024-01-23T18:45:46.080' AS DateTime), NULL, CAST(N'2024-01-25T22:41:00.760' AS DateTime))
INSERT [dbo].[TblUsers] ([UserID], [UserName], [FullName], [FirstName], [LastName], [Password], [Password_Salt], [UniKey], [UserTypeId], [ClassID], [Email], [EmailConfirmed], [PhoneNumber], [IDCardNumber], [Gender], [CountryId], [CityId], [PostalCode], [FullAddress], [DateOfBirth], [EnrollmentYear], [Code], [RegistrationDate], [LastLogin], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10006, N'GGG', N'GG', N'HHHHH', N'KKK', N'44444', NULL, NULL, 1, 9, N'GG@gmail.com', 1, N'868687', N'876868687', NULL, NULL, NULL, N'7868', N'hjgjghjgh', CAST(N'2024-01-17T00:00:00.000' AS DateTime), CAST(N'0666-01-01' AS Date), N'868768', CAST(N'2024-01-24T22:09:16.050' AS DateTime), NULL, 4, NULL, CAST(N'2024-01-24T22:09:16.050' AS DateTime), NULL, NULL)
INSERT [dbo].[TblUsers] ([UserID], [UserName], [FullName], [FirstName], [LastName], [Password], [Password_Salt], [UniKey], [UserTypeId], [ClassID], [Email], [EmailConfirmed], [PhoneNumber], [IDCardNumber], [Gender], [CountryId], [CityId], [PostalCode], [FullAddress], [DateOfBirth], [EnrollmentYear], [Code], [RegistrationDate], [LastLogin], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10007, N'wwww', N'www', N'wwwee', N'eee', N'123', NULL, NULL, 1, 24, N'www@gmail.com', 1, N'213123123', N'123213213', NULL, NULL, NULL, N'123123', N'1dweewrew', CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, N'3333324', CAST(N'2024-01-25T21:27:16.717' AS DateTime), NULL, 4, NULL, CAST(N'2024-01-25T21:27:16.717' AS DateTime), NULL, CAST(N'2024-01-29T20:35:54.343' AS DateTime))
INSERT [dbo].[TblUsers] ([UserID], [UserName], [FullName], [FirstName], [LastName], [Password], [Password_Salt], [UniKey], [UserTypeId], [ClassID], [Email], [EmailConfirmed], [PhoneNumber], [IDCardNumber], [Gender], [CountryId], [CityId], [PostalCode], [FullAddress], [DateOfBirth], [EnrollmentYear], [Code], [RegistrationDate], [LastLogin], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (10008, N'', N'', N'', N'', N'', NULL, NULL, 0, 0, N'', 1, N'', N'', NULL, NULL, NULL, N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, N'', CAST(N'2024-02-01T22:21:17.083' AS DateTime), NULL, 0, NULL, CAST(N'2024-02-01T22:21:17.083' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[TblUsers] OFF
GO
ALTER TABLE [dbo].[TblExamClass]  WITH CHECK ADD  CONSTRAINT [FK_TblExamClass_ClassID] FOREIGN KEY([ClassID])
REFERENCES [dbo].[TblCLass] ([ClassID])
GO
ALTER TABLE [dbo].[TblExamClass] CHECK CONSTRAINT [FK_TblExamClass_ClassID]
GO
ALTER TABLE [dbo].[TblExamQuestions]  WITH CHECK ADD  CONSTRAINT [FK__TblExamQu__ExamI__3F466844] FOREIGN KEY([ExamID])
REFERENCES [dbo].[TblExams] ([ExamID])
GO
ALTER TABLE [dbo].[TblExamQuestions] CHECK CONSTRAINT [FK__TblExamQu__ExamI__3F466844]
GO
ALTER TABLE [dbo].[TblExamQuestions]  WITH CHECK ADD  CONSTRAINT [FK__TblExamQu__Quest__403A8C7D] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[TblQuestions] ([QuestionID])
GO
ALTER TABLE [dbo].[TblExamQuestions] CHECK CONSTRAINT [FK__TblExamQu__Quest__403A8C7D]
GO
ALTER TABLE [dbo].[TblExamSubject]  WITH CHECK ADD  CONSTRAINT [FK_TblExamSubject_ExamID] FOREIGN KEY([ExamID])
REFERENCES [dbo].[TblExams] ([ExamID])
GO
ALTER TABLE [dbo].[TblExamSubject] CHECK CONSTRAINT [FK_TblExamSubject_ExamID]
GO
ALTER TABLE [dbo].[TblExamSubject]  WITH CHECK ADD  CONSTRAINT [FK_TblExamSubject_SubjectID] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[TblSubjects] ([SubjectID])
GO
ALTER TABLE [dbo].[TblExamSubject] CHECK CONSTRAINT [FK_TblExamSubject_SubjectID]
GO
ALTER TABLE [dbo].[TblOptions]  WITH CHECK ADD  CONSTRAINT [FK__TblOption__Quest__412EB0B6] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[TblQuestions] ([QuestionID])
GO
ALTER TABLE [dbo].[TblOptions] CHECK CONSTRAINT [FK__TblOption__Quest__412EB0B6]
GO
ALTER TABLE [dbo].[TblQuestionAnswers]  WITH CHECK ADD  CONSTRAINT [FK__TblQuesti__Quest__4222D4EF] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[TblQuestions] ([QuestionID])
GO
ALTER TABLE [dbo].[TblQuestionAnswers] CHECK CONSTRAINT [FK__TblQuesti__Quest__4222D4EF]
GO
ALTER TABLE [dbo].[TblQuestionAnswers]  WITH CHECK ADD  CONSTRAINT [FK__TblQuesti__UserI__4316F928] FOREIGN KEY([UserID])
REFERENCES [dbo].[TblUsers] ([UserID])
GO
ALTER TABLE [dbo].[TblQuestionAnswers] CHECK CONSTRAINT [FK__TblQuesti__UserI__4316F928]
GO
ALTER TABLE [dbo].[TblQuestions]  WITH CHECK ADD  CONSTRAINT [FK__TblQuesti__Quest__440B1D61] FOREIGN KEY([QuestionTypeID])
REFERENCES [dbo].[TblQuestionTypes] ([QuestionTypeID])
GO
ALTER TABLE [dbo].[TblQuestions] CHECK CONSTRAINT [FK__TblQuesti__Quest__440B1D61]
GO
ALTER TABLE [dbo].[TblQuestions]  WITH CHECK ADD  CONSTRAINT [FK__TblQuesti__UserI__44FF419A] FOREIGN KEY([UserID])
REFERENCES [dbo].[TblUsers] ([UserID])
GO
ALTER TABLE [dbo].[TblQuestions] CHECK CONSTRAINT [FK__TblQuesti__UserI__44FF419A]
GO
ALTER TABLE [dbo].[TblQuestions]  WITH CHECK ADD  CONSTRAINT [FK_TblQuestions_TblQuestions] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[TblQuestions] ([QuestionID])
GO
ALTER TABLE [dbo].[TblQuestions] CHECK CONSTRAINT [FK_TblQuestions_TblQuestions]
GO
ALTER TABLE [dbo].[TblQuestions]  WITH CHECK ADD  CONSTRAINT [FK_TblQuestions_TblSubjects] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[TblSubjects] ([SubjectID])
GO
ALTER TABLE [dbo].[TblQuestions] CHECK CONSTRAINT [FK_TblQuestions_TblSubjects]
GO
ALTER TABLE [dbo].[TblRoleMenues]  WITH CHECK ADD FOREIGN KEY([MenueID])
REFERENCES [dbo].[TblMenues] ([MenueID])
GO
ALTER TABLE [dbo].[TblRoleMenues]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[TblRoles] ([RoleID])
GO
ALTER TABLE [dbo].[TblShortAnswerQuestions]  WITH CHECK ADD  CONSTRAINT [FK__TblShortA__Quest__47DBAE45] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[TblQuestions] ([QuestionID])
GO
ALTER TABLE [dbo].[TblShortAnswerQuestions] CHECK CONSTRAINT [FK__TblShortA__Quest__47DBAE45]
GO
ALTER TABLE [dbo].[TblUserExamAssignedQuestions]  WITH CHECK ADD FOREIGN KEY([AttemptID])
REFERENCES [dbo].[TblUserExamAttempts] ([AttemptID])
GO
ALTER TABLE [dbo].[TblUserExamAssignedQuestions]  WITH CHECK ADD  CONSTRAINT [FK__TblUserEx__Quest__49C3F6B7] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[TblQuestions] ([QuestionID])
GO
ALTER TABLE [dbo].[TblUserExamAssignedQuestions] CHECK CONSTRAINT [FK__TblUserEx__Quest__49C3F6B7]
GO
ALTER TABLE [dbo].[TblUserExamAssignedQuestions]  WITH CHECK ADD  CONSTRAINT [FK__TblUserEx__UserI__4AB81AF0] FOREIGN KEY([UserID])
REFERENCES [dbo].[TblUsers] ([UserID])
GO
ALTER TABLE [dbo].[TblUserExamAssignedQuestions] CHECK CONSTRAINT [FK__TblUserEx__UserI__4AB81AF0]
GO
ALTER TABLE [dbo].[TblUserExamAttempts]  WITH CHECK ADD  CONSTRAINT [FK__TblUserEx__ExamI__4BAC3F29] FOREIGN KEY([ExamID])
REFERENCES [dbo].[TblExams] ([ExamID])
GO
ALTER TABLE [dbo].[TblUserExamAttempts] CHECK CONSTRAINT [FK__TblUserEx__ExamI__4BAC3F29]
GO
ALTER TABLE [dbo].[TblUserExamAttempts]  WITH CHECK ADD  CONSTRAINT [FK__TblUserEx__UserI__4CA06362] FOREIGN KEY([UserID])
REFERENCES [dbo].[TblUsers] ([UserID])
GO
ALTER TABLE [dbo].[TblUserExamAttempts] CHECK CONSTRAINT [FK__TblUserEx__UserI__4CA06362]
GO
ALTER TABLE [dbo].[TblUserExamResponses]  WITH CHECK ADD FOREIGN KEY([AttemptID])
REFERENCES [dbo].[TblUserExamAttempts] ([AttemptID])
GO
ALTER TABLE [dbo].[TblUserExamResponses]  WITH CHECK ADD  CONSTRAINT [FK__TblUserEx__Quest__4E88ABD4] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[TblQuestions] ([QuestionID])
GO
ALTER TABLE [dbo].[TblUserExamResponses] CHECK CONSTRAINT [FK__TblUserEx__Quest__4E88ABD4]
GO
ALTER TABLE [dbo].[TblUserRoles]  WITH CHECK ADD  CONSTRAINT [FK__TblUserRo__UserI__4F7CD00D] FOREIGN KEY([UserID])
REFERENCES [dbo].[TblUsers] ([UserID])
GO
ALTER TABLE [dbo].[TblUserRoles] CHECK CONSTRAINT [FK__TblUserRo__UserI__4F7CD00D]
GO
/****** Object:  StoredProcedure [dbo].[OES_ADD_Bool_QuestionAnswer]    Script Date: 2/2/2024 1:56:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OES_ADD_Bool_QuestionAnswer]
    @QuestionID3 INT,
    @AnswerboolOne VARCHAR(MAX),
    @boolrdoOne VARCHAR(1),
    @Answerbooltwo VARCHAR(MAX),
    @boolrdotwo VARCHAR(1)
 
AS
BEGIN
    INSERT INTO TblOptions (QuestionID, OptionText, IsCorrect)
    VALUES (@QuestionID3, @AnswerboolOne, @boolrdoOne),
           (@QuestionID3, @Answerbooltwo, @boolrdotwo)
  
END
GO
/****** Object:  StoredProcedure [dbo].[OES_ADD_CheckBox_QuestionAnswer]    Script Date: 2/2/2024 1:56:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OES_ADD_CheckBox_QuestionAnswer]
    @QuestionID2 INT,
    @txtOneChkAnswer VARCHAR(MAX),
    @IsOptionCorrectOne VARCHAR(1),
    @txttwoChkAnswer VARCHAR(MAX),
    @IsOptionCorrectTwo VARCHAR(1),
    @txtthreeChkAnswer VARCHAR(MAX),
    @IsOptionCorrecThree VARCHAR(1),
    @txtChkAfournswer VARCHAR(MAX),
    @IsOptionCorrectFour VARCHAR(1)
AS
BEGIN
    INSERT INTO TblOptions (QuestionID, OptionText, IsCorrect)
    VALUES (@QuestionID2, @txtOneChkAnswer, @IsOptionCorrectOne),
           (@QuestionID2, @txttwoChkAnswer, @IsOptionCorrectTwo),
           (@QuestionID2, @txtthreeChkAnswer, @IsOptionCorrecThree),
           (@QuestionID2, @txtChkAfournswer, @IsOptionCorrectFour)
END


 
GO
/****** Object:  StoredProcedure [dbo].[OES_ADD_RadioBox_QuestionAnswer]    Script Date: 2/2/2024 1:56:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OES_ADD_RadioBox_QuestionAnswer]
    @QuestionID INT,
    @txtradioanswerOne VARCHAR(MAX),
    @rdioOptionOne VARCHAR(1),
    @txtradioanswertwo VARCHAR(MAX),
    @rdioOptiontwo VARCHAR(1),
    @txtradioanswerthree VARCHAR(MAX),
    @rdioOptionthree VARCHAR(1),
    @txtradioanswerfour VARCHAR(MAX),
    @rdioOptionfour VARCHAR(1)
AS
BEGIN
    INSERT INTO TblOptions (QuestionID, OptionText, IsCorrect)
    VALUES (@QuestionID, @txtradioanswerOne, @rdioOptionOne),
           (@QuestionID, @txtradioanswertwo, @rdioOptiontwo),
           (@QuestionID, @txtradioanswerthree, @rdioOptionthree),
           (@QuestionID, @txtradioanswerfour, @rdioOptionfour)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AddEdit_QuestionsAnswers]    Script Date: 2/2/2024 1:56:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROC [dbo].[sp_AddEdit_QuestionsAnswers]
@QuestionID bigint ,
@OptionText nvarchar (300),
@IsCorrect int 
AS
 
BEGIN
insert into TblOptions (QuestionID , OptionText, IsCorrect) 
values (@QuestionID,@OptionText,@IsCorrect)
 
END


 

GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllClasses]    Script Date: 2/2/2024 1:56:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_GetAllClasses]

@Status nvarchar(max)=null

--@password nvarchar(max)=null
 

AS



BEGIN
Select *  from tblClass
					  
 

END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllQuestions]    Script Date: 2/2/2024 1:56:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_GetAllQuestions]

@Status nvarchar(max)=null


AS



BEGIN
Select QuestionID,QuestionText,u.UserName,q.UserID,t.QuestionTypeName,q.QuestionTypeID,Marks,q.IsActive from TblQuestions q inner join TblQuestionTypes t
on t.QuestionTypeID=q.QuestionTypeID
left join TblUsers u on u.UserID=q.UserID where q.IsActive=1					 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllSubjects]    Script Date: 2/2/2024 1:56:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_GetAllSubjects]

@Status nvarchar(max)=null

AS

BEGIN
Select *  from TblSubjects where IsActive=1
					  
 

END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllUser]    Script Date: 2/2/2024 1:56:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_GetAllUser]

@Status int
 
AS



BEGIN
Select u.*,r.RoleName,r.RoleID  from TblUsers u Inner join TblUserRoles ur 
on ur.RoleID=u.UserTypeId Inner JOin TblRoles r on r.RoleID=ur.RoleID
where u.IsActive=@Status
					  
 

END


 
GO
/****** Object:  StoredProcedure [dbo].[sp_GetClassesById]    Script Date: 2/2/2024 1:56:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_GetClassesById]

@ClassID bigint
AS
BEGIN
Select ClassID,ClassName,IsActive from tblClass where ClassID=@ClassID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetQuestionById]    Script Date: 2/2/2024 1:56:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_GetQuestionById]

@QuestionID bigint
AS
BEGIN
Select QuestionID,QuestionText,u.UserName,q.StatusID,q.SubjectID,q.UserID,t.QuestionTypeName,q.QuestionTypeID,Marks,q.IsActive from TblQuestions q inner join TblQuestionTypes t
on t.QuestionTypeID=q.QuestionTypeID
left join TblUsers u on u.UserID=q.UserID
where QuestionID=@QuestionID
END


 
GO
/****** Object:  StoredProcedure [dbo].[sp_GetQuestionType]    Script Date: 2/2/2024 1:56:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[sp_GetQuestionType]
 @Status bit
AS
 
BEGIN
Select  QuestionTypeID,QuestionTypeName from   TblQuestionTypes  --where IsActive=@Status
 
END


 
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSubject]    Script Date: 2/2/2024 1:56:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[sp_GetSubject]
 @Status bit
AS
 
BEGIN
Select  SubjectID,SubjectName from   TblSubjects  where IsActive=@Status
 
END


 
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSubjectById]    Script Date: 2/2/2024 1:56:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[sp_GetSubjectById]

@SubjectID bigint
AS
BEGIN
Select SubjectID,SubjectName,IsActive from TblSubjects where SubjectID=@SubjectID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserById]    Script Date: 2/2/2024 1:56:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_GetUserById]

@UserID bigint
AS
BEGIN
Select u.*,r.RoleName  from TblUsers u Inner join TblUserRoles ur on ur.RoleID=u.UserTypeId Inner JOin TblRoles r on r.RoleID=ur.RoleID
where u.UserID=@UserID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserClass]    Script Date: 2/2/2024 1:56:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROC [dbo].[sp_GetUserClass]
 @Status bit
AS
 
BEGIN
Select  ClassID,ClassName from   TblCLass  where IsActive=@Status
 
END


 
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserRole]    Script Date: 2/2/2024 1:56:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_GetUserRole]
 @Status bit
AS
 
BEGIN
Select RoleID,RoleName  from   TblRoles  where 1=1
 
END


 
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserStatus]    Script Date: 2/2/2024 1:56:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_GetUserStatus]
 @Status bit
AS
 
BEGIN
Select s.SubCategoryID as statusID, s.SubCategoryName as statusName  from   TblCategory c inner Join TblSubCategory s on c.CategoryID=s.CategoryID
where c.CategoryID=2
 
END


 
GO
/****** Object:  StoredProcedure [dbo].[sp_OES_Add_Class]    Script Date: 2/2/2024 1:56:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_OES_Add_Class]

@ClassName varchar(20)=null,
@Status bit,
@CLassID bigint=0

AS
BEGIN

if @CLassID!=0
begin
update TblCLass set ClassName=@ClassName,IsActive=@Status,UpdateDate=GETDATE() where ClassID=@CLassID

end
else
begin
Insert into TblCLass(ClassName,IsActive,InsertedDate) values(@ClassName,@Status ,GETDATE())
end
END
GO
/****** Object:  StoredProcedure [dbo].[sp_OES_Add_Question]    Script Date: 2/2/2024 1:56:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_OES_Add_Question]
@UserID bigint=0,
@QuestionType bigint=0,
@QuestionTitle nvarchar(300)=null,
@Marks decimal (18,5),
@Status bit,
@QuestionID bigint=0,
@Subject bigint=0

AS
BEGIN

 DECLARE @InsertedID bigint;
if @QuestionID!=0
begin
update TblQuestions set QuestionText=@QuestionTitle,SubjectID=@Subject,QuestionTypeID=@QuestionType,IsActive=@Status,UpdatedDate=GETDATE() where QuestionID=@QuestionID
select  @QuestionID as QuestionID
end
else
begin
Insert into TblQuestions(QuestionTypeID,QuestionText,SubjectID,Marks,IsActive,CreatedDate,UserID) 
 
values(@QuestionType,@QuestionTitle,@Subject,@Marks,@Status ,GETDATE(),@UserID)
    SET @InsertedID = SCOPE_IDENTITY();
end
END
SELECT @InsertedID AS QuestionID;

 
GO
/****** Object:  StoredProcedure [dbo].[sp_OES_Add_Subject]    Script Date: 2/2/2024 1:56:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_OES_Add_Subject]

@SubjectName varchar(20)=null,
@Status bit,
@SubjectID bigint=0

AS
BEGIN

if @SubjectID!=0
begin
update TblSubjects set SubjectName=@SubjectName,IsActive=1,UpdateDate=GETDATE() where SubjectID=@SubjectID

end
else
begin
Insert into TblSubjects(SubjectName,IsActive,InsertedDate) values(@SubjectName,@Status ,GETDATE())
end
END

 
GO
/****** Object:  StoredProcedure [dbo].[sp_OES_AddUpdate_User]    Script Date: 2/2/2024 1:56:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_OES_AddUpdate_User]

@Username nvarchar (50),
@EmailAddress nvarchar   (50),
@Password nvarchar  (500),
@Class int,
@Role int,
@DateOfBirth nvarchar(50) ,
@FullName nvarchar  (50),
@FirstName nvarchar  (25),
@LastName nvarchar  (50),
@PhoneNumber nvarchar (50),
@IDCardNumber nvarchar (50),
@PostalCode nvarchar  (20),
@Address nvarchar (50),
@IntakeYear   nvarchar(50),
@Code nvarchar(30),
@Status int,
@UserID bigint=0

AS
BEGIN

 
   DECLARE @ParsedDateOfBirth datetime;

    -- Convert the string DateOfBirth to datetime
	SET @ParsedDateOfBirth = TRY_CONVERT(datetime, @DateOfBirth, 101); -- Assuming '101' is the format for 'mm/dd/yyyy'

    

	   DECLARE @ParsedDateofEnrollment datetime;

    -- Convert the string DateOfBirth to datetime
    SET @ParsedDateofEnrollment = TRY_CONVERT(datetime, @IntakeYear, 101); -- Assuming '120' is the format for 'yyyy-mm-dd'



if @UserID!=0
begin
update TblUsers set UserName=@Username ,Email=@EmailAddress,Password=@Password,ClassID=@Class,
UserTypeId=@Role , DateOfBirth=@ParsedDateOfBirth, FullName=@FullName ,FirstName=@FirstName ,LastName=@LastName
 ,PhoneNumber=@PhoneNumber, IDCardNumber=@IDCardNumber ,PostalCode=@PostalCode, FullAddress=@Address ,
 EnrollmentYear=@ParsedDateofEnrollment, Code=@Code, IsActive=@Status,UpdatedDate=GETDATE() 
where UserID=@UserID
end
else
begin
Insert into TblUsers(UserName,Email,Password,ClassID,UserTypeId,DateOfBirth,FullName,FirstName,LastName,
PhoneNumber,IDCardNumber,PostalCode,FullAddress,EnrollmentYear,Code,IsActive,CreatedDate,RegistrationDate,EmailConfirmed) 
values(@Username,@EmailAddress ,@Password,@Class, @Role,@ParsedDateOfBirth,@FullName,@FirstName,@LastName,@PhoneNumber,
@IDCardNumber,@PostalCode,@Address,@ParsedDateofEnrollment,@Code,@Status,GETDATE(),GETDATE() ,1)
end
END

 
GO
/****** Object:  StoredProcedure [dbo].[sp_OES_Delete_Class]    Script Date: 2/2/2024 1:56:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_OES_Delete_Class]

@ClassID bigint,
@ReasonOfDeletion nvarchar(500)

AS
BEGIN
Update TblCLass set IsDeleted=1,IsActive=0,Notes=@ReasonOfDeletion,UpdateDate=getdate() where ClassID=@ClassID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_OES_Delete_Question]    Script Date: 2/2/2024 1:56:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_OES_Delete_Question]

@QuestionID bigint,
@ReasonOfDeletion nvarchar(500)

AS
BEGIN
if( select count(*) from TblExamQuestions where QuestionID=@QuestionID)>0
begin

select 2

end
else
begin
Update TblQuestions set IsDeleted=1,IsActive=0,Notes=@ReasonOfDeletion,UpdatedDate=getdate() 
where QuestionID=@QuestionID 
END
select 1
end
GO
/****** Object:  StoredProcedure [dbo].[sp_OES_Delete_Subject]    Script Date: 2/2/2024 1:56:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[sp_OES_Delete_Subject]

@SubjectID bigint,
@ReasonOfDeletion nvarchar(500)

AS
BEGIN
Update TblSubjects set IsDeleted=1,IsActive=0,Notes=@ReasonOfDeletion,UpdateDate=getdate() where SubjectID=@SubjectID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_VerifyUserAccountInformaion]    Script Date: 2/2/2024 1:56:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_VerifyUserAccountInformaion]

@userEmail nvarchar(max)=null,

@password nvarchar(max)=null
 

AS



BEGIN
SELECT        TblUsers.UserID,TblUsers.FirstName,TblUsers.LastName, TblUsers.UserTypeId, tblRoles.RoleName, 
TblUsers.Email, TblUsers.EmailConfirmed, TblUsers.Password, 
TblUsers.Password_Salt, 
                          TblUsers.UniKey, TblUsers.FullName AS EmplName
FROM            TblUsers LEFT OUTER JOIN
                         tblRoles ON TblUsers.UserTypeId = tblRoles.RoleID
					  where (TblUsers.Email = @userEmail)
					  
					  --and Password=@password
					  AND (TblUsers.EmailConfirmed = 1) 
 

END
GO
USE [master]
GO
ALTER DATABASE [XtremeOESM] SET  READ_WRITE 
GO
