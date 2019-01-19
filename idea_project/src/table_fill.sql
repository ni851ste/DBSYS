DROP SEQUENCE fwID;
DROP SEQUENCE anzNr;
DROP SEQUENCE buchID;
DROP SEQUENCE benutzerNO;


CREATE SEQUENCE anzNR INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE fwID INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE buchID INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE benutzerNO INCREMENT BY 1 START WITH 1;

INSERT INTO land VALUES('Deutschland');
INSERT INTO land VALUES('Brasilien');
INSERT INTO land VALUES('Katar');
INSERT INTO land VALUES('Spanien');

INSERT INTO ausstattung VALUES('Sauna');
INSERT INTO ausstattung VALUES('Fernseher');
INSERT INTO ausstattung VALUES('Pool');
INSERT INTO ausstattung VALUES('Playstation');
INSERT INTO ausstattung VALUES('Grill');
INSERT INTO ausstattung VALUES('Internet');
INSERT INTO ausstattung VALUES('WLAN');
INSERT INTO ausstattung VALUES('DVD-Player');
INSERT INTO ausstattung VALUES('Buecher');
INSERT INTO ausstattung VALUES('Safe');
INSERT INTO ausstattung VALUES('Kaffeevollautomat');
INSERT INTO ausstattung VALUES('Waschmaschine');
INSERT INTO ausstattung VALUES('Kuehlschrank');
INSERT INTO ausstattung VALUES('Parkplatz');

INSERT INTO stadt VALUES(21001,'Huelva');
INSERT INTO stadt VALUES(21337,'Lueneburg');
INSERT INTO stadt VALUES(74892,'Sevilla');
INSERT INTO stadt VALUES(15328,'Rio de Janeiro');
INSERT INTO stadt VALUES(15330,'Sao Paulo');
INSERT INTO stadt VALUES(20095,'Hamburg');
INSERT INTO stadt VALUES(20251,'Hamburg');
INSERT INTO stadt VALUES(24103,'Kiel');
INSERT INTO stadt VALUES(92836,'Sklavenhausen');
INSERT INTO stadt VALUES(12726,'Buxdehude');
INSERT INTO stadt VALUES(79725,'Laufenburg');

INSERT INTO benutzer (mail,kundennummer,benutzername,iban,plz,hausnummer,strasse,passwort,landname, anzBuch, anzStorno, summeBezahlt)
VALUES ('blabla@gmail.com', benutzerNO.NextVal,'ballab','DE101010101010101010101010', 21337, '6a', 'Bahnerallee', 'test123', 'Deutschland', 0, 0, 0);

INSERT INTO benutzer (mail, kundennummer,benutzername,iban,plz,hausnummer,strasse,passwort,landname, anzBuch, anzStorno, summeBezahlt)
VALUES ('zellner@gmail.com', benutzerNO.NextVal,'jzellner98','DE501010101010101010101010', 24103, '5b', 'Strasse', 'mamaiscool', 'Deutschland', 0, 0, 0);


INSERT INTO ferienwohnung(ferienwohnung_ID,fw_name, plz, hausnummer, strasse, preis, groesse, zimmeranzahl, landname)
    VALUES(fwID.NextVal,'Alpenrose', 21337, '14', 'Bahnerallee', 575, 255, 12, 'Deutschland');    
INSERT INTO beinhaltet VALUES(1,'Sauna');
INSERT INTO beinhaltet VALUES(1,'Fernseher');
    
INSERT INTO ferienwohnung(ferienwohnung_ID,fw_name, plz, hausnummer, strasse, preis, groesse, zimmeranzahl, landname)
    VALUES(fwID.NextVal,'Nik mit K', 21337, '69', 'Juergen-Backhaus-Strasse', 1, 150, 15, 'Deutschland');
