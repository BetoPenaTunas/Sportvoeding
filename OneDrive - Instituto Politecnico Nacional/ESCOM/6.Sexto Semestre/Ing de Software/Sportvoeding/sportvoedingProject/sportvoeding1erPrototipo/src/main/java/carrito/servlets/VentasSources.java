package carrito.servlets;

import Modelo.Conexion;
import java.io.File;
import java.io.IOException;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.context.FacesContext;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtils;
import org.jfree.chart.JFreeChart;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;
import utileria.DatosGraficaDAO;
import utileria.DatosGraficaDTO;

/**
 *
 * @author L450
 */
@WebServlet(name = "VentasSources", urlPatterns = {"/VentasSources"})
public class VentasSources extends HttpServlet {

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
        String accion= request.getParameter("accion");
        
        if(accion.equals("verReportePDF")){
            System.out.println("Mostrando reporte...");
            verReportePDF(request,response);
        }
        
        if(accion.equals("verGrafica")){
            System.out.println("Mostrando Gráfica...");
            verGrafica(request,response);
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

    private void verReportePDF(HttpServletRequest request, HttpServletResponse response) {
        ServletOutputStream sos = null;
        try {
            //Se necesita lo siguiente

            Conexion con = new Conexion();
            sos = response.getOutputStream(); //Necesitamos un flujo o cadeana de salida de la respuesta del SERVLET 
            File reporte;                   //Especificaremos la ubicación del reporte
            byte b[];                       //Arreglo de bytes donde se cargaran datos de SALIDA, para después obtener el LENGHT 

            reporte = new File(getServletConfig().getServletContext().getRealPath("/reportes/Sportv.jasper")); //Se indica la ruta del REPORTE dentro del proyecto
            b = JasperRunManager.runReportToPdf(reporte.getPath(), null, con.getConnection());  //Convirtiendo el reporte jasper compilado
            //ubicación del reporte,,Conexión de la BD

            response.setContentType("application/pdf"); //EL contenido de la respuesta, que es un PDF
            response.setContentLength(b.length);        //Tamaño del reporte PDF
            sos.write(b, 0, b.length);                   //Escribiendo el arreglo en el flujo de SALIDA
            sos.flush();
            sos.close();

        } catch (IOException ex) {
            System.out.println(ex);
        } catch (JRException ex) {
            System.out.println(ex);
        } finally {
            try {
                sos.close();
            } catch (IOException ex) {
                System.out.println(ex);
            }
        }
    }
    
    private PieDataset getDatosGrafica(){
    
        DefaultPieDataset pie = new DefaultPieDataset();
        
        DatosGraficaDAO dao= new DatosGraficaDAO();
        DatosGraficaDTO datos[]= new DatosGraficaDTO[3];
        
        //Datos a graficar
        datos[0] = dao.getCantidadPorCategorias(dao.graficar("PRP"), "PRP");
        datos[1]= dao.getCantidadPorCategorias(dao.graficar("EMP"), "EMP");
        datos[2] = dao.getCantidadPorCategorias(dao.graficar("BBD"), "BBD");
        if(datos!=null){
            int i=0;
            for (DatosGraficaDTO dato : datos) {
                System.out.println(datos[i].getTipo());
                System.out.println(datos[i].getCantidadTotalTipo());
                System.out.println("\n");
                
                switch(datos[i].getTipo()){
                    case "PRP":
                        datos[i].setTipo("ALIMENTOS PREPARADOS");
                        break;
                    
                    case "EMP": 
                        datos[i].setTipo("SUMPLEMENTOS y VITAMINAS");
                        break;
                        
                    case "BBD":
                        datos[i].setTipo("BEBIDAS");
                        break;
                    
                    default: 
                        break;
                }
                
                pie.setValue(datos[i].getTipo(), datos[i].getCantidadTotalTipo());
                i++;
            }
        }
        
        return pie;
    }
    
    private void verGrafica(HttpServletRequest request, HttpServletResponse response) {
        try {
            JFreeChart chart= ChartFactory.createPieChart(
                    "Artículos de la tienda por categoría",
                    getDatosGrafica(),true,true, Locale.getDefault()
            );
            
            String archivo= getServletConfig().getServletContext().getRealPath("/grafica.png");
            System.out.println(archivo);
            ChartUtils.saveChartAsPNG(new File(archivo), chart, 800, 600);
            
            //Redireccionando a otro SERVLET
            request.getRequestDispatcher("/grafica.jsp").forward(request, response);
            
        } catch (IOException ex) {
            Logger.getLogger(VentasSources.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ServletException ex) {
            Logger.getLogger(VentasSources.class.getName()).log(Level.SEVERE, null, ex);
        }
    }



}
