
package carrito.servlets;

import BaseDatos.ConexionDB;
import carrito.classes.Articulo;
import carrito.classes.Producto;
import carrito.controllers.ControladorProducto;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Ventas", urlPatterns = {"/Ventas"})
public class Ventas extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        int cliente = Integer.parseInt(request.getParameter("cliente"));
        String salon = request.getParameter("salon1");
        float total1 = Float.parseFloat(request.getParameter("dint"));
        float din = Float.parseFloat(request.getParameter("dineromomento"));
        float dinero = din-total1;
        System.out.println(salon);
        System.out.println(total1);
        System.out.println(dinero);
        HttpSession sesion2 = request.getSession(true);
        List<Articulo> articulos = sesion2.getAttribute("carrito1")== null ? new ArrayList<>() : (List) sesion2.getAttribute("carrito1");
        ControladorProducto cp = new ControladorProducto();
        if(articulos!=null){
            for(Articulo a: articulos){
                Producto producto = cp.getProducto(a.getIdProducto());
                System.out.println(producto.getId());
                System.out.println(a.getCant());
                try{
                Connection con = ConexionDB.getConexionDB();
                Statement stm=con.createStatement();
                stm.executeUpdate("insert into ventas"
                + "(id_cliente,id_alimento,cantidad,costo,salon)values("+cliente+",'"+producto.getId()+"'"
                + ","+a.getCant()+","+producto.getCosto()*a.getCant()+",'"+salon+"')");
                stm.close();
                con.close();
                System.out.println("ya estan dentro man");
            }
            catch(SQLException e){
                System.out.println("Error bro :'(");
            }
            }
            try{
                Connection con = ConexionDB.getConexionDB();
                Statement stm=con.createStatement();
                stm.executeUpdate("insert into total"
                + "(id_cliente,total)values("+cliente+","+total1+")");
                stm.close();
                con.close();
                System.out.println("ya estan dentro man 2.0");
            }
            catch(SQLException e){
                System.out.println("Error bro :'( chale");
            }
            try{
                Connection con = ConexionDB.getConexionDB();
                Statement stm=con.createStatement();
                stm.executeUpdate("UPDATE cliente SET dinero="+dinero+""
                + "where id="+cliente+"");
                stm.close();
                con.close();
                System.out.println("ya estan dentro man 3.0");
            }
            catch(SQLException e){
                System.out.println("Error bro :'( chale con el dinero");
            }
        }
        response.sendRedirect("InicioCliente.jsp?id="+cliente+"");
        articulos.clear();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
