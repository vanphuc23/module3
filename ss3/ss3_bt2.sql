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

-- Hiển thị các thông tin gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select o.oID,o.oDate,p.pPrice
from Dat_hang o
join OrderDetail od on o.oID=od.oID
join Product p on od.pID=p.pID;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.cName as 'Danh sách khách hàng',p.pName as 'Sản phẩm được mua'
from Customer c
join Dat_hang o 
on c.cID=o.cID
join OrderDetail od
on o.oID=od.oID
join Product p
on od.pID=p.pID;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.cName, o.oTotalPrice
from Customer c
join Dat_hang o 
on c.cID=o.cID;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select o.oID,o.oDate,sum(od.odQTY*p.pPrice) as 'Tổng tiền'
from Dat_hang o
join OrderDetail od on o.oID=od.oID
join Product p on od.pID=p.pID
group by o.oID;
