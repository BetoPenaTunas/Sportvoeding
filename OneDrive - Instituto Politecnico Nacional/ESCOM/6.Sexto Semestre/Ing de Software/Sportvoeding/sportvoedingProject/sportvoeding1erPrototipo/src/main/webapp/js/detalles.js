function sumar() {
    valor = document.getElementById("cantpro").value;
    valor=parseInt(valor);
    valor = valor + 1;
    document.getElementById("cantpro").value = valor;

    var cantidad=document.getElementById("cantp2").innerHTML;
    cantidad=parseFloat(cantidad);
    cantidad = cantidad + (cantidad/(valor-1));
    document.getElementById("cantp2").innerHTML = cantidad;

    var cantidad1=document.getElementById("cantp3").innerHTML;
    cantidad1=parseFloat(cantidad1);
    cantidad1 = cantidad1 + (cantidad1/(valor-1));
    document.getElementById("cantp3").innerHTML = cantidad1;

    var cantidad2=document.getElementById("cantp4").innerHTML;
    cantidad2=parseFloat(cantidad2);
    cantidad2 = cantidad2 + (cantidad2/(valor-1));
    document.getElementById("cantp4").innerHTML = cantidad2;
    
    var cantidad3=document.getElementById("cantp5").innerHTML;
    cantidad3=parseFloat(cantidad3);
    cantidad3 = cantidad3 + (cantidad3/(valor-1));
    document.getElementById("cantp5").innerHTML = cantidad3;
    
    var cantidad4=document.getElementById("cantp6").innerHTML;
    cantidad4=parseFloat(cantidad4);
    cantidad4 = cantidad4 + (cantidad4/(valor-1));
    document.getElementById("cantp6").innerHTML = cantidad4;

    var cantidad5=document.getElementById("cantp7").innerHTML;
    cantidad5=parseFloat(cantidad5);
    cantidad5 = cantidad5 + (cantidad5/(valor-1));
    document.getElementById("cantp7").innerHTML = cantidad5;

    var cantidad6=document.getElementById("cantp8").innerHTML;
    cantidad6=parseFloat(cantidad6);
    cantidad6 = cantidad6 + (cantidad6/(valor-1));
    document.getElementById("cantp8").innerHTML = cantidad6;

    var cantidad7=document.getElementById("cantp9").innerHTML;
    cantidad7=parseFloat(cantidad7);
    cantidad7 = cantidad7 + (cantidad7/(valor-1));
    document.getElementById("cantp9").innerHTML = cantidad7;

    var costo=document.getElementById("costotot").innerHTML;
    costo=parseFloat(costo);
    costo = costo + (costo/(valor-1));
    document.getElementById("costotot").innerHTML = costo;

    if(valor<3){
        document.getElementById("baccol").style.backgroundColor= "#11c21a";
        document.getElementById("exceso").innerHTML="";
    }
    if(valor>2){
        document.getElementById("baccol").style.backgroundColor= "red";
        document.getElementById("exceso").innerHTML="CUIDADO CONSUMO EN EXCESO";
        document.getElementById("exceso").style.color= "white";
    }
    var a = document.getElementById("dincom").innerHTML;
    console.log(a);
    console.log(costo);
    if(parseFloat(a)<costo){
        alert("NO TIENES SUFICIENTE DINERO");
        restar();
    }

}

function restar() {
    valor = document.getElementById("cantpro").value;
    valor=parseInt(valor);
    if(valor>1){
        valor = valor - 1;
        document.getElementById("cantpro").value = valor;

        var cantidad=document.getElementById("cantp2").innerHTML;
    cantidad=parseFloat(cantidad);
    cantidad = cantidad - (cantidad/(valor+1));
    document.getElementById("cantp2").innerHTML = cantidad;

    var cantidad1=document.getElementById("cantp3").innerHTML;
    cantidad1=parseFloat(cantidad1);
    cantidad1 = cantidad1 - (cantidad1/(valor+1));
    document.getElementById("cantp3").innerHTML = cantidad1;

    var cantidad2=document.getElementById("cantp4").innerHTML;
    cantidad2=parseFloat(cantidad2);
    cantidad2 = cantidad2 - (cantidad2/(valor+1));
    document.getElementById("cantp4").innerHTML = cantidad2;
    
    var cantidad3=document.getElementById("cantp5").innerHTML;
    cantidad3=parseFloat(cantidad3);
    cantidad3 = cantidad3 - (cantidad3/(valor+1));
    document.getElementById("cantp5").innerHTML = cantidad3;
    
    var cantidad4=document.getElementById("cantp6").innerHTML;
    cantidad4=parseFloat(cantidad4);
    cantidad4 = cantidad4 - (cantidad4/(valor+1));
    document.getElementById("cantp6").innerHTML = cantidad4;

    var cantidad5=document.getElementById("cantp7").innerHTML;
    cantidad5=parseFloat(cantidad5);
    cantidad5 = cantidad5 - (cantidad5/(valor+1));
    document.getElementById("cantp7").innerHTML = cantidad5;

    var cantidad6=document.getElementById("cantp8").innerHTML;
    cantidad6=parseFloat(cantidad6);
    cantidad6 = cantidad6 - (cantidad6/(valor+1));
    document.getElementById("cantp8").innerHTML = cantidad6;

    var cantidad7=document.getElementById("cantp9").innerHTML;
    cantidad7=parseFloat(cantidad7);
    cantidad7 = cantidad7 - (cantidad7/(valor+1));
    document.getElementById("cantp9").innerHTML = cantidad7;

    var costo = document.getElementById("costotot").innerHTML;
    costo = parseFloat(costo);
    costo = costo - (costo/(valor+1));
    document.getElementById("costotot").innerHTML = costo;

    if(valor<3){
        document.getElementById("baccol").style.backgroundColor= "#11c21a";
        document.getElementById("exceso").innerHTML="";
    }
    if(valor>2){
        document.getElementById("baccol").style.backgroundColor= "red";
        document.getElementById("exceso").innerHTML="CUIDADO CONSUMO EN EXCESO";
        document.getElementById("exceso").style.color= "white";
    }

}
}
