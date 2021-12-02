select naziv,smjer from grupa;

select a.naziv as grupa, b.naziv as smjer
from grupa a inner join smjer b on a.smjer = b.sifra ;


select a.naziv as grupa, b.naziv as smjer, d.ime,d.prezime
from grupa a inner join smjer b on a.smjer = b.sifra
inner join predavac c on a.predavac  = c.sifra
inner join osoba d on c.osoba = d.sifra;



select a.naziv as grupa, b.naziv as smjer, d.ime,d.prezime
from grupa a inner join smjer b on a.smjer = b.sifra
left join predavac c on a.predavac  = c.sifra
left join osoba d on c.osoba = d.sifra;

#zadatak ispišite sve šifre polaznika i njihova imena i prezimena

select a.sifra, b.ime as ime, b.prezime  as prezime
from polaznik a inner join osoba b on a.osoba = b.sifra;

#ispišite sva imena i prezimena polaznika koji su članovi grupe JP25
select d.ime, d.prezime
from  clan a inner join grupa b on a.grupa = b.sifra
inner join polaznik c on a.polaznik = c.sifra
inner join osoba d on c.osoba = d.sifra
where b.naziv ='JP25';

#Upišite sebe u grupu PP24
#16
select * from osoba;
#15
select * from polaznik;
#1
select * from clan;
insert into clan (grupa,polaznik) values
(2,15);

$ispišite sve nazive grupa u kojima se nalazite vi

select b.naziv
from  clan a inner join grupa b on a.grupa = b.sifra
inner join polaznik c on a.polaznik = c.sifra
inner join osoba d on c.osoba = d.sifra
where d.ime ='Mario' and d.prezime='Kordić';

# "Udajte" se svi i promijenite si prezime na novo željeno

update osoba set prezime='Magušić' where sifra=16;

# Obrišite sve svoje podatke iz baze

delete from clan where polaznik=15;
delete from polaznik where sifra=15;
delete from osoba  where sifra =16;