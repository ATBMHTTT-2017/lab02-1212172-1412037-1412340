
--T?o b?ng
CREATE TABLE NhanVien (
  key VARCHAR2(2000),
  maNV VARCHAR2(10) NOT NULL PRIMARY KEY,
  hoTen NVARCHAR2(50) NOT NULL,
  diaChi NVARCHAR2(50) NOT NULL,
  dienThoai VARCHAR2(10),
  email VARCHAR2(50),
  maPhong VARCHAR2(10),
  chiNhanh VARCHAR2(10),
  luong VARCHAR2(50)
  
);

CREATE TABLE PhongBan (
  maPhong VARCHAR2(10) NOT NULL PRIMARY KEY,
  tenPhong NVARCHAR2(50) NOT NULL,
  truongPhong VARCHAR2(10),
  ngayNhanChuc DATE,
  soNhanVien INT,
  chiNhanh VARCHAR2(10)
);

CREATE TABLE ChiNhanh (
  maCN VARCHAR2(10) NOT NULL PRIMARY KEY,
  tenCN NVARCHAR2(50) NOT NULL,
  truongChiNhanh VARCHAR2(10)
);

CREATE TABLE DuAn (
  maDA VARCHAR2(10) NOT NULL PRIMARY KEY,
  tenDA NVARCHAR2(50) NOT NULL,
  kinhPhi FLOAT,
  phongChuTri VARCHAR2(10),
  truongDA VARCHAR2(10)
);

CREATE TABLE PhanCong (
  maNV VARCHAR2(10) NOT NULL,
  duAn VARCHAR2(10) NOT NULL,
  vaiTro NVARCHAR2(50),
  phuCap FLOAT,
  CONSTRAINT PhanCong_PK PRIMARY KEY(maNV,duAn) ENABLE
);

CREATE TABLE ChiTieu (
  maChiTieu VARCHAR2(10) NOT NULL PRIMARY KEY,
  tenChiTieu NVARCHAR2(50) NOT NULL,
  soTien FLOAT,
  duAn VARCHAR2(10)
);

--Thi?t �?t c�c kh�a li�n k?t gi?a c�c b?ng
ALTER TABLE NhanVien  ADD CONSTRAINT FK1_NhanVien_PhongBan FOREIGN KEY(maPhong) REFERENCES PhongBan (maPhong);
ALTER TABLE NhanVien  ADD CONSTRAINT FK2_NhanVien_ChiNhanh FOREIGN KEY(chiNhanh) REFERENCES ChiNhanh (maCN);
ALTER TABLE PhongBan  ADD CONSTRAINT FK1_PhongBan_ChiNhanh FOREIGN KEY(chiNhanh) REFERENCES ChiNhanh (maCN);
ALTER TABLE PhongBan  ADD CONSTRAINT FK2_PhongBan_NhanVien FOREIGN KEY(truongPhong) REFERENCES NhanVien (maNV);
ALTER TABLE ChiNhanh  ADD CONSTRAINT FK1_ChiNhanh_NhanVien FOREIGN KEY(truongChiNhanh) REFERENCES NhanVien (maNV);
ALTER TABLE DuAn  ADD CONSTRAINT FK1_DuAn_PhongBan FOREIGN KEY(phongChuTri) REFERENCES PhongBan (maPhong);
ALTER TABLE DuAn  ADD CONSTRAINT FK1_DuAn_NhanVien FOREIGN KEY(truongDA) REFERENCES NhanVien (maNV);
ALTER TABLE PhanCong  ADD CONSTRAINT FK1_PhanCong_NhanVien FOREIGN KEY(maNV) REFERENCES NhanVien (maNV);
ALTER TABLE PhanCong  ADD CONSTRAINT FK2_PhanCong_DuAn FOREIGN KEY(duAn) REFERENCES DuAn (maDA);
ALTER TABLE ChiTieu  ADD CONSTRAINT FK1_ChiTieu_DuAn FOREIGN KEY(duAn) REFERENCES DuAn (maDA);

