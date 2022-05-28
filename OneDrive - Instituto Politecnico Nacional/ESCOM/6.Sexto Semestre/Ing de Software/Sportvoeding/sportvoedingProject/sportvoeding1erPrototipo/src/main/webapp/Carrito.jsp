<%@page import="carrito.classes.Producto"%>
<%@page import="carrito.controllers.ControladorProducto"%>
<%@page import="carrito.classes.Articulo"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
        HttpSession sesion2 = request.getSession(true);
        ArrayList<Articulo> articulos = sesion2.getAttribute("carrito1") == null ? null : (ArrayList) sesion2.getAttribute("carrito1");
        System.out.println("LLEGAMOS");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>D'Voladini</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
          <meta http-equiv="Expires" content="0">
  <meta http-equiv="Last-Modified" content="0">
  <meta http-equiv="Cache-Control" content="no-cache, mustrevalidate">
  <meta http-equiv="Pragma" content="no-cache">
        
        <link rel="stylesheet" href="css/principal.css">
        <link rel="stylesheet" href="css/cliente.css">
        <link rel="shortcut icon" href="img/logo.ico">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@800&display=swap" rel="stylesheet">
        <link rel="stylesheet"  href="http://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        
        <link rel="stylesheet" href="https://cdn.rawgit.com/openlayers/openlayers.github.io/master/en/v5.3.0/css/ol.css"
    type="text/css">
  <script src="https://cdn.rawgit.com/openlayers/openlayers.github.io/master/en/v5.3.0/build/ol.js"></script>

  <style>
    .map {
      height: 400px;
      width: 100%;
    }
  </style>
    </head>
    <body  onload="getLocation(); sufdin();">
        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">
                        <img src="img/Dvoladini3.png" alt="" width="500">
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="InicioCliente.jsp?id=${id}">INICIO</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="Tienda.jsp">TIENDA</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="Compras.jsp?id=${id}">TU CARRITO</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <img src="img/gear.png" alt="Config" width="50">
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li align="center">${nombre} ${apellidos}</li>
                                    <li align="center">${id}</li>
                                    <li align="center">${escuela}</li>
                                    <li align="center">${dinero} Burrodolares</li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li align="center"><a class="dropdown-item" href="Controlador?accion=Salir">CERRAR SESIÓN</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <h1 class="nomti" align="center">
            HOLA ${nombre} ${apellidos}
        </h1>
            
        <section class="container">
            <div id="cart-container">
            <table class="table" id="shop-table">
                <thead>
                    <tr class="tabcol">
                        <th scope="col">PRODUCTO</th>
                        <th scope="col">PRECIO</th>
                        <th scope="col">CANTIDAD</th>
                        <th scope="col">TOTAL</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ControladorProducto cp = new ControladorProducto();
                        float total = 0;

                        if(articulos!=null){
                        for(Articulo a: articulos){
                            Producto producto = cp.getProducto(a.getIdProducto());
                            total += a.getCant() * producto.getCosto();

                    %>   
                    <tr class="tabcol">
                        <th><img src="img/<%= producto.getFoto() %>" alt="" width="500"></th>
                        <td>$<%= producto.getCosto() %></td>
                        <td>
                            <input class="form-control" id="cantto" type="" name="quantity" value="<%= a.getCant() %>" readonly="readonly" size="2">
                        </td>
                        <td class="cart-total" id="cantpcos"><%= producto.getCosto() * a.getCant() %></td>
                        <td>
                            <span id="idarticulo" style="display: none;"><%= producto.getId() %></span>
                            <a class="elix" href="" onclick="location.reload(true)" id="eliminarcarrito">x</a>
                        </td>
                    </tr>
                    <% } }%>
                </tbody>
            </table>
            <% if (articulos == null){ %>
                <h4>No hay Articulos en el carro</h4>
            <% } %>    
            </div>
            <div class="total3" align="right">
                <label style="font-size: 30px !important;font-weight: 700;">Total: $</label>
                <input class="form-control" style="width: 200px !important;font-size: 30px !important;font-weight: 700;"  name="total2" id="txt-total" value="<%= total %>" readonly="readonly" size="2">
                
            </div>
            <a style="text-decoration: none !important;font-size: 30px;font-weight: 700;" href="javascript:window.history.go(-2);">SEGUIR COMPRANDO</a>
            <form id="formdin" action="Ventas" align="right">
                <input value="${id}" Style="display:none;" name="cliente">
                <input value="${dinero}" Style="display:none;" name="dineromomento">
                <input value="<%= total %>" name="dint" style="display:none;">
                <input style="display:none;" id="salon1" name="salon1" value="CAFETERIA">
                <button style="font-size: 30px;
                font-weight: 700;" type="submit" class="btn btn-primary">COMPRAR</button>
            </form>
                <br><br>
                <h2 align="right" id="nohay" class="errordin"></h2>
                <br><br>
        </section>
            
                <section class="container">
                    <div class="row">
                        <div class="col">
                            <p id="geo"></p>
                            <div id="map" class="map"></div>
                        </div>
                        <div class="col">
                            <select id="salon" class="form-select" name="salon" onchange="ShowSelected();" aria-label="Default select example">
                                <option selected>DONDE RECOGER:</option>
                                <option>CAFETERIA</option>
                                <option>GESTION ESCOLAR</option>
                                <option>SERVICIO MEDICO</option>
                                <option>BECAS</option>
                                <option>UPIS</option>
                                <option>DIRECCION</option>
                                <option>JEFATURA</option>
                                <option>1002</option>
                                <option>1003</option>
                                <option>1004</option>
                                <option>1005</option>
                                <option>1006</option>
                                <option>1007</option>
                                <option>1008</option>
                                <option>1009</option>
                                <option>1010</option>
                                <option>1011</option>
                                <option>1012</option>
                                <option>1013</option>
                                <option>1014</option>
                                <option>2002</option>
                                <option>2003</option>
                                <option>2004</option>
                                <option>2005</option>
                                <option>2006</option>
                                <option>2007</option>
                                <option>2008</option>
                                <option>2009</option>
                                <option>2010</option>
                                <option>2011</option>
                                <option>2012</option>
                                <option>2013</option>
                                <option>2014</option>
                                <option>1101</option>
                                <option>1102</option>
                                <option>1103</option>
                                <option>1104</option>
                                <option>1105</option>
                                <option>1106</option>
                                <option>1107</option>
                                <option>1108</option>
                                <option>1109</option>
                                <option>1110</option>
                                <option>1111</option>
                                <option>1112</option>
                                <option>1113</option>
                                <option>1114</option>
                                <option>2101</option>
                                <option>2102</option>
                                <option>2103</option>
                                <option>2104</option>
                                <option>2105</option>
                                <option>2106</option>
                                <option>2107</option>
                                <option>2108</option>
                                <option>2109</option>
                                <option>2110</option>
                                <option>2111</option>
                                <option>2112</option>
                                <option>2113</option>
                                <option>1201</option>
                                <option>1202</option>
                                <option>1203</option>
                                <option>1204</option>
                                <option>1205</option>
                                <option>1206</option>
                                <option>1207</option>
                                <option>1208</option>
                                <option>1209</option>
                                <option>1210</option>
                                <option>1211</option>
                                <option>1212</option>
                                <option>1213</option>
                                <option>1214</option>
                                <option>2201</option>
                                <option>2202</option>
                                <option>2203</option>
                                <option>2204</option>
                                <option>2205</option>
                                <option>2206</option>
                                <option>2207</option>
                                <option>2208</option>
                                <option>2209</option>
                                <option>2210</option>
                                <option>2211</option>
                                <option>2212</option>
                                <option>2213</option>
                                
                            </select>
                        </div>
                    </div>
                </section><br><br>

        <section class="dineroback">
            <br><br><br>
            <h1 align="center" class="dinerodis">DINERO DISPONIBLE</h1>
            <br>
            <div align="center">
                <label align="center" id="dincom" for="exampleInputEmail1" class="form-label ldif">${dinero}</label>
            </div>  
            <br>
            <div align="center">
                <input align="center" value="PARA RECARGAS, FAVOR DE IR A SU CAFETERIA CORRESPONDIENTE" class="btn recar btn-primary agdi">
            </div>  
        </section>
            
        <footer>
            <div class="row">
                <div class="col-4 rowcent">
                    <div class="redes-container">
                        <ul>
                            <li><a href="#" target="_blank" class="facebook"><i class="fab fa-facebook"></i></a></li>
                            <li><a href="#" target="_blank" class="twitter"><i class="fab fa-twitter"></i></a></li>
                            <li><a href="#" target="_blank" class="instagram"><i class="fab fa-instagram"></i></a></li>
                            <li><a href="#" target="_blank" class="youtube"><i class="fab fa-youtube"></i></a></li>
                            <li><a href="#" target="_blank" class="google"><i class="fab fa-google"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col">
                    <img src="img/logo.png" class="centrar3" width="200" alt="logopie2">
                    <p class="pf">Diseño por YTAA</p>
                </div>
                <div class="col">
                    <div class="mov">
                    <div class="pos1">
                        <div class="pos">
                            <img src="img/whatsapp.svg" height="35" alt="">
                        </div>
                        <div class="pos">
                            <p class="pf1">
                                <a href="#" class="pf1">D'Voladini</a>
                            </p>
                        </div>
                    </div>
                    <div class="pos1">
                        <div class="pos1">
                            <img src="img/envelope.svg" height="35" alt="">
                        </div>
                        <div class="pos1">
                            <p class="pf1">
                                dvoladini@gmail.com
                            </p>
                        </div>
                    </div>
                    <div class="pos1">
                        <div class="pos1">
                            <img src="img/telephone-fill.svg" height="35" alt="">
                        </div>
                        <div class="pos1">
                            <p class="pf1">
                                5512345678
                            </p>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </footer>
        
            
        <script src="js/detalles2.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/carrito.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script type="text/javascript">

    var geo = document.getElementById("geo");
    var latitud = 0;
    var longitud = 0;

    function getLocation() {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
        
      }
      else {

        geo = geo.innerHTML = "No es compatible tu navegador";
      }

    }

    function showPosition(position) {
      //geo.innerHTML=" Latitud: "+position.coords.latitude+"<br> Longuitud: "+position.coords.longitude;
      latitud = position.coords.latitude;
      longitud = position.coords.longitude;
      console.log("Latitud: " + latitud + " Longuitud: " + longitud);
      if(latitud!=0 && longitud!=0)
      {
          verUbi();
      }


    }

    
    function verUbi(){
    var map = new ol.Map({
      target: 'map',
      layers: [
        new ol.layer.Tile({
          source: new ol.source.OSM()
        })
      ],
      view: new ol.View({
        center: ol.proj.fromLonLat([longitud, latitud]),
        zoom: 19
      })

    });

    /*
      Impresición 
      Longuitud:-99.0239552
      Latitud: 19.6157791
    	
      	
      Ajustando las coordenas
      Latitud: 	19.6157791-0.0019291		= 19.61385
      Longuitud: -99.0239552-0.01108480		= -99.03504
    
    */

    var Style = new ol.style.Style({
      image: new ol.style.Icon({
        anchor: [0.5, 10],
        anchorXUnits: 'fraction',
        anchorYUnits: 'pixels',
        src: 'marker.png'
      }),

    });

    var layer = new ol.layer.Vector({
      source: new ol.source.Vector({
        features: [
          new ol.Feature({
            geometry: new ol.geom.Point(ol.proj.fromLonLat([longitud, latitud]))
          })
        ]
      }),
      style: Style
    });
    map.addLayer(layer);
  }

  </script>
    </body>
    
    <%-- CHATBOT --%>
        <script defer>
            function loadChatWidget() {
                  chatteron.init({
                  clientId: "_4NYe8aMIG3RVowwVusd4",
                  openInTab: true,
                  bubbleUrl: "https://upload.wikimedia.org/wikipedia/commons/c/c7/Chat.png"
                  
            });
          }
        </script>
        <script defer src="https://web.leena.ai/scripts/sdk.js" onload="loadChatWidget();">
        </script>  
    
</html>
