-- Procedure ma hoa luong moi khi them nhan vien vao bang NhanVien
CREATE OR REPLACE PROCEDURE Them_NhanVien (maNV IN VARCHAR2,hoTen IN VARCHAR2,diaChi IN VARCHAR2,dienThoai IN VARCHAR2,email IN VARCHAR2,maPhong IN VARCHAR2,chiNhanh IN VARCHAR2,luong IN VARCHAR2) 
AS 
BEGIN
 DECLARE
    I_luong     VARCHAR(2000) := luong;
    I_luong_raw     RAW(2000);
    I_key_len      NUMBER := 128/8;
    I_key      RAW(2000);
    I_mod   PLS_INTEGER := dbms_crypto.ENCRYPT_AES128
                      + dbms_crypto.CHAIN_CBC + dbms_crypto.PAD_PKCS5;
  BEGIN
    dbms_output.PUT_LINE ('Original :' || I_luong);
    
    I_key := dbms_crypto.RANDOMBYTES (I_key_len);
    
    I_luong_raw := dbms_crypto.ENCRYPT (
                                          src => UTL_I18N.STRING_TO_RAW (I_luong,'AL32UTF8'),
                                          typ => I_mod,
                                          key => I_key
                                          );
  INSERT INTO SYS.NHANVIEN VALUES(I_key,maNV, hoTen, diaChi, dienThoai, email, maPhong, chiNhanh, I_luong_raw);
  END;
END;

--Procedure giai ma thong tin luong cua moi nhan vien
CREATE OR REPLACE PROCEDURE XemLuong_NhanVien
AS
  user VARCHAR2(100);
  CURSOR TBL_NV  IS SELECT maNV FROM SYS.NhanVien ;
  I_luong VARCHAR2(2000);
  I_decrypted_raw     RAW(2000); 
  I_mod   PLS_INTEGER := dbms_crypto.ENCRYPT_AES256
                        + dbms_crypto.CHAIN_CBC + dbms_crypto.PAD_PKCS5;                                                     
BEGIN
  user:= SYS_CONTEXT('userenv','SESSION_USER');
  
  FOR ROW_NV in TBL_NV
  LOOP  
   IF(  ROW_NV.maNV = user )THEN
  
    I_decrypted_raw := dbms_crypto.DECRYPT (
                                        src => SYS.NhanVien.luong,
                                        typ =>  I_mod,
                                        key => SYS.NhanVien.key);                                   
    I_luong := UTL_I18N.RAW_TO_CHAR (I_decrypted_raw, 'AL32UTF8');
    
    dbms_output.PUT_LINE('luong:' || I_luong);
   END IF;
  END LOOP;
END;
--Cap procedure cho cac role
GRANT EXECUTE ON XemLuong_NhanVien TO rNhanVien, rTruongPhong, rTruongChiNhanh, rGiamDoc, rTruongDuAn;