Create database QL_NhanSu2
go
use QL_NhanSu
go


CREATE TABLE users (
    id INT IDENTITY(1,1) PRIMARY KEY, -- ID tự động tăng
    username NVARCHAR(255) NOT NULL UNIQUE, -- Tên người dùng, không trùng lặp
    password NVARCHAR(255) NOT NULL, -- Mật khẩu, nên được bảo mật tốt hơn
    email NVARCHAR(255) NOT NULL UNIQUE, -- Email, không trùng lặp
    role_id INT NOT NULL, -- ID của vai trò trong bảng roles
    note NVARCHAR(255),
    created_at DATETIME2 DEFAULT GETDATE() -- Thời gian tạo, mặc định là thời gian hiện tại
);


INSERT INTO users (username, password, email, role_id,note)
VALUES
('admin', 'admin', 'admin@example.com', 0,'admin'),
('user1', 'password1', 'user1@example.com', 1,'quanly'),
('user2', 'password2', 'user2@example.com', 2,'nhanvien'),
('user3', 'password3', 'user3@example.com', 3,'thuctap');




-- Tạo bảng Khối phòng ban
CREATE TABLE KhoiPhongBan (
  MaKhoiPhongBan INT PRIMARY KEY,
  TenKhoiPhongBan NVARCHAR(255)
);

-- Tạo bảng Phòng ban
CREATE TABLE PhongBan (
  MaPhongBan INT PRIMARY KEY ,
  Stt int IDENTITY(1,1),
  TenPhongBan NVARCHAR(255),
  DoTuoiVeHuuNam INT,
  DoTuoiVeHuuNu INT,
  SoLaoDong INT,
  MaKhoiPhongBan INT,
  FOREIGN KEY (MaKhoiPhongBan) REFERENCES KhoiPhongBan(MaKhoiPhongBan)
);

CREATE TABLE ChungChi (
  MaChungChi INT PRIMARY KEY ,
  Stt int IDENTITY(1,1),
  TenChungChi NVARCHAR(255),
  ThoiHan INT,
  GhiChu NVARCHAR(255)  
);

CREATE TABLE BacLuong (
  MaBacLuong INT PRIMARY KEY ,
  Stt int IDENTITY(1,1),
  Ngay datetime,
  TenBacLuong NVARCHAR(255),
  Bac1 FLOAT,  
  Bac2 FLOAT,
  Bac3 FLOAT,
  Bac4 FLOAT,
  Bac5 FLOAT,
  Bac6 FLOAT,
  Bac7 FLOAT,
  Bac8 FLOAT,
  Bac9 FLOAT,
  Bac10 FLOAT
);

CREATE TABLE MucXang (
  ID INT PRIMARY KEY ,
  Stt int IDENTITY(1,1),
  NgayApDung datetime,
  Muc1 INT,
  Muc2 INT,
  Muc3 INT,
  Muc4 INT  
);
CREATE TABLE NhanVien1 (
	MaNhanVien INT identity(1,1) PRIMARY KEY,
	TenNhanVien NVARCHAR(255),
	NgaySinh datetime,
	ChucVu NVARCHAR(255),
	DiaChi NVARCHAR(255)
);

CREATE TABLE TrangThaiLamViec (
    MaTrangThai INT IDENTITY(1,1) PRIMARY KEY,
    TenTrangThai NVARCHAR(255),
    KyHieu NVARCHAR(50)
);

CREATE TABLE BoPhan (
    MaBoPhan INT IDENTITY(1,1) PRIMARY KEY,
    TenBoPhan NVARCHAR(255)
);
CREATE TABLE ChucVu (
    MaChucVu INT IDENTITY(1,1) PRIMARY KEY,
    TenChucVu NVARCHAR(255)
);

CREATE TABLE LoaiBaoCao (
    MaLoaiBaoCao INT IDENTITY(1,1) PRIMARY KEY,
    TenLoaiBaoCao NVARCHAR(255),
    MoTa NVARCHAR(MAX)
);

