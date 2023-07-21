create database bt_ss2_2;
use bt_ss2_2;

create table Customer(
cID int primary key auto_increment,
cName varchar(50),
cAge date
);

create table Dat_hang(
oID int primary key auto_increment,
cID int,
oDate date,
oTotalPrice double,
foreign key(cID) references Customer(cID)
);

create table Product(
pID int primary key auto_increment,
pName varchar(255),
pPrice int
);

create table OrderDetail(
oID int,
pID int,
odQTY int,
primary key(oID,pID),
foreign key(oID) references Dat_hang(oID),
foreign key(pID) references Product(pID)
);