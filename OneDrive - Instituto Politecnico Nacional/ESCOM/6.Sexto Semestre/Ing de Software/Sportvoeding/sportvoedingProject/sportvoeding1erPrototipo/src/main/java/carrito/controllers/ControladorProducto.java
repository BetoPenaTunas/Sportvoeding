package carrito.controllers;

import carrito.classes.Producto;
import carrito.models.ModeloProducto;

public class ControladorProducto {
    public String getProductos(){
        ModeloProducto mp = new ModeloProducto();
        String htmlcode = "";
        for(Producto producto : mp.getAllProductos()){
            htmlcode += "<div class=\"tarj ventli\">\n" +
"                <div align=\"center\"><img align=\"center\" src=\"img/"+producto.getFoto()+"\" alt=\"\" class=\"imaven\" width=350></div>\n" +
"                <h4 class=\"hven agdi\">"+producto.getAlimento()+"</h4>\n" +
"                <h5 class=\"hven\">$"+producto.getCosto()+"</h5>\n" +
"                <a href=\"Detalles.jsp?id="+producto.getId()+"\" class=\"btn btn-primary agdi bm\">DETALLES</a>\n" +
"            </div>";
                    
        }        
        return htmlcode;        
    }
    
    
    // Nos retorna el producto a ocupar, se ocupa en product details
    public Producto getProducto(String id){
        return new ModeloProducto().getProducto(id);
    }
}
