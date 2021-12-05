select a.country ,d.first_name, d.last_name
from country a
inner join city b on a.country_id = b.country_id
inner join address c on b.city_id = c.city_id
inner join staff d on d.address_id= c.address_id ;


"Zaposli" se u sakila bazi.
#Unesite zemlju grad, adresu  i sebe kao zaposlenika

describe country ;

insert into country (country) values ('Croatia');
#110
select * from country order by country_id desc limit 1;

describe city;
#601
insert into city (city,country_id) values('Osijek',110);

select * from city order by 1 desc limit 1;

describe address;

insert  into address ( address,district,city_id,phone) values
('Lorenza Jagera 2','Osječko baranjska',601,'031/225-669');
#606
select * from address order by 1 desc limit 1;

describe staff;

select * from store;

insert into staff(first_name,last_name,address_id,store_id,username)
values ('Mario', 'Kordić',606,1,'mariok');
#599
select count(*) from customer ;
#591
select distinct first_name from customer;

select first_name , count(*) from customer
where first_name like '%a%' # filtiraju se podaci prohranjenu u tablici
group by first_name
having count(*)>1 #filrtiju se izvedeni / agregirani podaci
order by 1 desc
limit 2;



select first_name, last_name from customer
union
select first_name, last_name from staff;


create  table osoba
select first_name, last_name from customer
union
select first_name, last_name from staff;


select * from osoba where  last_name like 'Ko%';

update osoba set first_name=upper(first_name), last_name = upper(last_name);  

select * from grupa;
select * from osoba;
select * from predavac;

#unesite Predavača Pavle Vidaković
describe osoba;
describe predavac ;
insert into osoba (sifra,ime,prezime,email)
values (null,'Pavle','Vidaković','pavle.vidakovic@net.hr');

insert into predavac (sifra,osoba,iban)
values (null, 25, 'HR3723600003468177862');

#predavači koji ne vode niti jednu grupu

select predavac from grupa where predavac is not null;
#podupit
select b.ime,b.prezime
from predavac a inner join osoba b on a.osoba =b.sifra
where a.sifra not in(
select predavac from grupa where predavac is not null
);

#obrisite Pavle Vidaković
delete  from osoba  where  prezime = 'Vidaković';
delete from predavac where sifra =2;
delete from osoba where prezime =25;





select * from film;
select *, datediff(return_date, rental_date) from rental  where  rental_date  is not null;


select a.first_name ,a.last_name ,
sum(datediff(b.return_date, b.rental_date)*d.rental_rate) as ukupno,
avg(datediff(b.return_date, b.rental_date)) as projekdana
from customer a
inner join rental b on a.customer_id = b.customer_id
inner join inventory c on b.inventory_id  = c.inventory_id
inner join film d on c.film_id = d.film_id
group by a.first_name, a.last_name
having  ukupno > 700
order by 4 desc;

# koje je sve jedinstvene filmove RHONDA KENNEDY posudila

select d.film_id,d.title
from customer a
inner join rental b on a.customer_id = b.customer_id
inner join inventory c on b.inventory_id  = c.inventory_id
inner join film d on c.film_id = d.film_id
where a.first_name ='RHONDA' and a.last_name = 'KENNEDY';