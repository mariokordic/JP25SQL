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
    spol char(1),
    usluga int not null,
    termin int not null
);

CREATE table usluga(
    sifra int  not null primary key auto_increment,
    naziv varchar(50)  not null,
    trajanje int  not null,
    djelatnik int  not null,
    korisnik int  not null,
    isporucena_usluga int  not null,
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