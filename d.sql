USE master
GO
IF DB_ID('SachOnline') IS NOT NULL
DROP DATABASE SachOnline
GO
CREATE DATABASE SachOnline
GO	
USE SachOnline
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 3/20/2017 9:59:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[MaAdmin] [int] IDENTITY(1,1) NOT NULL,
	[TenAdmin] [nvarchar](150) NULL,
	[UserName] [nvarchar](150) NULL,
	[Password] [nvarchar](50) NULL,
	[Email] [nvarchar](150) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[SDT] [nvarchar](15) NULL,
	[Quyen] [int] NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[MaAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 3/20/2017 9:59:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaDonHang] [int] NOT NULL,
	[MaSach] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [int] NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC,
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChuDe]    Script Date: 3/20/2017 9:59:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuDe](
	[MaChuDe] [int] IDENTITY(1,1) NOT NULL,
	[TenChuDe] [nvarchar](100) NULL,
 CONSTRAINT [PK_ChuDe] PRIMARY KEY CLUSTERED 
(
	[MaChuDe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 3/20/2017 9:59:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[ThanhToan] [int] NULL,
	[GiaoHang] [int] NULL,
	[NgayDat] [datetime] NULL,
	[NgayGiao] [datetime] NULL,
	[MaKH] [int] NULL,
	[MaAdmin] [int] NULL,
	[MaGiaoHang] [int] NULL,
	[TongGia] [int] NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GiaoHang]    Script Date: 3/20/2017 9:59:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaoHang](
	[MaGiaoHang] [int] IDENTITY(1,1) NOT NULL,
	[TenNguoiNhan] [nvarchar](150) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[SDT] [nvarchar](20) NULL,
	[Email] [nvarchar](150) NULL,
	[QuaTang] [int] NULL,
	[LoiNhan] [nvarchar](max) NULL,
 CONSTRAINT [PK_GiaoHang] PRIMARY KEY CLUSTERED 
(
	[MaGiaoHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 3/20/2017 9:59:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](100) NULL,
	[TaiKhoan] [nvarchar](100) NULL,
	[MatKhau] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[DienThoai] [nvarchar](15) NULL,
	[NgaySinh] [datetime] NULL,
	[NgayTao] [datetime] NULL,
	[NgaySua] [datetime] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaXuatBan]    Script Date: 3/20/2017 9:59:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaXuatBan](
	[MaNXB] [int] IDENTITY(1,1) NOT NULL,
	[TenNXB] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[DienThoai] [nvarchar](15) NULL,
 CONSTRAINT [PK_NhaXuatBan] PRIMARY KEY CLUSTERED 
(
	[MaNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhanHoi]    Script Date: 3/20/2017 9:59:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanHoi](
	[MaPhanHoi] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](50) NULL,
	[Email] [nvarchar](150) NULL,
	[PhanHoi] [nvarchar](max) NULL,
 CONSTRAINT [PK_PhanHoi] PRIMARY KEY CLUSTERED 
(
	[MaPhanHoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sach]    Script Date: 3/20/2017 9:59:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[MaSach] [int] IDENTITY(1,1) NOT NULL,
	[TenSach] [nvarchar](250) NULL,
	[GiaBan] [decimal](18, 0) NULL,
	[MoTa] [nvarchar](max) NULL,
	[AnhBia] [nvarchar](150) NULL,
	[NgayCapNhat] [datetime] NULL,
	[SoLuong] [int] NULL,
	[MaNXB] [int] NULL,
	[MaChuDe] [int] NULL,
	[TenTacGia] [nvarchar](150) NULL,
	[MaAdmin] [int] NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_Sach] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSach], [SoLuong], [DonGia]) VALUES (1, 2, 1, 75000)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSach], [SoLuong], [DonGia]) VALUES (2, 2, 1, 75000)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSach], [SoLuong], [DonGia]) VALUES (2, 15, 1, 9300)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSach], [SoLuong], [DonGia]) VALUES (2, 16, 1, 19800)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSach], [SoLuong], [DonGia]) VALUES (2, 17, 1, 16400)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSach], [SoLuong], [DonGia]) VALUES (3, 20, 1, 45000)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSach], [SoLuong], [DonGia]) VALUES (4, 21, 1, 75000)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSach], [SoLuong], [DonGia]) VALUES (4, 22, 4, 45000)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSach], [SoLuong], [DonGia]) VALUES (5, 1, 3, 45000)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSach], [SoLuong], [DonGia]) VALUES (6, 2, 13, 75000)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSach], [SoLuong], [DonGia]) VALUES (7, 3, 10, 37800)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSach], [SoLuong], [DonGia]) VALUES (8, 2, 1, 75000)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSach], [SoLuong], [DonGia]) VALUES (9, 3, 1, 37800)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSach], [SoLuong], [DonGia]) VALUES (10, 8, 1, 43200)
SET IDENTITY_INSERT [dbo].[ChuDe] ON 

INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (1, N'Văn Học Trong Nước')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (2, N'Tiểu Thuyết')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (3, N'Truyện Tranh')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (4, N'Sách Thiếu Nhi')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (5, N'Kiến Thức Tổng Hợp')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (6, N'Kinh Tế - Chính Trị')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (7, N'Khoa Học Kỹ Thuật')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (8, N'Giáo Khoa - Tham Khảo')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (9, N'Sách Học Ngoại Ngữ')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (10, N'Sách Nước Ngoài')
SET IDENTITY_INSERT [dbo].[ChuDe] OFF
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDonHang], [ThanhToan], [GiaoHang], [NgayDat], [NgayGiao], [MaKH], [MaAdmin], [MaGiaoHang], [TongGia]) VALUES (1, NULL, NULL, CAST(N'2017-03-17 19:43:12.777' AS DateTime), NULL, 2, NULL, 1, 75000)
INSERT [dbo].[DonHang] ([MaDonHang], [ThanhToan], [GiaoHang], [NgayDat], [NgayGiao], [MaKH], [MaAdmin], [MaGiaoHang], [TongGia]) VALUES (2, NULL, NULL, CAST(N'2017-03-17 19:43:43.020' AS DateTime), NULL, 2, NULL, 2, 120500)
INSERT [dbo].[DonHang] ([MaDonHang], [ThanhToan], [GiaoHang], [NgayDat], [NgayGiao], [MaKH], [MaAdmin], [MaGiaoHang], [TongGia]) VALUES (3, NULL, NULL, CAST(N'2017-03-17 22:01:52.127' AS DateTime), NULL, 2, NULL, 3, 45000)
INSERT [dbo].[DonHang] ([MaDonHang], [ThanhToan], [GiaoHang], [NgayDat], [NgayGiao], [MaKH], [MaAdmin], [MaGiaoHang], [TongGia]) VALUES (4, NULL, NULL, CAST(N'2017-03-17 22:03:53.523' AS DateTime), NULL, 2, NULL, 4, 255000)
INSERT [dbo].[DonHang] ([MaDonHang], [ThanhToan], [GiaoHang], [NgayDat], [NgayGiao], [MaKH], [MaAdmin], [MaGiaoHang], [TongGia]) VALUES (5, NULL, NULL, CAST(N'2017-03-17 22:10:39.343' AS DateTime), NULL, 2, NULL, 5, 135000)
INSERT [dbo].[DonHang] ([MaDonHang], [ThanhToan], [GiaoHang], [NgayDat], [NgayGiao], [MaKH], [MaAdmin], [MaGiaoHang], [TongGia]) VALUES (6, NULL, NULL, CAST(N'2017-03-17 22:13:36.867' AS DateTime), NULL, 2, NULL, 6, 975000)
INSERT [dbo].[DonHang] ([MaDonHang], [ThanhToan], [GiaoHang], [NgayDat], [NgayGiao], [MaKH], [MaAdmin], [MaGiaoHang], [TongGia]) VALUES (7, NULL, NULL, CAST(N'2017-03-17 22:23:10.160' AS DateTime), NULL, 2, NULL, 7, 378000)
INSERT [dbo].[DonHang] ([MaDonHang], [ThanhToan], [GiaoHang], [NgayDat], [NgayGiao], [MaKH], [MaAdmin], [MaGiaoHang], [TongGia]) VALUES (8, NULL, NULL, CAST(N'2017-03-17 22:25:09.003' AS DateTime), NULL, 2, NULL, 8, 75000)
INSERT [dbo].[DonHang] ([MaDonHang], [ThanhToan], [GiaoHang], [NgayDat], [NgayGiao], [MaKH], [MaAdmin], [MaGiaoHang], [TongGia]) VALUES (9, NULL, NULL, CAST(N'2017-03-18 18:42:15.327' AS DateTime), NULL, 2, NULL, 9, 37800)
INSERT [dbo].[DonHang] ([MaDonHang], [ThanhToan], [GiaoHang], [NgayDat], [NgayGiao], [MaKH], [MaAdmin], [MaGiaoHang], [TongGia]) VALUES (10, NULL, NULL, CAST(N'2017-03-20 00:50:42.717' AS DateTime), NULL, 2, NULL, 10, 43200)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
SET IDENTITY_INSERT [dbo].[GiaoHang] ON 

