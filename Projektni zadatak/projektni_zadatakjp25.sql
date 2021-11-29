DROP database if exists fizerskisalonjp25;
CREATE database fizerskisalonjp25;
USE fizerskisalonjp25;

CREATE table djelatnik(
    sifra int  not null primary key auto_increment,
    ime varchar(50)  not null,
    prezime varchar(50)  not null,
    adresa varchar(50),
    grad varchar(50),
    drzava varchar(20),
    postanski_broj varchar(10)
);


CREATE table korisnik(
    sifra int  not null primary key auto_increment,
    ime varchar(50)  not null,
    prezime varchar(50)  not null,
    broj_mobitela varchar(30),
    adresa varchar(50),
    grad varchar (50),
    drzava varchar(20),
    postanski_broj varchar(10),
    spol char(1)
);

CREATE table usluga(
    sifra int  not null primary key auto_increment,
    naziv varchar(50)  not null,
    trajanje int  not null,
    cijena decimal(18,2)  not null
);

CREATE table termin(
   sifra int  not null primary key auto_increment,
   djelatnik int  not null,
   korisnik int  not null,
   datum_i_vrijeme datetime,
   napomena varchar(100)
);

CREATE table isporucena_usluga(
    sifra int  not null primary key auto_increment,
    usluga int  not null,
    termin int  not null,
    kolicina int not null,
    cijena decimal(18,2) not null
);



alter table termin add foreign key (djelatnik) references djelatnik(sifra);
alter table isporucena_usluga add foreign key (termin) references termin(sifra);
alter table termin add foreign key (korisnik) references korisnik(sifra);
alter table isporucena_usluga add foreign key (usluga) references usluga(sifra);

insert into djelatnik (sifra,ime,prezime)
values (null,'Mirela','Čulić');

insert into djelatnik (sifra,ime,prezime)
values (null,'Maja','Varga');
#1
insert  into korisnik (sifra,ime,prezime,broj_mobitela,adresa,grad,drzava,postanski_broj,spol)
values (null,'Marija','Magusić','0981767036','Ilirska 56','Osijek','Hrvatska','31000','Ž'),
        (null,'Mario','Kordić','0997078094','Ilirska 56','Osijek','Hrvatska','31000','M'),
        (null,'Tajana','Mak','0982539020','Vijenac Petrove Gore 5','Osijek','Hrvatska','31000','Ž');

insert into termin(sifra,djelatnik,korisnik,datum_i_vrijeme,napomena)
values(null,1,1,'2021-11-30 12:30','Bojanje - Crvena'),
      (null,1,2,'2021-12-01 11:10','Muško šišanje, kasnit će možda 10 minuta'),
      (null,2,3,'2021-12-01 10:00','Trajna - minival');


insert into usluga(sifra,naziv,trajanje,cijena)
values(null,'Bojanje',90, 180),
      (null,'M. šišanje',30, 45),
      (null,'Minival',120,280),
      (null,'Ž. šišanje',60,90);


insert into isporucena_usluga(sifra,usluga,termin,kolicina,cijena)
values(null,1,1,1, 180),
      (null,2,2,1, 90),
      (null,3,3,1, 45),
      (null,4,3,1,280);