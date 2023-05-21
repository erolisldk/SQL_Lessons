CREATE TABLE memurlar
(
memur_id int primary key,
memur_isim VARCHAR(50),
memur_maas int  
);
​
INSERT INTO memurlar VALUES(101, 'Ali Can', 12000);
INSERT INTO memurlar VALUES(102, 'Veli Han', 2000);
INSERT INTO memurlar VALUES(103, 'Ayse Kan', 7000);
INSERT INTO memurlar VALUES(104, 'Melek Tan', 8500);
​
--Veli Han'ın maas değerini en yüksek maas değerine esitleyin
update memurlar
set memur_maas = (select max(memur_maas) from memurlar)
where memur_isim ='Veli Han';
​
--bana 12000 ı veren sorguyu yazıyorum
select max(memur_maas) from memurlar;
​
--Ali Can'ın maas değerini en düşük maas değerinin 1.5 katına esitleyin
update memurlar
set memur_maas =(select min(memur_maas)*1.5 from memurlar)
where memur_isim='Ali Can'
​
--en dusuk memur maasının 1,5 katını veren sorgu
select min(memur_maas)*1.5 from memurlar
​
--Melek Tanın maasını Ayse Kan ve Veli Hanın maasları toplamına esıtleyın
update memurlar
set memur_maas =(select sum(memur_maas) from memurlar
                 where memur_isim in('Ayse Kan', 'Veli Han'))
where memur_isim='Melek Tan';
​
--ayse ve veli maas top veren sorgu -->19000
select sum(memur_maas) from memurlar
where memur_isim in('Ayse Kan', 'Veli Han');
--where memur_isim='Ayse Kan' or memur_isim='Veli Han';
​
--Ortalama maas değerinden düşük olan maas değerlerini 1000 artırın.
--ortalama maas veren sorgu
select avg(memur_maas) from memurlar-> 9500
​
update memurlar
set memur_maas = memur_maas +1000
where memur_maas<(select avg(memur_maas) from memurlar)
​
--Ortalama maas değerinden düşük maas değerlerine ortalama maas değeri atayın.
update memurlar
set memur_maas = (select avg(memur_maas) from memurlar)--ortalama maas
where memur_maas < (select avg(memur_maas) from memurlar)--ortalama maas
​
select avg(memur_maas) from memurlar--12875