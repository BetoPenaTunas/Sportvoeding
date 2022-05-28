<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="BaseDatos.ConexionDB"%>
<%@page import="java.sql.Connection"%>
<%
    String id = request.getParameter("id");
    String fecha = request.getParameter("fecha");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="css/carrito.css">
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
            <br><br>
            <h2 align="center">PRODUCTOS</h2>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">CLAVE</th>
                        <th scope="col">ALIMENTO</th>
                        <th scope="col">COSTO</th>
                        <th scope="col">CANTIDAD</th>
                        <th scope="col">TOTAL</th>
                        <th scope="col">LUGAR</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try{
                            Connection con = ConexionDB.getConexionDB();
                            Statement stm=con.createStatement();
                            ResultSet check=stm.executeQuery("select v.id_alimento AS CLAVE, a.alimento AS NOMBRE,"
                            + " a.costo AS COSTO, v.cantidad AS CANTIDAD, v.costo AS TOTAL, v.salon AS LUGAR "
                            + "FROM ventas v join alimentos a on (v.id_alimento = a.id) "
                            + "where id_cliente="+id+" and fecha = '"+fecha+"'"); 
                            
                            while(check.next()){
                        %>
                    <tr>
                        <td><%= check.getString("CLAVE") %></td>
                        <td><%= check.getString("NOMBRE") %></td>
                        <td><%= check.getFloat("COSTO") %></td>
                        <td><%= check.getInt("CANTIDAD") %></td>
                        <td><%= check.getFloat("TOTAL") %></td>
                        <td><%= check.getString("LUGAR") %></td>
                    </tr>
                    <%
                        }
                            stm.close();
                            con.close();
                            System.out.println("ya estan dentro man");
                        }
                        catch(SQLException e){
                            System.out.println("Error bro :'(");
                            System.out.println(e);
                        }
                        %>
                </tbody>
            </table>
        </section>

        <br><br>

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


