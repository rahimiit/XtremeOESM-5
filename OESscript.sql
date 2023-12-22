USE [master]
GO
/****** Object:  Database [XtremeOESM]    Script Date: 12/22/2023 2:36:12 AM ******/
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
/****** Object:  Table [dbo].[TblCLass]    Script Date: 12/22/2023 2:36:13 AM ******/
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
/****** Object:  Table [dbo].[TblExamClass]    Script Date: 12/22/2023 2:36:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblExamClass](
	[ExamID] [bigint] NOT NULL,
	[ClassID] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblExamQuestions]    Script Date: 12/22/2023 2:36:13 AM ******/
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
/****** Object:  Table [dbo].[TblExams]    Script Date: 12/22/2023 2:36:13 AM ******/
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
/****** Object:  Table [dbo].[TblExamSubject]    Script Date: 12/22/2023 2:36:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblExamSubject](
	[ExamID] [bigint] NOT NULL,
	[SubjectID] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblMenues]    Script Date: 12/22/2023 2:36:13 AM ******/
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
/****** Object:  Table [dbo].[TblOptions]    Script Date: 12/22/2023 2:36:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblOptions](
	[OptionID] [bigint] NOT NULL,
	[QuestionID] [bigint] NULL,
	[OptionText] [varchar](max) NOT NULL,
	[IsCorrect] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblQuestionAnswers]    Script Date: 12/22/2023 2:36:13 AM ******/
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
/****** Object:  Table [dbo].[TblQuestions]    Script Date: 12/22/2023 2:36:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblQuestions](
	[QuestionID] [bigint] NOT NULL,
	[UserID] [bigint] NULL,
	[QuestionText] [varchar](max) NOT NULL,
	[QuestionTypeID] [bigint] NOT NULL,
	[Marks] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblQuestionTypes]    Script Date: 12/22/2023 2:36:13 AM ******/
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
/****** Object:  Table [dbo].[TblRoleMenues]    Script Date: 12/22/2023 2:36:13 AM ******/
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
/****** Object:  Table [dbo].[TblRoles]    Script Date: 12/22/2023 2:36:13 AM ******/
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
/****** Object:  Table [dbo].[TblShortAnswerQuestions]    Script Date: 12/22/2023 2:36:13 AM ******/
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
/****** Object:  Table [dbo].[TblSubjects]    Script Date: 12/22/2023 2:36:13 AM ******/
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
 CONSTRAINT [PK_TblSubjects] PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblUserExamAssignedQuestions]    Script Date: 12/22/2023 2:36:13 AM ******/
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
/****** Object:  Table [dbo].[TblUserExamAttempts]    Script Date: 12/22/2023 2:36:13 AM ******/
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
/****** Object:  Table [dbo].[TblUserExamResponses]    Script Date: 12/22/2023 2:36:13 AM ******/
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
/****** Object:  Table [dbo].[TblUserRoles]    Script Date: 12/22/2023 2:36:13 AM ******/
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
/****** Object:  Table [dbo].[TblUsers]    Script Date: 12/22/2023 2:36:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblUsers](
	[UserID] [bigint] NOT NULL,
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
	[RegistrationDate] [datetime] NOT NULL,
	[LastLogin] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
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
SET IDENTITY_INSERT [dbo].[TblCLass] ON 

INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (9, N'Class-I', 0, NULL, NULL, CAST(N'2023-12-21T22:42:35.750' AS DateTime), NULL, N'SSFDSF', 1)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (10, N'Class-II', 0, NULL, NULL, CAST(N'2023-12-21T22:39:41.107' AS DateTime), NULL, N'FDSFS', 1)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (11, N'Class-III', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (12, N'Class-IV', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (13, N'Class-V', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (14, N'Class-VI', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (15, N'Class-VII', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (16, NULL, 1, CAST(N'2023-12-20T00:51:54.990' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (17, N'Test Class-2', 1, CAST(N'2023-12-20T00:56:09.613' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblCLass] ([ClassID], [ClassName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy], [Notes], [IsDeleted]) VALUES (18, N'Test Class-3', 1, CAST(N'2023-12-20T00:56:42.050' AS DateTime), NULL, NULL, NULL, NULL, NULL)
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
INSERT [dbo].[TblOptions] ([OptionID], [QuestionID], [OptionText], [IsCorrect]) VALUES (1, 1, N'Paris', 1)
INSERT [dbo].[TblOptions] ([OptionID], [QuestionID], [OptionText], [IsCorrect]) VALUES (2, 1, N'London', 0)
INSERT [dbo].[TblOptions] ([OptionID], [QuestionID], [OptionText], [IsCorrect]) VALUES (3, 1, N'Berlin', 0)
INSERT [dbo].[TblOptions] ([OptionID], [QuestionID], [OptionText], [IsCorrect]) VALUES (4, 1, N'Madrid', 0)
INSERT [dbo].[TblOptions] ([OptionID], [QuestionID], [OptionText], [IsCorrect]) VALUES (5, 3, N'Earth', 0)
INSERT [dbo].[TblOptions] ([OptionID], [QuestionID], [OptionText], [IsCorrect]) VALUES (6, 3, N'Mars', 1)
INSERT [dbo].[TblOptions] ([OptionID], [QuestionID], [OptionText], [IsCorrect]) VALUES (7, 3, N'Venus', 0)
INSERT [dbo].[TblOptions] ([OptionID], [QuestionID], [OptionText], [IsCorrect]) VALUES (8, 3, N'Jupiter', 0)
GO
INSERT [dbo].[TblQuestions] ([QuestionID], [UserID], [QuestionText], [QuestionTypeID], [Marks], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, 2, N'What is the capital of France?', 1, 10, 1, 1, CAST(N'2023-11-20T10:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[TblQuestions] ([QuestionID], [UserID], [QuestionText], [QuestionTypeID], [Marks], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, 3, N'Solve for x: 2x + 5 = 15', 2, 15, 1, 1, CAST(N'2023-11-20T11:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[TblQuestions] ([QuestionID], [UserID], [QuestionText], [QuestionTypeID], [Marks], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, 2, N'Who wrote Romeo and Juliet?', 1, 12, 1, 1, CAST(N'2023-11-20T12:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[TblQuestions] ([QuestionID], [UserID], [QuestionText], [QuestionTypeID], [Marks], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (4, 3, N'What is the square root of 64?', 2, 8, 1, 1, CAST(N'2023-11-20T13:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[TblQuestionTypes] ([QuestionTypeID], [QuestionTypeName], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'Multiple Choice', 1, CAST(N'2023-11-20T12:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[TblQuestionTypes] ([QuestionTypeID], [QuestionTypeName], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'Math Problem', 1, CAST(N'2023-11-20T12:30:00.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[TblRoles] ([RoleID], [RoleName], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'Admin', 1, CAST(N'2023-11-20T08:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[TblRoles] ([RoleID], [RoleName], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'Student', 1, CAST(N'2023-11-20T09:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[TblShortAnswerQuestions] ([QuestionID], [MaxWordLimit]) VALUES (4, 50)
GO
SET IDENTITY_INSERT [dbo].[TblSubjects] ON 

INSERT [dbo].[TblSubjects] ([SubjectID], [SubjectName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy]) VALUES (9, N'Math', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblSubjects] ([SubjectID], [SubjectName], [IsActive], [InsertedDate], [InsertedBy], [UpdateDate], [UpdateBy]) VALUES (10, N'English', 1, NULL, NULL, NULL, NULL)
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
INSERT [dbo].[TblUsers] ([UserID], [UserName], [FullName], [FirstName], [LastName], [Password], [Password_Salt], [UniKey], [UserTypeId], [ClassID], [Email], [EmailConfirmed], [PhoneNumber], [IDCardNumber], [Gender], [CountryId], [CityId], [PostalCode], [FullAddress], [DateOfBirth], [EnrollmentYear], [Code], [RegistrationDate], [LastLogin], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, N'admin_user', NULL, N'Raim', N'Syed', N'123', NULL, NULL, 1, NULL, N'rahimiit44@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-11-20T08:30:00.000' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblUsers] ([UserID], [UserName], [FullName], [FirstName], [LastName], [Password], [Password_Salt], [UniKey], [UserTypeId], [ClassID], [Email], [EmailConfirmed], [PhoneNumber], [IDCardNumber], [Gender], [CountryId], [CityId], [PostalCode], [FullAddress], [DateOfBirth], [EnrollmentYear], [Code], [RegistrationDate], [LastLogin], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, N'student1', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, N'student1@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-11-20T10:00:00.000' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblUsers] ([UserID], [UserName], [FullName], [FirstName], [LastName], [Password], [Password_Salt], [UniKey], [UserTypeId], [ClassID], [Email], [EmailConfirmed], [PhoneNumber], [IDCardNumber], [Gender], [CountryId], [CityId], [PostalCode], [FullAddress], [DateOfBirth], [EnrollmentYear], [Code], [RegistrationDate], [LastLogin], [IsActive], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, N'student2', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, N'student2@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-11-20T11:00:00.000' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
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
ALTER TABLE [dbo].[TblExamQuestions]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[TblQuestions] ([QuestionID])
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
ALTER TABLE [dbo].[TblOptions]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[TblQuestions] ([QuestionID])
GO
ALTER TABLE [dbo].[TblQuestionAnswers]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[TblQuestions] ([QuestionID])
GO
ALTER TABLE [dbo].[TblQuestionAnswers]  WITH CHECK ADD  CONSTRAINT [FK__TblQuesti__UserI__4316F928] FOREIGN KEY([UserID])
REFERENCES [dbo].[TblUsers] ([UserID])
GO
ALTER TABLE [dbo].[TblQuestionAnswers] CHECK CONSTRAINT [FK__TblQuesti__UserI__4316F928]
GO
ALTER TABLE [dbo].[TblQuestions]  WITH CHECK ADD FOREIGN KEY([QuestionTypeID])
REFERENCES [dbo].[TblQuestionTypes] ([QuestionTypeID])
GO
ALTER TABLE [dbo].[TblQuestions]  WITH CHECK ADD  CONSTRAINT [FK__TblQuesti__UserI__44FF419A] FOREIGN KEY([UserID])
REFERENCES [dbo].[TblUsers] ([UserID])
GO
ALTER TABLE [dbo].[TblQuestions] CHECK CONSTRAINT [FK__TblQuesti__UserI__44FF419A]
GO
ALTER TABLE [dbo].[TblRoleMenues]  WITH CHECK ADD FOREIGN KEY([MenueID])
REFERENCES [dbo].[TblMenues] ([MenueID])
GO
ALTER TABLE [dbo].[TblRoleMenues]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[TblRoles] ([RoleID])
GO
ALTER TABLE [dbo].[TblShortAnswerQuestions]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[TblQuestions] ([QuestionID])
GO
ALTER TABLE [dbo].[TblUserExamAssignedQuestions]  WITH CHECK ADD FOREIGN KEY([AttemptID])
REFERENCES [dbo].[TblUserExamAttempts] ([AttemptID])
GO
ALTER TABLE [dbo].[TblUserExamAssignedQuestions]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[TblQuestions] ([QuestionID])
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
ALTER TABLE [dbo].[TblUserExamResponses]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[TblQuestions] ([QuestionID])
GO
ALTER TABLE [dbo].[TblUserRoles]  WITH CHECK ADD  CONSTRAINT [FK__TblUserRo__UserI__4F7CD00D] FOREIGN KEY([UserID])
REFERENCES [dbo].[TblUsers] ([UserID])
GO
ALTER TABLE [dbo].[TblUserRoles] CHECK CONSTRAINT [FK__TblUserRo__UserI__4F7CD00D]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllClasses]    Script Date: 12/22/2023 2:36:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetAllUser]    Script Date: 12/22/2023 2:36:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_GetAllUser]

@Status bit
 
AS



BEGIN
Select *  from TblUsers u Inner join TblUserRoles ur on ur.UserID=u.UserID Inner JOin TblRoles r on r.RoleID=ur.RoleID
where u.IsActive=@Status
					  
 

END


 
GO
/****** Object:  StoredProcedure [dbo].[sp_GetClassesById]    Script Date: 12/22/2023 2:36:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetUserClass]    Script Date: 12/22/2023 2:36:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetUserRole]    Script Date: 12/22/2023 2:36:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_GetUserRole]
 @Status bit
AS
 
BEGIN
Select RoleID,RoleName ,* from   TblRoles  where 1=1
 
END


 
GO
/****** Object:  StoredProcedure [dbo].[sp_OES_Add_Class]    Script Date: 12/22/2023 2:36:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_OES_Delete_Class]    Script Date: 12/22/2023 2:36:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_VerifyUserAccountInformaion]    Script Date: 12/22/2023 2:36:13 AM ******/
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
					  where (TblUsers.Email = @userEmail) AND (TblUsers.EmailConfirmed = 1) 
 

END
GO
USE [master]
GO
ALTER DATABASE [XtremeOESM] SET  READ_WRITE 
GO
