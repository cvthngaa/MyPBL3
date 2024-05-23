USE [master]
GO
/****** Object:  Database [PBL3]    Script Date: 5/23/2024 11:43:46 PM ******/
CREATE DATABASE [PBL3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PBL3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.CVTHNGA\MSSQL\DATA\PBL3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PBL3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.CVTHNGA\MSSQL\DATA\PBL3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PBL3] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PBL3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PBL3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PBL3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PBL3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PBL3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PBL3] SET ARITHABORT OFF 
GO
ALTER DATABASE [PBL3] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PBL3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PBL3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PBL3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PBL3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PBL3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PBL3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PBL3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PBL3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PBL3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PBL3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PBL3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PBL3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PBL3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PBL3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PBL3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PBL3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PBL3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PBL3] SET  MULTI_USER 
GO
ALTER DATABASE [PBL3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PBL3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PBL3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PBL3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PBL3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PBL3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PBL3] SET QUERY_STORE = ON
GO
ALTER DATABASE [PBL3] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PBL3]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 5/23/2024 11:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[IDHoaDon] [varchar](10) NOT NULL,
	[IDChiTiet] [varchar](6) NOT NULL,
	[SoLuong] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDHoaDon] ASC,
	[IDChiTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietSanPham]    Script Date: 5/23/2024 11:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietSanPham](
	[IDChiTiet] [varchar](6) NOT NULL,
	[IDSanPham] [varchar](6) NOT NULL,
	[IDNhaPhanPhoi] [varchar](5) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[HanSuDung] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDChiTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 5/23/2024 11:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[IDHoaDon] [varchar](10) NOT NULL,
	[IDNhanVien] [varchar](4) NOT NULL,
	[NgayTaoHoaDon] [date] NOT NULL,
	[IDKhachHang] [varchar](6) NOT NULL,
	[ChietKhau] [float] NOT NULL,
	[TongTien] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 5/23/2024 11:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[IDKhachHang] [varchar](6) NOT NULL,
	[SDT] [varchar](10) NOT NULL,
	[Ten] [varchar](100) NOT NULL,
	[Diem] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 5/23/2024 11:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[IDNhanVien] [varchar](4) NOT NULL,
	[IDTaiKhoan] [varchar](4) NOT NULL,
	[TenNhanVien] [varchar](100) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[Nam] [bit] NOT NULL,
	[ViTri] [varchar](50) NULL,
	[Email] [varchar](100) NOT NULL,
	[CCCD] [varchar](12) NOT NULL,
	[SoDienThoai] [varchar](10) NOT NULL,
	[MucLuong] [int] NOT NULL,
	[DiaChi] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaPhanPhoi]    Script Date: 5/23/2024 11:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaPhanPhoi](
	[IDNhaPhanPhoi] [varchar](5) NOT NULL,
	[TenNhaPhanPhoi] [varchar](100) NOT NULL,
	[SoDienThoai] [varchar](10) NOT NULL,
	[DiaChi] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDNhaPhanPhoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 5/23/2024 11:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[IDSanPham] [varchar](6) NOT NULL,
	[Ten] [varchar](100) NOT NULL,
	[PhanLoai] [varchar](100) NOT NULL,
	[GiaBan] [decimal](10, 3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 5/23/2024 11:43:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[IDTaiKhoan] [varchar](4) NOT NULL,
	[TenTaiKhoan] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[isAdmin] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD001', N'CTM001', 3)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD001', N'CTM002', 4)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD001', N'CTM003', 2)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD001', N'CTM004', 5)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD001', N'CTM005', 1)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD002', N'CTM006', 2)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD002', N'CTV001', 1)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD002', N'CTV007', 3)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD002', N'CTV008', 4)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD002', N'CTV010', 6)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD003', N'CTC007', 1)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD003', N'CTC009', 1)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD004', N'CTP001', 1)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD004', N'CTP012', 1)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD005', N'CTB011', 4)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD005', N'CTC012', 1)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD006', N'CTS008', 1)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD006', N'CTS010', 1)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD007', N'CTL005', 1)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD007', N'CTL007', 1)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD008', N'CTM004', 1)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD008', N'CTS009', 1)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD009', N'CTD003', 1)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD009', N'CTD010', 1)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD010', N'CTD017', 1)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD010', N'CTH002', 1)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD011', N'CTP012', 1)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD011', N'CTP018', 1)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD012', N'CTH002', 10)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD012', N'CTH008', 1)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD013', N'CTB015', 1)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD013', N'CTC003', 1)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD013', N'CTC015', 1)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD014', N'CTD003', 1)
