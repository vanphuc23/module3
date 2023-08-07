create database if not exists CaseStudy;
use CaseStudy;

create table if not exists vi_tri(
ma_vi_tri int auto_increment primary key not null,
ten_vi_tri varchar(50) not null unique
);

create table if not exists trinh_do(
ma_trinh_do int auto_increment primary key not null,
ten_trinh_do varchar(45) not null unique 
);

create table if not exists bo_phan(
ma_bo_phan int auto_increment primary key not null,
ten_bo_phan varchar(45) not null unique
);

create table if not exists nhan_vien(
ma_nhan_vien int auto_increment primary key not null,
ho_ten varchar(45) not null,
ngay_sinh date not null,
so_cmnd varchar(45) not null unique,
luong double not null,
so_dien_thoai varchar(45) not null unique,
email varchar(45) unique,
dia_chi varchar(45),
ma_vi_tri int not null,
ma_trinh_do int not null,
ma_bo_phan int not null,
foreign key(ma_vi_tri) references vi_tri(ma_vi_tri),
foreign key(ma_trinh_do) references trinh_do(ma_trinh_do),
foreign key(ma_bo_phan) references bo_phan(ma_bo_phan)
);

create table if not exists loai_khach(
ma_loai_khach int auto_increment primary key not null,
ten_loai_khach varchar(45) not null
);

create table if not exists khach_hang(
ma_khach_hang int auto_increment primary key not null,
ma_loai_khach int not null,
ho_ten varchar(45) not null,
ngay_sinh date not null,
gioi_tinh bit not null,
so_cmnd varchar(45) not null unique,
so_dien_thoai varchar(45) not null unique,
email varchar(45) unique,
dia_chi varchar(45),
foreign key(ma_loai_khach) references loai_khach(ma_loai_khach)
);

create table if not exists kieu_thue(
ma_kieu_thue int primary key auto_increment not null,
ten_kieu_thue varchar(45) not null unique
);

create table if not exists loai_dich_vu(
ma_loai_dich_vu int primary key auto_increment not null,
ten_loai_dich_vu varchar(45) not null unique
);

create table if not exists dich_vu(
ma_dich_vu int primary key auto_increment not null,
ten_dich_vu varchar(45) not null,
dien_tich varchar(45) not null,
chi_phi_thue double not null,
so_nguoi_toi_da int not null,
ma_kieu_thue int not null,
ma_loai_dich_vu int not null,
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi varchar(45),
so_tang int,
foreign key(ma_kieu_thue) references kieu_thue(ma_kieu_thue),
foreign key(ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu)
);


create table if not exists hop_dong(
ma_hop_dong int primary key auto_increment not null,
ngay_lam_hop_dong datetime not null,
ngay_ket_thuc datetime not null,
tien_dat_coc double not null,
ma_nhan_vien int not null,
ma_khach_hang int not null,
ma_dich_vu int not null,
foreign key(ma_nhan_vien) references nhan_vien(ma_nhan_vien),
foreign key(ma_khach_hang) references khach_hang(ma_khach_hang),
foreign key(ma_dich_vu) references dich_vu(ma_dich_vu)
);

create table if not exists dich_vu_di_kem(
ma_dich_vu_di_kem int auto_increment primary key not null,
ten_dich_vu_di_kem varchar(45) not null unique,
gia double not null,
don_vi varchar(45) not null,
trang_thai varchar(45) not null
);

create table if not exists hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int primary key auto_increment not null,
ma_hop_dong int not null,
ma_dich_vu_di_kem int not null,
so_luong int not null,
foreign key(ma_hop_dong) references hop_dong(ma_hop_dong),
foreign key(ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_dich_kem)
);

INSERT INTO vi_tri (ten_vi_tri)
VALUE('Quản Lý'),
	 ('Nhân Viên');
     
INSERT INTO trinh_do (ten_trinh_do)
VALUE('Trung Cấp'),
     ('Cao Đẳng'),
     ('Đại Học'),
     ('Sau Đại Học');
     
INSERT INTO bo_phan (ten_bo_phan)
VALUE('Sale-Marketing'),
	 ('Hành chính'),
     ('Phục vụ'),
     ('Quản lý');

