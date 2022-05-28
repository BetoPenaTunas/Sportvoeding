package Modelo;

import BaseDatos.ConexionDB;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Conexion {
    Connection con;

    public Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");

            try {
                con = DriverManager.getConnection("jdbc:mysql://localhost/sport", "root", "admin");

            } catch (SQLException ex) {
                Logger.getLogger(ConexionDB.class.getName()).log(Level.SEVERE, null, ex);
            }
            System.out.println("EXITO AL CONECTAR CON LA BASE");
        } catch (ClassNotFoundException ex) {
            System.out.println("ERROR AL CONECTAR CON LA BASE");
        }
        return con;
    }
}
