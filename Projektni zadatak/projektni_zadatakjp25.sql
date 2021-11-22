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
    djelatnik int  not null,
    korisnik int  not null,
    cijena decimal(18,2)  not null
);

CREATE table termin(
   sifra int  not null primary key auto_increment,
   djelatnik int  not null,
   korisnik int  not null,
   datum_i_vrijeme datetime
);

CREATE table isporucena_usluga(
    sifra int  not null primary key auto_increment,
    usluga int  not null,
    djelatnik int not null,
    termin int  not null,
    ukupna_cijena decimal(18,2) not null
);


alter table usluga add foreign key (djelatnik) references djelatnik(sifra);
alter table termin add foreign key (djelatnik) references djelatnik(sifra);
alter table isporucena_usluga add foreign key (djelatnik) references djelatnik(sifra);
alter table isporucena_usluga add foreign key (termin) references termin(sifra);
alter table termin add foreign key (korisnik) references korisnik(sifra);
alter table usluga add foreign key (korisnik) references korisnik(sifra);
alter table isporucena_usluga add foreign key (usluga) references usluga(sifra);

insert into djelatnik (sifra,ime,prezime)
values (null,'Mirela','Čulić');

#1
insert  into korisnik (sifra,ime,prezime,broj_mobitela,adresa,grad,drzava,postanski_broj,spol)
values (null,'Marija','Magusić','0981767036','Ilirska 56','Osijek','Hrvatska','31000','Ž'),
        (null,'Mario','Kordić','0997078094','Ilirska 56','Osijek','Hrvatska','31000','M');
;
#1
insert  into usluga (sifra,naziv,trajanje,djelatnik,korisnik,cijena)
values (null,'Feniranje','30',1,1,50);
#1
insert  into termin (sifra, djelatnik, korisnik,datum_i_vrijeme)
values (null,1,1,'2021-11-22 20:30:00');
#1
insert into isporucena_usluga (sifra,usluga,djelatnik,termin,ukupna_cijena)
values (null, 1,1,1,50);
#2
insert  into usluga (sifra,naziv,trajanje,djelatnik,korisnik,cijena)
values (null,'Šišanje','35',1,2,35);