CREATE TABLE BaoBieuChamCongHangNgay (
    MaBaoBieu INT IDENTITY(1,1) PRIMARY KEY,
    MaNhanVien INT,
    Ngay DATE,
    ThoiGianDen TIME,
    ThoiGianVe TIME,
    SoGioLamViec FLOAT,
    GhiChu NVARCHAR(MAX),
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien1(MaNhanVien)
);
CREATE TABLE HopDongLaoDong (
    MaHopDong INT IDENTITY(1,1) PRIMARY KEY,
    MaNhanVien INT,
    NgayKy DATE,
    NgayHetHan DATE,
    LoaiHopDong NVARCHAR(255),
    DieuKhoan NVARCHAR(MAX),
    CONSTRAINT FK_HopDongLaoDong_NhanVien FOREIGN KEY (MaNhanVien) REFERENCES NhanVien1 (MaNhanVien)
)


CREATE TABLE BangLuong (
    MaBangLuong INT IDENTITY(1,1) PRIMARY KEY,
    NgayCapNhat DATETIME,
    MaNhanVien INT,
    LuongCoBan DECIMAL(10, 2),
    TienThuong DECIMAL(10, 2),
    BaoHiem DECIMAL(10, 2),
    PhuCap DECIMAL(10, 2),
    CONSTRAINT FK_BangLuong_NhanVien FOREIGN KEY (MaNhanVien) REFERENCES NhanVien1 (MaNhanVien)
);   

CREATE TABLE BaoBieuChamCongHangThang (
    MaBaoBieu INT IDENTITY(1,1) PRIMARY KEY,
    MaNhanVien INT,
    Thang DATE,
    TongSoGioLamViec FLOAT,
    SoNgayCong INT,
    SoNgayNghi INT,
    SoNgayLamThemGio INT,
    GhiChu NVARCHAR(MAX),
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien1(MaNhanVien)
);


CREATE TABLE DanhGiaHieuSuat (
    MaDanhGia INT IDENTITY(1,1) PRIMARY KEY,
    MaNhanVien INT,
    NgayDanhGia DATETIME,
    KetQuaDanhGia NVARCHAR(255),
    CONSTRAINT FK_DanhGiaHieuSuat_NhanVien FOREIGN KEY (MaNhanVien) REFERENCES NhanVien1 (MaNhanVien)
);


CREATE TABLE HoSoNhanVien (
    MaHoSo INT IDENTITY(1,1) PRIMARY KEY,
    MaNhanVien INT,
    ThongTinCaNhan NVARCHAR(MAX),
    LichSuCongViec NVARCHAR(MAX),
    KyNangVaNangLuc NVARCHAR(MAX),
    CONSTRAINT FK_HoSoNhanVien_NhanVien FOREIGN KEY (MaNhanVien) REFERENCES NhanVien1 (MaNhanVien)
);

CREATE TABLE BaoBieuLuongHangThang (
    MaBaoBieu INT IDENTITY(1,1) PRIMARY KEY,
    MaNhanVien INT,
    Thang DATE,
    LuongCoBan DECIMAL(10,2),
    TienThuong DECIMAL(10,2),
    CacKhoanPhuCap DECIMAL(10,2),
    TongThuNhap DECIMAL(10,2),
    GhiChu NVARCHAR(MAX),
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien1(MaNhanVien)
);

CREATE TABLE ThuongPhat (
    MaQuyetDinh INT IDENTITY(1,1) PRIMARY KEY,
    MaNhanVien INT,
    NgayQuyetDinh DATE,
    LoaiThuongPhat NVARCHAR(255),
    SoTien DECIMAL(18, 2),
    CONSTRAINT FK_ThuongPhat_NhanVien FOREIGN KEY (MaNhanVien) REFERENCES NhanVien1 (MaNhanVien)
);


CREATE TABLE HopDongLaoDong (
    MaHopDong INT IDENTITY(1,1) PRIMARY KEY,
    MaNhanVien INT,
    NgayKy DATE,
    NgayHetHan DATE,
    LoaiHopDong NVARCHAR(255),
    DieuKhoan NVARCHAR(MAX),
    CONSTRAINT FK_HopDongLaoDong_NhanVien FOREIGN KEY (MaNhanVien) REFERENCES NhanVien1 (MaNhanVien)
);


CREATE TABLE BaoHiemVaPhucLoi (
    MaBaoHiem INT IDENTITY(1,1) PRIMARY KEY,
    MaNhanVien INT,
    LoaiBaoHiem NVARCHAR(255),
    NgayBatDau DATE,
    NgayKetThuc DATE,
    MucDong DECIMAL(18, 2),
    CONSTRAINT FK_BaoHiemVaPhucLoi_NhanVien FOREIGN KEY (MaNhanVien) REFERENCES NhanVien1 (MaNhanVien)
);



