/* 1. */
SELECT stadtname,COUNT(*)
FROM dbsys08.stadt,dbsys08.ferienwohnung
WHERE (stadt.plz = ferienwohnung.plz)
GROUP BY (stadt.stadtname);

/* 2. */
SELECT fw_name, AVG(sterne)
FROM dbsys08.ferienwohnung fw,dbsys08.buchung b
WHERE fw.landname = 'Spanien' AND b.ferienwohnung_ID = fw.ferienwohnung_ID
GROUP BY fw_name
HAVING AVG (sterne) > 4;


/* 3. */
CREATE OR REPLACE VIEW AUFGABECOUNTER AS
SELECT ferienwohnung_id, COUNT (ausstattungsname) as summe
FROM dbsys08.beinhaltet
GROUP BY ferienwohnung_id;

SELECT ferienwohnung_id, summe
FROM AUFGABECOUNTER
WHERE summe = (SELECT MAX(summe) FROM AUFGABECOUNTER);

/* 4. */
SELECT fw.landname, COUNT(buchung_nummer) AS nummerBuchung
FROM dbsys08.buchung b
RIGHT JOIN dbsys08.ferienwohnung fw ON b.ferienwohnung_id = fw.ferienwohnung_id
WHERE b.anreisedatum IS NULL OR b.anreisedatum > SYSDATE
GROUP BY fw.landname
ORDER BY nummerBuchung DESC;

/* 5. */
CREATE OR REPLACE VIEW SaunasInSpanien AS
SELECT fw.ferienwohnung_id, fw.fw_name
FROM dbsys08.ferienwohnung fw, dbsys08.beinhaltet b
WHERE fw.landname = 'Spanien' AND fw.ferienwohnung_id = b.ferienwohnung_id AND b.ausstattungsname = 'Sauna';

CREATE OR REPLACE VIEW Zeitspanne AS
SELECT ferienwohnung_id
FROM dbsys08.buchung
WHERE (anreisedatum BETWEEN ('01.11.2018') AND ('21.11.2018'))
OR (abreisedatum BETWEEN ('01.11.2018') AND ('21.11.2018'))
OR (anreisedatum < ('01.11.2018') and abreisedatum > ('21.11.2018'));

SELECT AVG(sterne) AS sterne, fw_name
FROM dbsys08.buchung b RIGHT OUTER JOIN SaunasInSpanien ON b.ferienwohnung_id = SaunasInSpanien.ferienwohnung_id
WHERE SaunasInSpanien.ferienwohnung_id NOT IN (SELECT ferienwohnung_id FROM Zeitspanne)
GROUP BY fw_name
ORDER BY sterne DESC


