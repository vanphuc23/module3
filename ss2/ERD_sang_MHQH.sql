create table PHIEUXUAT(
id_PX int auto_increment primary key,
SoPX int,
NgayXuat date
);

create table VATTU(
MaVTU int primary key auto_increment,
TenVTU varchar(50)
);

create table PHIEUXUAT_VATTU(
id_PX int,
MaVTU int,
DGXuat varchar(50),
SLXuat int,
primary key(id_PX,MaVTU),
foreign key(id_PX) references PHIEUXUAT(id_PX),
foreign key(MaVTU) references VATTU(MaVTU)
);

create table PHIEUNHAP(
id_PN int primary key auto_increment,
SoPN int,
NgayNhap date
);

create table VATTU_PHIEUNHAP(
MaVTU int,
id_PN int,
DGNhap varchar(50),
SLNhap int,
primary key(MaVTU,id_PN),
foreign key(MaVTU) references VATTU(MaVTU),
foreign key(id_PN) references PHIEUNHAP(id_PN)
);

create table NHACC(
MaNCC int primary key auto_increment,
TenNCC varchar(50),
DiaChi varchar(255)
);

create table DONDH(
id_DH int primary key auto_increment,
SoDH int,
NgayDH date,
MaNCC int,
foreign key(MaNCC) references NHACC(MaNCC)
);

create table VATTU_DONDH(
MaVTU int,
id_DH int,
primary key(MaVTU,id_DH),
foreign key(MaVTU) references VATTU(MaVTU),
foreign key(id_DH) references DONDH(id_DH)
);

create table SDT(
MaNCC int auto_increment,
SDT varchar(20),
foreign key(MaNCC) references NHACC(MaNCC)
);