INSERT INTO nhan_vien(ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan)
VALUE('Nguyễn Văn An', '1970-11-07',	'456231786', 10000000, '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng',	1, 3, 1),
     ('Lê Văn Bình', '1997-04-09', '654231234', 7000000, '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', 1, 2, 2),
     ('Hồ Thị Yến', '1995-12-12', '999231723', 14000000, '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', 1, 3, 2),
     ('Võ Công Toản', '1980-04-04', '123231365', 17000000, '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', 1, 4, 4),
     ('Nguyễn Bỉnh Phát', '1999-12-09', '454363232', 6000000, '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', 2, 1, 1),
     ('Khúc Nguyễn An Nghi', '2000-11-08', '964542311', 7000000, '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', 2, 2, 3),
     ('Nguyễn Hữu Hà', '1993-01-01', '534323231', 8000000, '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', 2, 3, 2),
     ('Nguyễn Hà Đông', '1989-09-03', '234414123', 9000000, '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', 2, 4, 4),
     ('Tòng Hoang', '1982-09-03', '256781231', 6000000, '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', 2, 4, 4),
     ('Nguyễn Công Đạo', '1994-01-08', '755434343', 8000000, '0988767111', 'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đồng Nai', 2, 3, 2);
 
INSERT INTO loai_khach (ten_loai_khach)
VALUE('Diamond'),
     ('Platinium'),
     ('Gold'),
     ('Silver'),
     ('Member');
     
