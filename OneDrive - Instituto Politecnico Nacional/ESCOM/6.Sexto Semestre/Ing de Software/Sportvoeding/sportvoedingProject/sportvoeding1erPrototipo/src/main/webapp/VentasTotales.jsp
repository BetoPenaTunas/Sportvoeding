<%@page import="java.sql.ResultSet"%>
<%@page import="BaseDatos.ConexionDB"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ventas Totales Sportvoeding</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/principal.css">
        <link rel="shortcut icon" href="img/logo.ico">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@800&display=swap" rel="stylesheet">
        <link rel="stylesheet"  href="http://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link rel="stylesheet" href="css/admin.css">
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">
                        <img src="img/sportvoeding.png" alt="" width="500">
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="PrincAdmin.jsp">INICIO</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">ACERCA DE NOSOTROS</a>
                            </li>
                            
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <img src="img/gear.png" alt="Config" width="50">
                                </a>
                                <ul class="dropdown-menu text-white" aria-labelledby="navbarDropdown">
                                    <li align="center">Id Administrador: ${idKey}</li>
                                    <li align="center">${nombreAdminVar} ${apellidoAdminVar}</li>
                                    <li align="center"><a class="dropdown-item" href="Controlador?accion=SalirAdmin">CERRAR SESIÓN</a></li>
                                </ul>
                            </li>
                            
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <section class="container">
            <br><br><h2 align="center">VENTAS TOTALES</h2>
            <br><br> <a class="text-white btn btn-primary" href="VentasSources?accion=verReportePDF" target="_blank">Generar reporte</a>
            <a class="text-white btn btn-primary" href="VentasSources?accion=verGrafica" target="_blank">Generar gráfica</a>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">NO</th>
                        <th scope="col">ID CLIENTE</th>
                        <th scope="col">ID ALIMENTO</th>
                        <th scope="col">PRODUCTO</th>
                        <th scope="col">CANTIDAD</th>
                        <th scope="col">COSTO</th>  
                        <th scope="col">FECHA DE<br>PEDIDO</th>  
                        <th scope="col">FECHA DE<br>ENTREGA</th>
                        <th scope="col">ESTADO</th>  
                    </tr>
                </thead>
                <tbody>
                    <%
                        try{
                            Connection con = ConexionDB.getConexionDB();
                            Statement stm=con.createStatement();
                            ResultSet check=stm.executeQuery("select v.id AS NUMERO, v.id_cliente AS ID, "
                            + "v.id_alimento AS IDAL, a.alimento AS PRODUCTO, v.cantidad AS CANTIDAD, v.costo "
                            + "AS COSTO, v.salon AS SALON, t.fecha AS FECHA, t.fecha_entrega AS ENREGA, "
                            + "t.estado AS ESTADO FROM ventas v join total t on(v.id_cliente = t.id_cliente "
                            + "AND v.fecha = t.fecha) JOIN alimentos a on (v.id_alimento = a.id)"); 
                            
                            while(check.next()){
                        %>
                    <tr>
                        <td><%= check.getInt("NUMERO") %></td>
                        <td><%= check.getInt("ID") %></td>
                        <td><%= check.getString("IDAL") %></td>
                        <td><%= check.getString("PRODUCTO") %></td>
                        <td><%= check.getInt("CANTIDAD") %></td>
                        <td><%= check.getFloat("COSTO") %></td>
                        <td><%= check.getString("FECHA") %></td>
                        <td><%= check.getString("ENREGA") %></td>
                        <td><%= check.getInt("ESTADO") %></td>
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
                <%
                        try{
                            Connection con = ConexionDB.getConexionDB();
                            Statement stm=con.createStatement();
                            ResultSet check=stm.executeQuery("select SUM(total) AS TOTAL from total"); 
                            
                            while(check.next()){
                        %>
                        <h2 align="center">TOTAL: <%= check.getFloat("TOTAL") %></h2>
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
        </section>

        <section class="container">
            <br><br><h2 align="center">VENTAS DE HOY</h2>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">NO</th>
                        <th scope="col">ID CLIENTE</th>
                        <th scope="col">ID ALIMENTO</th>
                        <th scope="col">PRODUCTO</th>
                        <th scope="col">CANTIDAD</th>
                        <th scope="col">COSTO</th>  
                        <th scope="col">SALON</th>
                        <th scope="col">FECHA DE<br>PEDIDO</th>  
                        <th scope="col">FECHA DE<br>ENTREGA</th>
                        <th scope="col">ESTADO</th>  
                    </tr>
                </thead>
                <tbody>
                    <%
                        try{
                            Connection con = ConexionDB.getConexionDB();
                            Statement stm=con.createStatement();
                            ResultSet check=stm.executeQuery("select v.id AS NUMERO, v.id_cliente AS ID, "
                            + "v.id_alimento AS IDAL, a.alimento AS PRODUCTO, v.cantidad AS CANTIDAD, v.costo "
                            + "AS COSTO, v.salon AS SALON, t.fecha AS FECHA, t.fecha_entrega AS ENREGA, "
                            + "t.estado AS ESTADO FROM ventas v join total t on(v.id_cliente = t.id_cliente "
                            + "AND v.fecha = t.fecha) JOIN alimentos a on (v.id_alimento = a.id)"
                            + "WHERE t.fecha between DATE(DATE_ADD(now(), interval -EXTRACT(HOUR from now())+1  hour)) "
                            + "AND now();"); 
                            
                            while(check.next()){
                        %>
                    <tr>
                        <td><%= check.getInt("NUMERO") %></td>
                        <td><%= check.getInt("ID") %></td>
                        <td><%= check.getString("IDAL") %></td>
                        <td><%= check.getString("PRODUCTO") %></td>
                        <td><%= check.getInt("CANTIDAD") %></td>
                        <td><%= check.getFloat("COSTO") %></td>
                        <td><%= check.getString("SALON") %></td>
                        <td><%= check.getString("FECHA") %></td>
                        <td><%= check.getString("ENREGA") %></td>
                        <td><%= check.getInt("ESTADO") %></td>
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
                <%
                        try{
                            Connection con = ConexionDB.getConexionDB();
                            Statement stm=con.createStatement();
                            ResultSet check=stm.executeQuery("select SUM(total) AS TOTAL from total "
                            + "WHERE fecha between DATE(DATE_ADD(now(), interval -EXTRACT(HOUR "
                            + "from now())+1  hour)) AND now()"); 
                            
                            while(check.next()){
                        %>
                        <h2 align="center">TOTAL: <%= check.getFloat("TOTAL") %></h2>
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
                    <p class="pf">Diseño por KV</p>
                </div>
                <div class="col">
                    <div class="mov">
                    <div class="pos1">
                        <div class="pos">
                            <img src="img/whatsapp.svg" height="35" alt="">
                        </div>
                        <div class="pos">
                            <p class="pf1">
                                <a href="#" class="pf1">Sportvoeding</a>
                            </p>
                        </div>
                    </div>
                    <div class="pos1">
                        <div class="pos1">
                            <img src="img/envelope.svg" height="35" alt="">
                        </div>
                        <div class="pos1">
                            <p class="pf1">
                                pedidos.sportvoeding@gmail.com
                            </p>
                        </div>
                    </div>
                    <div class="pos1">
                        <div class="pos1">
                            <img src="img/telephone-fill.svg" height="35" alt="">
                        </div>
                        <div class="pos1">
                            <p class="pf1">
                                5524567896
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
</html>
