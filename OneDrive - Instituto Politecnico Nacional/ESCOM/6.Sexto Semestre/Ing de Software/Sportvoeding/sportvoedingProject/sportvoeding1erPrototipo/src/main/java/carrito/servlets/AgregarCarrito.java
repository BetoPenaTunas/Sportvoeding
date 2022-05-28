package carrito.servlets;

import carrito.classes.Articulo;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class AgregarCarrito extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        int cantidad = Integer.parseInt(request.getParameter("cant"));
        String idproducto = request.getParameter("idproducto");
        
        response.getWriter().print(cantidad+" "+idproducto);
        
        HttpSession sesion2 = request.getSession(true);
        List<Articulo> articulos = sesion2.getAttribute("carrito1")== null ? new ArrayList<>() : (List) sesion2.getAttribute("carrito1");
      
        
        boolean flag = false;
        if (articulos.size() > 0) {
            for (Articulo a : articulos) {
                if (idproducto.equals(a.getIdProducto())) {
                    a.setCant(a.getCant() + cantidad);
                    flag = true;
                    break;
                }
            }
        }

        if (!flag) {
            articulos.add(new Articulo(idproducto, cantidad));
            
        }
        
        sesion2.setAttribute("carrito1", articulos);
        response.sendRedirect("Carrito.jsp");
        System.out.println("YA VAMOS");
        
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
