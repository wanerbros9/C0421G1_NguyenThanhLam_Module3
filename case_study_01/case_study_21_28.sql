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
delimiter //
CREATE PROCEDURE sp_1 (
id_delete INT
)
BEGIN
DELETE 
FROM khach_hang kh
WHERE id_khach_hang = id_delete;
END;
// delimiter ;

CALL sp_1(1);

-- 24. Tạo Store procedure Sp_2 Dùng để thêm mới vào bảng HopDong với yêu
-- cầu Sp_2 phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với
-- nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham
-- chiếu đến các bảng liên quan.
DELIMITER //
CREATE PROCEDURE sp_2(
id_nhan_vien_a INT,
id_khach_hang_a INT,
id_dich_vu_a INT,
ngay_lam_hop_dong_a DATE,
ngay_ket_thuc_a DATE,
tien_dat_coc_a INT 
)
begin
if (id_nhan_vien_a in (select id_nhan_vien from nhan_vien) AND 
	id_khach_hang_a in (SELECT id_khach_hang FROM khach_hang)AND 
    id_dich_vu_a IN (SELECT id_dich_vu FROM dich_vu)) THEN 
    INSERT INTO hop_dong(id_nhan_vien, id_khach_hang, id_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc)
    VALUES (id_nhan_vien_a, id_khach_hang_a, id_dich_vu_a, ngay_lam_hop_dong_a, ngay_ket_thuc_a, tien_dat_coc_a);
    else 
    select 'sai r';
    end if;
end;
// DELIMITER ;

CALL sp_2(1, 1, 1, '2021-07-14', '2021-08-11', 50000);











