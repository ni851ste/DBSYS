/* Stornierungen */
CREATE OR REPLACE TRIGGER storno_trigger
    BEFORE DELETE ON buchung
    FOR EACH ROW
BEGIN
    INSERT INTO storno
        VALUES(:old.ferienwohnung_id, :old.buchung_nummer, :old.anreisedatum,:old.abreisedatum,:old.buchung_datum,:old.rechnung_nummer,
        :old.rechnung_datum,:old.rechnung_betrag,:old.bewertung_nummer,:old.sterne,:old.bewertung_datum,:old.mail, SYSDATE);
END;
/





CREATE OR REPLACE TRIGGER kundenstatistikTrig
AFTER INSERT ON buchung
FOR EACH ROW
BEGIN
    UPDATE benutzer SET anzBuch = anzBuch + 1 WHERE benutzer.mail = :new.mail;
    UPDATE benutzer SET summeBezahlt = summeBezahlt + :new.rechnung_betrag WHERE benutzer.mail = :new.mail;    
END;
/

CREATE OR REPLACE TRIGGER stornoCount_trigger
    AFTER DELETE ON buchung
    FOR EACH ROW
BEGIN
    UPDATE benutzer SET anzStorno = anzStorno + 1 WHERE benutzer.mail = :old.mail;
END;
/