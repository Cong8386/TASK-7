 Cấu trúc bảng cho bảng `SanPham`
--

CREATE TABLE SanPham (
  MaSP varchar(7) PRIMARY KEY ,
  TenSP varchar(30) NOT NULL,
  MoTaSP varchar(100) NOT NULL,
  Donvi varchar(5) NOT NULL,
  GiaSP float NOT NULL,
  SoLuong int(11) NOT NULL,
  Trang_Thai varchar(50) DEFAULT NULL
  );
   Cấu trúc bảng cho bảng KhachHang
--

CREATE TABLE KhachHang (
  MaKH varchar(7) PRIMARY KEY,
  HoTen varchar(30) NOT NULL,
  DiaChi varchar(100) NOT NULL,
  SoDT bigint(20) DEFAULT NULL,
  Trang_Thai varchar(50) DEFAULT NULL
  );
  
   Cấu trúc bảng cho bảng Donhang
--

CREATE TABLE Donhang (
  MaDH varchar(7) PRIMARY KEY,
  MaKH varchar(7) NOT NULL,
  Ngay_Dat_Hang datetime DEFAULT NULL,
  Trang_Thai varchar(30) DEFAULT NULL
  );
  
   Cấu trúc bảng cho bảng ChiTietDonHang
--

CREATE TABLE ChiTietDonHang (
  MaDH varchar(7) NOT NULL,
  MaKH varchar(7) NOT NULL,
  GiaSP float NOT NULL,
  SoLuong int(11) DEFAULT NULL,
  CONSTRAINT ChiTietDonHang_ibfk_1 FOREIGN KEY (MaDH,MaKH) REFERENCES DonHang(MaDH, MaKH)
  );
  



~~Liệt kê danh sách khách hàng đã mua hàng ở cửa hàng.
SELECT KhachHang.HoTen,Donhang.MaKH
From Donhang INNER JOIN KhachHang
On Donhang.MaKH=KhachHang.MaKH

~~~Liệt kê danh sách sản phẩm của của hàng
SELECT TenSP FROM SanPham

~~~Liệt kê danh sách các đơn đặt hàng của cửa hàng.
SELECT MaDH,MaKH FROM Donhang

~~~~~Liệt kê danh sách khách hàng theo thứ thự alphabet.
SELECT * FROM KhachHang WHERE HoTen BETWEEN 'a'AND 'z'

~~~~~Liệt kê danh sách sản phẩm của cửa hàng theo thứ thự giá giảm dần.
SELECT * FROM SanPham
   ORDER BY GiaSP DESC;
   
   ~~~~Liệt kê các sản phẩm mà khách hàng Nguyễn Văn An đã mua.
   SELECT ChiTietDonHang.MaSP, KhachHang.HoTen, SanPham.MaSP AS TenSp 
   From ((ChiTietDonHang 
   INNER JOIN KhachHang ON ChiTietDonHang.MaKH= KhachHang.MaKH) 
   INNER JOIN SanPham ON ChiTietDonHang.MaSP =SanPham.MaSP); 
   
  ~~~~ Số khách hàng đã mua ở cửa hàng.
  Select COUNT(*) MaKH From Donhang
  
  ~~~~~Số mặt hàng mà cửa hàng bán.
  SELECT COUNT(*)TenSP From SanPham
  
  ~~~~~Viết câu lệnh để thay đổi trường giá tiền của từng mặt hàng là dương(>0).
 ALTER TABLE SanPham
ADD CHECK (GiaSP>0);
~~~~~Viết câu lệnh để thay đổi ngày đặt hàng của khách hàng phải nhỏ hơn ngày hiện tại.





````Viết câu lệnh để thêm trường ngày xuất hiện trên thị trường của sản phẩm.
ALTER TABLE SanPham
ADD Ngay_Xuat_Hien datetime

  
  
  
