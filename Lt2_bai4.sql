create database FPTsoftware;

create table nhacungcap ( 
manhacc int auto_increment primary key,
tennhacungcap varchar(255),
diachi varchar(255),
sodienthoai varchar(11),
masothue varchar (20)
);

create table loaiDichVu(
maloaidv int auto_increment  primary key,
tenloaidv varchar (255)
);

create table mucphi (
mamucphi int auto_increment primary key,
dongia double,
mota varchar(255)
);

create table dongxe (
tendongxe varchar (255) primary key,
hangxe varchar(50),
sochongoi int
);

create table dangkycungcap (
madkcc int auto_increment primary key,
manhacc int,
maloaidv int,
mamucphi int,
tendongxe varchar (255),
ngaybatdau date,
ngayketthuc date,
soluongxedk int,

foreign key ( manhacc) references nhacungcap(manhacc),
foreign key ( maloaidv) references loaidichvu(maloaidv),
foreign key ( mamucphi) references mucphi(mamucphi),
foreign key ( tendongxe) references dongxe(tendongxe)
);

insert into dongxe values('vios', 'toyota',4),
('kia morrning', 'kia' , 4),
('s600', 'Mercedes-Benz', 4),
('civic', 'honda',4),
('inova','toyota',6);

insert into loaidichvu values (1,'taxi'),
(2,'gia đình'),
(3,'doanh nghiep');

insert into mucphi values ( 1, 165, 'tot'),
(2,200,'kha'),
(3,100,'trung bình');

insert into nhacungcap values(1,'Song','Ha Noi','0353131231','298762'),
(2,'Dat','Ha Tay', '0399913231', '32986043'),
(3,'52Blue' , 'My Duc', '035313123','904338');

insert into dangkycungcap values (1,1,1,1,'civic', '2022-5-5', '2022-5-9',10),
(2,2,2,2,'vios', '2022-6-6', '2022-6-10',11),
(3,3,3,3,'s600', '2022-7-8', '2022-12-6',15);

-- Câu 3: Liệt kê những dòng xe có số chỗ ngồi trên 5 chỗ
select * from dongxe where sochongoi >5;

-- Câu 4: Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp những dòng xe thuộc hãng xe “Toyota” với mức phí có đơn giá là 15.000 VNĐ/km hoặc những dòng xe thuộc hãng xe “KIA” với mức phí có đơn giá là 20.000 VNĐ/km;
select*from 
nhacungcap as ncc 
join dangkycungcap as dk  
join mucphi as mp 
join dongxe as dx 
on ncc.manhacc=dk.manhacc 
and dk.mamucphi=mp.mamucphi
and dx.tendongxe=dk.tendongxe where dx.hangxe= ' toyota' and mp.dongia ='15000'

union

select*from 
nhacungcap as ncc 
join dangkycungcap as dk  
join mucphi as mp 
join dongxe as dx 
on ncc.manhacc=dk.manhacc 
and dk.mamucphi=mp.mamucphi
and dx.tendongxe=dk.tendongxe where dx.hangxe= ' kia' and mp.dongia ='20000';

-- Câu 5: Liệt kê thông tin toàn bộ nhà cung cấp được sắp xếp tăng dần theo tên nhà cung cấp và giảm dần theo mã số thuế

select*from
 nhacungcap as ncc
order by ncc.tennhacungcap ,ncc.MaSoThue desc;

-- Câu 6: Đếm số lần đăng ký cung cấp phương tiện tương ứng cho từng nhà cung cấp với yêu cầu chỉ đếm cho những nhà cung cấp thực hiện đăng ký cung cấp có ngày bắt đầu cung cấp là “20/11/2015”
select  nhacungcap.*,count(madkcc	) as 'Số lần đăng ký cung cấp'
FROM dangkycungcap join nhacungcap on dangkycungcap.manhacc= nhacungcap.manhacc
where dangkycungcap.ngaybatdau > '2015-11-20'
group by nhacungcap.manhacc; 

-- Câu 7: Liệt kê tên của toàn bộ các hãng xe có trong cơ sở dữ liệu với yêu cầu mỗi hãng xe chỉ được liệt kê một lần
select distinct dx.HangXe as 'Hãng xe'
from DongXe as dx;

-- Câu 8: Liệt kê MaDKCC, MaNhaCC, TenNhaCC, DiaChi, MaSoThue, TenLoaiDV, DonGia,HangXe, NgayBatDauCC, NgayKetThucCC của tất cả các lần đăng ký cung cấp phương tiện với yêu cầu những nhà cung cấp nào chưa từng thực hiện đăng ký cung cấp phươngtiện thì cũng liệt kê thông tin những nhà cung cấp đó ra

select dk.madkcc,ncc.*,ldv.tenloaidv,mp.dongia,dx.hangxe,dk.ngaybatdau,dk.ngayketthuc
from nhacungcap as ncc 
	left join Dangkycungcap as dk  on ncc.manhacc=dk.manhacc 
    left join loaidichvu as ldv on dk.maloaiDV=ldv.maloaiDV
    left join mucphi as mp on dk.mamucphi=mp.mamucphi
    left join dongxe as dx on dk.tendongxe=dx.tendongxe;	
    
   


-- Câu 9: Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp phương tiện thuộc dòng xe “Hiace” hoặc từng đăng ký cung cấp phương tiện thuộc dòng xe “Cerato”
SELECT * FROM
 nhacungcap AS n 
JOIN Dangkycungcap as dk on n.manhacc =dk.manhacc  
JOIN dongxe AS dx on dk.tendongxe =dx.tendongxe
WHERE dx.hangxe='Toyota' OR dx.hangxe='SU';

-- Câu 10: Liệt kê thông tin của các nhà cung cấp chưa từng thực hiện đăng ký cung cấp phương tiện lần nào cả.
SELECT *
FROM nhacungcap 
WHERE manhacc not in( SELECT manhacc FROM Dangkycungcap);



