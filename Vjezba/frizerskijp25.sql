DROP database if exists frizerskijp25;
CREATE database frizerskijp25;
USE frizerskijp25;

CREATE table salon (
    sifra int primary key not null auto_increment,
    naziv varchar(50) not null,
    adresa varchar(50) not null,
    djelatnik int not null
);

CREATE table djelatnik (
    sifra int primary key not null auto_increment,
    osoba int not null,
    placa decimal(18,2),
    salon int not null,
    iban varchar(50)
);

CREATE table osoba (
    sifra int primary key not null auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib int
);

CREATE table korisnik(
    sifra int primary key not null auto_increment,
    osoba int not null,
    usluga int not null,    
    broj_mobitela varchar(50)
);

CREATE table usluga(
    sifra int primary key not null auto_increment,
    djelatnik int not null,
    korisnik int not null,
    naziv varchar(50),
    cijena decimal(18,2),
    datum datetime
);


ALTER table djelatnik add foreign key (salon) references salon(sifra);
ALTER table djelatnik add foreign key (osoba) references osoba(sifra);
ALTER table korisnik add foreign key (osoba) references osoba(sifra);
ALTER table korisnik add foreign key (usluga) references usluga(sifra);