
package carrito.classes;

public class Producto {
    private String id;
    private String alimento;
    private String tipo;
    private float costo;
    private String foto;
    private String descripcion;
    private float cantidad;
    private float calorias;
    private float grasastotales;
    private float colesterol;
    private float sodio;
    private float potasio;
    private float carbohidratos;
    private float proteinas;

    public Producto(String id, String alimento, String tipo, float costo, String foto, String descripcion,
    float cantidad, float calorias, float grasastotales, float colesterol, float sodio,
    float potasio, float carbohidratos, float proteinas) {
        this.id = id;
        this.alimento=alimento;
        this.tipo=tipo;
        this.costo=costo;
        this.foto=foto;
        this.descripcion=descripcion;
        this.cantidad=cantidad;
        this.calorias=calorias;
        this.grasastotales=grasastotales;
        this.colesterol=colesterol;
        this.sodio=sodio;
        this.potasio=potasio;
        this.carbohidratos=carbohidratos;
        this.proteinas=proteinas;
    }

    public Producto() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAlimento() {
        return alimento;
    }

    public void setAlimento(String alimento) {
        this.alimento = alimento;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public float getCosto() {
        return costo;
    }

    public void setCosto(float costo) {
        this.costo = costo;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public float getCantidad() {
        return cantidad;
    }

    public void setCantidad(float cantidad) {
        this.cantidad = cantidad;
    }

    public float getCalorias() {
        return calorias;
    }

    public void setCalorias(float calorias) {
        this.calorias = calorias;
    }

    public float getGrasastotales() {
        return grasastotales;
    }

    public void setGrasastotales(float grasastotales) {
        this.grasastotales = grasastotales;
    }

    public float getColesterol() {
        return colesterol;
    }

    public void setColesterol(float colesterol) {
        this.colesterol = colesterol;
    }

    public float getSodio() {
        return sodio;
    }

    public void setSodio(float sodio) {
        this.sodio = sodio;
    }

    public float getPotasio() {
        return potasio;
    }

    public void setPotasio(float potasio) {
        this.potasio = potasio;
    }

    public float getCarbohidratos() {
        return carbohidratos;
    }

    public void setCarbohidratos(float carbohidratos) {
        this.carbohidratos = carbohidratos;
    }

    public float getProteinas() {
        return proteinas;
    }

    public void setProteinas(float proteinas) {
        this.proteinas = proteinas;
    }
    
    
}