CREATE TABLE ChamCong2 (
    SoThuTu INT IDENTITY(1,1) PRIMARY KEY,
    MaNhanVien INT,
    TenNhanVien NVARCHAR(100),
    SoGioTangCa INT,
    LuongCoBan DECIMAL(18, 2),
    TroCapDiLai DECIMAL(18, 2),
    TroCapNhaO DECIMAL(18, 2),
    TienHieuSuat DECIMAL(18, 2),
    BaoHiemXaHoi DECIMAL(18, 2),
    BaoHiemYTe DECIMAL(18, 2),
    BaoHiemTuNguyen DECIMAL(18, 2),
    PhiCongDoan DECIMAL(18, 2),
    ThucLinh DECIMAL(18, 2),
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien1(MaNhanVien) -- Giả sử có bảng NhanVien với MaNhanVien là khóa chính
);


CREATE TABLE LichLamViec (
    MaLichLamViec INT IDENTITY(1,1) PRIMARY KEY,
    MaNhanVien INT,
    Ngay DATE,
    CaLamViec NVARCHAR(50),
    CONSTRAINT FK_LichLamViec_NhanVien FOREIGN KEY (MaNhanVien) REFERENCES NhanVien1 (MaNhanVien)
);

CREATE TABLE QuaTrinhThangChuc (
    MaQuaTrinhThangChuc INT IDENTITY(1,1) PRIMARY KEY,
    MaNhanVien INT,
    NgayBatDau DATE,
    ChucVuMoi NVARCHAR(255),
    CONSTRAINT FK_QuaTrinhThangChuc_NhanVien FOREIGN KEY (MaNhanVien) REFERENCES NhanVien1 (MaNhanVien)
);


CREATE TABLE DieuChuyenCongTac (
    MaDieuChuyen INT IDENTITY(1,1) PRIMARY KEY,
    MaNhanVien INT,
    PhongBanDieuChuyen NVARCHAR(255),
    ThoiGianDieuChuyen DATE,
    ViTriDieuChuyen NVARCHAR(255),
    CONSTRAINT FK_DieuChuyenCongTac_NhanVien FOREIGN KEY (MaNhanVien) REFERENCES NhanVien1 (MaNhanVien)
);


CREATE TABLE BaoCaoThamNienCongTac (
    MaBaoCao INT IDENTITY(1,1) PRIMARY KEY,
    MaNhanVien INT,
    ThamNienCongTac INT, -- Thâm niên tính bằng số năm
    NgayBatDauCongTac DATE,
    GhiChu NVARCHAR(MAX),
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien1(MaNhanVien)
);


CREATE TABLE KhenThuongKyLuat (
    MaQuyetDinh INT IDENTITY(1,1) PRIMARY KEY,
    MaNhanVien INT,
    NgayQuyetDinh DATE,
    LoaiHinh NVARCHAR(255),
    LyDo NVARCHAR(500),
    CONSTRAINT FK_KhenThuongKyLuat_NhanVien FOREIGN KEY (MaNhanVien) REFERENCES NhanVien1 (MaNhanVien)
);


CREATE TABLE ThongTinGiaDinh (
    MaThongTin INT IDENTITY(1,1) PRIMARY KEY,
    MaNhanVien INT,
    QuanHe NVARCHAR(50),
    Ten NVARCHAR(255),
    NgaySinh DATE,
    NgheNghiep NVARCHAR(255),
    CONSTRAINT FK_ThongTinGiaDinh_NhanVien FOREIGN KEY (MaNhanVien) REFERENCES NhanVien1 (MaNhanVien)
);
    
INSERT INTO NhanVien1 (TenNhanVien, NgaySinh, ChucVu, DiaChi) VALUES
('Nguyen Van A', '1980-05-15', 'Giam doc', 'TP HCM'),
('Tran Thi B', '1992-08-25', 'Nhan vien', 'Ha Noi'),
('Le Van C', '1975-03-09', 'Pho giam doc', 'Da Nang'); 


INSERT INTO BoPhan (TenBoPhan) VALUES
('Phòng Ke toán'),
('Phòng Nhân sự'),
('Phòng Marketing'),
('Phòng Bán hàng'),
('Phòng Kỹ thuật');

INSERT INTO ChucVu (TenChucVu) VALUES
('Giam doc'),
('Pho giam doc'),
('Nhan vien')


