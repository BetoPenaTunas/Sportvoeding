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
    console.log(valores);
    document.getElementById('fecha').value = elementosTD[4].innerHTML;
}
