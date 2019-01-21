import java.sql.*;
import java.io.Console;


public class TUI {

    public static void main (String[] args){
        try {
           /* Class.forName("oracle.jdbc.driver.OracleDriver");
            String url = "jdbc:oracle:thin:@oracle12c.in.htwgkonstanz.de:1521:ora12c";
            Connection conn = DriverManager.getConnection(url, "dbsys08", "NiggySchiggy");
            Statement stmt = conn.createStatement();
            ResultSet rs1 = stmt.executeQuery("SELECT mail, kundennummer FROM benutzer");
*/
            Console console = System.console();
            String input = console.readLine("user: ");
            String[] splitStr = input.split("\\s+");
            System.out.println(splitStr);


/*            while (rs1.next()) {
                String r1 = rs1.getString("name");
                int r2 = rs1.getInt("gehalt");
                System.out.println(r1 + " verdient " + r2);
            }
            rs1.close(); stmt.close(); conn.close();
*/


        } catch (Exception e){
            System.out.println("fehler: " + e);
        }


    }


}
