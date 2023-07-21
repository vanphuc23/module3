create database bt_ss3_2;
use bt_ss3_2;

create table Customer(
cID int not null primary key auto_increment,
cName varchar(50) not null,
cAge tinyint not null
);

create table Dat_hang(
oID int not null primary key auto_increment,
cID int not null,
oDate date,
oTotalPrice double,
foreign key(cID) references Customer(cID)
);

create table Product(
pID int not null primary key auto_increment,
pName varchar(255) not null,
pPrice int not null
);

create table OrderDetail(
oID int not null,
pID int not null,
odQTY int,
primary key(oID,pID),
foreign key(oID) references Dat_hang(oID),
foreign key(pID) references Product(pID)
);

insert into Customer(cName,cAge)
values('Minh Quan',10),('Ngoc Oanh',20),('Hong Ha',50);

insert into Dat_hang(cID,oDate,oTotalPrice)
values (1,'2006-3-21',null),(2,'2006-3-23',null),(1,'2006-3-16',null);

insert into Product(pName,pPrice)
values('May Giat',3),('Tu Lanh',5),('Dieu Hoa',7),('Quat',1),('Bep Dien',2);

insert into OrderDetail(oID,pID,odQTY)
values(1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);


