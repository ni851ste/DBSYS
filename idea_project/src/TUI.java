import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;



public class TUI {

    public static void main (String[] args){
        //try {
           /* Class.forName("oracle.jdbc.driver.OracleDriver");
            String url = "jdbc:oracle:thin:@oracle12c.in.htwgkonstanz.de:1521:ora12c";
            Connection conn = DriverManager.getConnection(url, "dbsys08", "NiggySchiggy");
            Statement stmt = conn.createStatement();

            ResultSet search = stmt.executeQuery("
                SELECT fw_name, ferienwohnung_id, AVG(sterne)
                FROM dbsys08.ferienwohnung fw,dbsys08.buchung b
                WHERE fw.landname = 'Spanien' AND b.ferienwohnung_ID = fw.ferienwohnung_ID
                GROUP BY fw_name;"
            );

            ResultSet book = stmt.executeQuery("
                INSERT INTO dbsys08.buchung  (ferienwohnung_id, buchung_nummer, anreisedatum, abreisedatum, buchung_datum, rechnung_nummer, rechnung_datum, rechnung_betrag, bewertung_nummer, sterne, bewertung_datum, mail)
                VALUES (3, buchID.NextVal, '10.05.2016', '24.05.2016', '01.05.2016', buchID.CurrVal, '28.05.2016', 1500, buchID.CurrVal, 5, '29.05.2016', 'zellner@gmail.com');
                ");


            } catch (Exception e){
            System.out.println("fehler: " + e);
            }

*/
            BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        while (true) {
            String s;
            try {
                System.out.println("-s <Land> <Anreisedatum> <Abreisedatum> <OPTIONAL Ausstattung>");
                //returns buchungsnummer
                System.out.println("-b <FW_ID> <BenutzerID> <Anreisedatum> <Abreisedatum>:");
                System.out.println("Befehl eingeben hier eingeben. Datum in DD.MM.YYYY.");

                s = br.readLine();
                String[] splitStr = s.split("\\s+");
                switch (splitStr[0]){
                    case "exit": System.exit(0);
                    case "-s":    ;
                    case "-b":   conn.commit() ;
                }

                for (String str : splitStr)
                    System.out.println(str);
            } catch (IOException nfe) {
                System.out.println("Fehler beim Lesen aufgetreten");
            }
        }


/*            while (rs1.next()) {
                String r1 = rs1.getString("name");
                int r2 = rs1.getInt("gehalt");
                System.out.println(r1 + " verdient " + r2);
            }
            rs1.close(); stmt.close(); conn.close();
*/





    }


}