INSERT INTO BangLuong (NgayCapNhat, MaNhanVien, LuongCoBan, TienThuong, BaoHiem, PhuCap) VALUES
('2024-04-01', 1, 20000.00, 3000.00, 1500.00, 500.00),
('2024-04-01', 2, 12000.00, 1500.00, 1200.00, 300.00),
('2024-04-01', 3, 18000.00, 2500.00, 1800.00, 400.00);


INSERT INTO DanhGiaHieuSuat (MaNhanVien, NgayDanhGia, KetQuaDanhGia) VALUES
(1, '2024-03-15', 'XUAT SAC'),
(2, '2024-03-16', 'TOT'),
(3, '2024-03-17', 'KHA');


INSERT INTO HoSoNhanVien (MaNhanVien, ThongTinCaNhan, LichSuCongViec, KyNangVaNangLuc) VALUES
(1, 'Nam, sinh ngay 15/05/1980 tai TP HCM', 'Tu nam 2005 den nam 2010 lam viec tai cong ty XYZ. Tu nam 2011 den nay lam Giam doc tai ABC.', 'Ky nang lanh dao, quan ly thoi gian, giao tiep.'),
(2, 'Nu, sinh ngay 25/08/1992 tai Ha Noi', 'Tu nam 2015 den nam 2020 lam viec tai cong ty DEF. Tu nam 2021 den nay lam Nhan vien tai GHI.', 'Ky nang phan tich du lieu, lam viec nhom, Microsoft Office.'),
(3, 'Nam, sinh ngay 09/03/1975 tai Da Nang', 'Tu nam 2000 den nam 2015 lam viec tai cong ty JKL. Tu nam 2016 den nay lam Pho giam doc tai MNO.', 'Ky nang quan ly du an, ra quyet dinh, giai quyet van de.');


INSERT INTO ThuongPhat (MaNhanVien, NgayQuyetDinh, LoaiThuongPhat, SoTien) VALUES
(1, '2024-04-01', 'Thuong', 5000000.00),
(2, '2024-04-01', 'Phat', -1000000.00),
(3, '2024-04-01', 'Thuong', 3000000.00);


INSERT INTO HopDongLaoDong (MaNhanVien, NgayKy, NgayHetHan, LoaiHopDong, DieuKhoan) VALUES
(1, '2024-01-01', '2029-01-01', 'Co thoi han', 'Dieu khoan ve trach nhiem va quyen loi cua nhan vien.'),
(2, '2024-02-15', '2025-02-15', 'Co thoi han', 'Dieu khoan ve gio lam viec, ngay nghi phep.'),
(3, '2024-03-20', '2029-03-20', 'Khong thoi han', 'Dieu khoan ve bao hiem, luong, va dieu chinh hang nam.');


INSERT INTO BaoHiemVaPhucLoi (MaNhanVien, LoaiBaoHiem, NgayBatDau, NgayKetThuc, MucDong) VALUES
(1, 'Bao hiem y te', '2024-01-01', '2029-01-01', 1000000.00),
(2, 'Bao hiem xa hoi', '2024-02-15', '2029-02-15', 800000.00),
(3, 'Bao hiem tai nan', '2024-03-20', '2029-03-20', 500000.00);


INSERT INTO KhoiPhongBan (MaKhoiPhongBan, TenKhoiPhongBan)
VALUES (1, N'Khối Kế toán'),
       (2, N'Khối Nhân sự'),
       (3, N'Khối Kỹ thuật'),
       (4, N'Khối Marketing');

	   INSERT INTO PhongBan (MaPhongBan, TenPhongBan, DoTuoiVeHuuNam, DoTuoiVeHuuNu, SoLaoDong, MaKhoiPhongBan)
VALUES (1, N'Phòng Kế toán 1', 60, 55, 20, 1),
       (2, N'Phòng Kế toán 2', 65, 60, 15, 1),
       (3, N'Phòng Kế toán 3', 62, 57, 18, 1),
       (4, N'Phòng Nhân sự 1', 63, 58, 12, 2),
       (5, N'Phòng Nhân sự 2', 58, 53, 10, 2),
       (6, N'Phòng Nhân sự 3', 63, 58, 15, 2),
       (7, N'Phòng Kỹ thuật 1', 65, 60, 25, 3),
       (8, N'Phòng Kỹ thuật 2', 60, 55, 20, 3),
       (9, N'Phòng Kỹ thuật 3', 62, 57, 18, 3),
       (10, N'Phòng Marketing 1', 63, 58, 12, 4),
       (11, N'Phòng Marketing 2', 58, 53, 10, 4),
       (12, N'Phòng Marketing 3', 63, 58, 15, 4),
       (13, N'Phòng Kế toán 4', 65, 60, 25, 1),
       (14, N'Phòng Nhân sự 4', 60, 55, 20, 2),
       (15, N'Phòng Kỹ thuật 4', 62, 57, 18, 3);



