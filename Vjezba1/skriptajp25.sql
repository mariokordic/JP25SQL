DROP database if exists edunovajp25;
CREATE database edunovajp25;
USE edunovajp25;

CREATE table smjer(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    trajanje int not null,
    cijena decimal(18,2),
    certificiran boolean
);

CREATE table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11),
    email varchar(50) not null
);

CREATE table grupa(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    smjer int not null,
    predavac int,
    datumpocetka datetime

);

CREATE table predavac(
    sifra int not null primary key auto_increment,
    osoba int not null,
    iban varchar(50)
);


CREATE table clan(
    grupa int not null,
    polaznik int not null
);

CREATE table polaznik(
    sifra int not null primary key auto_increment,
    osoba int not null,
    brojugovora varchar(50)
);


alter table grupa add foreign key(smjer) references smjer(sifra);
alter table grupa add foreign key(predavac) references predavac(sifra);

alter table predavac add foreign key (osoba) references osoba(sifra);

alter table polaznik add foreign key (osoba) references osoba(sifra);

alter table clan add foreign key (grupa) references grupa(sifra);
alter table clan add foreign key (polaznik) references polaznik(sifra);
