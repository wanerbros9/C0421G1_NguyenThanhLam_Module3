-- 2. Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là
-- một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
USE furama_resort;

SELECT * FROM nhan_vien
WHERE ten_nhan_vien LIKE 'h%' 
OR ten_nhan_vien LIKE 't%'
OR ten_nhan_vien LIKE 'k%'
AND ten_nhan_vien <= 15;

-- 3. Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và
-- có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

SELECT * FROM khach_hang
WHERE (year(curdate())-year(ngay_sinh)) >= 18 AND (year(curdate())-year(ngay_sinh)) <= 50
AND (dia_chi = 'Đà Nẵng' OR dia_chi = 'Quảng Trị');

-- 4. Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu
-- lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của
-- khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là
-- “Diamond”.

SELECT ten_loai_khach, ho_ten, COUNT(khach_hang.id_khach_hang) FROM loai_khach
INNER JOIN khach_hang ON loai_khach.id_loai_khach = khach_hang.id_loai_khach
INNER JOIN hop_dong ON hop_dong.id_khach_hang = khach_hang.id_khach_hang
WHERE khach_hang.id_loai_khach = 1
GROUP BY khach_hang.id_khach_hang
ORDER BY COUNT(khach_hang.id_khach_hang) ASC;

-- 5. Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong,
-- TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien (Với
-- TongTien được tính theo công thức như sau: ChiPhiThue +
-- SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem) cho tất cả
-- các Khách hàng đã từng đặt phỏng. (Những Khách hàng nào chưa từng
-- đặt phòng cũng phải hiển thị ra).

SELECT kh.id_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.id_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, 
SUM(dv.chi_phi_thue+(hdct.so_luong*dvdk.gia)) AS 'tong_cong'
FROM khach_hang kh
LEFT JOIN hop_dong hd ON hd.id_khach_hang = kh.id_khach_hang
LEFT JOIN loai_khach lk ON lk.id_loai_khach = kh.id_loai_khach
LEFT JOIN dich_vu dv ON dv.id_dich_vu = hd.id_dich_vu
LEFT JOIN hop_dong_chi_tiet hdct ON hdct.id_hop_dong = hd.id_hop_dong
LEFT JOIN dich_vu_di_kem dvdk ON dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
GROUP BY kh.id_khach_hang
ORDER BY tong_cong;

-- 6. Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue,
-- TenLoaiDichVu của tất cả các loại Dịch vụ chưa từng được Khách hàng
-- thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).
SELECT kh.ho_ten,dv.id_dich_vu,dv.ten_dich_vu,dv.dien_tich,dv.chi_phi_thue,ldv.ten_loai_dich_vu,hd.ngay_lam_hop_dong
FROM dich_vu dv
LEFT JOIN hop_dong hd ON dv.id_dich_vu = hd.id_dich_vu
LEFT JOIN khach_hang kh ON kh.id_khach_hang = hd.id_khach_hang
LEFT JOIN loai_dich_vu ldv ON dv.id_loai_dich_vu = ldv.id_loai_dich_vu
WHERE hd.ngay_lam_hop_dong NOT IN 
(SELECT ngay_lam_hop_dong
FROM hop_dong
WHERE (year(hd.ngay_lam_hop_dong) = '2019' and month(hd.ngay_lam_hop_dong) IN (1,2,3))
);

-- 7. Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue,
-- TenLoaiDichVu của tất cả các loại dịch vụ đã từng được Khách hàng đặt phòng 
-- trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019.
SELECT kh.ho_ten,dv.id_dich_vu,dv.ten_dich_vu,dv.dien_tich,dv.so_nguoi_toi_da,dv.chi_phi_thue,ldv.ten_loai_dich_vu,hd.ngay_lam_hop_dong
FROM dich_vu dv
LEFT JOIN hop_dong hd ON dv.id_dich_vu = hd.id_dich_vu
LEFT JOIN loai_dich_vu ldv ON dv.id_loai_dich_vu = ldv.id_loai_dich_vu
LEFT JOIN khach_hang kh ON kh.id_khach_hang = hd.id_khach_hang
WHERE hd.ngay_lam_hop_dong NOT IN (
SELECT ngay_lam_hop_dong
FROM hop_dong
WHERE year(ngay_lam_hop_dong) = '2019'
) AND hd.ngay_lam_hop_dong IN (
SELECT ngay_lam_hop_dong
FROM hop_dong
WHERE year(ngay_lam_hop_dong) = '2018'
);

-- 8. Hiển thị thông tin HoTenKhachHang có trong hệ thống,
-- với yêu cầu HoThenKhachHang không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
SELECT ho_ten
FROM khach_hang
GROUP BY ho_ten;

SELECT DISTINCT ho_ten
FROM khach_hang;

SELECT ho_ten
FROM khach_hang
UNION
SELECT ho_ten
FROM khach_hang;

-- 9. Thực hiện thống kê doanh thu theo tháng, 
-- nghĩa là tương ứng với mỗi tháng trong năm 2019 
-- thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.