INSERT INTO ChungChi (MaChungChi, TenChungChi, ThoiHan, GhiChu)
VALUES (1, N'Chứng chỉ Quản lý Dự án', 24, N'Không có ghi chú');

INSERT INTO BacLuong (MaBacLuong, Ngay, TenBacLuong, Bac1, Bac2, Bac3, Bac4, Bac5, Bac6, Bac7, Bac8, Bac9, Bac10)
VALUES (1, '2024-04-09', N'Bậc lương 1', 1.0, 1.2, 1.4, 1.6, 1.8, 2.0, 2.2, 2.4, 2.6, 2.8);

INSERT INTO MucXang (ID, NgayApDung, Muc1, Muc2, Muc3, Muc4)
VALUES (1, '2024-04-09', 15000, 16000, 17000, 18000);



INSERT INTO ChamCong2 (
    MaNhanVien, TenNhanVien, SoGioTangCa, LuongCoBan, TroCapDiLai, TroCapNhaO, TienHieuSuat, 
    BaoHiemXaHoi, BaoHiemYTe, BaoHiemTuNguyen, PhiCongDoan, ThucLinh
) VALUES
(1, 'Nguyen Van A', 10, 12000000, 1000000, 500000, 2000000, 600000, 200000, 0, 100000, 14300000),
(2, 'Tran Thi B', 5, 8000000, 500000, 300000, 1500000, 400000, 160000, 0, 80000, 9570000),
(3, 'Le Van C', 20, 15000000, 1500000, 1000000, 2500000, 750000, 250000, 0, 150000, 17800000);




INSERT INTO LichLamViec (MaNhanVien, Ngay, CaLamViec) VALUES
(1, '2024-04-15', 'Sang'),
(2, '2024-04-15', 'Chieu'),
(3, '2024-04-15', 'Toi');


INSERT INTO QuaTrinhThangChuc (MaNhanVien, NgayBatDau, ChucVuMoi) VALUES
(1, '2025-01-01', 'Tong Giam Doc'),
(2, '2025-01-01', 'Truong phong'),
(3, '2025-01-01', 'Giam Doc');


INSERT INTO DieuChuyenCongTac (MaNhanVien, PhongBanDieuChuyen, ThoiGianDieuChuyen, ViTriDieuChuyen) VALUES
(1, 'Phong Marketing', '2024-05-01', 'Truong Phong Marketing'),
(2, 'Phong Nhan Su', '2024-05-01', 'Nhan Vien Nhan Su'),
(3, 'Phong Ke Toan', '2024-05-01', 'Ke Toan Truong');


INSERT INTO KhenThuongKyLuat (MaNhanVien, NgayQuyetDinh, LoaiHinh, LyDo) VALUES
(1, '2024-06-01', 'Khen thuong', 'Hoan thanh vuot muc ke hoach quy I'),
(2, '2024-06-15', 'Ky luat', 'Vi pham quy dinh ve gio lam'),
(3, '2024-06-20', 'Khen thuong', 'Dong gop y tuong sang tao moi');


INSERT INTO ThongTinGiaDinh (MaNhanVien, QuanHe, Ten, NgaySinh, NgheNghiep) VALUES
(1, 'Vo', 'Nguyen Thi A', '1985-04-10', 'Giao vien'),
(1, 'Con', 'Nguyen Van B', '2010-03-15', 'Hoc sinh'),
(2, 'Chong', 'Tran Van C', '1990-01-20', 'Ky su'),
(3, 'Me', 'Le Thi D', '1950-08-08', 'Nghi huu');

INSERT INTO TrangThaiLamViec (TenTrangThai, KyHieu) VALUES
('Dang lam viec', 'DL'),
('Nghi phep', 'NP'),
('Da nghi viec', 'DNV');

