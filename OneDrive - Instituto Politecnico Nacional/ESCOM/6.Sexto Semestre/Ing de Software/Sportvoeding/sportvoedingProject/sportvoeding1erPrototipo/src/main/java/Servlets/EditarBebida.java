
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
@WebServlet(name = "EditarBebida", urlPatterns = {"/EditarBebida"})
public class EditarBebida extends HttpServlet {

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
            
            String id=request.getParameter("idpred");
            String alimento=request.getParameter("alimentopred");
            String costos=request.getParameter("costopred");
            String foto=request.getParameter("imagenpred");
            String descripcion=request.getParameter("descpred");
            String cantidads=request.getParameter("cantidadpred");
            String calorias=request.getParameter("caloriaspred");
            String grasas=request.getParameter("grasaspred");
            String colesterols=request.getParameter("colesterolpred");
            String sodios=request.getParameter("sodiopred");
            String potasios=request.getParameter("potasiopred");
            String carbs=request.getParameter("carpred");
            String proteinas=request.getParameter("proteinaspred");
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
                stm.executeUpdate("UPDATE alimentos SET id='"+id+"',"
                + "alimento='"+alimento+"',tipo='BEBIDA',costo="+costo+",foto='"+foto+"',descripcion='"+descripcion+"',"
                + "cantidad="+cantidad+",calorias="+caloria+",grasastotales="+grasa+",colesterol="+colesterol+","
                + "sodio="+sodio+",potasio="+potasio+",carbohidratos="+carb+","
                + "proteinas="+proteina+" WHERE id='"+id+"'");

                stm.close();
                con.close();
                response.sendRedirect("EditBebida.jsp");
            }
            catch(SQLException e){
                System.out.println("ERROR AL EDITAR BEBIDA");
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
