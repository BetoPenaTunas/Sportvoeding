
package carrito.classes;

public class Articulo {
    private String idProducto;
    private int cant;

    public Articulo(String idProducto, int cant) {
        this.idProducto = idProducto;
        this.cant = cant;
    }

    public String getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(String idProducto) {
        this.idProducto = idProducto;
    }

    public int getCant() {
        return cant;
    }

    public void setCant(int cant) {
        this.cant = cant;
    }

    @Override
    public String toString() {
        return "Articulo{" + "idProducto=" + idProducto + ", cantidad=" + cant + '}';
    }
}
