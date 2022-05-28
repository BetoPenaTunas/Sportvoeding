package BaseDatos;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author ksanchezt1500
 */
public class ConexionDB {
    
    
    public static Connection getConexionDB(){
        Connection ConexionDB = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            try {
                ConexionDB=DriverManager.getConnection("jdbc:mysql://localhost/sport", "root", "admin");

            } catch (SQLException ex) {
                Logger.getLogger(ConexionDB.class.getName()).log(Level.SEVERE, null, ex);
            }
            System.out.println("EXITO AL CONECTAR CON LA BASE");
        } catch (ClassNotFoundException ex) {
            System.out.println("ERROR AL CONECTAR CON LA BASE");
        }
        return ConexionDB;
    }
}
