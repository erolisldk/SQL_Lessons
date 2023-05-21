/*========================CONSTRAINT -- KISITLAMALAR=======================================================

1) UNIQUE -->  Bir sütundaki verilerin BENZERSİZ olmasıdır.(2 veya daha fazla null deger kabul eder)

2) NOT NULL --> Bir sütunun NULL İÇERMEMESİNİ sağlar
   (NOT NULL kısıtlaması, data türünden hemen sonra yazılır. CONSTRAINT ismi tanımlanmaz.)   

3) PRIMARY KEY --> UNIQUE(BENZERSİZ) - NOT NULL 
   Bir tabloda en fazla bir adet Primary Key olur. 
   iki sutunun birlesiminden bir Primary Key oluşturulmasına ise Composite Primary Key denir.

4) CHECK --> Bir sütunun değer aralığını sınırlamak için kullanılır.

5) FOREIGN KEY --> Başka bir tablodaki PRİMARY KEY'i referans göstermek için kullanılır.
   Böylelikle, tablolar arasında Parent- Child ilişkisi oluşur.
============================================================================================================*/

/*
SORU1: memurlar isminde bir tablo oluşturunuz. 
id, isim, maas, mezuniyet sutunları olsun.
id sutununun data turu int olsun. PRİMARY KEY kısıtlaması olsun.
isim sutununun data turu varchar(30) olsun. UNIQUE kısıtlaması olsun.
maas sutununun data turu int olsun. maas 5000 buyuk olsun.
mezuniyet sutununun data turu varchar(25) olsun. NOT NULL kısıtlaması olsun.    
*/

create table memurlar(
id int PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int CHECK(maas>5000),
mezuniyet varchar(25) NOT NULL
);

insert into memurlar values(1, 'Ali', 10000, 'Lisans' );
insert into memurlar values(2,'Ahmet', 150000, 'Yuksek Lisans');
insert into memurlar values(3, 'Altug', 20000, 'Lisans');
insert into memurlar values(4,'Elif',18000,'Lisans');

select * from memurlar;

insert into memurlar values(1,'Zulal',20000,'Lise');  			 -- PRIMARY KEY SEBEBİYLE EROR VERİR
insert into memurlar values(5,'Altug',25000,'Yüksek Lisans');    -- UNIQUE SEBEBİYLE EROR VERİR
insert into memurlar values(6,'Hayri',4000,'Lisans');			 -- CHECK SEBEBİYLE EROR VERİR
insert into memurlar values(7,'Burak',30000,null); 				 -- NOT NULL SEBEBİYLE EROR VERİR


/*
SORU2: insanlar isminde bir tablo oluşturunuz. 
isim, soyisim sutunları olsun.
isim sutununun data turu varchar(20) olsun.
soyisim sutununun data turu varchar(30) olsun. 


isim sutununda PRİMARY KEY kısıtlaması olsun. Kısıtlamanın isimi pr_ks olsun.
soyisim sutununda UNIQUE kısıtlaması olsun. Kısıtlamanın ismi uni_ks olsun.
*/

create table insanlar(
isim varchar(20),
soyisim varchar(30),

CONSTRAINT pr_ks PRIMARY KEY(isim),
CONSTRAINT uni_ks UNIQUE(soyisim)
);

insert into insanlar values('Harun', 'Tan');
insert into insanlar values ('Azra', 'Can');
select * from insanlar;

insert into insanlar values('Harun', 'Tan');--PRIMARY KEY sebebi 'le error verir
insert into insanlar values(null, 'Er'); --PRIMARY KEY sebebi 'le error verir
insert into insanlar values('Kudret', 'Can');  --UNIQUE sebebi ile error verir


/*
SORU3: hayvanlar isminde bir tablo oluşturunuz. 
isim, cins sutunları olsun.
isim sutununun data turu varchar(20) olsun.
cins sutununun data turu varchar(25) olsun.

isim ve cins sutunları birlesiminden bir PRIMARY KEY kısıtlaması olsun.(Composite Primary Key). Kısıtlamanın ismini comp_pr yapınız

*/

create table hayvanlar(
isim varchar(20),
cins varchar(25),

CONSTRAINT comp_pr PRIMARY KEY (isim, cins)-- iki sutunun birlesiminden bir PRIMARY KEY kisitlasmasi elde ettik. Bunun ismi Composite Primary Key
);



