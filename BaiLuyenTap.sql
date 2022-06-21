use managestudent;
select * from sinhvien;
-- Câu 5: Hiển thị sinh viên họ trần
select * from sinhvien where hoten like 'tran%';

-- Câu 6: Hiển thị sinh viên nữ có học bổng
select * from sinhvien where gioitinh like 'nu' and hocbong<>0;

-- Câu 7: Hiển thị danh sách sinh viên có học bổng
select * from sinhvien where gioitinh like 'nu' or hocbong <>0;

-- Câu 8:  Lập danh sách sinh viên có năm sinh từ 1978 đến 1985
select * from sinhvien where year(ngaysinh) between 1978 and 1985 ;  

-- Câu 9: Liệt kê danh sách sinh viên tăng dần
select * from sinhvien order by maSinhVien;

-- Câu 10: Liệt kê danh sách sinh viên được sắp xếp giảm dần theo HocBong
select * from sinhvien order by hocbong desc;  

-- Câu 12: Lập danh sách sinh viên có học bổng của khoa CNTT.
Select * from sinhvien where hocbong <>0; 

-- Câu 13:  Lập danh sách sinh viên có học bổng của khoa CNTT. 
Select * from sinhvien where hocbong <>0; 

-- Câu 14: Cho biết số sinh viên của mỗi lớp
select lop.Tenlop, count(sinhvien.masinhvien) as 'Số sinh viên' 
from lop join Sinhvien on lop.Malop = Sinhvien.Malop group by lop.Tenlop;

-- Câu 15: Cho biết số lượng sinh viên của mỗi khoa.
select khoa.tenKhoa, count(sinhvien.masinhvien) as 'lượng sinh viên'
from khoa join lop on khoa.maKhoa join sinhvien on lop.malop = sinhvien.maLop group by khoa.tenKhoa;

-- Câu 16: Cho biết số lượng sinh viên nữ của mỗi khoa.
select khoa.tenKhoa, count(sinhvien.masinhvien) as 'số sinh viên ' from khoa 
join lop on khoa.makhoa = lop.makhoa
join sinhvien on lop.maLop = sinhvien.malop where sinhvien.gioitinh='nu' group by khoa.tenkhoa;

-- Câu 17 :Cho biết tổng tiền học bổng của mỗi lớp
select lop.Tenlop, sum(sinhvien.hocbong) as 'Số sinh viên' from lop 
join Sinhvien on lop.Malop = Sinhvien.Malop group by lop.Tenlop;

-- Câu 18 Tổng tiền học bổng của mỗikhoa
select khoa.Tenkhoa, sum(sinhvien.hocbong) as 'Số sinh viên' from khoa join lop on khoa.Makhoa = lop.Makhoa 
join Sinhvien on lop.Malop = Sinhvien.Malop  group by khoa.Tenkhoa;

-- Câu 19,20: Lập danh sánh những khoa có nhiều hơn 50 sinh viên nữ. Danh sách cần: MaKhoa, TenKhoa, Soluong
select khoa.Tenkhoa, count(sinhvien.masinhvien) as 'Số sinh viên' from khoa join lop on khoa.Makhoa = lop.Makhoa 
join Sinhvien on lop.Malop = Sinhvien.Malop  group by khoa.Tenkhoa having count(sinhvien.masinhvien)>1;

-- Câu 22:  Lập danh sách sinh viên có học bổng cao nhất
select khoa.Tenkhoa, count(sinhvien.masinhvien) as 'Số sinh viên' from khoa 
join lop on khoa.Makhoa = lop.Makhoa 
join Sinhvien on lop.Malop = Sinhvien.Malop where sinhvien.gioitinh='nu' group by khoa.Tenkhoa  having count(sinhvien.masinhvien)>1;
select *  from sinhvien where  hocbong = (select max(hocbong) From sinhvien);

-- Câu 23: Lập danh sách sinh viên có điểm thi môn toán cao nhất
select khoa.tenkhoa, count(sinhvien.masinhvien) as 'danh sach ' from khoa
join lop on khoa.maKhoa = lop.makhoa
join sinhvien on lop.malop = sinhvien.malop group by khoa.tenKhoa having count(sinhvien.masinhvien)>1;
select * from sinhvien where 