INSERT [dbo].[GiaoHang] ([MaGiaoHang], [TenNguoiNhan], [DiaChi], [SDT], [Email], [QuaTang], [LoiNhan]) VALUES (1, N'afsdfa', N'34/34 Vạn Bảo', N'01233966513', N'nghiabfvn@gmail.com', NULL, N'')
INSERT [dbo].[GiaoHang] ([MaGiaoHang], [TenNguoiNhan], [DiaChi], [SDT], [Email], [QuaTang], [LoiNhan]) VALUES (2, N'afsdfa', N'34/34 Vạn Bảo', N'01233966513', N'nghiabfvn@gmail.com', NULL, N'')
INSERT [dbo].[GiaoHang] ([MaGiaoHang], [TenNguoiNhan], [DiaChi], [SDT], [Email], [QuaTang], [LoiNhan]) VALUES (3, N'afsdfa', N'34/34 Vạn Bảo', N'01233966513', N'nghiabfvn@gmail.com', NULL, N'')
INSERT [dbo].[GiaoHang] ([MaGiaoHang], [TenNguoiNhan], [DiaChi], [SDT], [Email], [QuaTang], [LoiNhan]) VALUES (4, N'afsdfa', N'34/34 Vạn Bảo', N'01233966513', N'nghiabfvn@gmail.com', NULL, N'')
INSERT [dbo].[GiaoHang] ([MaGiaoHang], [TenNguoiNhan], [DiaChi], [SDT], [Email], [QuaTang], [LoiNhan]) VALUES (5, N'afsdfa', N'34/34 Vạn Bảo', N'01233966513', N'nghiabfvn@gmail.com', NULL, N'')
INSERT [dbo].[GiaoHang] ([MaGiaoHang], [TenNguoiNhan], [DiaChi], [SDT], [Email], [QuaTang], [LoiNhan]) VALUES (6, N'afsdfa', N'34/34 Vạn Bảo', N'01233966513', N'nghiabfvn@gmail.com', NULL, N'')
INSERT [dbo].[GiaoHang] ([MaGiaoHang], [TenNguoiNhan], [DiaChi], [SDT], [Email], [QuaTang], [LoiNhan]) VALUES (7, N'afsdfa', N'34/34 Vạn Bảo', N'01233966513', N'nghiabfvn@gmail.com', NULL, N'')
INSERT [dbo].[GiaoHang] ([MaGiaoHang], [TenNguoiNhan], [DiaChi], [SDT], [Email], [QuaTang], [LoiNhan]) VALUES (8, N'afsdfa', N'34/34 Vạn Bảo', N'01233966513', N'nghiabfvn@gmail.com', NULL, N'')
INSERT [dbo].[GiaoHang] ([MaGiaoHang], [TenNguoiNhan], [DiaChi], [SDT], [Email], [QuaTang], [LoiNhan]) VALUES (9, N'afsdfa', N'34/34 Vạn Bảo', N'01233966513', N'nghiabfvn@gmail.com', NULL, N'')
INSERT [dbo].[GiaoHang] ([MaGiaoHang], [TenNguoiNhan], [DiaChi], [SDT], [Email], [QuaTang], [LoiNhan]) VALUES (10, N'afsdfa', N'34/34 Vạn Bảo', N'01233966513', N'nghiabfvn@gmail.com', NULL, N'')
SET IDENTITY_INSERT [dbo].[GiaoHang] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [NgaySinh], [NgayTao], [NgaySua]) VALUES (1, N'Trần Văn A', N'admin', N'fcea920f7412b5da7be0cf42b8c93759', N'tranvana@gmail.com', N'285 Đội Cấn, quận Ba Đình, tp Hà Nội', N'01234567899', CAST(N'1990-03-17 00:00:00.000' AS DateTime), CAST(N'2017-03-17 15:07:47.263' AS DateTime), NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [NgaySinh], [NgayTao], [NgaySua]) VALUES (2, N'afsdfa', N'admin1', N'e10adc3949ba59abbe56e057f20f883e', N'nghiabfvn@gmail.com', N'34/34 Vạn Bảo', N'01233966513', CAST(N'1996-05-09 00:00:00.000' AS DateTime), CAST(N'2017-03-17 19:33:17.197' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[NhaXuatBan] ON 

INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [DienThoai]) VALUES (1, N'Kim Đồng', N'285 Đội Cấn', N'0123456789')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [DienThoai]) VALUES (2, N'NXB Trẻ', N'285 Đội Cấn', N'0123456789')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [DienThoai]) VALUES (3, N'IPM', N'285 Đội Cấn', N'0123456789')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [DienThoai]) VALUES (4, N'Nhã Nam', N'285 Đội Cấn', N'0123456789')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [DienThoai]) VALUES (5, N'Bách Khoa', N'285 Đội Cấn', N'0123456789')
SET IDENTITY_INSERT [dbo].[NhaXuatBan] OFF
SET IDENTITY_INSERT [dbo].[Sach] ON 

INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuong], [MaNXB], [MaChuDe], [TenTacGia], [MaAdmin], [TrangThai]) VALUES (1, N'5 Centimet Trên Giây', CAST(45000 AS Decimal(18, 0)), N'TOP 100 BEST SELLER - 5cm/s không chỉ là vận tốc của những cánh anh đào rơi, mà còn là vận tốc khi chúng ta lặng lẽ bước qua đời nhau, đánh mất bao cảm xúc thiết tha nhất của tình yêu.

Bằng giọng văn tinh tế, truyền cảm, Năm centimet trên giây mang đến những khắc họa mới về tâm hồn và khả năng tồn tại của cảm xúc, bắt đầu từ tình yêu trong sáng, ngọt ngào của một cô bé và cậu bé. Ba giai đoạn, ba mảnh ghép, ba ngôi kể chuyện khác nhau nhưng đều xoay quanh nhân vật nam chính, người luôn bị ám ảnh bởi kí ức và những điều đã qua…

Khác với những câu chuyện cuốn bạn chạy một mạch, truyện này khó mà đọc nhanh. Ngón tay bạn hẳn sẽ ngừng lại cả trăm lần trên mỗi trang sách. Chỉ vì một cử động rất khẽ, một câu thoại, hay một xúc cảm bất chợt có thể sẽ đánh thức những điều tưởng chừng đã ngủ quên trong tiềm thức, như ngọn đèn vừa được bật sáng trong tâm trí bạn. Và rồi có lúc nó vượt quá giới hạn chịu đựng, bạn quyết định gấp cuốn sách lại chỉ để tận hưởng chút ánh sáng từ ngọn đèn, hay đơn giản là để vết thương trong lòng mình có thời gian tự tìm xoa dịu. ', N'5-centimet-tren-giay.jpeg', NULL, 10, 3, 2, N'Shinkai Makoto', NULL, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuong], [MaNXB], [MaChuDe], [TenTacGia], [MaAdmin], [TrangThai]) VALUES (2, N'Hiểm Họa Hacker Hiểu Biết Và Phòng Chống', CAST(75000 AS Decimal(18, 0)), N'Gần đây người ta thường nói đến hacker (hiểu theo nghĩa tiêu cực là tin tặc), đến sự nguy hiểm của những cuộc tấn công mạng. Nhưng nhiều người trong số chúng ta vẫn cho rằng, mối đe dọa này chẳng mấy liên quan đến thường dân. Thực tế lại không như vậy. Hầu như tất cả các công trình công nghiệp hiện nay đều đã được tự động hóa, ứng dụng công nghệ thông tin (CNTT), trong đó có những công trình đặc biệt quan trọng đối với một quốc gia như chế biến dầu khí, nhà máy điện, cảng hàng không... Cuốn sách này đề cập đến một vấn đề quan trọng: an ninh của các công trình công nghiệp tối quan trọng, và cũng là an ninh của quốc gia nói chung.

  Việc tự động hóa, ứng dụng CNTT trong sản xuất giúp nâng cao độ tin cậy, tăng năng suất vì loại bỏ được lỗi do con người gây ra. Thế nhưng, đây lại chính là mục tiêu tấn công của hacker. Trên thế giới hiện nay đã có nhiều trường hợp xảy ra, chỉ một nhóm hacker cũng có thể làm đình trệ cả một hệ thống lớn.

  Ví dụ điển hình là cuộc tấn công bằng mã độc vào Cụm cảng Hàng không Việt Nam tại Nội Bài và Tân Sơn Nhất vào cuối tháng 7/2016 đã gây ngưng trệ hoạt động tại các sân bay, đồng thời một lượng dữ liệu lớn của khách hàng Vietnam Airlines bị đánh cắp. Chưa dừng ở đó, vụ mất tiền từ tài khoản của khách hàng tại Vietcombank cũng cho thấy có bàn tay của hacker chuyên nghiệp.

Sẽ ra sao nếu như đứng sau những cuộc tấn công như vậy lại là bọn khủng bố, hay tệ hơn là kẻ thù tiềm năng, và thậm chí cả một quốc gia thù địch với tiềm lực công nghệ lẫn tài chính mạnh hơn rất nhiều, nghĩa là khả năng đạt mục tiêu cũng lớn hơn và hậu quả sẽ thảm khốc hơn.

  Chính vì vậy, sự ra mắt của cuốn sách “Hiểm họa hacker: Hiểu biết và phòng chống” là rất đúng lúc và cần thiết. Tác giả của cuốn sách này là một nhà khoa học Nga - chuyên gia về an ninh thông tin. Và chúng ta đều biết rằng an ninh thông tin của Nga là một trong những trường phái mạnh hàng đầu thế giới.

  Cuốn sách rất thiết thực cho cán bộ và đại diện các cơ quan an ninh, nó cũng cần thiết cho lãnh đạo các công trình tối quan trọng để nhận thức rõ tính cấp thiết của vấn đề an ninh thông tin. Hơn nữa, cuốn sách còn rất bổ ích cho các doanh nhân, chuyên viên CNTT, và cho cả những người quan tâm đến CNTT và an ninh mạng.', N'image_120320.jpg', NULL, 49, 5, 7, N'Mikhaylov Dmitry - Lê Trọng Hiển dịch', NULL, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuong], [MaNXB], [MaChuDe], [TenTacGia], [MaAdmin], [TrangThai]) VALUES (3, N'Thám Tử Lừng Danh Conan - Những Câu Chuyện Lãng Mạn - Tập 2', CAST(37800 AS Decimal(18, 0)), N'Thám Tử Lừng Danh Conan - Những Câu Chuyện Lãng Mạn - Tập 2

Chuyện tình cảm giữa Conan (Shinichi) và Ran còn gay cấn, hồi hộp hơn cả trinh thám nữa!

Dõi theo từng diễn biến trong Tập 2 của cuốn tuyển tập rất được yêu thích này, các bạn sẽ được chứng kiến rất nhiều pha “tình bể bình” giữa hai người!

Ngoài ra bạn sẽ được ôn lại chuyện tình lãng mạn giữa đôi bạn thanh mai trúc mã Heiji & Kazuha, hay trung sĩ Takagi & thiếu úy Sato nữa! Hi vọng những cuộc tình phải đặt cược bằng cả mạng sống sẽ khiến cho các fan của "Thám tử Conan" tan chảy và mãn nguyện.

', N'9786042088251.jpg', NULL, 70, 1, 3, N'Gosho AOYAMA', NULL, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuong], [MaNXB], [MaChuDe], [TenTacGia], [MaAdmin], [TrangThai]) VALUES (4, N'Nghĩ Như Nhà Vô Địch', CAST(56000 AS Decimal(18, 0)), N'Nghĩ Như Nhà Vô Địch

Tác giả Donald Trump từng được bạn đọc Việt Nam biết qua nhiều tác phẩm nổi tiếng chia sẻ về câu chuyện thành công và làm giàu của ông. Trong cuốn sách này ông chia sẻ về “phương pháp” sống và kinh doanh của mình. Đó là quá trình tư duy, mà tác giả nghĩ sẽ ích cho mọi người, để đi đến thành công. Donald Trump đã có nhiều thời gian để kiểm nghiệm những suy nghĩ này và ông tin rằng mỗi người muốn thành công đều cần một công thức cho riêng mình.

Độc giả sẽ tìm thấy những điều thú vị và đáng ghi nhớ qua những trải nghiệm của chính tác giả hay những điều ông học từ người khác.

 

Quyển sách sẽ truyền cảm hứng cho những ai đam mê thành công, và muốn luôn có tư duy của nhà vô địch.', N'nghinhunhavodich.jpg', NULL, 0, 2, 6, N'Donald J. Trump', NULL, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuong], [MaNXB], [MaChuDe], [TenTacGia], [MaAdmin], [TrangThai]) VALUES (5, N'Món Ăn Á - Âu Ngon Mỗi Ngày', CAST(32000 AS Decimal(18, 0)), N'Món Ăn Á - Âu Ngon Mỗi Ngày (2016)

Mỗi quốc gia, khu vực trên thế giới đều có những nét độc đáo riêng trong văn hóa ẩm thực. Những món ăn không đơn thuần phục vụ cho nhu cầu của con người mà hơn hết còn phản ánh đặc trưng vùng miền, các yếu tố địa lý, cách thích nghi môi trường... Một người nội trợ giỏi nên biết chế biến món ăn theo nhiều phong cách khác nhau, mang lại hương vị đa dạng, phong phú và mới lạ cho bữa cơm hàng ngày. Cuốn sách giới thiệu những món ăn Á - Âu đặc trưng và hấp dẫn: Xúp sườn kiểu Trung Quốc, miến trộn Hàn Quốc, bánh Kalter hund hương vị Đức, bánh xèo kiểu Nga, Salad kiểu Hy Lạp...

Nội dung sách gồm các phần:

Phần 1: Những món ăn Á ngon

Phần 2: Món ăn Âu đặc sắc', N'8935210218568.jpg', NULL, 60, 2, 5, N'Nguyễn Viên Chi', NULL, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuong], [MaNXB], [MaChuDe], [TenTacGia], [MaAdmin], [TrangThai]) VALUES (6, N'Cẩm Nang Bác Sĩ Gia Đình - Từ Điển Nhỏ Về Các Bệnh Thường Gặp', CAST(45000 AS Decimal(18, 0)), N'Cẩm Nang Bác Sĩ Gia Đình - Từ Điển Nhỏ Về Các Bệnh Thường Gặp

50 bệnh thường gặp ở trẻ: cách can thiệp và chữa trị nhanh nhất.

Sốt, mụn nhọt, ngã, đau đầu, ho, đau bụng…

Hằng ngày, trẻ vẫn thường mắc những bệnh hoặc thương tích lớn nhỏ. Cuốn từ điển đơn giản và nhẹ nhàng này giúp bạn hiểu điều gì đã xảy ra, để có những ứng phó kịp thời và chữa trị hợp lí.

Ngay cả khi còn rất nhỏ, trẻ cũng nên quan tâm đến sức khỏe của mình, bởi vậy cuốn sách này giúp cha mẹ và con cái cùng đặt ra cho nhau những câu hỏi để hiểu hơn về các bệnh thường gặp và cũng là để biết có cần thiết phải gặp bác sĩ hay không.', N'9786042083683.jpg', NULL, 100, 2, 7, N'Nathalie SzapiroManoukianOlivia Sautreuil', NULL, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuong], [MaNXB], [MaChuDe], [TenTacGia], [MaAdmin], [TrangThai]) VALUES (7, N'Căn Phòng Bí Ẩn', CAST(32500 AS Decimal(18, 0)), N'Các nhân vật ở nhiều không gian khác nhau với những hành trình gay cấn, hồi hộp, dồn dập sự cố, cứ mở rồi thắt rồi mở rồi thắt... Lôi cuốn và mướt mượt đến tận con chữ cuối cùng. Bạn có thể rơi nước mắt khi đọc truyện, là nước mắt của cảm kích, của mừng vui khi chứng kiến cảnh đoàn viên hay thấm thía một lẽ thật trong đời- về một hồn ma hiền lành, về những chiếc lá tuyệt vời, về diều nhỏ và Dế và Bồ Câu tốt bụng... Bằng thể loại truyện kỳ ảo và đồng thoại, tác giả Lan Thương dẫn bạn đọc nhỏ vào thế giới là lạ quen quen, thủ thỉ những điều diệu kỳ về tình bạn, tình cảm gia đình, tình người... Sách được trình bày như một bộ phim hoạt hình trên "màn ảnh giấy" với nét vẽ của họa sĩ Tooru.

', N'8934974146339.jpg', NULL, 20, 1, 4, N'Lan Thương', NULL, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuong], [MaNXB], [MaChuDe], [TenTacGia], [MaAdmin], [TrangThai]) VALUES (8, N'Chỉ Có Niềm Đam Mê', CAST(43200 AS Decimal(18, 0)), N'Chỉ Có Niềm Đam Mê

20 điều chia sẻ cùng người khởi nghiệp trong cuốn sách này chứa đựng nhiều điều hơn thế.

Tác giả Lý Quí Trung, thành viên sáng lập Phở 24 và đang bắt đầu hành trình khởi nghiệp lần thứ hai với một tiệm ăn nhỏ trên phố Broadway của Sydney chia sẻ rằng "chỉ có niềm đam mê mới có thể giúp tôi vượt qua tất cả để bắt đầu lại từ đầu mà vẫn thấy hạnh phúc".

Nhưng, đam mê thôi chưa đủ. Điều quan trọng tác giả muốn nói với các bạn trẻ khởi nghiệp: "Niềm đam mê dù có lớn đến đâu cũng không đủ để mở một nhà hàng thành công. Nó đòi hỏi nhiều điều khác nữa, mà trong đó kinh nghiệm và kiến thức là hai thứ tối thiểu".

Cuốn sách này không chỉ hữu ích cho những ai muốn khởi nghiệp mở nhà hàng mà nó còn hữu ích cho bất cứ ai đang trên con đường khởi nghiệp nói chung. Ngoài những kinh nghiệm cụ thể trong lĩnh vực nhà hàng, cuốn sách còn đặc biệt khơi gợi tinh thần và tư duy của người làm chủ. Nghĩ lớn - bắt đầu nhỏ, lợi ích của doanh nghiệp phải đi đôi với lợi ích của khách hàng, quản trị cơ nghiệp với cặp mắt và trái tim của người chủ… là những thứ tạo nên sự khác biệt giữa doanh nghiệp này với doanh nghiệp khác, giữa thành công với thất bại.Những tính cách hay phẩm chất cần thiết đối với một người khởi nghiệp thành công cũng được được đề cập nhiều trong cuốn sách. Sự kiên định là một ví dụ. Nó khác xa với sự cứng đầu, bảo thủ. Nó là cái xương sống rắn chắc giúp người khởi nghiệp đứng vững trong cơn bão táp và nhanh chóng đứng dậy sau mỗi lần bị ngã xuống. Và trong cuộc chơi có thể thắng có thể thua này, chắc chắn ai cũng cần đến sự may mắn. Nhưng là may mắn theo cách nói của tay golf huyền thoại Gary Player, là càng luyện tập thì càng thấy mình may mắn hơn.

Còn nhiều điều thú vị khác nữa mà tác giả đã chia sẻ và gởi gắm trong cuốn sách này, đặc biệt dành cho các bạn trẻ khởi nghiệp.

', N'8934974143475.jpg', NULL, 35, 5, 6, N'Lý Quí Trung', NULL, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuong], [MaNXB], [MaChuDe], [TenTacGia], [MaAdmin], [TrangThai]) VALUES (9, N'Ông Già Nhìn Ra Thế Giới', CAST(157500 AS Decimal(18, 0)), N'Sinh năm 1923, cuộc đời chính trị của cựu thủ tướng Singapore Lý Quang Diệu có liên quan mật thiết tới nhiều sự kiện quốc tế. Ông từng hội kiến các lãnh đạo chủ chốt của Trung Quốc từ Mao Trạch Đông tới Tập Cận Bình và thân thiết với các tổng thống Hoa Kỳ từ Lyndon Johnson tới Barack Obama.
Trong quyển sách này, Lý Quang Diệu dựa trên kinh nghiệm phong phú và hiểu biết sâu rộng của mình để đưa ra quan điểm về thế giới đương đại với tầm nhìn hai mươi năm sau. Nhưng đây không phải một quyển sách giáo khoa bàn chuyện địa chính trị khô khan cũng như không nhằm tiết lộ những thâm cung bí sử trong những sự kiện thế giới. Thay vào đó, tác phẩm này phản ánh những quan điểm của ông về thế giới hiện tại trên phạm vi rộng lớn từ Mỹ, Trung Quốc tới châu Á và châu Âu. Trong bối cảnh ấy, ông phân tích sâu sắc các vấn đề xã hội cũng như tâm lý người dân và từ đó rút ra kết luận về cơ hội tồn tại của dân tộc đó và vị thế của họ trên thang bậc quyền lực tương lai.
Với văn phong giản dị, điềm đạm và không ngại động chạm, ông mô tả một Trung Quốc vẫn ám ảnh với sự cai trị của một nhà nước trung ương tập quyền trên con đường trỗi dậy mãnh liệt; một Hoa Kỳ rồi đây phải chia sẻ ngôi vị thống trị độc tôn của mình bất chấp nền kinh tế đất nước này vẫn luôn luôn năng động; và một châu Âu luôn phải vật lộn với những thách thức nhằm duy trì liên minh để tồn tại. Quan điểm thẳng thắn và thường gây ngạc nhiên của ông - về lý do Nhật Bản khép kín với người nước ngoài, vì sao Mùa xuân Ả rập sẽ không mang lại phổ thông đầu phiếu cho Trung Đông, và vì sao nỗ lực ngăn chặn hiện tượng ấm lên toàn cầu sẽ không hiệu quả bằng cách chuẩn bị sẵn sàng khi nó diễn ra – khiến cho ấn phẩm này trở nên mới mẻ và có sức lôi cuốn khác thường. Lý Quang Diệu kết thúc tác phẩm bằng cái nhìn hướng tới viễn cảnh của Singapore – mối quan tâm của tất cả đời ông – và cũng hé mở đôi chút cho độc giả liếc qua cuộc sống riêng của mình cũng như cách ông chuẩn bị để giã biệt thế giới này.

', N'8934974147176.jpg', NULL, 48, 2, 6, N'Lý Quang Diệu', NULL, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuong], [MaNXB], [MaChuDe], [TenTacGia], [MaAdmin], [TrangThai]) VALUES (10, N'10 Bài Toán Trọng Điểm Hình Học Phẳng Oxy', CAST(135150 AS Decimal(18, 0)), N'Bạn có thể hình dung việc giải toán, giống như bạn phải tìm đúng con đường để về đích và chọn một con đường ngắn nhất luôn là điều chúng ta muốn hướng tới. Để làm tốt được điều này, trên hành trình tìm ra đích đến, chúng ta thường nhớ tới các mốc, những địa điểm dễ nhớ gắn liền với đích đến. Và trong cuốn sách này tác giả thiết kế dựa trên ý tưởng đó, bằng cách tạo ra những “điểm mốc” thông qua 10 bài toán gốc. Trên con đường để tìm đến “đáp số” các bạn sẽ cần những bài toán này. Nghĩa là khi nhìn thấy chúng, bạn sẽ biết cách để tìm ra được lời giải cho các bài toán. Đây là 10 bài toán quan trọng, là “linh hồn” để tạo ra các bài toán khác. Có thể sẽ có rất nhiều bạn sẽ ngạc nhiên khi đọc nội dung các bài toán gốc, vì thực ra nó khá đơn giản. Nhưng các bạn có biết rằng, ý tưởng được lấy từ các bài toán này chính là “nguồn cảm hứng” cho các câu hỏi xuất hiện trong đề thi quốc gia. Chúng gần như giải quyết hầu hết các bài toán thi Đại Học trong các năm vừa qua và tác giả tin nó sẽ có giá trị rất nhiều trong các kì thi Quốc Gia sắp tới. Mong rằng với cách tiếp cận hoàn toàn mới này, sẽ giúp bạn đọc thấy thích thú và việc chinh phục các câu hỏi liên quan đến hình học phẳng Oxy không còn là vấn đề lớn đối với các bạn.

Tác giả hi vọng cuốn sách sẽ giúp ích cho các bạn học sinh trong quá trình học tập, ôn thi một cách chủ động, tự tin bước vào kì thi Quốc Gia và là tài liệu tham khảo hữu ích cho các thầy cô trong quá trình giảng dạy.', N'image_86243.jpg', NULL, 14, 5, 8, N'Nguyễn Thanh Tùng', NULL, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuong], [MaNXB], [MaChuDe], [TenTacGia], [MaAdmin], [TrangThai]) VALUES (11, N'Những lần ta chia tay', CAST(65000 AS Decimal(18, 0)), N'“Tôi nghĩ tới Iris, người dầu sao cũng từng rất quan trọng trong cuộc đời tôi, tôi nghĩ tới cả Émilie, tới Céline, hẳn nhiên rồi, tới Charlotte, và thấp thoáng những cái tên khác trong những vùng mờ tối khác, nhưng Alice, luôn luôn là Alice, mới là người trụ lại, bất động, với những tràng cười bay lượn trên đầu chúng tôi, như thể tình đầu là một hình phạt chung thân.”
 
Alice là sinh viên tiếng Đức, còn Fritz đã tốt nghiệp nhiều chuyên ngành khác nhau, từ lịch sử nghệ thuật cho tới vật lý nguyên tử, và vừa nhận một chân biên tập tại nhà xuất bản Larousse. Một cô nàng con nhà tư sản với một anh chàng con nhà hippy. Hai con người hoàn toàn trái ngược, chỉ gặp nhau ở một điểm chung duy nhất, ấy là Alice yêu Fritz, còn Fritz phát điên vì nàng. Tình yêu của một thời thanh xuân hoa mộng lãng mạn và sôi nổi, nhưng cũng không thiếu những lúc mưa lúc nắng, tan rồi hợp, hợp rồi tan, với vô số lý do bi hài. Mơ ước giản dị khi về già của chàng và nàng, rằng “đêm đến chúng ta sẽ để hai bộ răng giả trong cùng một chiếc cốc, những chiếc răng sẽ hạnh phúc bên nhau”, liệu có trở thành hiện thực khi xung quanh họ luôn xảy ra biết bao chuyện dở khóc dở cười?', N'nhung_lan_ta_chia_tay.jpg', NULL, 71, 4, 2, N'David Foenkinos', NULL, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuong], [MaNXB], [MaChuDe], [TenTacGia], [MaAdmin], [TrangThai]) VALUES (12, N'Milk And Honey', CAST(225900 AS Decimal(18, 0)), N'Milk and Honey is a collection of poetry and prose about survival. About the experience of violence, abuse, love, loss, and femininity.

The book is divided into four chapters, and each chapter serves a different purpose. Deals with a different pain. Heals a different heartache. Milk and Honey takes readers through a journey of the most bitter moments in life and finds sweetness in them because there is sweetness everywhere if you are just willing to look.

', N'9781449474256_1.png', NULL, 62, 4, 10, N'Rupi Kaur', NULL, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuong], [MaNXB], [MaChuDe], [TenTacGia], [MaAdmin], [TrangThai]) VALUES (13, N'Các Lỗi Thường Gặp Trong Tiếng Anh', CAST(45500 AS Decimal(18, 0)), N'Nội dung cuốn sách được trình bày đồng nhất. Trước tiên, lỗi thường gặp được đề cập và trình bày trong câu để các bạn có thể nhận biết trước khi nó được sửa lại cho đúng; sau đó câu sai được thay bằng câu đúng ngay bên dưới; cuối cùng là lời giảng giải hoặc cách dùng cụ thể. Phần lưu ý được thêm vào khi cần mở rộng hoặc nhấn mạnh điểm nào đó.

Cuốn sách này có thể không bao quát hết tất cả các lỗi thường gặp trong Tiếng Anh, nhưng các ví dụ trong sách là những lỗi thường gặp nhất.

', N'9786048418472.jpg', NULL, 47, 2, 9, N'Mai Lan Hương , Hà Thanh Uyên', NULL, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuong], [MaNXB], [MaChuDe], [TenTacGia], [MaAdmin], [TrangThai]) VALUES (14, N'Những Gợi Ý Hữu Ích Dành Cho Các Kỳ Thi IELTS (Kèm CD)', CAST(60000 AS Decimal(18, 0)), N'Cuốn sách Tiếng Anh Chuyên Đề - Tiếng Anh Dùng Trong Lĩnh Vực Hàng Không đưa ra những gợi ý hữu ích cho từng phần thi của kỳ thi IELTS, kỳ thi đang được rất nhiều bạn trẻ quan tâm để có thể tham gia vào những khóa học nâng cao tiếng Anh ở các trường cao đẳng hay đại học quốc tế. Đây sẽ là những gợi ý quan trọng bởi chúng giúp các bạn hiểu rõ hơn về từng phần của bài thi, qua đó có được sự tự tin để làm bài một cách tốt nhất.

Các bạn quan tâm đến kỳ thi này nên chú ý đọc kỹ để nắm rõ từng phần thi. Chẳng hạn trước khi thi các bạn cần chọn ra một mục tiêu thực tế và có thể đạt được, lập ra một kế hoạch học tập đều đặn, rồi dần dần tăng tốc để đọc hiểu các câu tiếng Anh nhanh hơn, cũng như phát triển trí nhớ về tiếng Anh . Trong lúc thi, các bạn cần kiểm soát thời gian làm bài và chú ý đọc kỹ các hướng dẫn để không bị làm sai đề. Trước khi kết thúc bài thi, các bạn cần dành thời gian kiểm tra lại bài để chắc chắn câu trả lời của bạn là đúng.

Bên cạnh những gợi ý cơ bản trước khi thi, trong lúc thi, và trước khi kết thúc bài thi, các bạn cũng nên xem qua những gợi ý cụ thể cho các phần thi nghe, nói, đọc, viết, thực hành đối với các câu hỏi trả lời ngắn, và làm thử các bài kiểm tra thực hành.

Những gợi ý trong quyển sách này sẽ giúp ích cho các bạn và giúp các bạn đạt được điểm tối đa trong kỳ thi IETLS.', N'image_113671.jpg', NULL, 0, 2, 9, N'MA Diễm Ly, Minh Đạo', NULL, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuong], [MaNXB], [MaChuDe], [TenTacGia], [MaAdmin], [TrangThai]) VALUES (15, N'Tranh Truyện Dân Gian Việt Nam - Cha Mẹ Nuôi Con Bằng Trời Bằng Bể (Tái Bản 2017)', CAST(9300 AS Decimal(18, 0)), N'Tranh Truyện Dân Gian Việt Nam - Cha Mẹ Nuôi Con Bằng Trời Bằng Bể (Tái Bản 2017)

Những câu chuyện dân gian nuôi dưỡng tâm hồn các em, giúp các em biết học điều hay lẽ phải, yêu cái thiện, ghét cái xấu và trân trọng truyền thống cha ông. Bộ sách Tranh truyện dân gian Việt Nam là món quà ý nghĩa với những câu chuyện được tuyển chọn và biên soạn kĩ lưỡng. Phần tranh vẽ minh họa sinh động, gần gũi giúp các em dễ dàng hơn trong việc tiếp cận và ghi nhớ câu chuyện.

Truyện được xây dựng trên tích dân gian xưa, nội dung cảm động, ca ngợi công ơn bao la của cha mẹ. Cha mẹ dành cả cuộc đời chăm sóc con cái, tình cảm ấy thật ngọt ngào và ấm áp, không gì sánh được. Câu chuyện là một bài học lớn cho mỗi người về lòng hiếu thảo, luôn luôn biết ơn, phụng dưỡng cha mẹ để đền đáp công ơn to lớn ấy.

', N'8935036688538.jpg', NULL, 29, 1, 3, N'Nguyễn Văn A', NULL, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuong], [MaNXB], [MaChuDe], [TenTacGia], [MaAdmin], [TrangThai]) VALUES (16, N'Pokemon Đặc Biệt - Tập 39', CAST(19800 AS Decimal(18, 0)), N'Giữa những đấu trường của khu vực giao đấu, âm mưu của đám người đầy dã tâm dần chuyển thành hành động! Tại núi Khắc Nghiệt, cùng với Heatran, nhà khoa học xấu xa Pluto đã khai màn bằng những ngọn lửa hừng hực!

Mặt khác, thông tin về "Thế giới hỗn mang" cũng ngày một rõ rệt...!

Xin gửi đến các bạn một tập truyện đầy kịch tính về chặng đường mới của Platinum!!', N'9786042087490.jpg', NULL, 84, 1, 3, N'Lời: Hidenori Kusaka - Tranh: Satoshi Yamamoto', NULL, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuong], [MaNXB], [MaChuDe], [TenTacGia], [MaAdmin], [TrangThai]) VALUES (17, N'Những Phương Pháp Của Ngôn Ngữ Học Cấu Trúc', CAST(16400 AS Decimal(18, 0)), N'Cuốn sách này trình bày những phương pháp được sử dụng trong ngôn ngữ học miêu tả, hay nói cho đúng hơn, là ngôn ngữ học cấu trúc. Như vậy, nó nhằm thảo luận về những thủ pháp mà nhà ngôn ngữ học có thể thực hiện trong quá trình nghiên cứu nhiều hơn là đề ra một lý luận về những cách phân tích cấu trúc tính có thể rút ra từ những cuộc nghiên cứu đó. Các phương pháp nghiên cứu được sắp xếp dưới dạng thức những thao tác phân tích (procedures of analysis) kế tiếp theo nhau mà nhà ngôn ngữ học dùng để xử lí các cứ liệu của mình. Chúng tôi hi vọng rằng lối trình bày các phương pháp dưới dạng thức và theo trình tự từng thao tác có thể góp phần giảm bớt cái ấn tượng ảo thuật và phiền phức thường đi đôi với những cách phân tích ngôn ngữ học tế nhị hơn.

', N'nhungphuongphapcuangonngucautruc.jpg', NULL, 31, 2, 1, N'Z.S.HARRIS', NULL, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuong], [MaNXB], [MaChuDe], [TenTacGia], [MaAdmin], [TrangThai]) VALUES (18, N'Tình Yêu Tìm Thấy', CAST(88500 AS Decimal(18, 0)), N'Tiểu thư Amanda Locke yêu kiều, ái nữ của Công tước vùng Norford, đang bước vào Mùa lễ hội thứ thứ ba của mình mà vẫn chưa tìm được vị phu quân ưng ý. Bực mình hơn, gia đình Amanda vì sốt ruột mà giao trọng trách mai mối cho Devin Baldwin, một gã chăn ngựa điển trai nhưng thô lỗ. Liệu tình yêu có tìm thấy nàng trước khi Amanda Locke trở thành một Bà cô già?

Devin Baldwin, có biệt danh Cupid, nhờ tài năng mai mối. Nhận lời giúp Amanda học cưỡi ngựa để gây ấn tượng với một Bá tước trẻ, anh không ngờ bản thân ngày càng bị cô tiểu kiêu kỳ này thu hút. Nhưng Devin vẫn bị những bí mật và nỗi đau từ quá khứ đeo đuổi. Liệu Devin Baldwin có thể vượt qua tất cả để nắm bắt cơ hội và tìm thấy tình yêu cuộc đời mình?', N'9786049540226.jpg', NULL, 78, 3, 2, N'Johanna Lindsey', NULL, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuong], [MaNXB], [MaChuDe], [TenTacGia], [MaAdmin], [TrangThai]) VALUES (20, N'5 Centimet Trên Giây', CAST(45000 AS Decimal(18, 0)), N'TOP 100 BEST SELLER - 5cm/s không chỉ là vận tốc của những cánh anh đào rơi, mà còn là vận tốc khi chúng ta lặng lẽ bước qua đời nhau, đánh mất bao cảm xúc thiết tha nhất của tình yêu.

Bằng giọng văn tinh tế, truyền cảm, Năm centimet trên giây mang đến những khắc họa mới về tâm hồn và khả năng tồn tại của cảm xúc, bắt đầu từ tình yêu trong sáng, ngọt ngào của một cô bé và cậu bé. Ba giai đoạn, ba mảnh ghép, ba ngôi kể chuyện khác nhau nhưng đều xoay quanh nhân vật nam chính, người luôn bị ám ảnh bởi kí ức và những điều đã qua…

Khác với những câu chuyện cuốn bạn chạy một mạch, truyện này khó mà đọc nhanh. Ngón tay bạn hẳn sẽ ngừng lại cả trăm lần trên mỗi trang sách. Chỉ vì một cử động rất khẽ, một câu thoại, hay một xúc cảm bất chợt có thể sẽ đánh thức những điều tưởng chừng đã ngủ quên trong tiềm thức, như ngọn đèn vừa được bật sáng trong tâm trí bạn. Và rồi có lúc nó vượt quá giới hạn chịu đựng, bạn quyết định gấp cuốn sách lại chỉ để tận hưởng chút ánh sáng từ ngọn đèn, hay đơn giản là để vết thương trong lòng mình có thời gian tự tìm xoa dịu. ', N'5-centimet-tren-giay.jpeg', NULL, 9, 3, 2, N'Shinkai Makoto', NULL, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuong], [MaNXB], [MaChuDe], [TenTacGia], [MaAdmin], [TrangThai]) VALUES (21, N'Hiểm Họa Hacker Hiểu Biết Và Phòng Chống', CAST(75000 AS Decimal(18, 0)), N'Gần đây người ta thường nói đến hacker (hiểu theo nghĩa tiêu cực là tin tặc), đến sự nguy hiểm của những cuộc tấn công mạng. Nhưng nhiều người trong số chúng ta vẫn cho rằng, mối đe dọa này chẳng mấy liên quan đến thường dân. Thực tế lại không như vậy. Hầu như tất cả các công trình công nghiệp hiện nay đều đã được tự động hóa, ứng dụng công nghệ thông tin (CNTT), trong đó có những công trình đặc biệt quan trọng đối với một quốc gia như chế biến dầu khí, nhà máy điện, cảng hàng không... Cuốn sách này đề cập đến một vấn đề quan trọng: an ninh của các công trình công nghiệp tối quan trọng, và cũng là an ninh của quốc gia nói chung.

  Việc tự động hóa, ứng dụng CNTT trong sản xuất giúp nâng cao độ tin cậy, tăng năng suất vì loại bỏ được lỗi do con người gây ra. Thế nhưng, đây lại chính là mục tiêu tấn công của hacker. Trên thế giới hiện nay đã có nhiều trường hợp xảy ra, chỉ một nhóm hacker cũng có thể làm đình trệ cả một hệ thống lớn.

  Ví dụ điển hình là cuộc tấn công bằng mã độc vào Cụm cảng Hàng không Việt Nam tại Nội Bài và Tân Sơn Nhất vào cuối tháng 7/2016 đã gây ngưng trệ hoạt động tại các sân bay, đồng thời một lượng dữ liệu lớn của khách hàng Vietnam Airlines bị đánh cắp. Chưa dừng ở đó, vụ mất tiền từ tài khoản của khách hàng tại Vietcombank cũng cho thấy có bàn tay của hacker chuyên nghiệp.

Sẽ ra sao nếu như đứng sau những cuộc tấn công như vậy lại là bọn khủng bố, hay tệ hơn là kẻ thù tiềm năng, và thậm chí cả một quốc gia thù địch với tiềm lực công nghệ lẫn tài chính mạnh hơn rất nhiều, nghĩa là khả năng đạt mục tiêu cũng lớn hơn và hậu quả sẽ thảm khốc hơn.

  Chính vì vậy, sự ra mắt của cuốn sách “Hiểm họa hacker: Hiểu biết và phòng chống” là rất đúng lúc và cần thiết. Tác giả của cuốn sách này là một nhà khoa học Nga - chuyên gia về an ninh thông tin. Và chúng ta đều biết rằng an ninh thông tin của Nga là một trong những trường phái mạnh hàng đầu thế giới.

  Cuốn sách rất thiết thực cho cán bộ và đại diện các cơ quan an ninh, nó cũng cần thiết cho lãnh đạo các công trình tối quan trọng để nhận thức rõ tính cấp thiết của vấn đề an ninh thông tin. Hơn nữa, cuốn sách còn rất bổ ích cho các doanh nhân, chuyên viên CNTT, và cho cả những người quan tâm đến CNTT và an ninh mạng.', N'image_120320.jpg', NULL, 49, 5, 7, N'Mikhaylov Dmitry - Lê Trọng Hiển dịch', NULL, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuong], [MaNXB], [MaChuDe], [TenTacGia], [MaAdmin], [TrangThai]) VALUES (22, N'5 Centimet Trên Giây', CAST(45000 AS Decimal(18, 0)), N'TOP 100 BEST SELLER - 5cm/s không chỉ là vận tốc của những cánh anh đào rơi, mà còn là vận tốc khi chúng ta lặng lẽ bước qua đời nhau, đánh mất bao cảm xúc thiết tha nhất của tình yêu.

Bằng giọng văn tinh tế, truyền cảm, Năm centimet trên giây mang đến những khắc họa mới về tâm hồn và khả năng tồn tại của cảm xúc, bắt đầu từ tình yêu trong sáng, ngọt ngào của một cô bé và cậu bé. Ba giai đoạn, ba mảnh ghép, ba ngôi kể chuyện khác nhau nhưng đều xoay quanh nhân vật nam chính, người luôn bị ám ảnh bởi kí ức và những điều đã qua…

Khác với những câu chuyện cuốn bạn chạy một mạch, truyện này khó mà đọc nhanh. Ngón tay bạn hẳn sẽ ngừng lại cả trăm lần trên mỗi trang sách. Chỉ vì một cử động rất khẽ, một câu thoại, hay một xúc cảm bất chợt có thể sẽ đánh thức những điều tưởng chừng đã ngủ quên trong tiềm thức, như ngọn đèn vừa được bật sáng trong tâm trí bạn. Và rồi có lúc nó vượt quá giới hạn chịu đựng, bạn quyết định gấp cuốn sách lại chỉ để tận hưởng chút ánh sáng từ ngọn đèn, hay đơn giản là để vết thương trong lòng mình có thời gian tự tìm xoa dịu. ', N'5-centimet-tren-giay.jpeg', NULL, 6, 3, 2, N'Shinkai Makoto', NULL, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuong], [MaNXB], [MaChuDe], [TenTacGia], [MaAdmin], [TrangThai]) VALUES (23, N'5 Centimet Trên Giây', CAST(45000 AS Decimal(18, 0)), N'TOP 100 BEST SELLER - 5cm/s không chỉ là vận tốc của những cánh anh đào rơi, mà còn là vận tốc khi chúng ta lặng lẽ bước qua đời nhau, đánh mất bao cảm xúc thiết tha nhất của tình yêu.

Bằng giọng văn tinh tế, truyền cảm, Năm centimet trên giây mang đến những khắc họa mới về tâm hồn và khả năng tồn tại của cảm xúc, bắt đầu từ tình yêu trong sáng, ngọt ngào của một cô bé và cậu bé. Ba giai đoạn, ba mảnh ghép, ba ngôi kể chuyện khác nhau nhưng đều xoay quanh nhân vật nam chính, người luôn bị ám ảnh bởi kí ức và những điều đã qua…

Khác với những câu chuyện cuốn bạn chạy một mạch, truyện này khó mà đọc nhanh. Ngón tay bạn hẳn sẽ ngừng lại cả trăm lần trên mỗi trang sách. Chỉ vì một cử động rất khẽ, một câu thoại, hay một xúc cảm bất chợt có thể sẽ đánh thức những điều tưởng chừng đã ngủ quên trong tiềm thức, như ngọn đèn vừa được bật sáng trong tâm trí bạn. Và rồi có lúc nó vượt quá giới hạn chịu đựng, bạn quyết định gấp cuốn sách lại chỉ để tận hưởng chút ánh sáng từ ngọn đèn, hay đơn giản là để vết thương trong lòng mình có thời gian tự tìm xoa dịu. ', N'5-centimet-tren-giay.jpeg', NULL, 7, 3, 2, N'Shinkai Makoto', NULL, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuong], [MaNXB], [MaChuDe], [TenTacGia], [MaAdmin], [TrangThai]) VALUES (24, N'Hiểm Họa Hacker Hiểu Biết Và Phòng Chống', CAST(75000 AS Decimal(18, 0)), N'Gần đây người ta thường nói đến hacker (hiểu theo nghĩa tiêu cực là tin tặc), đến sự nguy hiểm của những cuộc tấn công mạng. Nhưng nhiều người trong số chúng ta vẫn cho rằng, mối đe dọa này chẳng mấy liên quan đến thường dân. Thực tế lại không như vậy. Hầu như tất cả các công trình công nghiệp hiện nay đều đã được tự động hóa, ứng dụng công nghệ thông tin (CNTT), trong đó có những công trình đặc biệt quan trọng đối với một quốc gia như chế biến dầu khí, nhà máy điện, cảng hàng không... Cuốn sách này đề cập đến một vấn đề quan trọng: an ninh của các công trình công nghiệp tối quan trọng, và cũng là an ninh của quốc gia nói chung.

  Việc tự động hóa, ứng dụng CNTT trong sản xuất giúp nâng cao độ tin cậy, tăng năng suất vì loại bỏ được lỗi do con người gây ra. Thế nhưng, đây lại chính là mục tiêu tấn công của hacker. Trên thế giới hiện nay đã có nhiều trường hợp xảy ra, chỉ một nhóm hacker cũng có thể làm đình trệ cả một hệ thống lớn.

  Ví dụ điển hình là cuộc tấn công bằng mã độc vào Cụm cảng Hàng không Việt Nam tại Nội Bài và Tân Sơn Nhất vào cuối tháng 7/2016 đã gây ngưng trệ hoạt động tại các sân bay, đồng thời một lượng dữ liệu lớn của khách hàng Vietnam Airlines bị đánh cắp. Chưa dừng ở đó, vụ mất tiền từ tài khoản của khách hàng tại Vietcombank cũng cho thấy có bàn tay của hacker chuyên nghiệp.

Sẽ ra sao nếu như đứng sau những cuộc tấn công như vậy lại là bọn khủng bố, hay tệ hơn là kẻ thù tiềm năng, và thậm chí cả một quốc gia thù địch với tiềm lực công nghệ lẫn tài chính mạnh hơn rất nhiều, nghĩa là khả năng đạt mục tiêu cũng lớn hơn và hậu quả sẽ thảm khốc hơn.

  Chính vì vậy, sự ra mắt của cuốn sách “Hiểm họa hacker: Hiểu biết và phòng chống” là rất đúng lúc và cần thiết. Tác giả của cuốn sách này là một nhà khoa học Nga - chuyên gia về an ninh thông tin. Và chúng ta đều biết rằng an ninh thông tin của Nga là một trong những trường phái mạnh hàng đầu thế giới.

  Cuốn sách rất thiết thực cho cán bộ và đại diện các cơ quan an ninh, nó cũng cần thiết cho lãnh đạo các công trình tối quan trọng để nhận thức rõ tính cấp thiết của vấn đề an ninh thông tin. Hơn nữa, cuốn sách còn rất bổ ích cho các doanh nhân, chuyên viên CNTT, và cho cả những người quan tâm đến CNTT và an ninh mạng.', N'image_120320.jpg', NULL, 37, 5, 7, N'Mikhaylov Dmitry - Lê Trọng Hiển dịch', NULL, 1)
SET IDENTITY_INSERT [dbo].[Sach] OFF
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DonHang] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DonHang]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_Sach] FOREIGN KEY([MaSach])
REFERENCES [dbo].[Sach] ([MaSach])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_Sach]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_Admin] FOREIGN KEY([MaAdmin])
REFERENCES [dbo].[Admin] ([MaAdmin])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_Admin]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_GiaoHang] FOREIGN KEY([MaGiaoHang])
REFERENCES [dbo].[GiaoHang] ([MaGiaoHang])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_GiaoHang]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_KhachHang]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_Admin] FOREIGN KEY([MaAdmin])
REFERENCES [dbo].[Admin] ([MaAdmin])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_Admin]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_ChuDe] FOREIGN KEY([MaChuDe])
REFERENCES [dbo].[ChuDe] ([MaChuDe])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_ChuDe]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_NhaXuatBan] FOREIGN KEY([MaNXB])
REFERENCES [dbo].[NhaXuatBan] ([MaNXB])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_NhaXuatBan]
GO
USE [master]
GO
ALTER DATABASE [SachOnline] SET  READ_WRITE 
GO
