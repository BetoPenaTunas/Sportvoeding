package utileria;

import lombok.Data;
import lombok.NoArgsConstructor;
import java.io.*;

@Data
@NoArgsConstructor
public class DatosGraficaDTO implements Serializable{
    
    private String idal;
    private String producto;
    private int cantidad;
    private String tipo;
    private int cantidadTotalTipo;
    
    @Override
    public String toString(){
        return "\n\n--------------------------------------------------------------"+
                "\nId Alimento: "+idal+
                "\nProducto: "+producto+
                "\nCantidad: "+cantidad+
                "\n--------------------------------------------------------------";
    }
    
}