INSERT [dbo].[ChiTietHoaDon] ([IDHoaDon], [IDChiTiet], [SoLuong]) VALUES (N'HD014', N'CTL004', 1)
GO
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTB001', N'B01', N'NPP12', 55, CAST(N'2024-09-15' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTB002', N'B01', N'NPP13', 56, CAST(N'2024-09-25' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTB003', N'B02', N'NPP12', 65, CAST(N'2024-09-14' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTB004', N'B03', N'NPP13', 64, CAST(N'2024-09-16' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTB005', N'B03', N'NPP13', 54, CAST(N'2024-09-15' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTB006', N'B03', N'NPP12', 67, CAST(N'2024-09-10' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTB007', N'B04', N'NPP12', 50, CAST(N'2024-09-19' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTB008', N'B04', N'NPP13', 60, CAST(N'2024-09-21' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTB009', N'B05', N'NPP13', 51, CAST(N'2024-09-17' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTB010', N'B05', N'NPP12', 67, CAST(N'2024-09-20' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTB011', N'B06', N'NPP13', 68, CAST(N'2024-09-12' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTB012', N'B07', N'NPP13', 51, CAST(N'2024-09-18' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTB013', N'B07', N'NPP12', 52, CAST(N'2024-09-02' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTB014', N'B08', N'NPP13', 58, CAST(N'2024-09-18' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTB015', N'B08', N'NPP12', 76, CAST(N'2024-09-15' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTB016', N'B09', N'NPP12', 65, CAST(N'2024-09-25' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTB017', N'B10', N'NPP13', 66, CAST(N'2024-09-16' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTB018', N'B10', N'NPP12', 56, CAST(N'2024-09-30' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTB019', N'B10', N'NPP12', 53, CAST(N'2024-10-30' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTC001', N'C01', N'NPP05', 42, CAST(N'2025-10-20' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTC002', N'C01', N'NPP07', 57, CAST(N'2025-10-25' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTC003', N'C02', N'NPP07', 45, CAST(N'2025-10-26' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTC004', N'C02', N'NPP05', 46, CAST(N'2025-10-21' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTC005', N'C03', N'NPP05', 47, CAST(N'2025-10-23' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTC006', N'C03', N'NPP07', 56, CAST(N'2025-10-20' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTC007', N'C04', N'NPP05', 45, CAST(N'2025-10-11' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTC008', N'C05', N'NPP07', 67, CAST(N'2025-10-22' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTC009', N'C05', N'NPP05', 55, CAST(N'2025-10-12' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTC010', N'C06', N'NPP07', 47, CAST(N'2025-10-10' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTC011', N'C07', N'NPP05', 51, CAST(N'2025-10-14' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTC012', N'C07', N'NPP07', 53, CAST(N'2025-10-24' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTC013', N'C08', N'NPP05', 43, CAST(N'2025-10-29' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTC014', N'C08', N'NPP07', 35, CAST(N'2025-10-20' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTC015', N'C09', N'NPP06', 47, CAST(N'2025-10-12' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTC016', N'C10', N'NPP05', 56, CAST(N'2025-10-15' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTC017', N'C11', N'NPP07', 58, CAST(N'2025-10-27' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTC018', N'C11', N'NPP07', 60, CAST(N'2025-10-28' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTC019', N'C12', N'NPP07', 43, CAST(N'2025-10-10' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTC020', N'C12', N'NPP05', 48, CAST(N'2025-10-20' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTC021', N'C13', N'NPP05', 49, CAST(N'2025-10-10' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTC022', N'C13', N'NPP07', 57, CAST(N'2025-10-21' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTC023', N'C14', N'NPP05', 68, CAST(N'2025-10-20' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTC024', N'C15', N'NPP07', 49, CAST(N'2025-10-27' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTC025', N'C15', N'NPP07', 50, CAST(N'2025-10-25' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTC026', N'C16', N'NPP07', 53, CAST(N'2025-10-01' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTC027', N'C16', N'NPP05', 46, CAST(N'2025-10-21' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTC028', N'C16', N'NPP07', 48, CAST(N'2025-10-15' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTD001', N'D01', N'NPP10', 158, CAST(N'2024-11-16' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTD002', N'D01', N'NPP11', 20, CAST(N'2024-12-30' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTD003', N'D02', N'NPP10', 25, CAST(N'2024-12-30' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTD004', N'D03', N'NPP11', 168, CAST(N'2024-12-11' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTD005', N'D03', N'NPP11', 140, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTD006', N'D04', N'NPP10', 160, CAST(N'2024-12-10' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTD007', N'D04', N'NPP11', 187, CAST(N'2024-12-25' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTD008', N'D05', N'NPP11', 166, CAST(N'2024-12-29' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTD009', N'D05', N'NPP10', 156, CAST(N'2024-12-23' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTD010', N'D06', N'NPP10', 145, CAST(N'2024-12-21' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTD011', N'D07', N'NPP11', 165, CAST(N'2024-12-01' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTD012', N'D07', N'NPP10', 170, CAST(N'2024-12-15' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTD013', N'D08', N'NPP10', 167, CAST(N'2024-12-18' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTD014', N'D08', N'NPP10', 156, CAST(N'2024-12-30' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTD015', N'D08', N'NPP11', 168, CAST(N'2024-12-04' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTD016', N'D09', N'NPP11', 147, CAST(N'2024-12-12' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTD017', N'D10', N'NPP10', 165, CAST(N'2024-12-13' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTD018', N'D10', N'NPP11', 145, CAST(N'2024-12-27' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTD019', N'D11', N'NPP11', 163, CAST(N'2024-12-11' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG001', N'G01', N'NPP08', 57, CAST(N'2026-07-01' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG002', N'G01', N'NPP10', 58, CAST(N'2026-06-07' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG003', N'G02', N'NPP08', 68, CAST(N'2026-07-10' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG004', N'G02', N'NPP08', 47, CAST(N'2026-08-01' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG005', N'G03', N'NPP10', 69, CAST(N'2026-09-01' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG006', N'G04', N'NPP08', 63, CAST(N'2026-07-20' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG007', N'G04', N'NPP10', 51, CAST(N'2026-10-01' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG008', N'G05', N'NPP10', 33, CAST(N'2026-11-01' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG009', N'G05', N'NPP08', 36, CAST(N'2026-10-08' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG010', N'G06', N'NPP10', 39, CAST(N'2026-10-03' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG011', N'G06', N'NPP08', 40, CAST(N'2026-10-09' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG012', N'G07', N'NPP10', 33, CAST(N'2026-12-01' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG013', N'G08', N'NPP10', 43, CAST(N'2026-10-03' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG014', N'G08', N'NPP08', 36, CAST(N'2026-10-12' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG015', N'G09', N'NPP10', 46, CAST(N'2026-10-01' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG016', N'G10', N'NPP10', 36, CAST(N'2026-10-01' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG017', N'G10', N'NPP08', 31, CAST(N'2026-12-01' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG018', N'G11', N'NPP08', 48, CAST(N'2026-08-06' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG019', N'G11', N'NPP10', 48, CAST(N'2026-11-03' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG020', N'G12', N'NPP08', 49, CAST(N'2026-10-07' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG021', N'G12', N'NPP10', 42, CAST(N'2026-06-01' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG022', N'G13', N'NPP08', 34, CAST(N'2026-10-11' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG023', N'G14', N'NPP10', 38, CAST(N'2026-09-01' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG024', N'G14', N'NPP10', 36, CAST(N'2026-09-12' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG025', N'G15', N'NPP08', 37, CAST(N'2026-10-09' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG026', N'G15', N'NPP10', 39, CAST(N'2026-12-30' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG027', N'G16', N'NPP11', 36, CAST(N'2026-08-20' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG028', N'G16', N'NPP13', 35, CAST(N'2026-08-25' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG029', N'G17', N'NPP11', 45, CAST(N'2026-07-20' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG030', N'G17', N'NPP13', 46, CAST(N'2026-08-20' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG031', N'G18', N'NPP11', 49, CAST(N'2026-09-30' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG032', N'G19', N'NPP13', 48, CAST(N'2026-08-23' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG033', N'G19', N'NPP11', 30, CAST(N'2026-06-20' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG034', N'G19', N'NPP11', 31, CAST(N'2026-08-24' AS Date))
GO
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG035', N'G20', N'NPP11', 33, CAST(N'2026-09-28' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG036', N'G20', N'NPP11', 43, CAST(N'2026-08-21' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG037', N'G20', N'NPP13', 42, CAST(N'2026-10-20' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG038', N'G21', N'NPP11', 47, CAST(N'2026-07-20' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG039', N'G21', N'NPP13', 48, CAST(N'2026-08-26' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG040', N'G22', N'NPP13', 49, CAST(N'2026-08-25' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG041', N'G22', N'NPP13', 51, CAST(N'2026-07-23' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG042', N'G23', N'NPP13', 52, CAST(N'2026-11-20' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG043', N'G24', N'NPP11', 45, CAST(N'2026-07-27' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG044', N'G24', N'NPP13', 44, CAST(N'2026-08-29' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG045', N'G25', N'NPP13', 34, CAST(N'2026-08-21' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTG046', N'G25', N'NPP11', 33, CAST(N'2026-09-21' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTH001', N'H01', N'NPP04', 39, CAST(N'2025-05-23' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTH002', N'H01', N'NPP06', 49, CAST(N'2025-06-23' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTH003', N'H02', N'NPP06', 56, CAST(N'2025-05-12' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTH004', N'H03', N'NPP06', 54, CAST(N'2025-05-29' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTH005', N'H03', N'NPP04', 58, CAST(N'2025-05-13' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTH006', N'H03', N'NPP04', 65, CAST(N'2025-07-12' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTH007', N'H04', N'NPP06', 66, CAST(N'2025-05-21' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTH008', N'H04', N'NPP04', 54, CAST(N'2025-05-03' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTH009', N'H05', N'NPP04', 58, CAST(N'2025-05-12' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTH010', N'H05', N'NPP06', 50, CAST(N'2025-05-29' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTH011', N'H06', N'NPP04', 63, CAST(N'2025-06-23' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTH012', N'H06', N'NPP06', 69, CAST(N'2025-06-21' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTH013', N'H07', N'NPP06', 60, CAST(N'2025-05-24' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTH014', N'H08', N'NPP04', 66, CAST(N'2025-05-23' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTH015', N'H08', N'NPP06', 68, CAST(N'2025-05-25' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTH016', N'H09', N'NPP04', 62, CAST(N'2025-06-11' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTH017', N'H09', N'NPP04', 53, CAST(N'2025-05-19' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTH018', N'H10', N'NPP04', 56, CAST(N'2025-05-25' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTH019', N'H11', N'NPP06', 59, CAST(N'2025-05-27' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTH020', N'H11', N'NPP06', 50, CAST(N'2025-05-28' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTH021', N'H12', N'NPP04', 52, CAST(N'2025-05-13' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTH022', N'H12', N'NPP04', 62, CAST(N'2025-05-23' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTH023', N'H13', N'NPP06', 63, CAST(N'2025-05-25' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTH024', N'H14', N'NPP04', 53, CAST(N'2025-06-17' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTH025', N'H14', N'NPP06', 54, CAST(N'2025-05-23' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTH026', N'H15', N'NPP06', 64, CAST(N'2025-05-30' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTH027', N'H15', N'NPP04', 67, CAST(N'2025-05-11' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTL001', N'L01', N'NPP08', 56, CAST(N'2024-07-11' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTL002', N'L01', N'NPP09', 55, CAST(N'2024-07-15' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTL003', N'L02', N'NPP08', 65, CAST(N'2024-07-15' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTL004', N'L02', N'NPP08', 66, CAST(N'2024-07-11' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTL005', N'L03', N'NPP09', 67, CAST(N'2024-07-21' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTL006', N'L03', N'NPP08', 57, CAST(N'2024-07-12' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTL007', N'L04', N'NPP08', 58, CAST(N'2024-07-01' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTL008', N'L05', N'NPP09', 68, CAST(N'2024-07-04' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTL009', N'L06', N'NPP08', 68, CAST(N'2024-07-15' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTL010', N'L06', N'NPP09', 69, CAST(N'2024-07-13' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTL011', N'L07', N'NPP08', 56, CAST(N'2024-07-23' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTL012', N'L07', N'NPP08', 67, CAST(N'2024-07-03' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTL013', N'L07', N'NPP09', 57, CAST(N'2024-07-01' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTL014', N'L08', N'NPP09', 69, CAST(N'2024-07-14' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTM001', N'M01', N'NPP01', 50, CAST(N'2024-07-04' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTM002', N'M01', N'NPP02', 60, CAST(N'2024-07-10' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTM003', N'M02', N'NPP01', 70, CAST(N'2024-07-11' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTM004', N'M03', N'NPP02', 50, CAST(N'2024-07-11' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTM005', N'M03', N'NPP02', 65, CAST(N'2024-07-20' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTM006', N'M04', N'NPP03', 68, CAST(N'2024-07-13' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTM007', N'M05', N'NPP02', 54, CAST(N'2024-07-23' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTM008', N'M05', N'NPP03', 55, CAST(N'2024-07-30' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTM009', N'M06', N'NPP03', 72, CAST(N'2024-07-24' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTO001', N'O01', N'NPP06', 71, CAST(N'2024-09-27' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTO002', N'O01', N'NPP06', 64, CAST(N'2024-09-13' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTO003', N'O02', N'NPP07', 76, CAST(N'2024-09-14' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTO004', N'O02', N'NPP06', 65, CAST(N'2024-09-16' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTO005', N'O03', N'NPP06', 66, CAST(N'2024-09-25' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTO006', N'O04', N'NPP07', 69, CAST(N'2024-09-27' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTO007', N'O05', N'NPP06', 62, CAST(N'2024-09-19' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTO008', N'O05', N'NPP07', 78, CAST(N'2024-09-20' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTO009', N'O06', N'NPP07', 79, CAST(N'2024-09-24' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTO010', N'O07', N'NPP06', 75, CAST(N'2024-09-12' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTO011', N'O07', N'NPP06', 78, CAST(N'2024-09-30' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTO012', N'O08', N'NPP06', 74, CAST(N'2024-09-17' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTO013', N'O09', N'NPP06', 79, CAST(N'2024-09-22' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTO014', N'O09', N'NPP07', 74, CAST(N'2024-09-27' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTO015', N'O10', N'NPP06', 68, CAST(N'2024-09-12' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTO016', N'O11', N'NPP07', 69, CAST(N'2024-09-14' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTO017', N'O11', N'NPP07', 60, CAST(N'2024-09-12' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTO018', N'O12', N'NPP06', 62, CAST(N'2024-09-18' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTO019', N'O13', N'NPP06', 65, CAST(N'2024-09-18' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTO020', N'O13', N'NPP07', 66, CAST(N'2024-09-12' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTO021', N'O13', N'NPP06', 67, CAST(N'2024-09-22' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTO022', N'O14', N'NPP07', 63, CAST(N'2024-09-22' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTO023', N'O14', N'NPP06', 71, CAST(N'2024-09-22' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTO024', N'O15', N'NPP06', 78, CAST(N'2024-09-12' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTO025', N'O16', N'NPP07', 72, CAST(N'2024-09-14' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTO026', N'O17', N'NPP07', 73, CAST(N'2024-09-18' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTO027', N'O17', N'NPP06', 79, CAST(N'2024-09-03' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTO028', N'O17', N'NPP07', 81, CAST(N'2024-09-02' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTO029', N'O18', N'NPP07', 69, CAST(N'2024-09-17' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP001', N'P01', N'NPP07', 66, CAST(N'2025-08-10' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP002', N'P01', N'NPP09', 61, CAST(N'2025-08-11' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP003', N'P02', N'NPP09', 76, CAST(N'2025-08-19' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP004', N'P02', N'NPP07', 71, CAST(N'2025-07-10' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP005', N'P03', N'NPP07', 80, CAST(N'2025-08-15' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP006', N'P04', N'NPP07', 82, CAST(N'2025-07-20' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP007', N'P04', N'NPP09', 65, CAST(N'2025-08-30' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP008', N'P05', N'NPP09', 76, CAST(N'2025-08-30' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP009', N'P05', N'NPP07', 78, CAST(N'2025-08-11' AS Date))
GO
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP010', N'P06', N'NPP09', 82, CAST(N'2025-08-15' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP011', N'P06', N'NPP07', 83, CAST(N'2025-08-15' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP012', N'P07', N'NPP07', 64, CAST(N'2025-10-10' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP013', N'P07', N'NPP07', 75, CAST(N'2025-09-10' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP014', N'P08', N'NPP09', 89, CAST(N'2025-08-15' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP015', N'P09', N'NPP07', 84, CAST(N'2025-08-11' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP016', N'P09', N'NPP08', 74, CAST(N'2025-09-10' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP017', N'P10', N'NPP07', 76, CAST(N'2025-09-10' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP018', N'P10', N'NPP09', 71, CAST(N'2025-08-12' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP019', N'P11', N'NPP09', 61, CAST(N'2025-08-13' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP020', N'P12', N'NPP07', 81, CAST(N'2025-07-12' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP021', N'P12', N'NPP09', 60, CAST(N'2025-08-19' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP022', N'P13', N'NPP07', 63, CAST(N'2025-10-10' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP023', N'P14', N'NPP09', 62, CAST(N'2025-08-15' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP024', N'P14', N'NPP07', 77, CAST(N'2025-07-15' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP025', N'P15', N'NPP09', 75, CAST(N'2025-08-13' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP026', N'P15', N'NPP09', 65, CAST(N'2025-07-18' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP027', N'P16', N'NPP07', 81, CAST(N'2025-08-10' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP028', N'P16', N'NPP09', 82, CAST(N'2025-08-10' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP029', N'P17', N'NPP09', 63, CAST(N'2025-08-30' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP030', N'P18', N'NPP07', 63, CAST(N'2025-08-04' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTP031', N'P18', N'NPP07', 75, CAST(N'2025-10-11' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTS001', N'S01', N'NPP12', 112, CAST(N'2024-10-13' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTS002', N'S01', N'NPP13', 114, CAST(N'2024-10-15' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTS003', N'S02', N'NPP12', 110, CAST(N'2024-10-25' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTS004', N'S02', N'NPP12', 103, CAST(N'2024-11-26' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTS005', N'S03', N'NPP13', 123, CAST(N'2024-10-18' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTS006', N'S03', N'NPP13', 115, CAST(N'2024-10-11' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTS007', N'S04', N'NPP13', 104, CAST(N'2024-10-17' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTS008', N'S05', N'NPP12', 116, CAST(N'2024-10-20' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTS009', N'S05', N'NPP13', 120, CAST(N'2024-10-13' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTS010', N'S06', N'NPP12', 123, CAST(N'2024-10-16' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTS012', N'S06', N'NPP12', 117, CAST(N'2024-10-29' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTS013', N'S07', N'NPP13', 118, CAST(N'2024-10-30' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTS014', N'S08', N'NPP12', 108, CAST(N'2024-10-27' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTS015', N'S08', N'NPP13', 109, CAST(N'2024-10-15' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTV001', N'V01', N'NPP04', 89, CAST(N'2024-06-15' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTV002', N'V01', N'NPP05', 80, CAST(N'2024-06-20' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTV003', N'V02', N'NPP04', 81, CAST(N'2024-06-15' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTV004', N'V02', N'NPP04', 90, CAST(N'2024-06-30' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTV005', N'V03', N'NPP05', 98, CAST(N'2024-06-17' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTV006', N'V04', N'NPP04', 95, CAST(N'2024-06-20' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTV007', N'V04', N'NPP05', 93, CAST(N'2024-06-16' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTV008', N'V05', N'NPP04', 87, CAST(N'2024-06-21' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTV009', N'V06', N'NPP04', 92, CAST(N'2024-06-17' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTV010', N'V07', N'NPP05', 93, CAST(N'2024-06-18' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTV011', N'V07', N'NPP04', 83, CAST(N'2024-06-21' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTV012', N'V08', N'NPP05', 81, CAST(N'2024-06-11' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTV013', N'V09', N'NPP04', 76, CAST(N'2024-06-01' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTV014', N'V10', N'NPP05', 77, CAST(N'2024-06-11' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTV015', N'V11', N'NPP04', 70, CAST(N'2024-06-23' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTV016', N'V11', N'NPP05', 93, CAST(N'2024-06-15' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTV017', N'V12', N'NPP05', 98, CAST(N'2024-06-25' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTV018', N'V13', N'NPP04', 93, CAST(N'2024-06-13' AS Date))
INSERT [dbo].[ChiTietSanPham] ([IDChiTiet], [IDSanPham], [IDNhaPhanPhoi], [SoLuong], [HanSuDung]) VALUES (N'CTV019', N'V13', N'NPP05', 87, CAST(N'2024-06-26' AS Date))
GO
INSERT [dbo].[HoaDon] ([IDHoaDon], [IDNhanVien], [NgayTaoHoaDon], [IDKhachHang], [ChietKhau], [TongTien]) VALUES (N'HD001', N'NV01', CAST(N'2024-01-01' AS Date), N'KH001', 0, 1000)
INSERT [dbo].[HoaDon] ([IDHoaDon], [IDNhanVien], [NgayTaoHoaDon], [IDKhachHang], [ChietKhau], [TongTien]) VALUES (N'HD002', N'NV02', CAST(N'2024-01-02' AS Date), N'KH002', 20, 2000)
INSERT [dbo].[HoaDon] ([IDHoaDon], [IDNhanVien], [NgayTaoHoaDon], [IDKhachHang], [ChietKhau], [TongTien]) VALUES (N'HD003', N'NV02', CAST(N'2024-05-11' AS Date), N'KH001', 0, 60.5)
INSERT [dbo].[HoaDon] ([IDHoaDon], [IDNhanVien], [NgayTaoHoaDon], [IDKhachHang], [ChietKhau], [TongTien]) VALUES (N'HD004', N'NV02', CAST(N'2024-05-11' AS Date), N'KH001', 0, 77.5)
INSERT [dbo].[HoaDon] ([IDHoaDon], [IDNhanVien], [NgayTaoHoaDon], [IDKhachHang], [ChietKhau], [TongTien]) VALUES (N'HD005', N'NV02', CAST(N'2024-05-11' AS Date), N'KH001', 0, 86.1)
INSERT [dbo].[HoaDon] ([IDHoaDon], [IDNhanVien], [NgayTaoHoaDon], [IDKhachHang], [ChietKhau], [TongTien]) VALUES (N'HD006', N'NV02', CAST(N'2024-05-11' AS Date), N'KH006', 0, 60.5)
INSERT [dbo].[HoaDon] ([IDHoaDon], [IDNhanVien], [NgayTaoHoaDon], [IDKhachHang], [ChietKhau], [TongTien]) VALUES (N'HD007', N'NV02', CAST(N'2024-05-11' AS Date), N'KH006', 54.5, 109)
INSERT [dbo].[HoaDon] ([IDHoaDon], [IDNhanVien], [NgayTaoHoaDon], [IDKhachHang], [ChietKhau], [TongTien]) VALUES (N'HD008', N'NV02', CAST(N'2024-05-11' AS Date), N'KH006', 57.25, 114.5)
INSERT [dbo].[HoaDon] ([IDHoaDon], [IDNhanVien], [NgayTaoHoaDon], [IDKhachHang], [ChietKhau], [TongTien]) VALUES (N'HD009', N'NV02', CAST(N'2024-05-11' AS Date), N'KH006', 54.5, 109)
INSERT [dbo].[HoaDon] ([IDHoaDon], [IDNhanVien], [NgayTaoHoaDon], [IDKhachHang], [ChietKhau], [TongTien]) VALUES (N'HD010', N'NV02', CAST(N'2024-05-11' AS Date), N'KH006', 31.25, 62.5)
INSERT [dbo].[HoaDon] ([IDHoaDon], [IDNhanVien], [NgayTaoHoaDon], [IDKhachHang], [ChietKhau], [TongTien]) VALUES (N'HD011', N'NV02', CAST(N'2024-05-11' AS Date), N'KH008', 0, 112.5)
INSERT [dbo].[HoaDon] ([IDHoaDon], [IDNhanVien], [NgayTaoHoaDon], [IDKhachHang], [ChietKhau], [TongTien]) VALUES (N'HD012', N'NV02', CAST(N'2024-05-11' AS Date), N'KH009', 0, 1804.5)
INSERT [dbo].[HoaDon] ([IDHoaDon], [IDNhanVien], [NgayTaoHoaDon], [IDKhachHang], [ChietKhau], [TongTien]) VALUES (N'HD013', N'NV02', CAST(N'2024-05-11' AS Date), N'KH007', 0, 448)
INSERT [dbo].[HoaDon] ([IDHoaDon], [IDNhanVien], [NgayTaoHoaDon], [IDKhachHang], [ChietKhau], [TongTien]) VALUES (N'HD014', N'NV02', CAST(N'2024-05-15' AS Date), N'KH004', 0, 177.7)
GO
INSERT [dbo].[KhachHang] ([IDKhachHang], [SDT], [Ten], [Diem]) VALUES (N'KH001', N'0935051508', N'Gái Mi?n Tây', 10)
INSERT [dbo].[KhachHang] ([IDKhachHang], [SDT], [Ten], [Diem]) VALUES (N'KH002', N'0935063705', N'Má Thiên H?', 200)
INSERT [dbo].[KhachHang] ([IDKhachHang], [SDT], [Ten], [Diem]) VALUES (N'KH003', N'0935020158', N'H?c B?ch Vô Thu?ng', 30)
INSERT [dbo].[KhachHang] ([IDKhachHang], [SDT], [Ten], [Diem]) VALUES (N'KH004', N'0935030679', N'Ch? D?u', 20)
INSERT [dbo].[KhachHang] ([IDKhachHang], [SDT], [Ten], [Diem]) VALUES (N'KH005', N'0935120773', N'Chí Van Phèo', 10)
INSERT [dbo].[KhachHang] ([IDKhachHang], [SDT], [Ten], [Diem]) VALUES (N'KH006', N'0773189256', N'Ðào Th? N?', 150)
INSERT [dbo].[KhachHang] ([IDKhachHang], [SDT], [Ten], [Diem]) VALUES (N'KH007', N'0915061246', N'Nguy?n Thúy Ki?u', 50)
INSERT [dbo].[KhachHang] ([IDKhachHang], [SDT], [Ten], [Diem]) VALUES (N'KH008', N'0773112234', N'Hà Van Bá', 30)
INSERT [dbo].[KhachHang] ([IDKhachHang], [SDT], [Ten], [Diem]) VALUES (N'KH009', N'0774190238', N'Lí Công Thông', 40)
INSERT [dbo].[KhachHang] ([IDKhachHang], [SDT], [Ten], [Diem]) VALUES (N'KH010', N'0753239457', N'M? Ng?c Tho', 50)
GO
INSERT [dbo].[NhanVien] ([IDNhanVien], [IDTaiKhoan], [TenNhanVien], [NgaySinh], [Nam], [ViTri], [Email], [CCCD], [SoDienThoai], [MucLuong], [DiaChi]) VALUES (N'NV01', N'US04', N'Tr?n Minh Toàn', CAST(N'2004-01-01' AS Date), 1, N'B?o V?', N'tonminh@gmail.com', N'49204013368', N'0773915100', 5000000, N'Liên Chi?u')
INSERT [dbo].[NhanVien] ([IDNhanVien], [IDTaiKhoan], [TenNhanVien], [NgaySinh], [Nam], [ViTri], [Email], [CCCD], [SoDienThoai], [MucLuong], [DiaChi]) VALUES (N'NV02', N'US05', N'Cao Vu Thu Nga', CAST(N'2004-01-01' AS Date), 0, N'Thu Ngân', N'thunga@gmail.com', N'49304013390', N'0773915100', 6000000, N'Ngu Hãnh Son')
INSERT [dbo].[NhanVien] ([IDNhanVien], [IDTaiKhoan], [TenNhanVien], [NgaySinh], [Nam], [ViTri], [Email], [CCCD], [SoDienThoai], [MucLuong], [DiaChi]) VALUES (N'NV03', N'US06', N'Châu Bá Th?ng', CAST(N'2004-01-01' AS Date), 1, N'T?p V?', N'bathang@gmail.com', N'49205014456', N'0773915100', 4000000, N'C?m L?')
GO
INSERT [dbo].[NhaPhanPhoi] ([IDNhaPhanPhoi], [TenNhaPhanPhoi], [SoDienThoai], [DiaChi]) VALUES (N'NPP01', N'MTV NAMY HOUSE', N'0788691540', N'20/8 HOÀNG HOA THÁM, P.TÂN CHÍNH, Q.THANH KHÊ, TP ÐÀ N?NG')
INSERT [dbo].[NhaPhanPhoi] ([IDNhaPhanPhoi], [TenNhaPhanPhoi], [SoDienThoai], [DiaChi]) VALUES (N'NPP02', N'ÐÀ N?NG M? C?C', N'0251382735', N'159 - 161 HOÀNG DI?U, PHU?NG NAM DUONG, QU?N H?I CHÂU, TP ÐÀ N?NG')
INSERT [dbo].[NhaPhanPhoi] ([IDNhaPhanPhoi], [TenNhaPhanPhoi], [SoDienThoai], [DiaChi]) VALUES (N'NPP03', N'T?P HÓA ÐÌNH KH?I', N'0256374643', N'141 NGÔ MÂY, PHU?NG QUANG TRUNG, TP QUI NHON')
INSERT [dbo].[NhaPhanPhoi] ([IDNhaPhanPhoi], [TenNhaPhanPhoi], [SoDienThoai], [DiaChi]) VALUES (N'NPP04', N'PHAN TH? SEN', N'0903588244', N'T? 15, KP TR?N PHÚ, PHU?NG 8, TP TUY HÒA, T?NH PHÚ YÊN')
INSERT [dbo].[NhaPhanPhoi] ([IDNhaPhanPhoi], [TenNhaPhanPhoi], [SoDienThoai], [DiaChi]) VALUES (N'NPP05', N'SONG NG?C', N'0905249244', N'21 NGÔ Ð?C K?, PHU?NG TÂN L?P, THÀNH PH? NHA TRANG, T?NH KHÁNH HÒA')
INSERT [dbo].[NhaPhanPhoi] ([IDNhaPhanPhoi], [TenNhaPhanPhoi], [SoDienThoai], [DiaChi]) VALUES (N'NPP06', N'TRU?NG TH?NH', N'0772486790', N'05/17 LÊ H?U TRÁC, P.TÂY L?C, TP HU?')
INSERT [dbo].[NhaPhanPhoi] ([IDNhaPhanPhoi], [TenNhaPhanPhoi], [SoDienThoai], [DiaChi]) VALUES (N'NPP07', N'THUONG M?I VÀ D?CH V? NGUYÊN TH?Y', N'0905195945', N'189 TR?N CAO VÂN, PHU?NG AN SON, THÀNH PH? TAM K?, T?NH QU?NG NAM')
INSERT [dbo].[NhaPhanPhoi] ([IDNhaPhanPhoi], [TenNhaPhanPhoi], [SoDienThoai], [DiaChi]) VALUES (N'NPP08', N'MTV TM HOÀNG QUANG', N'0165444687', N'35 TRU?NG CHINH, PHU?NG CHÁNH L?, THÀNH PH? QU?NG NGÃI, T?NH QUÃNG NGÃI')
INSERT [dbo].[NhaPhanPhoi] ([IDNhaPhanPhoi], [TenNhaPhanPhoi], [SoDienThoai], [DiaChi]) VALUES (N'NPP09', N'NGUY?N TH? TUY?T', N'0848800205', N'S? 7, NGÕ 36, ÐU?NG VÕ TH? SÁU, P.NAM LÝ, TP Ð?NG H?I, T?NH QU?NG BÌNH')
INSERT [dbo].[NhaPhanPhoi] ([IDNhaPhanPhoi], [TenNhaPhanPhoi], [SoDienThoai], [DiaChi]) VALUES (N'NPP10', N'TR?N ANH TU?N', N'0946948777', N'187B (LÔ 2) HÀM NGHI, KHU PH? 10, PHU?NG 5, TP ÐÔNG HÀ')
INSERT [dbo].[NhaPhanPhoi] ([IDNhaPhanPhoi], [TenNhaPhanPhoi], [SoDienThoai], [DiaChi]) VALUES (N'NPP11', N'TM DV H?I Y?N', N'0989397793', N'H?M LÊ THÀNH TÔNG, T? DÂN PH? HÒA BÌNH, P.CAM NGHIA, TP CAM RANH, T?NH KHÁNH HÒA')
INSERT [dbo].[NhaPhanPhoi] ([IDNhaPhanPhoi], [TenNhaPhanPhoi], [SoDienThoai], [DiaChi]) VALUES (N'NPP12', N'THUONG M?I T?NG H?P NAM TRUNG', N'0946765668', N'M?t b?ng 530, Lô 153-154, P.Ðông V?, TP Thanh Hóa, T?nh Thanh Hóa')
INSERT [dbo].[NhaPhanPhoi] ([IDNhaPhanPhoi], [TenNhaPhanPhoi], [SoDienThoai], [DiaChi]) VALUES (N'NPP13', N'NGUY?N XUÂN K?', N'0905892539', N'THÔN BÌNH CHUONG NAM, XÃ HOÀI Ð?C, HUY?N HOÀI NHON, T?NH BÌNH Ð?NH')
GO
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'B01', N'Bánh g?o (14 cái)', N'Bánh K?o', CAST(23.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'B02', N'Bánh quy kem (20.4 g)', N'Bánh K?o', CAST(6.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'B03', N'Bánh ChocoPie (12 cái)', N'Bánh K?o', CAST(54.500 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'B04', N'Bánh bông lan (10 cái)', N'Bánh K?o', CAST(29.500 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'B05', N'Bánh g?o (14 cái)', N'Bánh K?o', CAST(23.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'B06', N'K?o cà phê (135 g)', N'Bánh K?o', CAST(15.500 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'B07', N'K?o b?c hà (15 g)', N'Bánh K?o', CAST(6.300 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'B08', N'K?o singum (146 g)', N'Bánh K?o', CAST(51.500 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'B09', N'Bánh g?o (14 cái)', N'Bánh K?o', CAST(23.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'B10', N'Ngu c?c (h?p, 150 g)', N'Bánh K?o', CAST(60.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'C01', N'D?u g?i Sunsilk(874ml)', N' Ð? Dùng Cá Nhân', CAST(175.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'C02', N'D?u g?i Clear(170ml)', N' Ð? Dùng Cá Nhân', CAST(51.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'C03', N'D?u x? Dove(10 gói)', N' Ð? Dùng Cá Nhân', CAST(18.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'C04', N'D?u x? Rejoice(10 gói)', N' Ð? Dùng Cá Nhân', CAST(12.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'C05', N'S?a t?m Lifebuoy(980ml)', N' Ð? Dùng Cá Nhân', CAST(195.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'C06', N'Kem dánh rang P/S(180g)', N' Ð? Dùng Cá Nhân', CAST(23.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'C07', N'Bàn ch?i dánh rang', N' Ð? Dùng Cá Nhân', CAST(8.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'C08', N'Gi?y v? sinh (3 l?p)', N' Ð? Dùng Cá Nhân', CAST(58.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'C09', N'Nu?c r?a tay Lifebuoy(177ml)', N' Ð? Dùng Cá Nhân', CAST(34.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'C10', N'Dao c?o râu Mano(5 cái lu?i lam)', N' Ð? Dùng Cá Nhân', CAST(8.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'C11', N'B?t c?o râu Mano', N' Ð? Dùng Cá Nhân', CAST(90.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'C12', N'Kem ch?ng n?ng Tsubaki', N' Ð? Dùng Cá Nhân', CAST(133.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'C13', N'Bông t?y trang Biore (80 mi?ng)', N' Ð? Dùng Cá Nhân', CAST(36.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'C14', N'Nu?c t?y trang Senka (230ml)', N' Ð? Dùng Cá Nhân', CAST(83.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'C15', N'S?a duong th? (200ml)', N' Ð? Dùng Cá Nhân', CAST(155.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'C16', N'S?a r?a m?t Hada Labo', N' Ð? Dùng Cá Nhân', CAST(54.500 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'D01', N'Bia Tiger (lon, 330ml)', N'Ð? U?ng', CAST(19.200 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'D02', N'Bia Tiger (thùng, 24 lon, 330ml)', N'Ð? U?ng', CAST(410.800 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'D03', N'Bia Heineken(thùng, 24 lon, 330ml)', N'Ð? U?ng', CAST(375.500 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'D04', N'Bia Heineken(lon, 330ml)', N'Ð? U?ng', CAST(19.600 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'D05', N'Nu?c ng?t Pepsi(lon, 245ml)', N'Ð? U?ng', CAST(5.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'D06', N'Nu?c ng?t Coca Cola(chai, 390ml)', N'Ð? U?ng', CAST(7.800 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'D07', N'Nu?c ng?t Coca Cola(lon, 320ml)', N'Ð? U?ng', CAST(10.600 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'D08', N'Nu?c ng?t Mirinda(chai, 390ml)', N'Ð? U?ng', CAST(7.500 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'D09', N'Nu?c su?i Aquafina( 1.5l )', N'Ð? U?ng', CAST(7.900 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'D10', N'Cà phê s?a Wake up(10 gói, 240g)', N'Ð? U?ng', CAST(49.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'D11', N'Nu?c y?n Ðông Trùng H? Th?o(chai, 200ml)', N'Ð? U?ng', CAST(35.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'G01', N'Ch?o inox Sunhouse', N'Ð? Dùng Gia Ðình', CAST(269.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'G02', N'Túi rác thom Soji', N'Ð? Dùng Gia Ðình', CAST(19.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'G03', N'Bình nu?c Lock&Lock (500ml)', N'Ð? Dùng Gia Ðình', CAST(75.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'G04', N'B? lau nhà Lock&Lock', N'Ð? Dùng Gia Ðình', CAST(523.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'G05', N'Màng b?c th?c ph?m PVC', N'Ð? Dùng Gia Ðình', CAST(66.900 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'G06', N'B? lau nhà SunHouse', N'Ð? Dùng Gia Ðình', CAST(249.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'G07', N'N?i tay c?m CookPlus', N'Ð? Dùng Gia Ðình', CAST(375.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'G08', N'Ch?o n?u Stone', N'Ð? Dùng Gia Ðình', CAST(376.800 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'G09', N'H?p th?y tinh cách nhi?t Glass Euro', N'Ð? Dùng Gia Ðình', CAST(93.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'G10', N'Khan m?t Bamboo Home', N'Ð? Dùng Gia Ðình', CAST(49.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'G11', N'Ch?o ch?ng dính CookPlus', N'Ð? Dùng Gia Ðình', CAST(486.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'G12', N'V?t mu?i Sunhouse', N'Ð? Dùng Gia Ðình', CAST(260.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'G13', N'Sáp thom Glade', N'Ð? Dùng Gia Ðình', CAST(63.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'G14', N'Gi? d?ng d? gi?t Modern Feel', N'Ð? Dùng Gia Ðình', CAST(256.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'G15', N'H?p b?o qu?n th?c ph?m Twist', N'Ð? Dùng Gia Ðình', CAST(37.400 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'G16', N'B? mu?ng AB-04', N'Ð? Dùng Gia Ðình', CAST(61.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'G17', N'B? dao Kiwi', N'Ð? Dùng Gia Ðình', CAST(165.400 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'G18', N'Ðua g? C?m H?ng Thu?n Phát', N'Ð? Dùng Gia Ðình', CAST(62.300 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'G19', N'Ðua inox hoa van', N'Ð? Dùng Gia Ðình', CAST(120.500 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'G20', N'Móc qu?n áo nh?a Sola', N'Ð? Dùng Gia Ðình', CAST(66.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'G21', N'? c?m di?n Ði?n Quang', N'Ð? Dùng Gia Ðình', CAST(155.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'G22', N'D?ng c? n?o c? qu? Echo', N'Ð? Dùng Gia Ðình', CAST(40.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'G23', N'Th?t tre Cherry', N'Ð? Dùng Gia Ðình', CAST(78.800 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'G24', N'C?c nu?c Nagoya', N'Ð? Dùng Gia Ðình', CAST(25.400 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'G25', N'Gh? nhà t?m Notoro', N'Ð? Dùng Gia Ðình', CAST(116.800 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'H01', N'B?t gi?t Comfort (3.6 kg)', N'Hóa Ph?m - T?y R?a', CAST(180.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'H02', N'B?t gi?t Omo (3.6 kg)', N'Hóa Ph?m - T?y R?a', CAST(190.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'H03', N' Nu?c x? Comfort (3.2 l)', N'Hóa Ph?m - T?y R?a', CAST(200.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'H04', N' Nu?c x? Downy (3.2 l)', N'Hóa Ph?m - T?y R?a', CAST(200.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'H05', N'Nu?c r?a chén Sunlight(2 l)', N'Hóa Ph?m - T?y R?a', CAST(75.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'H06', N'Nu?c r?a chén Surf(3.38 l)', N'Hóa Ph?m - T?y R?a', CAST(63.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'H07', N'Nu?c lau nhà Sunlight (1 kg)', N'Hóa Ph?m - T?y R?a', CAST(32.500 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'H08', N'Nu?c lau nhà Lix (1 kg)', N'Hóa Ph?m - T?y R?a', CAST(36.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'H09', N'T?y b?n c?u Vim (880 ml)', N'Hóa Ph?m - T?y R?a', CAST(34.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'H10', N'T?y b?n c?u Duck (900 kg)', N'Hóa Ph?m - T?y R?a', CAST(48.500 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'H11', N'Bình x?t mu?i Jumbo (600 ml)', N'Hóa Ph?m - T?y R?a', CAST(59.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'H12', N'Nu?c lau kính Lix (650 ml)', N'Hóa Ph?m - T?y R?a', CAST(22.500 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'H13', N'Nu?c lau b?p Sunlight Chanh (500 ml)', N'Hóa Ph?m - T?y R?a', CAST(33.500 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'H14', N'Nu?c t?y v?i AXO (800 ml)', N'Hóa Ph?m - T?y R?a', CAST(51.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'H15', N'Nu?c lau nhà Sunlight (1 kg)', N'Hóa Ph?m - T?y R?a', CAST(32.500 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'L01', N'Xúc xích (gói, 500g)', N'Th?c Ph?m Ðông L?nh', CAST(43.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'L02', N'Ch? l?a (gói, 500g)', N'Th?c Ph?m Ðông L?nh', CAST(96.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'L03', N'Ch? giò (gói, 500g)', N'Th?c Ph?m Ðông L?nh', CAST(97.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'L04', N'Ch? qu? (gói, 400g)', N'Th?c Ph?m Ðông L?nh', CAST(68.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'L05', N'Cá viên (gói, 200g)', N'Th?c Ph?m Ðông L?nh', CAST(35.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'L06', N'Bò viên (gói, 200g)', N'Th?c Ph?m Ðông L?nh', CAST(36.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'L07', N'Bún tuoi (gói, 500g)', N'Th?c Ph?m Ðông L?nh', CAST(9.500 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'L08', N'Mi?n tuoi (gói, 200g)', N'Th?c Ph?m Ðông L?nh', CAST(12.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'M01', N'Th?t heo (300g)', N'Th?t - H?i S?n', CAST(52.500 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'M02', N'Th?t bò (300g)', N'Th?t - H?i S?n', CAST(77.700 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'M03', N'?c gà (500g)', N'Th?t - H?i S?n', CAST(50.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'M04', N'Cá ba sa (phi lê, 300g)', N'Th?t - H?i S?n', CAST(34.200 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'M05', N'Cá diêu h?ng (làm s?ch, 400g)', N'Th?t - H?i S?n', CAST(37.200 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'M06', N'Tr?ng gà (h?p, 30 qu?)', N'Th?t - H?i S?n', CAST(60.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'O01', N'D?u d?u nành Tu?ng An(2l)', N'Gia V?', CAST(135.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'O02', N'D?u an happi Koki (2l)', N'Gia V?', CAST(70.500 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'O03', N'Nu?c m?m Nam Ngu (500ml)', N'Gia V?', CAST(35.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'O04', N'Nu?c m?m Nhi Hung (750ml)', N'Gia V?', CAST(75.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'O05', N'Nu?c tuong Maggi (300ml)', N'Gia V?', CAST(18.500 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'O06', N'Ðu?ng cát (500g)', N'Gia V?', CAST(13.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'O07', N'Ðu?ng phèn (500g)', N'Gia V?', CAST(26.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'O08', N'H?t nêm Knorr (400g)', N'Gia V?', CAST(33.500 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'O09', N'H?t nêm Maggi (400g)', N'Gia V?', CAST(13.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'O10', N'B?t ng?t (100g)', N'Gia V?', CAST(13.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'O11', N'Mu?i Iot (500g)', N'Gia V?', CAST(4.500 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'O12', N'S?t Mayone (130g)', N'Gia V?', CAST(24.500 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'O13', N'Tuong ?t (270g)', N'Gia V?', CAST(14.500 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'O14', N'Bo th?c v?t (800g)', N'Gia V?', CAST(61.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'O15', N'Gi?m an (900ml)', N'Gia V?', CAST(17.200 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'O16', N'Tiêu xay (50g)', N'Gia V?', CAST(12.300 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'O17', N'?t xay (200g)', N'Gia V?', CAST(22.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'O18', N'Sa t? tôm (90g)', N'Gia V?', CAST(11.500 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'P01', N'Túi gi?y mini', N'Van Phòng Ph?m', CAST(9.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'P02', N'V? bút bi Thiên Long (5 cây)', N'Van Phòng Ph?m', CAST(29.900 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'P03', N'T?p tô màu Thúy H?ng', N'Van Phòng Ph?m', CAST(21.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'P04', N'Bút xóa Long Châu', N'Van Phòng Ph?m', CAST(18.800 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'P05', N'Bút màu sáp Thiên Long', N'Van Phòng Ph?m', CAST(21.500 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'P06', N'H?p màu nu?c Thúy H?ng', N'Van Phòng Ph?m', CAST(87.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'P07', N'B?ng den Thiên Long', N'Van Phòng Ph?m', CAST(39.900 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'P08', N'S? lò xo PGRand', N'Van Phòng Ph?m', CAST(41.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'P09', N'B? thu?c k? Long Châu', N'Van Phòng Ph?m', CAST(19.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'P10', N'B? d?t n?n Long Châu', N'Van Phòng Ph?m', CAST(32.900 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'P11', N'Bang keo OPP', N'Van Phòng Ph?m', CAST(21.900 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'P12', N'Bút lông Thiên Long', N'Van Phòng Ph?m', CAST(11.900 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'P13', N'V? School (48 trang)', N'Van Phòng Ph?m', CAST(14.500 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'P14', N'V? Oringa (99 trang)', N'Van Phòng Ph?m', CAST(15.500 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'P15', N'C?p h?c sinh Deli (2 ngan)', N'Van Phòng Ph?m', CAST(108.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'P16', N'Kéo van phòng Deli', N'Van Phòng Ph?m', CAST(64.500 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'P17', N'Gi?y gói quà Deli', N'Van Phòng Ph?m', CAST(34.900 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'P18', N'Nhãn v? Thiên Long', N'Van Phòng Ph?m', CAST(13.100 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'S01', N'S?a chua Vinamilk(ít du?ng,100g)', N'S?a Các Lo?i', CAST(8.500 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'S02', N'S?a Milo (h?p, 180ml)', N'S?a Các Lo?i', CAST(7.800 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'S03', N'S?a tuoi Vinamilk(h?p gi?y, 180ml)', N'S?a Các Lo?i', CAST(7.800 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'S04', N'S?a tuoi TH true milk(h?p gi?y, 180ml)', N'S?a Các Lo?i', CAST(8.200 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'S05', N'S?a tuoi TH true milk(h?p nh?a, 200g)', N'S?a Các Lo?i', CAST(12.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'S06', N'S?a chua TH true milk(có du?ng,100g)', N'S?a Các Lo?i', CAST(9.400 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'S07', N'S?a b?t Nutifood(h?p,400g)', N'S?a Các Lo?i', CAST(126.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'S08', N'S?a b?t Nutifood(h?p,900g)', N'S?a Các Lo?i', CAST(270.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'V01', N'Chu?i (n?i, 1 kg)', N'Rau - C? - Trái Cây', CAST(11.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'V02', N'Dua h?u (trái, 2 kg)', N'Rau - C? - Trái Cây', CAST(31.200 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'V03', N'Cam (túi, 500g)', N'Rau - C? - Trái Cây', CAST(26.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'V04', N'Táo (túi, 500g)', N'Rau - C? - Trái Cây', CAST(33.500 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'V05', N'Xoài cát (1kg)', N'Rau - C? - Trái Cây', CAST(28.900 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'V06', N'Nho (túi, 500g)', N'Rau - C? - Trái Cây', CAST(59.500 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'V07', N'?i (túi, 500g)', N'Rau - C? - Trái Cây', CAST(9.950 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'V08', N'C?i thìa (bó , 400g)', N'Rau - C? - Trái Cây', CAST(7.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'V09', N'Rau mu?ng (bó , 400g)', N'Rau - C? - Trái Cây', CAST(7.000 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'V10', N'Rau má (bó , 400g)', N'Rau - C? - Trái Cây', CAST(12.300 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'V11', N'Giá d? (túi , 100g)', N'Rau - C? - Trái Cây', CAST(9.240 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'V12', N'Hành tím ( 200g)', N'Rau - C? - Trái Cây', CAST(18.300 AS Decimal(10, 3)))
INSERT [dbo].[SanPham] ([IDSanPham], [Ten], [PhanLoai], [GiaBan]) VALUES (N'V13', N'Cà r?t (200g)', N'Rau - C? - Trái Cây', CAST(12.000 AS Decimal(10, 3)))
GO
INSERT [dbo].[TaiKhoan] ([IDTaiKhoan], [TenTaiKhoan], [MatKhau], [isAdmin]) VALUES (N'US01', N'tranminhtoan', N'123456', 1)
INSERT [dbo].[TaiKhoan] ([IDTaiKhoan], [TenTaiKhoan], [MatKhau], [isAdmin]) VALUES (N'US02', N'caovuthunga', N'123456', 1)
INSERT [dbo].[TaiKhoan] ([IDTaiKhoan], [TenTaiKhoan], [MatKhau], [isAdmin]) VALUES (N'US03', N'chaubathang', N'123456', 1)
INSERT [dbo].[TaiKhoan] ([IDTaiKhoan], [TenTaiKhoan], [MatKhau], [isAdmin]) VALUES (N'US04', N'Minh Toan', N'123456', 0)
INSERT [dbo].[TaiKhoan] ([IDTaiKhoan], [TenTaiKhoan], [MatKhau], [isAdmin]) VALUES (N'US05', N'Thu Nga', N'123456', 0)
INSERT [dbo].[TaiKhoan] ([IDTaiKhoan], [TenTaiKhoan], [MatKhau], [isAdmin]) VALUES (N'US06', N'Ba Thang', N'123456', 0)
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD FOREIGN KEY([IDChiTiet])
REFERENCES [dbo].[ChiTietSanPham] ([IDChiTiet])
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD FOREIGN KEY([IDHoaDon])
REFERENCES [dbo].[HoaDon] ([IDHoaDon])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([IDNhaPhanPhoi])
REFERENCES [dbo].[NhaPhanPhoi] ([IDNhaPhanPhoi])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([IDSanPham])
REFERENCES [dbo].[SanPham] ([IDSanPham])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([IDKhachHang])
REFERENCES [dbo].[KhachHang] ([IDKhachHang])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([IDNhanVien])
REFERENCES [dbo].[NhanVien] ([IDNhanVien])
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD FOREIGN KEY([IDTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([IDTaiKhoan])
GO
USE [master]
GO
ALTER DATABASE [PBL3] SET  READ_WRITE 
GO
