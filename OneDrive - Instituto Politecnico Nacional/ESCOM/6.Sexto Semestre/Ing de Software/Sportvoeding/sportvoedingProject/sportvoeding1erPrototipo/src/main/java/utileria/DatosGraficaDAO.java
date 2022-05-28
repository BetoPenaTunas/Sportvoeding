package utileria;
import java.sql.*;
import java.util.*;
public class DatosGraficaDAO {
    
    private Connection con = null;
    private String URL = "jdbc:mysql://localhost:3306/dvoladini";

    private Connection getConnection() {

        String driverBD = "com.mysql.cj.jdbc.Driver";

        try {
            Class.forName(driverBD);
            con = DriverManager.getConnection(URL, "root", "admin");

        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }

        return con;
    }
    
    public List graficar(String tipo/*PRP,BBD,EMP*/){
        
        getConnection();
        PreparedStatement ps=null;
        ResultSet rs=null;
        List list=null;
        String query = "select v.id_alimento AS IDAL, a.alimento AS PRODUCTO, v.cantidad AS CANTIDAD FROM ventas v join total t on(v.id_cliente = t.id_cliente \n" +
"                             AND v.fecha = t.fecha) JOIN alimentos a on (v.id_alimento = a.id) where v.id_alimento like '%"+tipo+"%'";
        
        try{
            
            ps=con.prepareStatement(query);
            rs=ps.executeQuery();
            list=obtenerDatos(rs); 
            
            if(list.size()>0){
                return list;
            }
            else{
                return null;
            }
            
        
        }catch(SQLException ex){
            System.out.println("**"+ex);
        }finally{
            
            try{
                
                if(rs!=null){
                    rs.close();
                }
                
                if(ps!=null){
                    ps.close();
                }
                if(con!=null){
                    con.close();
                }
                
                
            }catch(Exception ex){
                System.out.println(ex);
            }
        
        }
        return list;
        
    }
    
    public List obtenerDatos(ResultSet rs){
        
        List list = new ArrayList();
        
        try {
            while (rs.next()) {
                
                DatosGraficaDTO dto= new DatosGraficaDTO();
                dto.setIdal(rs.getString(1)); 
                dto.setProducto(rs.getString(2)); 
                dto.setCantidad(rs.getInt(3));
                list.add(dto); 

            }
        }catch(SQLException ex){
            System.out.println(ex);
        }
        
        return list;
    }
    
    public DatosGraficaDTO getCantidadPorCategorias(List<DatosGraficaDTO> categorias, String tipo) {
        
        
        if (categorias!=null) {
            
            List noProductosPorCategoria = new ArrayList();
            int cantidadTotal = 0;
            for (DatosGraficaDTO categoria : categorias) {
                cantidadTotal += categoria.getCantidad();
            }

            DatosGraficaDTO cantPorTipo = new DatosGraficaDTO();
            cantPorTipo.setTipo(tipo);
            cantPorTipo.setCantidadTotalTipo(cantidadTotal);
            return cantPorTipo;
        } else {
            return null;
        }
    }
    
    
    public static void main(String [] args){
        DatosGraficaDAO dao= new DatosGraficaDAO();
        System.out.println(dao.graficar("EMP"));
        
        //Obteniendo datos a graficar 
        
        DatosGraficaDTO datos= new DatosGraficaDTO();
        
        datos = dao.getCantidadPorCategorias(dao.graficar("PRP"), "PRP");
        
        if(datos!=null){
            System.out.println("Hay "+datos.getCantidadTotalTipo()+" productos de la categoría: "+datos.getTipo());
        }
        
    }
    
    
}
