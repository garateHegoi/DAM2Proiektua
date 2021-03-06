USE [master]
GO
/****** Object:  Database [game]    Script Date: 16/05/2022 20:58:36 ******/
CREATE DATABASE [game]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'game', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HGARATE\MSSQL\DATA\game.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'game_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HGARATE\MSSQL\DATA\game_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [game] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [game].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [game] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [game] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [game] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [game] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [game] SET ARITHABORT OFF 
GO
ALTER DATABASE [game] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [game] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [game] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [game] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [game] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [game] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [game] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [game] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [game] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [game] SET  DISABLE_BROKER 
GO
ALTER DATABASE [game] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [game] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [game] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [game] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [game] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [game] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [game] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [game] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [game] SET  MULTI_USER 
GO
ALTER DATABASE [game] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [game] SET DB_CHAINING OFF 
GO
ALTER DATABASE [game] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [game] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [game] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [game] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [game] SET QUERY_STORE = OFF
GO
USE [game]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 16/05/2022 20:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 16/05/2022 20:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 16/05/2022 20:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 16/05/2022 20:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[game]    Script Date: 16/05/2022 20:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[game](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[num] [int] NULL,
	[time] [int] NULL,
	[player1] [varchar](max) NULL,
	[player2] [varchar](max) NULL,
	[winner] [varchar](max) NULL,
	[data] [smalldatetime] NULL,
 CONSTRAINT [PK_game] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e8c39ea6-edb3-42f8-8cea-50a890b248fa', N'garate.hegoi@uni.eus', N'GARATE.HEGOI@UNI.EUS', N'garate.hegoi@uni.eus', N'GARATE.HEGOI@UNI.EUS', 0, N'AQAAAAEAACcQAAAAEGlI7hDr0Ukk/BnFesq9nkIbvwdrC8B4YTIVHNdQ0xGh3AiC/IiZA/CTcQ0WeFBiOw==', N'H7HC6UTXY5BGAKCDLXUG6URUV7RLVNGG', N'b59f76ca-aa79-4223-b44e-f6e5426d267f', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[game] ON 

INSERT [dbo].[game] ([id], [num], [time], [player1], [player2], [winner], [data]) VALUES (1, 1, 5000, N'1', N'2', N'1', CAST(N'2022-05-14T17:40:00' AS SmallDateTime))
INSERT [dbo].[game] ([id], [num], [time], [player1], [player2], [winner], [data]) VALUES (2, 2, 6000, N'2', N'3', N'3', CAST(N'2022-05-14T17:40:00' AS SmallDateTime))
INSERT [dbo].[game] ([id], [num], [time], [player1], [player2], [winner], [data]) VALUES (3, 3, 5000, N'garate.hegoi@uni.eus', N'garate.hegoi@uni.eus', N'garate.hegoi@uni.eus', CAST(N'2022-05-14T17:40:00' AS SmallDateTime))
INSERT [dbo].[game] ([id], [num], [time], [player1], [player2], [winner], [data]) VALUES (4, 4, 6000, N'garate.hegoi', N'fdjfhdj', N'djfdhd', CAST(N'2022-05-14T17:40:00' AS SmallDateTime))
INSERT [dbo].[game] ([id], [num], [time], [player1], [player2], [winner], [data]) VALUES (5, 5, 6000, N'garate.hegoi', N'fdjfhdj', N'djfdhd', CAST(N'2022-05-14T17:40:00' AS SmallDateTime))
INSERT [dbo].[game] ([id], [num], [time], [player1], [player2], [winner], [data]) VALUES (6, 6, 6000, N'garate.hegoi', N'fdjfhdj', N'djfdhd', CAST(N'2022-05-14T17:40:00' AS SmallDateTime))
INSERT [dbo].[game] ([id], [num], [time], [player1], [player2], [winner], [data]) VALUES (7, 7, 6000, N'garate', N'sddff', N'uwu', CAST(N'2022-05-14T17:40:00' AS SmallDateTime))
INSERT [dbo].[game] ([id], [num], [time], [player1], [player2], [winner], [data]) VALUES (8, 8, 8000, N'garate.hegoi@uni.eus', N'garate.hegoi@uni.eus', N'garate.hegoi@uni.eus', CAST(N'2022-05-14T17:40:00' AS SmallDateTime))
INSERT [dbo].[game] ([id], [num], [time], [player1], [player2], [winner], [data]) VALUES (9, 9, 8000, N'prueba1@gmail.com', N'prueba1@gmail.com', N'garate.hegoi@uni.eus', CAST(N'2022-05-14T17:40:00' AS SmallDateTime))
INSERT [dbo].[game] ([id], [num], [time], [player1], [player2], [winner], [data]) VALUES (10, 10, 8000, N'prueba1@gmail.com', N'prueba1@gmail.com', N'garate.hegoi@uni.eus', CAST(N'2022-05-14T17:40:00' AS SmallDateTime))
INSERT [dbo].[game] ([id], [num], [time], [player1], [player2], [winner], [data]) VALUES (11, 11, 8000, N'garate.hegoi@gmail.com', N'garate.hegoi@gmail.com', N'garate.hegoi@uni.eus', CAST(N'2022-05-14T17:40:00' AS SmallDateTime))
INSERT [dbo].[game] ([id], [num], [time], [player1], [player2], [winner], [data]) VALUES (12, 14, 8000, N'gagaga', N'gagaga', N'garate.hegoi@uni.eus', CAST(N'2022-05-14T18:04:00' AS SmallDateTime))
INSERT [dbo].[game] ([id], [num], [time], [player1], [player2], [winner], [data]) VALUES (13, 14, 8000, N'dfdfgd', N'dfdfgd', N'garate.hegoi@uni.eus', CAST(N'2022-05-14T18:04:00' AS SmallDateTime))
INSERT [dbo].[game] ([id], [num], [time], [player1], [player2], [winner], [data]) VALUES (14, 14, 8000, N'sdggf', N'sdggf', N'garate.hegoi@uni.eus', CAST(N'2022-05-16T17:08:00' AS SmallDateTime))
INSERT [dbo].[game] ([id], [num], [time], [player1], [player2], [winner], [data]) VALUES (15, 14, 8000, N'wefsdfs', N'wefsdfs', N'garate.hegoi@uni.eus', CAST(N'2022-05-16T17:08:00' AS SmallDateTime))
INSERT [dbo].[game] ([id], [num], [time], [player1], [player2], [winner], [data]) VALUES (16, 14, 8000, N'garate.hegoi@uni.eus', N'garate.hegoi@uni.eus', N'garate.hegoi@uni.eus', CAST(N'2022-05-16T17:19:00' AS SmallDateTime))
INSERT [dbo].[game] ([id], [num], [time], [player1], [player2], [winner], [data]) VALUES (17, 14, 8000, N'prueba1@gmail.com', N'prueba1@gmail.com', N'garate.hegoi@uni.eus', CAST(N'2022-05-16T17:19:00' AS SmallDateTime))
INSERT [dbo].[game] ([id], [num], [time], [player1], [player2], [winner], [data]) VALUES (18, 14, 8000, N'prueba1@gmail.com', N'prueba1@gmail.com', N'garate.hegoi@uni.eus', CAST(N'2022-05-16T20:04:00' AS SmallDateTime))
INSERT [dbo].[game] ([id], [num], [time], [player1], [player2], [winner], [data]) VALUES (19, 19, 8000, N'garate.hegoi@uni.eus', N'prueba1@uni.eus', N'garate.hegoi@uni.eus', CAST(N'2022-05-16T20:04:00' AS SmallDateTime))
INSERT [dbo].[game] ([id], [num], [time], [player1], [player2], [winner], [data]) VALUES (20, 14, 8000, N'asds', N'asds', N'garate.hegoi@uni.eus', CAST(N'2022-05-16T20:06:00' AS SmallDateTime))
INSERT [dbo].[game] ([id], [num], [time], [player1], [player2], [winner], [data]) VALUES (21, 14, 8000, N'sadsada', N'sadsada', N'sadsada', CAST(N'2022-05-16T20:06:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[game] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 16/05/2022 20:58:36 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 16/05/2022 20:58:36 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 16/05/2022 20:58:36 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 16/05/2022 20:58:36 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[game] ADD  CONSTRAINT [DF_game_data]  DEFAULT (getdate()) FOR [data]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [game] SET  READ_WRITE 
GO
