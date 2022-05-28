<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="carrito.controllers.ControladorProducto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ControladorProducto cp=new ControladorProducto();
%>
<!DOCTYPE html> 
<html>
    <head>
        <title>D'Voladini</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/principal.css">
        <link rel="stylesheet" href="css/cliente.css">
        <link rel="shortcut icon" href="img/logo.ico">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@800&display=swap" rel="stylesheet">
        <link rel="stylesheet"  href="http://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    </head>
    <body>
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
                                <a class="nav-link" aria-current="page" href="ControladorTienda?accionCliente=muestraProductos">TIENDA</a>
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
            
            <%--
                SE MUESTRAN LOS PRODUCTOS QUE ESTÁN ALMACENADOS EN LA BASE DE DATOS 
            --%>
            
            <c:forEach items="${listadoProductosVar}" var="producto">
                
                <div class="tarj ventli">
                                                                <!-- RUTA DE LA IMAGEN -->                 
                    <div align="center"><img align="center" src=<%="img/"%>${producto.getFoto()} alt="" class="imaven" width=350></div>
                    <h4 class="hven agdi">
                        <c:out value="${producto.getAlimento()}"/>
                    </h4>
                    <h5 class="hven">
                        <c:out value="${producto.getId()}"/>
                    </h5>
                    <a href="Detalles.jsp?id=${producto.getId()}" class="btn btn-primary agdi bm">DETALLES</a>
                </div>
                
            </c:forEach>
            
            
            
            
        </section>

        <section class="dineroback">
            <br><br><br>
            <h1 align="center" class="dinerodis">DINERO DISPONIBLE</h1>
            <br>
            <div align="center">
                <label align="center" for="exampleInputEmail1" class="form-label ldif">${dinero}</label>
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

        <script src="js/principal.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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