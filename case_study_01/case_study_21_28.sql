-- 21. Tạo khung nhìn có tên là V_NHANVIEN để lấy được thông tin của tất cả
-- các nhân viên có địa chỉ là “Hải Châu” và đã từng lập hợp đồng cho 1
-- hoặc nhiều Khách hàng bất kỳ với ngày lập hợp đồng là “12/12/2019”
CREATE VIEW v_nhan_vien
AS 
SELECT nv.id_nhan_vien, ten_nhan_vien, dia_chi
FROM nhan_vien nv
JOIN hop_dong hd ON hd.id_nhan_vien = nv.id_nhan_vien
WHERE dia_chi = 'Hải Châu'
AND hd.ngay_lam_hop_dong = 12/12/2019;
 
DROP VIEW v_nhan_vien;

-- 22. Thông qua khung nhìn V_NHANVIEN thực hiện cập nhật địa chỉ thành
-- “Liên Chiểu” đối với tất cả các Nhân viên được nhìn thấy bởi khung nhìn
-- này.
UPDATE v_nhan_vien
SET dia_chi = 'Liên Chiểu';

SET SQL_SAFE_UPDATES = 0;

-- 23. Tạo Store procedure Sp_1 Dùng để xóa thông tin của một Khách hàng
-- nào đó với Id Khách hàng được truyền vào như là 1 tham số của Sp_1





