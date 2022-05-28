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
@WebServlet(name = "AgregarEmpaquetado", urlPatterns = {"/AgregarEmpaquetado"})
public class AgregarEmpaquetado extends HttpServlet {

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
            
            String id=request.getParameter("idpra");
            String alimento=request.getParameter("alimentopra");
            String costos=request.getParameter("costopra");
            String foto=request.getParameter("imagenpra");
            String descripcion=request.getParameter("descpra");
            String cantidads=request.getParameter("cantidadpra");
            String calorias=request.getParameter("caloriaspra");
            String grasas=request.getParameter("grasaspra");
            String colesterols=request.getParameter("colesterolpra");
            String sodios=request.getParameter("sodiopra");
            String potasios=request.getParameter("potasiopra");
            String carbs=request.getParameter("carpra");
            String proteinas=request.getParameter("proteinaspra");
            float costo=Float.parseFloat(costos);
            float cantidad=Float.parseFloat(cantidads);
            float caloria=Float.parseFloat(calorias);
            float grasa=Float.parseFloat(grasas);
            float colesterol=Float.parseFloat(colesterols);
            float sodio=Float.parseFloat(sodios);
            float potasio=Float.parseFloat(potasios);
            float carb=Float.parseFloat(carbs);
            float proteina=Float.parseFloat(proteinas);
            try{
                Connection con = ConexionDB.getConexionDB();
                Statement stm=con.createStatement();
                stm.executeUpdate("insert into alimentos (id,alimento,tipo,costo,foto,descripcion,cantidad,"
                + "calorias,grasastotales,colesterol,sodio,potasio,carbohidratos,proteinas) values('"+id+"','"
                + ""+alimento+"','EMPAQUETADO',"+costo+",'"+foto+"','"+descripcion+"',"+cantidad+","+caloria+","
                + ""+grasa+","+colesterol+","+sodio+","+potasio+","+carb+","+proteina+")");

                stm.close();
                con.close();
                response.sendRedirect("EditEmpaquetado.jsp");
            }
            catch(SQLException e){
                System.out.println("ERROR AL INSERTAR EMPAQUETADO");
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
