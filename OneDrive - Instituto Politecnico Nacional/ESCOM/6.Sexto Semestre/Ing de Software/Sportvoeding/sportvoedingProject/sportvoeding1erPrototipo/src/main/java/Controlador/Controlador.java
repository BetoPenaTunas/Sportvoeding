package Controlador;
import Modelo.Persona;
import Modelo.PersonaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Controlador", urlPatterns = {"/Controlador"})
public class Controlador extends HttpServlet {
    PersonaDAO dao = new PersonaDAO();
    Persona p = new Persona();
    int r;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String accion = request.getParameter("accion");
            
            if(accion.equals("Ingresar"))
            {
                String nom=request.getParameter("usuario");
                String clave=request.getParameter("contra");
                p.setCorreo(nom);
                p.setClave(clave);
                r=dao.validar(p);
                if(r==1){
                    request.getSession().setAttribute("id", p.getId());
                    request.getSession().setAttribute("escuela", p.getEscuela());
                    request.getSession().setAttribute("nombre", p.getNombre());
                    request.getSession().setAttribute("apellidos", p.getApellidos());
                    request.getSession().setAttribute("nom", nom);
                    request.getSession().setAttribute("clave", clave);
                    request.getSession().setAttribute("dinero", p.getDinero());
                    request.getSession().setAttribute("numero", p.getNumero());
                    request.getRequestDispatcher("InicioCliente.jsp?id="+p.getId()+"").forward(request, response);
                    
                } else{
                    boolean indicador=true;  //Variable para mostrar el RECUADRO de credeneciales INCORRECTAS 
                    request.setAttribute("notFound", indicador);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            }if(accion.equals("Salir")){
                request.getRequestDispatcher("index.jsp").forward(request, response);
                request.getSession().invalidate();  //Para cerrar la sesión 
            }
            if(accion.equals("SalirAdmin")){
                
                request.getRequestDispatcher("InicioAdmin.jsp").forward(request, response);
                request.getSession().invalidate();  //Para cerrar la sesión 
                
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
