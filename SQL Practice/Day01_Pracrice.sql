
--ogrenciler isminde bir tablo olusturalım
--ogr_id smallint
--isim varchar(50)
--adres varchar(100)
--sinav_notu smallint ...


/*
yorum
*/

create table ogrenciler(
	ogr_id smallint,
	isim varchar (50),
	adres varchar(100),
	sinav_notu smallint
);

insert into ogrenciler values(120, 'Ali Can', 'Ankara', 70);
INSERT INTO OGRENCILER VALUES ('121', 'Veli Can', 'Trabzon', 75);
insert into ogrenciler values(122, 'Ayse An', 'Bursa', 85);
insert into ogrenciler values(123, 'Kemal Kan', 'Istanbul', 95);
insert into ogrenciler values(124, 'Tarik Tan', 'Ankara', 95);
insert into ogrenciler values(125, 'Salih San', 'Izmir', 100);


select * from ogrenciler;

--Soru 2: ogrenciler tablosundaki adres sütununu listeleyiniz.

select adres from ogrenciler;

--Soru 3: ogrenciler tablosundaki ogr_id ve isim sütunlarını listeleyiniz.

select ogr_id, isim from ogrenciler;

--Soru 4: ogrenciler tablosundaki notu 85 üzeri olan öğrenci bilgilerinin tamamını listeleyiniz.

select * from ogrenciler where sinav_notu>85;

--Soru 5: ogrenciler tablosundaki adresi Ankara olan öğrencilerin isimlerini listeleyiniz

select isim from ogrenciler where adres='Ankara';

--Soru 6: ogrenciler tablosundaki notu 85 üzeri ve adresi Ankara olan öğrenci isim, adres ve sinav_not'larini listeleyiniz.

select isim, adres, sinav_notu from ogrenciler where sinav_notu>85 and adres='Ankara';

--Soru 7:sinav_notu 95 veya 70 olan üğrencilerin tüm bilgilerini listeleyiniz.
select * from ogrenciler
where sinav_notu=95 or sinav_notu=70;

--2.yol
select * from ogrenciler
where sinav_notu in(95,70);

--Soru 8: sinav_notu 75 ve 95 arasında olan 
--öğrencilerin isim ve sinav_notlarini listeleyiniz. 76 dan 94 e kadar olan kayıtlar
select isim , sinav_notu from ogrenciler
where sinav_notu<95 and sinav_notu>75;

--2.yol->between  sınırlar dahil
select isim, sinav_notu from ogrenciler
where sinav_notu between 76 and 94;

--Soru 9: id'si 122 ve 125 arasında olmayan öğrencilerin adreslerini listeleyiniz.

select adres from ogrenciler
where ogr_id<122 or ogr_id >125;

--2.yol : not between sınırlar dahil değil
select adres from ogrenciler
where ogr_id not between 122 and 125;






