INSERT INTO beinhaltet VALUES(2,'Fernseher');
INSERT INTO beinhaltet VALUES(2,'WLAN');
INSERT INTO beinhaltet VALUES(2,'Kuehlschrank');

    
INSERT INTO ferienwohnung(ferienwohnung_ID,fw_name, plz, hausnummer, strasse, preis, groesse, zimmeranzahl, landname)
    VALUES(fwID.NextVal,'Traum am Meer', 74892, '12c', 'Seestrasse', 325, 134, 4, 'Spanien');  
INSERT INTO beinhaltet VALUES(3,'Fernseher');
INSERT INTO beinhaltet VALUES(3,'WLAN');
INSERT INTO beinhaltet VALUES(3,'Kuehlschrank');
INSERT INTO beinhaltet VALUES(3,'Sauna');
INSERT INTO beinhaltet VALUES(3,'Safe');
INSERT INTO beinhaltet VALUES(3,'Parkplatz');

INSERT INTO ferienwohnung(ferienwohnung_ID,fw_name, plz, hausnummer, strasse, preis, groesse, zimmeranzahl, landname)
    VALUES(fwID.NextVal,'Mehr als Meer', 74892, '1', 'Beach Blv', 750, 350, 9, 'Brasilien');
    
INSERT INTO ferienwohnung(ferienwohnung_ID,fw_name, plz, hausnummer, strasse, preis, groesse, zimmeranzahl, landname)
    VALUES(fwID.NextVal,'Kann er Val', 15330, '432f', 'Karnevalstr', 548, 303, 7, 'Brasilien');
    
INSERT INTO ferienwohnung(ferienwohnung_ID,fw_name, plz, hausnummer, strasse, preis, groesse, zimmeranzahl, landname)
    VALUES(fwID.NextVal,'Kiezblick', 20095, '231', 'Reeperbahn', 431, 120, 4, 'Deutschland');  

INSERT INTO ferienwohnung(ferienwohnung_ID,fw_name, plz, hausnummer, strasse, preis, groesse, zimmeranzahl, landname)
    VALUES(fwID.NextVal,'Am Hafen', 20251, '48b', 'Thaliastrasse', 60, 5, 1, 'Deutschland');
    
INSERT INTO ferienwohnung(ferienwohnung_ID,fw_name, plz, hausnummer, strasse, preis, groesse, zimmeranzahl, landname)
    VALUES(fwID.NextVal,'Kiel Holen', 24103, '4a', 'Schwanenweg', 144, 58, 3, 'Deutschland');

INSERT INTO ferienwohnung(ferienwohnung_ID, fw_name, plz, hausnummer, strasse, preis, groesse, zimmeranzahl, landname)
	VALUES(fwID.NextVal, 'Zum goldenen Schuss', 12726, '12F', 'Spraehschiessgasse', 2, 3, 1, 'Deutschland');

INSERT INTO ferienwohnung(ferienwohnung_ID, fw_name, plz, hausnummer, strasse, preis, groesse, zimmeranzahl, landname)
	VALUES(fwID.NextVal, 'Fussball ist unser Leben', 92836, '1', 'Barfussgasse', 12, 32, 5, 'Katar');

INSERT INTO ferienwohnung(ferienwohnung_ID, fw_name, plz, hausnummer, strasse, preis, groesse, zimmeranzahl, landname)
	VALUES(fwID.NextVal, 'Hotel Mama', 79725, '16A', 'Ledergasse', 503, 420, 17, 'Deutschland');

INSERT INTO ferienwohnung(ferienwohnung_ID, fw_name, plz, hausnummer, strasse, preis, groesse, zimmeranzahl, landname)
	VALUES(fwID.NextVal, 'Los Pollos', 21001, '4', 'Haehnchengasse', 23, 40, 3, 'Spanien');
