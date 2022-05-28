package Servlets;

import BaseDatos.ConexionDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
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
@WebServlet(name = "Iniciosesion", urlPatterns = {"/Iniciosesion"})
public class Iniciosesion extends HttpServlet {

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
            
            String usuario = request.getParameter("usuario");
            String contra = request.getParameter("contra");
            Boolean vent;
            vent=false;
            String[] usu=new String[10];
            String[] pass=new String[10];
            
            try{
                Connection con = ConexionDB.getConexionDB();
                Statement stm=con.createStatement();
                ResultSet usuar=stm.executeQuery("select correo,clave from cliente");
                while(usuar.next()){
                    for(int i=0;i<usu.length;i++){
                        usu[i]=usuar.getString("correo");
                    }
                    for(int i=0;i<usu.length;i++){
                        pass[i]=usuar.getString("clave");
                    }
                    if(usuario.equals(usu[0]) && contra.equals(pass[0])){
                        vent=true;
                    }
                }
                if(vent==true){
                    response.sendRedirect("InicioCliente.jsp");
                }
                else{
                    out.println("<!DOCTYPE html>\n" +
"<html>\n" +
"    <head>\n" +
"        <title>D'Voladini</title>\n" +
"        <meta charset=\"UTF-8\">\n" +
"        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
"        <link rel=\"stylesheet\" href=\"css/principal.css\">\n" +
"        <link rel=\"shortcut icon\" href=\"img/logo.ico\">\n" +
"        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC\" crossorigin=\"anonymous\">\n" +
"        <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\n" +
"        <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\n" +
"        <link href=\"https://fonts.googleapis.com/css2?family=Nunito:wght@800&display=swap\" rel=\"stylesheet\">\n" +
"        <link rel=\"stylesheet\"  href=\"http://use.fontawesome.com/releases/v5.8.1/css/all.css\" integrity=\"sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf\" crossorigin=\"anonymous\">\n" +
"    </head>\n" +
"    <body>\n" +
"        <div id=\"contenedor_carga\"><div id=\"carga\"></div></div>\n" +
"        <header>\n" +
"            <nav class=\"navbar navbar-expand-lg navbar-light bg-light\">\n" +
"                <div class=\"container-fluid\">\n" +
"                    <a class=\"navbar-brand\" href=\"#\">\n" +
"                        <img src=\"img/Dvoladini3.png\" alt=\"\" width=\"500\">\n" +
"                    </a>\n" +
"                    <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#navbarNav\" aria-controls=\"navbarNav\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n" +
"                        <span class=\"navbar-toggler-icon\"></span>\n" +
"                    </button>\n" +
"                    <div class=\"collapse navbar-collapse\" id=\"navbarNav\">\n" +
"                        <ul class=\"navbar-nav\">\n" +
"                            <li class=\"nav-item\">\n" +
"                                <a class=\"nav-link\" aria-current=\"page\" href=\"#\">INICIO</a>\n" +
"                            </li>\n" +
"                            <li class=\"nav-item\">\n" +
"                                <a class=\"nav-link\" aria-current=\"page\" href=\"#\">REGISTRO</a>\n" +
"                            </li>\n" +
"                            <li class=\"nav-item\">\n" +
"                                <a class=\"nav-link\" href=\"#\">ACERCA DE NOSOTROS</a>\n" +
"                            </li>\n" +
"                        </ul>\n" +
"                    </div>\n" +
"                </div>\n" +
"            </nav>\n" +
"        </header>\n" +
"\n" +
"        <section class=\"inise\">\n" +
"            <div id=\"carouselExampleControls\" class=\"carousel slide tamcar\" data-bs-ride=\"carousel\">\n" +
"                <div class=\"carousel-inner\">\n" +
"                    <div class=\"carousel-item active\">\n" +
"                        <img src=\"img/enchiladas.png\" class=\"d-block w-100\" alt=\"...\">\n" +
"                    </div>\n" +
"                    <div class=\"carousel-item\">\n" +
"                        <img src=\"img/bag.jpg\" class=\"d-block w-100\" alt=\"...\">\n" +
"                    </div>\n" +
"                    <div class=\"carousel-item\">\n" +
"                        <img src=\"img/cafe.jpg\" class=\"d-block w-100\" alt=\"...\">\n" +
"                    </div>\n" +
"                    <div class=\"carousel-item\">\n" +
"                        <img src=\"img/postre.jpg\" class=\"d-block w-100\" alt=\"...\">\n" +
"                    </div>\n" +
"                </div>\n" +
"                    <button class=\"carousel-control-prev\" type=\"button\" data-bs-target=\"#carouselExampleControls\" data-bs-slide=\"prev\">\n" +
"                        <span class=\"carousel-control-prev-icon\" aria-hidden=\"true\"></span>\n" +
"                        <span class=\"visually-hidden\">Previous</span>\n" +
"                    </button>\n" +
"                    <button class=\"carousel-control-next\" type=\"button\" data-bs-target=\"#carouselExampleControls\" data-bs-slide=\"next\">\n" +
"                        <span class=\"carousel-control-next-icon\" aria-hidden=\"true\"></span>\n" +
"                        <span class=\"visually-hidden\">Next</span>\n" +
"                    </button>\n" +
"                </div>\n" +
"            <div class=\"tam\">\n" +
"                <div class=\"cajalog\">\n" +
"                    <h1 class=\"log\">INICIO DE SESIÓN</h1>\n" +
"                    <form action=\"Iniciosesion\">\n" +
"                        <div class=\"mb-3\">\n" +
"                            <label for=\"exampleInputEmail1\" class=\"form-label\">Correo</label>\n" +
"                            <input type=\"email\" class=\"form-control\" name=\"usuario\" id=\"exampleInputEmail1\" aria-describedby=\"emailHelp\">\n" +
"                            <div id=\"emailHelp\" class=\"form-text\">Nuestra empresa no comparte tu correo con alguien mas.</div>\n" +
"                        </div>\n" +
"                        <div class=\"mb-3\">\n" +
"                            <label for=\"exampleInputPassword1\" class=\"form-label\">Contraseña</label>\n" +
"                            <input type=\"password\" class=\"form-control\" name=\"contra\" id=\"exampleInputPassword1\">\n" +
"                        </div>\n" +
"                        <button type=\"submit\" class=\"btn btn-primary\">Iniciar Sesión</button>\n" +
"                        <div id=\"emailHelp\" class=\"form-text error\">¡CORREO O CONTRASEÑA INCORRECTOS!</div>" +
"                    </form>\n" +
"                </div>\n" +
"            </div>\n" +
"        </section>\n" +
"\n" +
"\n" +
"        <footer>\n" +
"            <div class=\"row\">\n" +
"                <div class=\"col-4 rowcent\">\n" +
"                    <div class=\"redes-container\">\n" +
"                        <ul>\n" +
"                            <li><a href=\"#\" target=\"_blank\" class=\"facebook\"><i class=\"fab fa-facebook\"></i></a></li>\n" +
"                            <li><a href=\"#\" target=\"_blank\" class=\"twitter\"><i class=\"fab fa-twitter\"></i></a></li>\n" +
"                            <li><a href=\"#\" target=\"_blank\" class=\"instagram\"><i class=\"fab fa-instagram\"></i></a></li>\n" +
"                            <li><a href=\"#\" target=\"_blank\" class=\"youtube\"><i class=\"fab fa-youtube\"></i></a></li>\n" +
"                            <li><a href=\"#\" target=\"_blank\" class=\"google\"><i class=\"fab fa-google\"></i></a></li>\n" +
"                        </ul>\n" +
"                    </div>\n" +
"                </div>\n" +
"                <div class=\"col\">\n" +
"                    <img src=\"img/logo.png\" class=\"centrar3\" width=\"200\" alt=\"logopie2\">\n" +
"                    <p class=\"pf\">Diseño por YTAA</p>\n" +
"                </div>\n" +
"                <div class=\"col\">\n" +
"                    <div class=\"mov\">\n" +
"                    <div class=\"pos1\">\n" +
"                        <div class=\"pos\">\n" +
"                            <img src=\"img/whatsapp.svg\" height=\"35\" alt=\"\">\n" +
"                        </div>\n" +
"                        <div class=\"pos\">\n" +
"                            <p class=\"pf1\">\n" +
"                                <a href=\"#\" class=\"pf1\">D'Voladini</a>\n" +
"                            </p>\n" +
"                        </div>\n" +
"                    </div>\n" +
"                    <div class=\"pos1\">\n" +
"                        <div class=\"pos1\">\n" +
"                            <img src=\"img/envelope.svg\" height=\"35\" alt=\"\">\n" +
"                        </div>\n" +
"                        <div class=\"pos1\">\n" +
"                            <p class=\"pf1\">\n" +
"                                dvoladini@gmail.com\n" +
"                            </p>\n" +
"                        </div>\n" +
"                    </div>\n" +
"                    <div class=\"pos1\">\n" +
"                        <div class=\"pos1\">\n" +
"                            <img src=\"img/telephone-fill.svg\" height=\"35\" alt=\"\">\n" +
"                        </div>\n" +
"                        <div class=\"pos1\">\n" +
"                            <p class=\"pf1\">\n" +
"                                5512345678\n" +
"                            </p>\n" +
"                        </div>\n" +
"                    </div>\n" +
"                    </div>\n" +
"                </div>\n" +
"            </div>\n" +
"        </footer>\n" +
"        \n" +
"\n" +
"\n" +
"        <script src=\"js/principal.js\"></script>\n" +
"        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM\" crossorigin=\"anonymous\"></script>\n" +
"    </body>\n" +
"</html>");
                    
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
