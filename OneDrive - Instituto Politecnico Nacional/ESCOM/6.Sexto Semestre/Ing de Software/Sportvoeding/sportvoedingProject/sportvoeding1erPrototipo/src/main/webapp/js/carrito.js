$(function()
{
    $('tr #eliminarcarrito').click(function(e){
        e.preventDefault();
        var elemento = $(this);    //Guardando al objeto con id=deleteitem
        
        // Nos estamos yendo al padre del elemento
        var idproducto = elemento.parent().find('#idarticulo').text();
        
        $.ajax({
            url: 'DeleteCarrito',
            type: 'post',
            data: {idproducto:idproducto},
            success: function(r){
                elemento.parent().parent().remove();
                var elementostabla = $('#shop-table tr');
                if(elementostabla.length<=1){
                    $('#cart-container').append("<h4>No hay articulos en el carro</h4>");
                }
                document.getElementById("txt-total").value=r;
                console.log("si llega man");
                window.location.reload(true);

                    
                
            }
        });
     

      
    });
    
});

