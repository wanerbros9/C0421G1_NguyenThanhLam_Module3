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


