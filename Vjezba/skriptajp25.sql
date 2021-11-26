DROP database if exists vjezbajp25;
CREATE database vjezbajp25;
USE vjezbajp25;

CREATE table smjer(
    sifra int primary key not null auto_increment,
    naziv varchar(50) not null,
    trajanje decimal(18,2) not null,
    certificiran boolean
);

CREATE table grupa(
    sifra int primary key not null auto_increment, 
    naziv varchar(50) not null,
    smjer int not null,
    predavac int,
    datumpocetka datetime
);

CREATE table predavac(
    sifra int primary key not null auto_increment,
    osoba int not null,
    iban varchar(50)    
);

CREATE table clan(
    grupa int not null,
    polaznik int not null
);

CREATE table polaznik(
    sifra int primary key not null auto_increment,
    osoba int not null,
    broj_ugovora varchar(50)
);

CREATE table osoba(
    sifra int primary key not null auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11),
    email varchar(50)not null
);


ALTER table grupa add foreign key (smjer) references smjer(sifra);
ALTER table grupa add foreign key (predavac) references predavac(sifra);

ALTER table clan add foreign key (grupa) references grupa(sifra);
ALTER table clan add foreign key (polaznik) references polaznik(sifra);

ALTER table polaznik add foreign key (osoba) references osoba(sifra);
ALTER table predavac add foreign key (osoba) references osoba(sifra);




