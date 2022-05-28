window.onload=function() {
	// creamos los eventos para cada elemento con la clase "boton"
	let elementos=document.getElementsByClassName("boton");
	for(let i=0;i<elementos.length;i++){
        // cada vez que se haga clic sobre cualquier de los elementos,
		// ejecutamos la función obtenerValores()
		elementos[i].addEventListener("click",obtenerValores);
	}
}

// funcion que se ejecuta cada vez que se hace clic
function obtenerValores(e) {
	var valores="";
	// vamos al elemento padre (<tr>) y buscamos todos los elementos <td>
	// que contenga el elemento padre
	var elementosTD=e.srcElement.parentElement.getElementsByTagName("td");
	// recorremos cada uno de los elementos del array de elementos <td>
	for(let i=0;i<elementosTD.length;i++){
        // obtenemos cada uno de los valores y los ponemos en la variable "valores"
		valores+=elementosTD[i].innerHTML+"\n";
	}
    document.getElementById('i1').value = elementosTD[0].innerHTML;
    document.getElementById('i2').value = elementosTD[1].innerHTML;
    document.getElementById('i3').value = elementosTD[2].innerHTML;
    document.getElementById('i4').value = elementosTD[3].innerHTML;
    document.getElementById('i5').value = elementosTD[4].innerHTML;
    document.getElementById('i6').value = elementosTD[5].innerHTML;
    document.getElementById('i7').value = elementosTD[0].innerHTML;
    document.getElementById('i8').value = elementosTD[1].innerHTML;
    document.getElementById('i9').value = elementosTD[2].innerHTML;
    document.getElementById('i10').value = elementosTD[3].innerHTML;
    document.getElementById('i11').value = elementosTD[4].innerHTML;
    document.getElementById('i12').value = elementosTD[5].innerHTML;
}