--Nhap lieu
INSERT INTO NhanVien  (maNV, hoTen, diaChi) VALUES ('nv001','Nguyen Van A','TPHCM');
INSERT INTO NhanVien  (maNV, hoTen, diaChi) VALUES ('nv002','Nguyen Van B','TPHCM');
INSERT INTO NhanVien  (maNV, hoTen, diaChi) VALUES ('nv003','Nguyen Van C','Binh Phuoc');
INSERT INTO NhanVien  (maNV, hoTen, diaChi) VALUES ('nv004','Nguyen Van D','TPHCM');
INSERT INTO NhanVien  (maNV, hoTen, diaChi) VALUES ('nv005','Nguyen Van E','TPHCM');
INSERT INTO NhanVien  (maNV, hoTen, diaChi) VALUES ('nv006','Nguyen Van F','Binh Duong');
INSERT INTO NhanVien  (maNV, hoTen, diaChi) VALUES ('nv007','Nguyen Van G','TPHCM');
INSERT INTO NhanVien  (maNV, hoTen, diaChi) VALUES ('nv008','Nguyen Van H','TPHCM');
INSERT INTO NhanVien  (maNV, hoTen, diaChi) VALUES ('nv009','Nguyen Van I','TPHCM');
INSERT INTO NhanVien  (maNV, hoTen, diaChi) VALUES ('nv010','Nguyen Van J','TPHCM');
INSERT INTO NhanVien  (maNV, hoTen, diaChi) VALUES ('nv011','Nguyen Van K','TPHCM');
INSERT INTO NhanVien  (maNV, hoTen, diaChi) VALUES ('nv012','Nguyen Van L','Ha Noi');
INSERT INTO NhanVien  (maNV, hoTen, diaChi) VALUES ('nv013','Nguyen Van M','TPHCM');
INSERT INTO NhanVien  (maNV, hoTen, diaChi) VALUES ('nv014','Nguyen Van N','TPHCM');
INSERT INTO NhanVien  (maNV, hoTen, diaChi) VALUES ('nv015','Nguyen Van R','TPHCM');
INSERT INTO NhanVien  (maNV, hoTen, diaChi) VALUES ('nv016','Nguyen Van O','TPHCM');
INSERT INTO NhanVien  (maNV, hoTen, diaChi) VALUES ('nv017','Nguyen Van P','TPHCM');
INSERT INTO NhanVien  (maNV, hoTen, diaChi) VALUES ('nv018','Nguyen Van X','TPHCM');
INSERT INTO NhanVien  (maNV, hoTen, diaChi) VALUES ('nv019','Nguyen Van Y','TPHCM');
INSERT INTO NhanVien  (maNV, hoTen, diaChi) VALUES ('nv020','Nguyen Van Z','TPHCM');

INSERT INTO PhongBan  (maPhong, tenPhong, truongPhong,chiNhanh) VALUES ('P001','Phong IT','nv001','CN001');
INSERT INTO PhongBan  (maPhong, tenPhong, truongPhong,chiNhanh) VALUES ('P002','Phong Ke Toan','nv002','CN001');
INSERT INTO PhongBan  (maPhong, tenPhong, truongPhong,chiNhanh) VALUES ('P003','Phong Ke Hoach','nv003','CN001');
INSERT INTO PhongBan  (maPhong, tenPhong, truongPhong,chiNhanh) VALUES ('P004','Phong �oi Ngoai','nv004','CN001');
INSERT INTO PhongBan  (maPhong, tenPhong, truongPhong,chiNhanh) VALUES ('P005','Phong Nh�n Su','nv005','CN001');
--
INSERT INTO PhongBan  (maPhong, tenPhong, truongPhong,chiNhanh) VALUES ('P006','Phong IT','nv001','CN002');
INSERT INTO PhongBan  (maPhong, tenPhong, truongPhong,chiNhanh) VALUES ('P007','Phong Ke Toan','nv002','CN002');
INSERT INTO PhongBan  (maPhong, tenPhong, truongPhong,chiNhanh) VALUES ('P008','Phong Ke Hoach','nv003','CN002');
INSERT INTO PhongBan  (maPhong, tenPhong, truongPhong,chiNhanh) VALUES ('P009','Phong �oi Ngoai','nv004','CN002');
INSERT INTO PhongBan  (maPhong, tenPhong, truongPhong,chiNhanh) VALUES ('P010','Phong Nh�n Su','nv005','CN002');
--
INSERT INTO PhongBan  (maPhong, tenPhong, truongPhong,chiNhanh) VALUES ('P011','Phong IT','nv001','CN003');
INSERT INTO PhongBan  (maPhong, tenPhong, truongPhong,chiNhanh) VALUES ('P012','Phong Ke Toan','nv002','CN003');
INSERT INTO PhongBan  (maPhong, tenPhong, truongPhong,chiNhanh) VALUES ('P013','Phong Ke Hoach','nv003','CN003');
INSERT INTO PhongBan  (maPhong, tenPhong, truongPhong,chiNhanh) VALUES ('P014','Phong �oi Ngoai','nv004','CN003');
INSERT INTO PhongBan  (maPhong, tenPhong, truongPhong,chiNhanh) VALUES ('P015','Phong Nh�n Su','nv005','CN003');

