
package carrito.models;

import Modelo.Conexion;
import carrito.classes.Producto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ModeloProducto {
    Connection con;
    Conexion cn = new Conexion();
    public ArrayList<Producto> getAllProductos(){
        ArrayList<Producto> productos = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
//            String sql = "call selectalimentos()";
            String sql ="select * from alimentos";
            pst = cn.getConnection().prepareCall(sql);
            rs = pst.executeQuery();
            while(rs.next()){
                productos.add(new Producto(rs.getString("id"),rs.getString("alimento"
                + ""),rs.getString("tipo"),rs.getFloat("costo"),rs.getString("foto"
                + ""),rs.getString("descripcion"),rs.getFloat("cantidad"),rs.getFloat("calorias"
                + ""),rs.getFloat("grasastotales"),rs.getFloat("colesterol"),rs.getFloat("sodio"
                + ""),rs.getFloat("potasio"),rs.getFloat("carbohidratos"),rs.getFloat("proteinas")));
            }
        } catch (Exception e) {
            System.out.println("ERROR AL OBTENER DATOS DE LISTA");
        } finally{
            try {
                if(rs != null) rs.close();
                if(pst != null) pst.close();
                if(cn.getConnection() != null){ cn.getConnection().close();}
            } catch (Exception e) {
                System.out.println("Error: "+e);
            }
        }       
        return productos;        
    }
    
    public Producto getProducto(String id){
        Producto producto = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "select * from alimentos where id=(?)";
            pst = cn.getConnection().prepareCall(sql);
            pst.setString(1, id);
            rs = pst.executeQuery();
            while(rs.next()){
                producto = new Producto(rs.getString("id"),rs.getString("alimento"
                + ""),rs.getString("tipo"),rs.getFloat("costo"),rs.getString("foto"
                + ""),rs.getString("descripcion"),rs.getFloat("cantidad"),rs.getFloat("calorias"
                + ""),rs.getFloat("grasastotales"),rs.getFloat("colesterol"),rs.getFloat("sodio"
                + ""),rs.getFloat("potasio"),rs.getFloat("carbohidratos"),rs.getFloat("proteinas"));
            }
            System.out.println("EXITO AL ENCONTRAR LA INFORMACIÓN");
        } catch (Exception e) {
            System.out.println("ERROR AL OBTENER DATOS DE LISTA 2");
        } finally{
            try {
                if(rs != null) rs.close();
                if(pst != null) pst.close();
                if(cn.getConnection() != null) cn.getConnection().close();
            } catch (Exception e) {
            }
        }       
        return producto;
        
    } 
}
