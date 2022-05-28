package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PersonaDAO implements Validar{
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    
    @Override
    public int validar(Persona per){
        int r=0;
        String sql = "select * from cliente WHERE correo=? AND clave=?";
        try{
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, per.getCorreo());
            ps.setString(2, per.getClave());
            rs=ps.executeQuery();   //Esto retornará un registro;
            while(rs.next()){
                r+=1;   //Se incrementa en 1, por que el ResultSet tendrá un sólo registro por recorrer
                per.setId(rs.getInt("id"));
                per.setNombre(rs.getString("nombre"));
                per.setApellidos(rs.getString("apellidos"));
                per.setCorreo(rs.getString("correo"));
                per.setClave(rs.getString("clave"));
                per.setEscuela(rs.getString("escuela"));
                per.setDinero(rs.getFloat("dinero"));
                per.setNumero(rs.getString("numero"));
            }
            if(r==1){   //Si se recorre una vez, significa que sí encontró el registro
                return 1;
            }else{
                return 0;   //Si r!=1 significa que ResultSet está vacio
            }
        } catch (SQLException e) {
            System.out.println(e);
            System.out.println("Error Al Obtener Datos");
            return 0;
        }
    }
}