INSERT INTO ChiNhanh  (maCN, tenCN, truongChiNhanh) VALUES ('CN001','TP HCM','nv006');
INSERT INTO ChiNhanh  (maCN, tenCN, truongChiNhanh) VALUES ('CN002','Ha Noi','nv007');
INSERT INTO ChiNhanh  (maCN, tenCN, truongChiNhanh) VALUES ('CN003','�a Nang','nv008');
INSERT INTO ChiNhanh  (maCN, tenCN, truongChiNhanh) VALUES ('CN004','Hai Phong','nv009');
INSERT INTO ChiNhanh  (maCN, tenCN, truongChiNhanh) VALUES ('CN005','Binh Phuoc','nv010');

INSERT INTO DuAn  (maDA, tenDA, phongChuTri, truongDuAn) VALUES ('DA001','Phan mem ho tro nguoi dung','P001','nv011');
INSERT INTO DuAn  (maDA, tenDA, phongChuTri, truongDuAn) VALUES ('DA002','Tang truong doanh thu nhieu chieu','P002','nv012');
INSERT INTO DuAn  (maDA, tenDA, phongChuTri, truongDuAn) VALUES ('DA003','Ke hoach tang truong dai hon','P003','nv013');
INSERT INTO DuAn  (maDA, tenDA, phongChuTri, truongDuAn) VALUES ('DA004','Thu hut von dau tu vo han','P004','nv014');
INSERT INTO DuAn  (maDA, tenDA, phongChuTri, truongDuAn) VALUES ('DA005','So do chuoi san pham','P005','nv015');

INSERT INTO PhanCong  (maNV, duAn) VALUES ('nv016','DA001');
INSERT INTO PhanCong  (maNV, duAn) VALUES ('nv017','DA002');
INSERT INTO PhanCong  (maNV, duAn) VALUES ('nv018','DA003');
INSERT INTO PhanCong  (maNV, duAn) VALUES ('nv019','DA004');
INSERT INTO PhanCong  (maNV, duAn) VALUES ('nv020','DA005');

INSERT INTO ChiTieu  (maChiTieu, tenChiTieu, duAn) VALUES ('CT001','Tien phi','DA001');
INSERT INTO ChiTieu  (maChiTieu, tenChiTieu, duAn) VALUES ('CT002','Tien phi','DA002');
INSERT INTO ChiTieu  (maChiTieu, tenChiTieu, duAn) VALUES ('CT003','Tien vat lieu','DA001');
INSERT INTO ChiTieu  (maChiTieu, tenChiTieu, duAn) VALUES ('CT004','Tien phi','DA003');
INSERT INTO ChiTieu  (maChiTieu, tenChiTieu, duAn) VALUES ('CT005','Tien phi','DA004');
INSERT INTO ChiTieu  (maChiTieu, tenChiTieu, duAn) VALUES ('CT006','Tien phi','DA005');
INSERT INTO ChiTieu  (maChiTieu, tenChiTieu, duAn) VALUES ('CT007','Tien thuoc vi lam deadline qua met','DA004');
INSERT INTO ChiTieu  (maChiTieu, tenChiTieu, duAn) VALUES ('CT008','Tien phi','DA004');
INSERT INTO ChiTieu  (maChiTieu, tenChiTieu, duAn) VALUES ('CT009','Tien di nhau','DA001');
INSERT INTO ChiTieu  (maChiTieu, tenChiTieu, duAn) VALUES ('CT010','Tien uong nuoc','DA004');


