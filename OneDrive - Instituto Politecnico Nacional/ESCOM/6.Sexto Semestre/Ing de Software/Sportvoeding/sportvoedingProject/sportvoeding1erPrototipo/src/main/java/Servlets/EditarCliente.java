package Servlets;

import BaseDatos.ConexionDB;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksanchezt1500
 */
@WebServlet(name = "EditarCliente", urlPatterns = {"/EditarCliente"})
public class EditarCliente extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String ids=request.getParameter("idced");
            String nombre=request.getParameter("nombreced");
            String apellido=request.getParameter("apeced");
            String correo=request.getParameter("usuarioced");
            String clave=request.getParameter("claveced");
            String sexo=request.getParameter("sexoced");
            String escuela=request.getParameter("escuelaced");
            String dinero=request.getParameter("dineroced");
            String numero=request.getParameter("numeroced");
            int id=parseInt(ids);
            try{
                Connection con = ConexionDB.getConexionDB();
                Statement stm=con.createStatement();
                stm.executeUpdate("UPDATE cliente SET id="+id+",nombre='"+nombre+"',"
                + "apellidos='"+apellido+"',correo='"+correo+"',clave='"+clave+"',"
                + "sexo='"+sexo+"',"
                + "escuela='"+escuela+"',dinero="+dinero+",numero='"+numero+"' WHERE id="+id+"");
                
                stm.close();
                con.close();
                response.sendRedirect("EditCliente.jsp");
            }
            catch(SQLException e){
                System.out.println("ERROR AL EDITAR CLIENTE");
            }
        }
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
