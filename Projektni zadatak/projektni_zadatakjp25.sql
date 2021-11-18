DROP database if exists fizerskisalonjp25;
CREATE database fizerskisalonjp25;
USE fizerskisalonjp25;

CREATE table djelatnik(
    sifra int,
    ime varchar(50),
    prezime varchar(50),
    adresa varchar(50),
    grad varchar(50),
    drzava varchar(20),
    postanski_broj varchar(10)
);


CREATE table korisnik(

    sifra int,
    ime varchar(50),
    prezime varchar(50),
    broj_mobitela varchar(30),
    adresa varchar(50),
    grad varchar (50),
    drzava varchar(20),
    postanski_broj varchar(10)
    spol char(1),
    usluga int,
    termin int,
);

CREATE table usluga(
    sifra int,
    naziv varchar(50),
    trajanje int,
    djelatnik int,
    korisnik int,
    isporucena_usluga int,
    cijena decimal(18,2)
);