--Procedure tao User cho cac nhan vien trong bang NhanVien v?i password c?ng l� maNV
CREATE OR REPLACE PROCEDURE CREATE_USER 
AS
  CURSOR TBL_NV  IS SELECT maNV FROM NhanVien ;
BEGIN
  FOR ROW_NV in TBL_NV 
  LOOP 
  EXECUTE IMMEDIATE 'CREATE USER ' || ROW_NV.maNV || 'IDENTIFIED BY' || ROW_NV.maNV;
  EXECUTE IMMEDIATE 'GRANT CONNECT TO' || ROW_NV.maNV;
  END LOOP;
END;
EXECUTE CREATE_USER ;


--Tao role cho cac chuc vu va cac Procedure tu dong cap cac role cho cac nhanh vien phu hop
CREATE ROLE rGiamDoc ;--Role GiamDoc
CREATE ROLE rNhanVien ;--Role Nhan Vien
CREATE OR REPLACE PROCEDURE GrantRoleNhanVien 
AS
  CURSOR TBL_NhanVien  IS SELECT maNV FROM SYS.NhanVien ;
BEGIN
    FOR ROW_maNV IN TBL_NhanVien 
    LOOP
        EXECUTE IMMEDIATE 'GRANT rNhanVien  TO ' || ROW_maNV.maNV;
    END LOOP;
END;
EXECUTE GrantRoleNhanVien ;


CREATE ROLE rTruongPhong ;--Role Truong Phong
CREATE OR REPLACE PROCEDURE GrantRoleTruongPhong 
AS
  CURSOR TBL_TruongPhong  IS SELECT maNV FROM SYS.NhanVien  JOIN SYS.PhongBan  ON maNV = truongPhong;
BEGIN
    FOR ROW_maNV IN TBL_TruongPhong 
    LOOP
        EXECUTE IMMEDIATE 'GRANT rTruongPhong  TO ' || ROW_maNV.maNV;
    END LOOP;
END;
EXECUTE GrantRoleTruongPhong ;


CREATE ROLE rTruongDuAn ;--Role Truong Du An
CREATE OR REPLACE PROCEDURE GrantRoleTruongDuAn 
AS
  CURSOR TBL_TruongDuAn  IS SELECT maNV FROM SYS.NhanVien  JOIN SYS.DuAn  ON maNV = truongDA;
BEGIN
    FOR ROW_maNV IN TBL_TruongDuAn 
    LOOP
        EXECUTE IMMEDIATE 'GRANT rTruongDuAn  TO ' || ROW_maNV.maNV;
    END LOOP;
END;
EXECUTE GrantRoleTruongDuAn ;


CREATE ROLE rTruongChiNhanh ;--Role Truong Chi Nhanh
CREATE OR REPLACE PROCEDURE GrantRoleTruongChiNhanh 
AS
  CURSOR TBL_TruongChiNhanh  IS SELECT maNV FROM SYS.NhanVien  JOIN SYS.ChiNhanh  ON maNV = truongChiNhanh;
BEGIN
    FOR ROW_maNV IN TBL_TruongChiNhanh 
    LOOP
        EXECUTE IMMEDIATE 'GRANT rTruongChiNhanh  TO ' || ROW_maNV.maNV;
    END LOOP;
END;
EXECUTE GrantRoleTruongChiNhanh ;