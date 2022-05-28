package Servlets;

import BaseDatos.ConexionDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksanchezt1500
 */
@WebServlet(name = "InicioAdminS", urlPatterns = {"/InicioAdminS"})
public class InicioAdminS extends HttpServlet {

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
            
            String usuario = request.getParameter("usuarioad");
            String contra = request.getParameter("clavead");
            Boolean vent;
            vent=false;
            String userAdminBD="";
            String passAdminBD="";
            
            try{
                Connection con = ConexionDB.getConexionDB();
                PreparedStatement stm=con.prepareStatement("select * from administrador");
                ResultSet usuar=stm.executeQuery();
                while(usuar.next()){
                    userAdminBD=usuar.getString(4);
                    passAdminBD= usuar.getString(5);
                    if(userAdminBD.equals(usuario) && passAdminBD.equals(contra)){ 
                        vent=true;
                        String nombreAdminValue=usuar.getString(2);
                        String apellidoAdminValue=usuar.getString(3);
                        int idAdmin=usuar.getInt(1);
                        request.getSession().setAttribute("nombreAdminVar",nombreAdminValue);
                        request.getSession().setAttribute("apellidoAdminVar", apellidoAdminValue);
                        request.getSession().setAttribute("idKey",idAdmin);
                        break;  //Ya no se quiere seguir buscando 
                    }
                    
                }
                if(vent==true){
                    System.out.println("Bienvenido administrador");
                    
                    
                    
                    //Redireccionando a la página indicada 
                    response.sendRedirect("PrincAdmin.jsp");
                }
                else{
                     boolean indicador=true;  //Variable para mostrar el RECUADRO de credeneciales INCORRECTAS 
                    request.setAttribute("notFound", indicador);
                    request.getRequestDispatcher("InicioAdmin.jsp").forward(request, response);
                    
                }
                usuar.close();
                stm.close();
                con.close();
            }
            catch(IOException | SQLException ex){
                System.out.println("ERROR AL CONSULTAR");
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
