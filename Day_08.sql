create table filmler
(film_id int,
film_name varchar(30),
category varchar(30)
);

insert into filmler values (100, 'Eyvah Eyvah', 'Komedi');
insert into filmler values (200, 'Kurtlar Vadisi', 'Aksiyon');
insert into filmler values (300, 'Eltilerin Savasi', 'Komedi');
insert into filmler values (400, 'Aile Arasinda', 'Komedi');
insert into filmler values (500, 'GORA', 'Bilim Kurgu');
insert into filmler values (600, 'Organize Isler', 'Komedi');
insert into filmler values (700, 'Babam ve Oglum', 'Dram');


create table aktorler
(
actor_name varchar(30),
film_id int
);

insert into aktorler values ('Ata Demirer', 100);
insert into aktorler values ('Necati Sasmaz', 200);
insert into aktorler values ('Gupse Ozay', 300);
insert into aktorler values ('Engin Gunaydin', 400);
insert into aktorler values ('Cem Yilmaz', 500);
insert into aktorler values ('Yilmaz Erdogan', 800);
insert into aktorler values ('Haluk Bilginer', 900);


-- SORU1: Tüm film_name'leri, tüm category'lerini ve bu filmlerde oynayan actor_name'leri listeleyiniz.

select film_name,category,actor_name from aktorler
right join filmler
on aktorler.film_id=filmler.film_id;


-- SORU2: Tüm actor_name'leri ve bu actorlerin oynadıgı film_name'lerini listeleyiniz.

select actor_name,film_name from aktorler left  join filmler on filmler.film_id = aktorler.film_id;


--SORU3: Her iki tabloda film_id'si ortak olan verilerin film_name ve actor_name'lerini listeleyiniz

select film_name , actor_name from filmler
inner join aktorler
on filmler.film_id = aktorler.film_id;

select * from filmler;

--SORU4: Tüm film_name'leri ve tüm actor_name'leri listeleyiniz

select film_name, actor_name from filmler full join aktorler 
on filmler.film_id = aktorler.film_id;






/*
TRANSACTİON: Verileri silinmeye karşı korur.

Tabloya ekledigimiz verileri silinmeye karşı korumak istiyorsak TRANSACTION işlemi kullanılmalıdır.


Begin: Transaction'ı başlatmak için kullanılır.

Savepoint: Verileri silinmeye karşı save eder.

Rollback: Silinen verileri geri getirir.

Commit: Transaction'ı sonlandırmak için kullanılır.

*/

create table evraklar
(
id int,
onem_derecesi varchar(40),
konusu varchar(100)
);

Begin; -- (Transaction'ı baslatmak icin kullandık)

insert into evraklar values(100,'Cok Onemli','Saglik');
insert into evraklar values(101,'Cok Onemli','Maliye');
insert into evraklar values(102,'Cok Onemli','Nufus');
insert into evraklar values(103,'Cok Onemli','Mezuniyet');

savepoint x; -- (cok onemli verileri silinmeye karsi save eder)

insert into evraklar values(104,'Onemsiz','Apartman Makbuzu');
insert into evraklar values(105,'Onemsiz','Su Faturasi')

select * from evraklar;

delete from evraklar;


select * from evraklar;

rollback to x; -- ( silinen cok onemli verileri geri getirir)

select * from evraklar;

commit;

delete from evraklar;

select * from evraklar;