INSERT INTO beinhaltet VALUES(12,'Fernseher');
INSERT INTO beinhaltet VALUES(12,'WLAN');
INSERT INTO beinhaltet VALUES(12,'Kuehlschrank');
INSERT INTO beinhaltet VALUES(12,'Sauna');
INSERT INTO beinhaltet VALUES(12,'Grill');
INSERT INTO beinhaltet VALUES(12,'Playstation');


INSERT INTO buchung  (ferienwohnung_id, buchung_nummer, anreisedatum, abreisedatum, buchung_datum, rechnung_nummer, rechnung_datum, rechnung_betrag, bewertung_nummer, sterne, bewertung_datum, mail)
    VALUES (3, buchID.NextVal, '10.05.2016', '24.05.2016', '01.05.2016', buchID.CurrVal, '28.05.2016', 1500, buchID.CurrVal, 5, '29.05.2016', 'zellner@gmail.com');
INSERT INTO buchung  (ferienwohnung_id, buchung_nummer, anreisedatum, abreisedatum, buchung_datum, rechnung_nummer, rechnung_datum, rechnung_betrag, bewertung_nummer, sterne, bewertung_datum, mail)
    VALUES (2, buchID.NextVal, '01.12.2019', '30.01.2020', '15.07.2018', buchID.CurrVal, '02.02.2020', 12345, buchID.CurrVal, 3, '02.12.2018', 'zellner@gmail.com');
INSERT INTO buchung  (ferienwohnung_id, buchung_nummer, anreisedatum, abreisedatum, buchung_datum, rechnung_nummer, rechnung_datum, rechnung_betrag, bewertung_nummer, sterne, bewertung_datum, mail)
    VALUES (12, buchID.NextVal, '02.12.2019', '01.02.2020', '20.07.2018', buchID.CurrVal, '02.02.2020', 420, buchID.CurrVal, 5, '05.12.2018', 'zellner@gmail.com');
INSERT INTO buchung  (ferienwohnung_id, buchung_nummer, anreisedatum, abreisedatum, buchung_datum, rechnung_nummer, rechnung_datum, rechnung_betrag, bewertung_nummer, sterne, bewertung_datum, mail)
    VALUES (3, buchID.NextVal, '10.10.2019', '29.10.2019', '01.10.2018', buchID.CurrVal, '10.11.2018', 1350, buchID.CurrVal, 5, '11.11.2018', 'zellner@gmail.com');
INSERT INTO buchung  (ferienwohnung_id, buchung_nummer, anreisedatum, abreisedatum, buchung_datum, rechnung_nummer, rechnung_datum, rechnung_betrag, bewertung_nummer, sterne, bewertung_datum, mail)
    VALUES (1, buchID.NextVal, '11.10.2018', '28.10.2018', '03.09.2018', buchID.CurrVal, '28.11.2018', 977, buchID.CurrVal, 5, '28.11.2018', 'blabla@gmail.com');
INSERT INTO buchung  (ferienwohnung_id, buchung_nummer, anreisedatum, abreisedatum, buchung_datum, rechnung_nummer, rechnung_datum, rechnung_betrag, bewertung_nummer, sterne, bewertung_datum, mail)
    VALUES (12, buchID.NextVal, '15.10.2018', '22.10.2018', '19.10.2018', buchID.CurrVal, '28.11.2018', 123456, buchID.CurrVal, 4, '05.12.2018', 'zellner@gmail.com');

INSERT INTO anzahlung (anzahlungsnummer, anzahlungsdatum, anzahlungsbetrag, buchung_nummer)
    VALUES (anzNR.NextVal, '05.05.2016', 10, 1);
INSERT INTO anzahlung (anzahlungsnummer, anzahlungsdatum, anzahlungsbetrag, buchung_nummer)
    VALUES (anzNR.NextVal, '30.11.2018', 15, 2);
INSERT INTO anzahlung (anzahlungsnummer, anzahlungsdatum, anzahlungsbetrag, buchung_nummer)
    VALUES (anzNR.NextVal, '10.10.2018', 115, 5);