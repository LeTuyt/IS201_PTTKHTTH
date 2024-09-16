Create database SINHVIEN;
show databases;
use SINHVIEN;
CREATE TABLE HOCPHI (
MSSV int primary key,
Ho varchar(10),
Ten varchar(10),
HocPhi int);


INSERT INTO HOCPHI VALUES (05201, 'Duong', 'Hoang', 100);
INSERT INTO HOCPHI VALUES (05203, 'Nguyen', 'Quan', 150);
INSERT INTO HOCPHI VALUES (05205, 'Ly', 'Quang', 200);
select * from HOCPHI;
drop database qlsp;
select * from sanpham;
create database qlsp;
    show databases;
    use qlsp;
    create table sanpham (
    MASP char(4) primary key,
    TENSP varchar(20),
    GIA BigInt);
    insert into sanpham values ('sp01','San pham 1','1000');
    insert into sanpham values ('sp02','San pham 2','2000');
    insert into sanpham values ('sp03','San pham 3','3000');
    
CREATE DATABASE QLKB;
USE QLKB;

CREATE TABLE BACSI (
MABS char(4) PRIMARY KEY,
TENBS varchar(20)CHARACTER SET utf8 COLLATE utf8_unicode_ci
);
CREATE TABLE BENHNHAN (
MABN char(4) PRIMARY KEY,
TENBN varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
NGSINH date,
DCHI varchar(50)CHARACTER SET utf8 COLLATE utf8_unicode_ci,
DTHOAI varchar(10),
GIOITINH boolean
);
CREATE TABLE KHAMBENH(
MAKB char(6) PRIMARY KEY,
MABN char(4),
MABS char(4),
NGAYKHAM date,
YEUCAUKHAM varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
KETLUAN varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
THANHTOAN boolean
);
CREATE TABLE DICHVU (
MADV char(6) PRIMARY KEY,
TENDV varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
DONGIA bigint
);
CREATE TABLE THUPHI (
MAKB char(6),
MADV char(6),
SOLUONG int,
THANHTIEN bigint,
PRIMARY KEY (MAKB, MADV)
);
INSERT INTO BACSI VALUES('BS01', N'BS Nguyễn Văn A');
INSERT INTO BACSI VALUES('BS02', N'BS Nguyễn Văn B');
INSERT INTO BACSI VALUES('BS03', N'BS Nguyễn Thị C');
select *from bacsi;
INSERT INTO BENHNHAN VALUES('BN01', N'BN Trần Văn D','1999-12-01', N'Phường
Linh Trung TP Thủ Đức TPHCM', '0987654321', 1);
INSERT INTO BENHNHAN VALUES('BN02', N'BN Trần Thị E','2000-01-12', N'Phường
Bến Nghé Quận 1 TPHCM', '0321321321', 0);
INSERT INTO BENHNHAN VALUES('BN03', N'BN Đào Thị N','1998-05-25', N'Phường
Tân Thới Hiệp Quận 12 TPHCM', '0321389000', 0);
select *from benhnhan;
INSERT INTO DICHVU VALUES('DV0001', N'Dịch vụ a',100000);
INSERT INTO DICHVU VALUES('DV0002', N'Dịch vụ b',120000);
INSERT INTO DICHVU VALUES('DV0003', N'Dịch vụ c',150000);
INSERT INTO DICHVU VALUES('DV0004', N'Dịch vụ d',250000);
select *from dichvu;
use qlsp;
select *from sanpham;
select *from khambenh;
select *from dichvu;
select*from thuphi;
Create table USER (
userid int primary key,
username varchar(40),
password varchar(20),
userrole varchar(40));
INSERT INTO USER VALUES (1,'nva','123456','Quan tri');
INSERT INTO USER VALUES (2,'nvb','123456','Lap trinh vien');
INSERT INTO USER VALUES (3,'nvc','123456','Kiem thu phan mem');
select *from user;
select *from USER
update benhnhan set ngsinh ='2002-01-19' where mabn='bn04'

CREATE DATABASE QuanLyChungCu
show databases;
use QuanLyChungCu;
CREATE TABLE TAIKHOAN
    (
      TenTaiKhoan VARCHAR(25)  PRIMARY KEY ,
      MatKhau VARCHAR(16) NOT NULL ,
      VaiTro BIT NOT NULL
                 DEFAULT 0
    );



CREATE TABLE KHUCANHO
    (
      MaKhu CHAR(2) PRIMARY KEY,
      TenKhu NVARCHAR(50) NOT NULL ,
      SoTang INT NOT NULL
                 DEFAULT 1 ,
      SoCanTT INT NOT NULL
                  DEFAULT 1 ,
      DiaChi NVARCHAR(100) NOT NULL
	);


CREATE TABLE CUDAN
    (
      MaCuDan CHAR(6)  PRIMARY KEY ,
      TenCuDan NVARCHAR(50) NOT NULL ,
      NgaySinh DATE NOT NULL,
                    
      GioiTinh BIT NOT NULL
                   DEFAULT 0 ,
      SoDT CHAR(10) NOT NULL ,
      SoCMT CHAR(12) NOT NULL ,
      QueQuan NVARCHAR(100) NOT NULL
    );



CREATE TABLE CANHO
    (
      MaCanHo CHAR(6)  PRIMARY KEY ,
      DienTich FLOAT NOT NULL
                     DEFAULT 50 ,
      Gia BIGINT NOT NULL ,
      TrangThai BIT NOT NULL
                    DEFAULT 0 ,
      SoPhong INT NOT NULL
                  DEFAULT 5 ,
      MaCuDan CHAR(6),
         FOREIGN KEY (MaCuDan) REFERENCES cudan(MaCuDan),
      MaKhu CHAR(2)
        NOT NULL
        DEFAULT 'AA',
        
        FOREIGN KEY (MaKhu) REFERENCES khucanho ( MaKhu ) ON DELETE CASCADE
        ON UPDATE CASCADE --  (AA -> ZZ)
    ) ;


CREATE TABLE HOPDONG
    (
      MaHopDong CHAR(12) NOT NULL
                          PRIMARY KEY , -- HD0000000001
      NgayGiaoDich DATE NOT NULL,
                        
      DiaChiKH NVARCHAR(100) NOT NULL ,
      MaCuDan CHAR(6)
        NOT NULL,
		FOREIGN KEY (MaCuDan) REFERENCES cudan( MaCuDan ) ,
      MaCanHo CHAR(6)
        NOT NULL,
        
        FOREIGN KEY (MaCanHo) REFERENCES canho ( MaCanHo ) ON DELETE CASCADE
        ON UPDATE CASCADE
    );




INSERT INTO TAIKHOAN   VALUES (N'Admin', N'123456', 1);
INSERT INTO TAIKHOAN   VALUES (N'NV001', N'abc123', 0);
INSERT INTO TAIKHOAN   VALUES (N'NV002', N'xyz123', 0);



INSERT INTO khucanho VALUES (N'AA', N'An Phú', 25, 20, N'Hà Đông');
INSERT INTO khucanho VALUES (N'CE', N'Hi Land', 30, 25, N'Cầu Giấy');
INSERT INTO khucanho VALUES (N'TS', N'The Spark', 25, 20, N'Hà Đông');



INSERT INTO cudan VALUES (N'111111', N'Trần Văn Nam', CAST(N'1998-05-21' AS Date), 1, N'0123456789', N'012345678985', N'Yên Bái');
INSERT INTO cudan VALUES (N'111112', N'Nguyễn Văn An', CAST(N'1997-02-25' AS Date), 1, N'0123456789', N'012365897456', N'Nam Định');
INSERT INTO cudan VALUES (N'111113', N'Phạm Thị Nguyên Hồng', CAST(N'1991-02-28' AS Date), 1, N'0123658974', N'000256398745', N'Hà Nội');


INSERT INTO canho  VALUES (N'AA1203', 46, 1400000000, 0, 4, NULL, N'AA');
INSERT INTO canho VALUES (N'CE2102', 65.2, 1500000000, 0, 6, NULL, N'CE');
INSERT INTO canho VALUES (N'TS0103', 50, 1200000000, 1, 5, N'111111', N'TS');
INSERT INTO canho VALUES (N'TS2301', 50, 2000000000, 0, 4, NULL, N'TS');
INSERT INTO canho VALUES (N'TS2502', 50, 2000000000, 0, 5, NULL, N'TS');



INSERT INTO hopdong VALUES (N'HD0000000001', CAST(N'2019-03-30' AS Date), N'Số 20, Phạm Văn Đồng, Bắc Từ Liêm', N'111111', N'TS0103');
INSERT INTO hopdong VALUES (N'HD0000000002', CAST(N'2019-03-30' AS Date), N'Số 50, Trần Duy Hưng, Cầu Giấy', N'111112', N'TS2502');
INSERT INTO hopdong VALUES (N'HD0000000003', CAST(N'2019-03-30' AS Date), N'Văn Trì, Từ Liêm, Hà Nội', N'111113', N'TS2301');



  USE QuanLyChungCu;
  
  CREATE PROC [dbo].[searchApartmentWithCriterias]
    @trangthai BIT ,
    @tugia BIGINT ,
    @dengia BIGINT ,
    @tudt FLOAT ,
    @dendt FLOAT
  AS
    BEGIN
  -----
        IF ( @dendt = 0 AND @dengia = 0 ) -- dt > 50, gia > 2000000000
            SELECT c.MaCanHo, c.DienTich, c.Gia, c.TrangThai, c.SoPhong,
                    c.MaCuDan, k.TenKhu
                FROM [QuanLyChungCu].[dbo].[CANHO] c
                    JOIN [QuanLyChungCu].[dbo].KHUCANHO k
                    ON k.MaKhu = c.MaKhu
                WHERE TrangThai = @trangthai AND Gia > @tugia AND DienTich > @tudt
        ELSE -- dt > 50, 0 <gia <= 2000000000
            IF ( @dendt = 0 AND ( ( @tugia = 0 AND @dengia = 1000000000 ) OR ( @tugia = 1000000000 AND @dengia = 2000000000 ) ) )
                SELECT c.MaCanHo, c.DienTich, c.Gia, c.TrangThai, c.SoPhong,
                        c.MaCuDan, k.TenKhu
                    FROM [QuanLyChungCu].[dbo].[CANHO] c
                        JOIN [QuanLyChungCu].[dbo].KHUCANHO k
                        ON k.MaKhu = c.MaKhu
                    WHERE TrangThai = @trangthai AND Gia BETWEEN @tugia AND @dengia AND DienTich > @tudt
            ELSE -- 30 <= dt <= 50, gia > 2000000000
                IF ( @dengia = 0 AND ( ( @tudt = 30 AND @dendt = 40 ) OR ( @tudt = 40 AND @dendt = 50 ) ) )
                    SELECT c.MaCanHo, c.DienTich, c.Gia, c.TrangThai,
                            c.SoPhong, c.MaCuDan, k.TenKhu
                        FROM [QuanLyChungCu].[dbo].[CANHO] c
                            JOIN [QuanLyChungCu].[dbo].KHUCANHO k
                            ON k.MaKhu = c.MaKhu
                        WHERE TrangThai = @trangthai AND Gia > @tugia AND DienTich BETWEEN @tudt AND @dendt
                ELSE --  30 <= dt <= 50 , 0 < gia <= 2000000000
                    SELECT c.MaCanHo, c.DienTich, c.Gia, c.TrangThai,
                            c.SoPhong, c.MaCuDan, k.TenKhu
                        FROM [QuanLyChungCu].[dbo].[CANHO] c
                            JOIN [QuanLyChungCu].[dbo].KHUCANHO k
                            ON k.MaKhu = c.MaKhu
                        WHERE TrangThai = @trangthai AND Gia BETWEEN @tugia AND @dengia AND DienTich BETWEEN @tudt AND @dendt

    END


SELECT * FROM  dbo.CANHO
EXEC dbo.searchApartmentWithCriterias 0,2000000000,0,40,50 -- 
GO 
CREATE PROC [dbo].[searchApartments]
    @tugia BIGINT ,
    @dengia BIGINT ,
    @tudt FLOAT ,
    @dendt FLOAT,
	@sophong INT
  AS
    BEGIN

        IF ( @dendt = 0 AND @dengia = 0 ) -- dt > 50, gia > 2000000000
            SELECT c.MaCanHo, c.DienTich, c.Gia, c.SoPhong, k.TenKhu
                FROM [QuanLyChungCu].[dbo].[CANHO] c
                    JOIN [QuanLyChungCu].[dbo].KHUCANHO k
                    ON k.MaKhu = c.MaKhu
                WHERE TrangThai = 0 AND Gia > @tugia AND DienTich > @tudt AND SoPhong=@sophong
        ELSE -- dt > 50, 0 <gia <= 2000000000
            IF ( @dendt = 0 AND ( ( @tugia = 0 AND @dengia = 1000000000 ) OR ( @tugia = 1000000000 AND @dengia = 2000000000 ) ) )
                SELECT c.MaCanHo, c.DienTich, c.Gia, c.SoPhong, k.TenKhu
                    FROM [QuanLyChungCu].[dbo].[CANHO] c
                        JOIN [QuanLyChungCu].[dbo].KHUCANHO k
                        ON k.MaKhu = c.MaKhu
                    WHERE Gia BETWEEN @tugia AND @dengia AND DienTich > @tudt AND SoPhong=@sophong
            ELSE -- 30 <= dt <= 50, gia > 2000000000
                IF ( @dengia = 0 AND ( ( @tudt = 30 AND @dendt = 40 ) OR ( @tudt = 40 AND @dendt = 50 ) ) )
                    SELECT c.MaCanHo, c.DienTich, c.Gia, c.SoPhong, k.TenKhu
                        FROM [QuanLyChungCu].[dbo].[CANHO] c
                            JOIN [QuanLyChungCu].[dbo].KHUCANHO k
                            ON k.MaKhu = c.MaKhu
                        WHERE Gia > @tugia AND DienTich BETWEEN @tudt AND @dendt AND SoPhong=@sophong
                ELSE --  30 <= dt <= 50 , 0 < gia <= 2000000000
                    SELECT c.MaCanHo, c.DienTich, c.Gia, c.SoPhong, k.TenKhu
                        FROM [QuanLyChungCu].[dbo].[CANHO] c
                            JOIN [QuanLyChungCu].[dbo].KHUCANHO k
                            ON k.MaKhu = c.MaKhu
                        WHERE  Gia BETWEEN @tugia AND @dengia AND DienTich BETWEEN @tudt AND @dendt AND SoPhong=@sophong
  -----
    END
GO
EXEC [dbo].[searchApartments] 1000000000,2000000000,40,50,4
GO
select *from canho;
select *from cudan;
select *from taikhoan;
use qlkb;
Alter table CuDan 
modify GioiTinh nvarchar(10);
update CuDan set GioiTinh = 'Nam' where MaCuDan = '111111';
update CuDan set GioiTinh = 'Nam' where MaCuDan = '111112';
update CuDan set GioiTinh = 'Nữ' where MaCuDan = '111113';