INSERT INTO khach_hang
VALUE(1, 5, 'Nguyễn Thị Hào', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng'),
     (2, 3, 'Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị'),
     (3, 1, 'Trương Đình Nghệ', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh'),
     (4, 1, 'Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng'),
     (5, 4, 'Hoàng Trần Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com', '224 Lý Thái Tổ, Gia Lai'),
     (6, 4, 'Tôn Nữ Mộc Châu', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng'),
     (7, 1, 'Nguyễn Mỹ Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 Lê Lợi, Hồ Chí Minh'),
     (8, 3, 'Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguyễn Văn Linh, Kon Tum'),
     (9, 1, 'Trần Đại Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhhai99@gmail.com', '24 Lý Thường Kiệt, Quảng Ngãi'),
     (10, 2, 'Nguyễn Tâm Đắc', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng');
     
INSERT INTO kieu_thue (ten_kieu_thue)
VALUE('year'),
     ('month'),
     ('day'),
     ('hour');
     
INSERT INTO loai_dich_vu (ma_loai_dich_vu, ten_loai_dich_vu)
VALUE(1, 'Villa'),
     (2, 'House'),
     (3, 'Room');
    
INSERT INTO dich_vu
VALUE(1, 'Villa Beach Front', 25000, 10000000, 10, 3, 1, 'vip', 'Có hồ bơi', 500, 4),
     (2, 'House Princess 01', 14000, 5000000, 7, 2, 2, 'vip', 'Có thêm bếp nướng', null, 3),
     (3, 'Room Twin 01', 5000, 1000000, 2, 4, 3, 'normal', 'Có tivi', null, null),
     (4, 'Villa No Beach Front', 22000, 9000000, 8, 3, 1, 'normal', 'Có hồ bơi', 300, 3),
     (5, 'House Princess 02', 10000, 4000000, 5, 3, 2, 'normal', 'Có thêm bếp nướng', null, 2),
     (6, 'Room Twin 02', 3000, 900000, 2, 4, 3, 'normal', 'Có tivi', null, null);

INSERT INTO dich_vu_di_kem
VALUE(1, 'Karaoke', 10000, 'giờ', 'tiện nghi, hiện tại'),
     (2, 'Thuê xe máy', 10000, 'chiếc', 'hỏng 1 xe'),
     (3, 'Thuê xe đạp', 20000, 'chiếc', 'tốt'),
     (4, 'Buffet buổi sáng', 15000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
     (5, 'Buffet buổi trưa', 90000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
     (6, 'Buffet buổi tối', 16000, 'suất', 'đầy đủ đồ ăn, tráng miệng');
     
INSERT INTO hop_dong
VALUE(1, '2020-12-08', '2020-12-08', 0, 3, 1, 3),
     (2, '2020-07-14', '2020-07-21', 200000, 7, 3, 1),
     (3, '2021-03-15', '2021-03-17', 50000, 3, 4, 2),
     (4, '2021-01-14', '2021-01-18', 100000, 7, 5, 5),
     (5, '2021-07-14', '2021-07-15', 0, 7, 2, 6),
     (6, '2021-06-01', '2021-06-03', 0, 7, 7, 6),
     (7, '2021-09-02', '2021-09-05', 100000, 7, 4, 4),
     (8, '2021-06-17', '2021-06-18', 150000, 3, 4, 1),
     (9, '2020-11-19', '2020-11-19', 0, 3, 4, 3),
     (10, '2021-04-12', '2021-04-14', 0, 10, 3, 5),
     (11, '2021-04-25', '2021-04-25', 0, 2, 2, 1),
     (12, '2021-05-25', '2021-05-27', 0, 7, 10, 1);
     
INSERT INTO hop_dong_chi_tiet
VALUE(1,  2, 4, 5),
     (2, 2, 5, 8),
     (3, 2, 6, 15),
     (4, 3, 1, 1),
     (5, 3, 2, 11),
     (6, 1, 3, 1),
     (7, 1, 2, 2),
     (8, 12, 2, 2);

-- 2.Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select * from nhan_vien
where (substring_index(ho_ten,' ',-1) like 'H%' or 
substring_index(ho_ten,' ',-1) like 'T%' or
substring_index(ho_ten,' ',-1) like 'K%') and
char_length(substring_index(ho_ten,' ',-1)) <= 15 ;
 
-- 3.Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from khach_hang 
where timestampdiff(year,ngay_sinh,curdate()) between 18 and 50 
and substring_index(dia_chi,', ',-1) like 'Đà Nẵng' or substring_index(dia_chi,', ',-1) like 'Quảng Trị';

-- 4.Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select kh.ma_khach_hang, kh.ho_ten, count(*) as so_lan_dat_phong
from hop_dong hd
join khach_hang kh on hd.ma_khach_hang= kh.ma_khach_hang
where kh.ma_loai_khach = 1
group by kh.ho_ten
order by so_lan_dat_phong asc;

-- 5.Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, 
ifnull(dv.chi_phi_thue + sum(hdct.so_luong * dvdk.gia),0) as tong_tien from
loai_khach lk left join khach_hang kh on kh.ma_loai_khach=lk.ma_loai_khach
left join hop_dong hd on hd.ma_khach_hang=kh.ma_khach_hang
left join dich_vu dv on dv.ma_dich_vu=hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong=hd.ma_hop_dong
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
group by kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc;

-- 6.Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu
-- của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).	
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu 
from loai_dich_vu ldv join dich_vu dv on dv.ma_loai_dich_vu=ldv.ma_loai_dich_vu
where not exists( select hd.ngay_lam_hop_dong from hop_dong hd
where hd.ma_dich_vu=dv.ma_dich_vu and
year(hd.ngay_lam_hop_dong) = 2021 and
quarter(hd.ngay_lam_hop_dong) = 1)
group by dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu;

-- 7.Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from loai_dich_vu ldv join dich_vu dv on dv.ma_loai_dich_vu=ldv.ma_loai_dich_vu
join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where dv.ma_dich_vu not in(
select dv.ma_dich_vu from dich_vu dv
join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where year(hd.ngay_lam_hop_dong) = 2021) 
and dv.ma_dich_vu in(
select dv.ma_dich_vu from dich_vu dv
join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where year(hd.ngay_lam_hop_dong) = 2020)
group by dv.ma_dich_vu;

-- 8.Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
-- Cách 1:
select distinct ho_ten from khach_hang;
-- Cách 2:
select ho_ten from khach_hang
group by ho_ten;

-- 9.Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(ngay_lam_hop_dong) as 'Tháng', count(month(ngay_lam_hop_dong)) as 'Số lượng khách hàng'
from hop_dong where year(ngay_lam_hop_dong)=2021
group by month(ngay_lam_hop_dong);

-- 10.Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở hop_dong_chi_tiet).
select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, sum(hdct.so_luong) as 'Số lượng dịch vụ đi kèm'
from hop_dong hd 
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
group by hd.ma_hop_dong;

-- 11.Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có
-- ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem 
from dich_vu_di_kem dvdk 
join hop_dong_chi_tiet hdct
on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong hd
on hd.ma_hop_dong = hdct.ma_hop_dong
join khach_hang kh
on kh.ma_khach_hang = hd.ma_khach_hang
join loai_khach lk
on lk.ma_loai_khach = kh.ma_loai_khach
where lk.ten_loai_khach like 'Diamond' and
(substring_index(kh.dia_chi,', ',-1) like 'Vinh'
or substring_index(kh.dia_chi,', ',-1) like 'Quảng Ngãi')
group by dvdk.ma_dich_vu_di_kem;

-- 12.Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), 
-- ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc 
-- của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select hd.ma_hop_dong, nv.ho_ten, kh.ho_ten, kh.so_dien_thoai, dv.ten_dich_vu, sum(hdct.so_luong) as 'so_luong_dich_vu_di_kem', sum(hd.tien_dat_coc) as tien_dat_coc
from hop_dong hd join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
where dv.ma_dich_vu not in (
select dv.ma_dich_vu from dich_vu dv
join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where year(hd.ngay_lam_hop_dong) = 2021 and (quarter(hd.ngay_lam_hop_dong) =1 or quarter(hd.ngay_lam_hop_dong) = 2)) and
dv.ma_dich_vu in (
select dv.ma_dich_vu from dich_vu dv
join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where year(hd.ngay_lam_hop_dong) = 2020 and quarter(hd.ngay_lam_hop_dong) =4)
group by hd.ma_hop_dong;

-- 13.Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from dich_vu_di_kem dvdk join hop_dong_chi_tiet hdct
on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having so_luong_dich_vu_di_kem  
order by so_luong_dich_vu_di_kem desc;


select sum(hdct.so_luong) as so_luong_dich_vu_di_kem from hop_dong_chi_tiet hdct
group by ma_dich_vu_di_kem;



-- 14.Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
select hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(*) as so_lan_su_dung
from loai_dich_vu ldv join dich_vu dv
on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong hd 
on hd.ma_dich_vu = dv.ma_dich_vu
join hop_dong_chi_tiet hdct
on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk
on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having count(hdct.ma_dich_vu_di_kem) = 1;

-- 15.Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi 
-- mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi
from trinh_do td join nhan_vien nv
on nv.ma_trinh_do = td.ma_trinh_do
join bo_phan bp 
on bp.ma_bo_phan = nv.ma_bo_phan
join hop_dong hd
on hd.ma_nhan_vien = nv.ma_nhan_vien
group by nv.ma_nhan_vien
having count(hd.ma_nhan_vien) <= 3;

-- 16.Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
select nv.ma_nhan_vien, nv.ho_ten
from nhan_vien nv left join hop_dong hd
on hd.ma_nhan_vien = nv.ma_nhan_vien
where not exists(select ma_nhan_vien from nhan_vien where
 year(hd.ngay_lam_hop_dong) between 2019 and 2021)
group by nv.ma_nhan_vien;

-- 17.Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
select kh.ma_khach_hang, kh.ho_ten, kh.ma_loai_khach
from khach_hang kh join hop_dong hd
on hd.ma_khach_hang = kh.ma_khach_hang
join dich_vu dv 
on dv.ma_dich_vu = hd.ma_dich_vu
join hop_dong_chi_tiet hdct
on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk
on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
where kh.ma_loai_khach != 1
group by kh.ma_khach_hang
having sum(dv.chi_phi_thue + (hdct.so_luong + dvdk.gia)) >= 10000000;

-- 18.Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
select kh.ma_khach_hang, kh.ho_ten
from khach_hang kh join hop_dong hd
on hd.ma_khach_hang = kh.ma_khach_hang
where year(hd.ngay_lam_hop_dong) < 2021
group by kh.ma_khach_hang;

-- 19.Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
from hop_dong hd join hop_dong_chi_tiet hdct
on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk
on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
where year(hd.ngay_lam_hop_dong) = 2020
group by dvdk.ma_dich_vu_di_kem
having sum(hdct.so_luong) >= 10;

-- 20.Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select nv.ma_nhan_vien as id, nv.ho_ten, nv.email, nv.so_dien_thoai, nv.ngay_sinh, nv.dia_chi
from nhan_vien nv
union all
select kh.ma_khach_hang as id, kh.ho_ten, kh.email, kh.so_dien_thoai, kh.ngay_sinh, kh.dia_chi
from khach_hang kh;