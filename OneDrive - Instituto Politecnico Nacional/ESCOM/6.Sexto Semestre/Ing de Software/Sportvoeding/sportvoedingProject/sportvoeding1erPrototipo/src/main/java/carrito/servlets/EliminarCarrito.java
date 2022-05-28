
package carrito.servlets;

import carrito.classes.Articulo;
import carrito.classes.Producto;
import carrito.controllers.ControladorProducto;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EliminarCarrito extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String idproducto = request.getParameter("idproducto");
        
        HttpSession sesion2 = request.getSession(true);
        ArrayList<Articulo> articulos = sesion2.getAttribute("carrito1") == null ? null : (ArrayList) sesion2.getAttribute("carrito1");
        
        //Borrando el artículo del carrito 
        if(articulos != null){
            for(Articulo a : articulos){                
                if(a.getIdProducto().equals(idproducto)){
                    articulos.remove(a);
                    break;
                }
            }
        }
        
        double total = 0;
        ControladorProducto cp = new ControladorProducto();
        
        
        for(Articulo a : articulos){                
            Producto producto = cp.getProducto(a.getIdProducto());
            total += a.getCant() * producto.getCosto();            
        }
        
        response.getWriter().print(Math.round(total * 100.0) /100.0);
        System.out.println("Estoy hasta aca");
        System.out.println(idproducto);
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
