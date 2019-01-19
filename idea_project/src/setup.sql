DROP TABLE beinhaltet;
DROP TABLE attraktion;
DROP TABLE anzahlung;
DROP TABLE buchung;
DROP TABLE storno;
DROP TABLE ausstattung;
DROP TABLE ferienwohnung;
DROP TABLE benutzer;
DROP TABLE land;
DROP TABLE stadt;





 

ALTER SESSION SET nls_date_format = 'DD.MM.YYYY';

CREATE TABLE stadt
( plz           INTEGER NOT NULL,
  stadtname     VARCHAR(30) NOT NULL,
  CONSTRAINT stadt_pk PRIMARY KEY(plz),
  CONSTRAINT stadt_plz CHECK (REGEXP_LIKE(plz,'\d{5}')),
  CONSTRAINT stadt_stadtname CHECK (REGEXP_LIKE(stadtname,'\D+'))
);  

CREATE TABLE land
( landname      VARCHAR(30) PRIMARY KEY,
  CHECK(REGEXP_LIKE(landname,'\D+'))
);

CREATE TABLE benutzer
( mail          VARCHAR(50) NOT NULL,
  kundennummer  INTEGER     NOT NULL,
  benutzername  VARCHAR(50) NOT NULL,
  iban          CHAR(26)    NOT NULL,
  plz           INTEGER     NOT NULL,
  hausnummer    VARCHAR(4)  NOT NULL,
  strasse       VARCHAR(30) NOT NULL,
  passwort      VARCHAR(50) NOT NULL,
  landname      VARCHAR(30) NOT NULL,
  anzBuch       INTEGER     NOT NULL,
  anzStorno     INTEGER     NOT NULL,
  summeBezahlt  INTEGER     NOT NULL,
  CONSTRAINT benutzer_pk PRIMARY KEY(mail),
  CONSTRAINT benutzer_fk FOREIGN KEY(plz) REFERENCES stadt(plz),
  CONSTRAINT benutzer_fkk FOREIGN KEY (landname) REFERENCES land(landname),
  CONSTRAINT benutzer_mail CHECK (REGEXP_LIKE(mail,'.+\@.+\.[a-z]{2,3}')),
  CONSTRAINT benutzer_iban CHECK (REGEXP_LIKE(iban,'[A-Z]{2}[0-9]{24}')),
  CONSTRAINT benutzer_plz CHECK (REGEXP_LIKE(plz,'\d{5}'))
);

CREATE TABLE ferienwohnung
( ferienwohnung_id          INTEGER NOT NULL,
  fw_name                   VARCHAR(30) NOT NULL,
  plz                       INTEGER NOT NULL,
  hausnummer                VARCHAR(4) NOT NULL,
  strasse                   VARCHAR(30) NOT NULL, 
  preis                     INTEGER NOT NULL,
  groesse                   INTEGER NOT NULL,
  zimmeranzahl              INTEGER NOT NULL,
  landname                  VARCHAR(30) NOT NULL,
  CONSTRAINT fw_pk PRIMARY KEY(ferienwohnung_id),
  CONSTRAINT fw_landname FOREIGN KEY (landname) REFERENCES land(landname)
);

CREATE TABLE ausstattung
( ausstattungsname          VARCHAR(30) NOT NULL PRIMARY KEY
);

CREATE TABLE buchung 
(   ferienwohnung_id        INTEGER NOT NULL,
    buchung_nummer          INTEGER NOT NULL,
    anreisedatum            DATE NOT NULL,
    abreisedatum            DATE NOT NULL,
    buchung_datum           DATE NOT NULL,
    rechnung_nummer         INTEGER NOT NULL,
    rechnung_datum          DATE,
    rechnung_betrag         INTEGER,
    bewertung_nummer        INTEGER,
    sterne                  INTEGER,
    bewertung_datum         DATE,
    mail                    VARCHAR(50),
    CONSTRAINT buchung_pk PRIMARY KEY (buchung_nummer),
    CONSTRAINT buchung_fk FOREIGN KEY (mail) REFERENCES benutzer (mail),
    CONSTRAINT buchung_fk2 FOREIGN KEY (ferienwohnung_id) REFERENCES ferienwohnung (ferienwohnung_id),
    CONSTRAINT reisedatum CHECK (abreisedatum - anreisedatum >= 3),
    CONSTRAINT b_sterne CHECK (sterne <= 5 AND sterne >= 0)
);

CREATE TABLE storno 
(   ferienwohnung_id        INTEGER NOT NULL,
    stornbuchung_nummer     INTEGER NOT NULL,
    anreisedatum            DATE NOT NULL,
    abreisedatum            DATE NOT NULL,
    buchung_datum           DATE NOT NULL,
    rechnung_nummer         INTEGER NOT NULL,
    rechnung_datum          DATE,
    rechnung_betrag         INTEGER,
    bewertung_nummer        INTEGER,
    sterne                  INTEGER,
    bewertung_datum         DATE,
    mail                    VARCHAR(50),
    stornodatum             DATE NOT NULL,
    CONSTRAINT storno_pk PRIMARY KEY (stornbuchung_nummer),
    CONSTRAINT storno_fk FOREIGN KEY (mail) REFERENCES benutzer (mail),
    CONSTRAINT storno_fk2 FOREIGN KEY (ferienwohnung_id) REFERENCES ferienwohnung (ferienwohnung_id),
    CONSTRAINT stronreisedatum CHECK (abreisedatum - anreisedatum >= 3),
    CONSTRAINT stornb_sterne CHECK (sterne <= 5 AND sterne >= 0)
);


CREATE TABLE anzahlung
(   anzahlungsnummer            INTEGER NOT NULL,
    anzahlungsdatum             DATE NOT NULL,
    anzahlungsbetrag            INTEGER NOT NULL,
    buchung_nummer              INTEGER NOT NULL,
    CONSTRAINT anzahlung_nr     PRIMARY KEY (anzahlungsnummer),
    CONSTRAINT anzahlung_buchnr FOREIGN KEY (buchung_nummer) 
    REFERENCES buchung(buchung_nummer) 
    ON DELETE CASCADE
);

CREATE TABLE attraktion
(   attraktionsname             VARCHAR(30) NOT NULL,
    attraktionsbeschreibung     VARCHAR(100) NOT NULL,
    CONSTRAINT attraktion_name  PRIMARY KEY (attraktionsname)
);

CREATE TABLE beinhaltet
( ferienwohnung_id      INTEGER NOT NULL,
  ausstattungsname      VARCHAR(30),
  CONSTRAINT bein_pk PRIMARY KEY(ferienwohnung_id, ausstattungsname),
  CONSTRAINT bein_fk1 FOREIGN KEY(ferienwohnung_id) REFERENCES ferienwohnung(ferienwohnung_id),
  CONSTRAINT bein_fk2 FOREIGN KEY(ausstattungsname) REFERENCES ausstattung(ausstattungsname)
);

GRANT SELECT ON ferienwohnung TO dbsys09;
GRANT SELECT ON stadt TO dbsys09;
GRANT SELECT ON buchung TO dbsys09;
GRANT SELECT ON beinhaltet TO dbsys09;