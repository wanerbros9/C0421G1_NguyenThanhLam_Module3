-- 11. Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách
-- hàng có TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh”
-- hoặc “Quảng Ngãi”.
SELECT kh.ho_ten,lk.ten_loai_khach,kh.dia_chi, dvdk.ten_dich_vu_di_kem
FROM dich_vu_di_kem dvdk
JOIN hop_dong_chi_tiet hdct ON dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
JOIN hop_dong hd ON hd.id_hop_dong = hdct.id_hop_dong
JOIN khach_hang kh ON kh.id_khach_hang = hd.id_khach_hang
JOIN loai_khach lk ON lk.id_loai_khach = kh.id_loai_khach
WHERE lk.ten_loai_khach = 'Diamond' AND dia_chi IN('Vinh','Quảng Ngãi');

-- 12. Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang,
-- SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem (được
-- tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các dịch vụ
-- đã từng được khách hàng đặt vào 3 tháng cuối năm 2019 nhưng chưa
-- từng được khách hàng đặt vào 6 tháng đầu năm 2019.
SELECT hd.id_hop_dong, nv.ten_nhan_vien, kh.ho_ten, kh.sdt, dv.ten_dich_vu, hdct.so_luong, hd.tien_dat_coc
FROM hop_dong hd
JOIN khach_hang kh ON hd.id_khach_hang = kh.id_khach_hang
JOIN dich_vu dv ON dv.id_dich_vu = hd.id_dich_vu
JOIN hop_dong_chi_tiet hdct ON hdct.id_hop_dong = hd.id_hop_dong
JOIN nhan_vien nv ON nv.id_nhan_vien = hd.id_nhan_vien
WHERE (year(hd.ngay_lam_hop_dong) = 2019 
AND month(hd.ngay_lam_hop_dong) IN (10,11,12))
AND (year(hd.ngay_lam_hop_dong) = 2019
AND month(hd.ngay_lam_hop_dong) IN (1,2,3,4,5,6,7,8,9)
);

-- 13. Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các
-- Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử
-- dụng nhiều như nhau).
SELECT dvdk.id_dich_vu_di_kem, gia, don_vi, id_hop_dong_chi_tiet, SUM(so_luong) AS 'so_lan_su_dung'
FROM dich_vu_di_kem dvdk
JOIN hop_dong_chi_tiet hdct ON hdct.id_dich_vu_di_kem = dvdk.id_dich_vu_di_kem
GROUP BY dvdk.id_dich_vu_di_kem
ORDER BY so_lan_su_dung DESC;

-- 14. Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một
-- lần duy nhất. Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu,
-- TenDichVuDiKem, SoLanSuDung.
SELECT dvdk.id_dich_vu_di_kem,ten_dich_vu_di_kem,dvdk.gia,don_vi, sum(so_luong) AS 'so_lan_su_dung'
FROM dich_vu_di_kem dvdk
JOIN hop_dong_chi_tiet hdct ON hdct.id_dich_vu_di_kem = dvdk.id_dich_vu_di_kem
GROUP BY dvdk.id_dich_vu_di_kem
HAVING sum(so_luong) = 1;

-- 15. Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen,
-- TrinhDo, TenBoPhan, SoDienThoai, DiaChi mới chỉ lập được tối đa 3
-- hợp đồng từ năm 2018 đến 2019.
SELECT nv.id_nhan_vien, nv.ten_nhan_vien, td.trinh_do, bp.ten_bo_phan, sdt, dia_chi, COUNT(hd.id_hop_dong) AS 'dem'
FROM nhan_vien nv
JOIN trinh_do td ON nv.id_trinh_do = td.id_trinh_do
JOIN bo_phan bp ON bp.id_bo_phan = nv.id_bo_phan
JOIN hop_dong hd ON hd.id_nhan_vien = nv.id_nhan_vien
WHERE year(hd.ngay_lam_hop_dong) IN (2018,2019)
GROUP BY id_nhan_vien
HAVING dem <=3;

-- 16. Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017
-- đến năm 2019.
CREATE TEMPORARY TABLE temp (
SELECT nv.id_nhan_vien
FROM nhan_vien nv
JOIN hop_dong hd ON hd.id_nhan_vien = nv.id_nhan_vien
WHERE year(hd.ngay_lam_hop_dong) IN (2017,2018,2019)
);

SET SQL_SAFE_UPDATES = 0;

DELETE FROM nhan_vien nv
WHERE nv.id_nhan_vien 
IN (select * from temp);
DROP TEMPORARY TABLE temp;

-- 17. Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ
-- Platinium lên Diamond, chỉ cập nhật những khách hàng đã từng đặt
-- phòng với tổng Tiền thanh toán trong năm 2019 là lớn hơn
-- 10.000.000 VNĐ.
CREATE TEMPORARY TABLE temp (
SELECT id_khach_hang
FROM khach_hang kh
JOIN loai_khach lk ON kh.id_loai_khach = lk.id_loai_khach
WHERE lk.id_loai_khach = 2
);

UPDATE khach_hang kh
SET kh.id_loai_khach = 1
WHERE lk.id_loai_khach
IN (SELECT * FROM temp);
DROP TEMPORARY TABLE temp;

-- 18. Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràngbuộc
-- giữa các bảng).
CREATE TEMPORARY TABLE temp (
SELECT nv.id_nhan_vien
FROM nhan_vien nv
JOIN hop_dong hd ON hd.id_nhan_vien = nv.id_nhan_vien
WHERE (year(hd.ngay_lam_hop_dong) <= 2016)
);

DELETE FROM nhan_vien nv
WHERE nv.id_nhan_vien 
IN (select * from temp);
DROP TEMPORARY TABLE temp;

-- 19. Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong
-- năm 2019 lên gấp đôi.
CREATE TEMPORARY TABLE temp(
SELECT dvdk.id_dich_vu_di_kem, COUNT(hdct.so_luong) AS 'dem'
FROM dich_vu_di_kem dvdk
JOIN hop_dong_chi_tiet hdct ON dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
JOIN hop_dong hd ON hd.id_hop_dong = hdct.id_hop_dong
WHERE (year(ngay_lam_hop_dong) = 2019)
GROUP BY id_dich_vu_di_kem
HAVING dem > 10
);

UPDATE dich_vu_di_kem
SET gia = gia*2
WHERE id_dich_vu_di_kem
IN (SELECT id_dich_vu_di_kem FROM temp);
DROP TEMPORARY TABLE temp;

-- 20. Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ
-- thống, thông tin hiển thị bao gồm ID (IDNhanVien, IDKhachHang),
-- HoTen, Email, SoDienThoai, NgaySinh, DiaChi.
SELECT nv.id_nhan_vien, nv.ten_nhan_vien, nv.email, nv.sdt, nv.ngay_sinh, nv.dia_chi
FROM nhan_vien nv
UNION ALL
SELECT kh.id_khach_hang, kh.ho_ten, kh.email, kh.sdt, kh.ngay_sinh, kh.dia_chi
FROM khach_hang kh;






