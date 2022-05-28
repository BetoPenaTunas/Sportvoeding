function ShowSelected()
{

var combo = document.getElementById("salon");
var selected = combo.options[combo.selectedIndex].text;
document.getElementById("salon1").value=selected;
}

function sufdin(){
    var dinero = document.getElementById("dincom").innerHTML;
    var dinerototal = document.getElementById("txt-total").value;
    dinero = parseFloat(dinero);
    dinerototal = parseFloat(dinerototal);
    console.log(dinero);
    console.log(dinerototal);
    var a = false;
    if(dinero<dinerototal)
    {
        a=true;
        console.log(a);
        var din = "NO TIENES SUFICIENTE DINERO";
        document.getElementById("nohay").innerHTML = din;
        document.getElementById("formdin").style.display="none";
    }
}