INSERT INTO LoaiBaoCao (TenLoaiBaoCao, MoTa) VALUES
('Bao cao tai chinh', 'Bao cao tong hop ve tinh hinh tai chinh cua cong ty, bao gom doanh thu, chi phi, loi nhuan, ...'),
('Bao cao nhan su', 'Bao cao ve tinh hinh nhan su, bao gom so luong, phan bo, hieu suat lam viec cua cac nhan vien'),
('Bao cao ban hang', 'Bao cao chi tiet cac hoat dong ban hang, doanh so, va cac chi tieu lien quan den ban hang');


INSERT INTO BaoBieuChamCongHangNgay (MaNhanVien, Ngay, ThoiGianDen, ThoiGianVe, SoGioLamViec, GhiChu) VALUES
(1, '2023-04-01', '08:00:00', '17:00:00', 8.0, 'Lam viec tot'),
(2, '2023-04-01', '08:30:00', '17:30:00', 8.0, 'Den muon 30 phut'),
(3, '2023-04-01', '08:00:00', '17:00:00', 8.0, 'Khong co ghi chu');


INSERT INTO BaoBieuChamCongHangThang (MaNhanVien, Thang, TongSoGioLamViec, SoNgayCong, SoNgayNghi, SoNgayLamThemGio, GhiChu) VALUES
(1, '2023-04-01', 160.0, 20, 2, 5, 'Lam viec tot, nhieu gio lam them'),
(2, '2023-04-01', 150.0, 19, 3, 4, 'Vang mat 3 ngay do om'),
(3, '2023-04-01', 170.0, 21, 1, 7, 'Tich cuc lam them, hieu qua cao');

INSERT INTO BaoBieuLuongHangThang (MaNhanVien, Thang, LuongCoBan, TienThuong, CacKhoanPhuCap, TongThuNhap, GhiChu) VALUES
(1, '2023-04-01', 12000.00, 2000.00, 500.00, 14500.00, 'Hoan thanh muc tieu thang 4'),
(2, '2023-04-01', 8000.00, 500.00, 300.00, 8800.00, 'Nghi om 3 ngay'),
(3, '2023-04-01', 15000.00, 2500.00, 1000.00, 18500.00, 'Thuc h	ien tot nhiem vu dac biet');

INSERT INTO BaoCaoThamNienCongTac (MaNhanVien, ThamNienCongTac, NgayBatDauCongTac, GhiChu) VALUES
(1, 18, '2005-04-01', 'Da qua nhieu du an lon'),
(2, 8, '2015-08-15', 'Nang dong va chiu hoc hoi'),
(3, 17, '2006-03-20', 'Kinh nghiem quan ly va dieu hanh');


select * from KhoiPhongBan
select * from PhongBan
select * from ChungChi
select * from BacLuong
select * from MucXang
select * from NhanVien1
select * from BoPhan
select * from ChucVu
select * from BangLuong
select * from DanhGiaHieuSuat
select * from HoSoNhanVien
select * from ThuongPhat
select * from HopDongLaoDong
select * from BaoHiemVaPhucLoi
select * from ChamCong2
select * from LichLamViec
select * from QuaTrinhThangChuc
select * from DieuChuyenCongTac
select * from KhenThuongKyLuat
select * from ThongTinGiaDinh
select * from TrangThaiLamViec
select * from LoaiBaoCao
select * from BaoBieuChamCongHangNgay
select * from BaoBieuChamCongHangThang
select * from BaoBieuLuongHangThang
select * from BaoCaoThamNienCongTac


SELECT
    ROW_NUMBER() OVER (ORDER BY MaNhanVien) AS STT,
    MaNhanVien AS "Mã NV",
    TenNhanVien AS "Tên NV",
    SoGioTangCa AS "Số giờ tăng ca",
    LuongCoBan AS "Lương CB",
    TroCapDiLai AS "Trợ cấp đi lại",
    TroCapNhaO AS "Trợ cấp nhà ở",
    TienHieuSuat AS "Tiền hiệu suất",
    BaoHiemXaHoi AS "BHXH",
    BaoHiemYTe AS "BHYT",
    BaoHiemTuNguyen AS "BHTN",
    PhiCongDoan AS "Phí công đoàn",
    (LuongCoBan + TroCapDiLai + TroCapNhaO + TienHieuSuat - BaoHiemXaHoi - BaoHiemYTe - BaoHiemTuNguyen - PhiCongDoan) AS "Thực lĩnh"
FROM
    ChamCong2
ORDER BY
    MaNhanVien;

