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
ma_dich_vu_dich_kem int auto_increment primary key not null,
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

insert into vi_tri(ten_vi_tri)
values ('Lễ tân'), ('Phục vụ'), ('Chuyên viên'), ('Giám sát'), ('Quản lý'), ('Giám đốc');

insert into trinh_do(ten_trinh_do)
values ('Trung cấp'), ('Cao đẳng'), ('Đại học'), ('Sau đại học');

insert into bo_phan(ten_bo_phan)
values ('Sale – Marketing'), ('Hành Chính'), ('Phục vụ'), ('Quản lý');

insert into nhan_vien(ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan)
values ('Nguyễn Văn Hưng', '2000-4-5', '123456789', 5000000, '0912345678', 'hung@gmail.com', 'Đà Nẵng', 1 , 2, 3), ('Đỗ Thị Hân', '1998-12-5', '123456799', 10000000, '0912342678', 'han@gmail.com', 'Quảng Trị', 5, 4, 4),
('Ngô Văn Thành', '1995-4-1', '133456789', 20000000, '0902345678', 'thanh@gmail.com', 'Quảng Trị', 3, 4, 1), ('Mai Thị Khang', '2001-2-27', '033456789', 7000000, '0992345678', 'khang@gmail.com', 'Quảng Trị', 4, 3, 2),
('Huỳnh Văn Tiền', '1995-8-1', '133456389', 15000000, '0982345678', 'tien@gmail.com', 'Đà Nẵng', 4, 4, 2), ('Trần Thành Kha', '2002-10-1', '133457789', 8000000, '0972345678', 'kha@gmail.com', 'Quảng Nam', 4, 3, 2),
('Nguyễn Anh Kiệt', '2000-9-2', '133451789', 10000000, '0952345678', 'kiet@gmail.com', 'Quảng Trị', 3, 3, 1), ('Ngô Thị Quỳnh', '1995-4-1', '233456789', 13000000, '0942345678', 'quynh@gmail.com', 'Quảng Trị', 3, 4, 1);

insert into loai_khach(ten_loai_khach)
values ('Diamond'), ('Platinium'), ('Gold'), ('Silver'), ('Member');

insert into khach_hang(ma_loai_khach, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi)
values (4, 'Nguyễn Văn A', '2000-2-2', 1, '123456780', '0901236467', 'a@gmail.com', 'Vinh'), (1, 'Nguyễn Văn B', '2000-2-2', 0, '123456781', '0911236467', 'b@gmail.com', 'Quảng Ngãi'),
(2, 'Nguyễn Văn A', '2000-2-2', 1, '123456780', '0901226467', 'ab@gmail.com', 'Vinh'), (1, 'Nguyễn Văn D', '2000-2-6', 1, '113456780', '0901536467', 'd@gmail.com', 'Vinh');

insert into kieu_thue(ten_kieu_thue)
values ('Theo giờ'), ('Theo ngày'), ('Theo tháng'), ('Theo năm');

insert into loai_dich_vu(ten_loai_dich_vu)
values ('Villa'), ('House'), ('Room');

insert into dich_vu(ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, ma_kieu_thue, ma_loai_dich_vu, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang)
values ('Villa1', '135m^2', 5000000, 20, 2, 1, 'Normal', 'Bàn bi-a', '4,5m x 15m x 1,6m', 7), ('Villa2', '145m^2', 7000000, 25, 1, 1, 'VIP', 'Phòng game', '5m x 18m x 1,7m', 6);

insert into dich_vu(ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, ma_kieu_thue, ma_loai_dich_vu, tieu_chuan_phong, mo_ta_tien_nghi_khac, so_tang)
values ('House1', '88m^2', 3000000, 12, 3, 2, 'Normal', 'Phòng kara', 4), ('House2', '95m^2', 3500000, 14, 3, 2, 'VIP', 'Phòng kara', 4);

insert into dich_vu(ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, ma_kieu_thue, ma_loai_dich_vu, mo_ta_tien_nghi_khac)
values ('Room1', '75m^2', 2000000, 5, 4, 3, 'Đồ ăn và thức uống miễn phí'), ('Room2', '78^2', 3000000, 6, 4, 3, 'Đồ ăn và thức uống miễn phí');

insert into hop_dong(ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
values ('2018-06-20 15:02:54', '2019-09-02 15:02:54', 2000000, 1, 1, 5), ('2019-07-20 10:05:50', '2019-09-21 10:05:50', 2500000, 3, 2, 2), ('2020-07-20 14:30:20', '2020-09-25 14:30:20', 2500000, 8, 3, 4), 
('2021-07-20 08:00:30', '2021-09-25 08:00:30', 2500000, 7, 4, 1), ('2021-07-20 09:42:23', '2022-09-25 09:42:23', 2500000, 6, 1, 3);

insert into dich_vu_di_kem(ten_dich_vu_di_kem, gia, don_vi, trang_thai)
values ('massage', 50000, 'Tầng 7', 'Hoạt động'), ('karaoke', 75000, 'Tầng 5', 'Trống'), ('thức ăn', 15000, 'Tầng 3', 'Hoạt động'),
('nước uống', 8000, 'Tầng 1', 'Hoạt động'), ('thuê xe di chuyển tham quan resort', 30000, 'Tầng 1', 'Hoạt động');

insert into hop_dong_chi_tiet(ma_hop_dong, ma_dich_vu_di_kem, so_luong)
values (2, 3, 25), (3, 5, 14), (4, 1, 20), (5, 3, 12);

-- Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select * from nhan_vien
where (substring_index(ho_ten,' ',-1) like 'H%' or 
substring_index(ho_ten,' ',-1) like 'T%' or
substring_index(ho_ten,' ',-1) like 'K%') and
 char_length(substring_index(ho_ten,' ',-1)) <= 15 ;
 
-- Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from khach_hang 
where timestampdiff(year,ngay_sinh,curdate()) between 18 and 50 
and dia_chi like 'Đà Nẵng' or dia_chi like 'Quảng Trị';

-- Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select kh.ho_ten, count(*) as num_bookings
from hop_dong hd
join khach_hang kh on hd.ma_khach_hang= kh.ma_khach_hang
where kh.ma_loai_khach = 1
group by kh.ho_ten
order by num_bookings asc;

-- Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, 