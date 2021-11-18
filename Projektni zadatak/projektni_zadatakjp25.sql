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