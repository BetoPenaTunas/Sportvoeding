
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="BaseDatos.ConexionDB"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>D'Voladini</title>
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
                        <img src="img/Dvoladini3.png" alt="" width="500">
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

        <section>
            <div class="row">
                <div class="col">
                    <div class="cajalog">
                        <h1 class="log">AGREGAR ADMINISTRADOR</h1>
                        <form action="AgregarAdmin">
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">ID</label>
                                <input class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name=idada>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">NOMBRE(S)</label>
                                <input class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name=nombreada>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">APELLIDOS</label>
                                <input class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name=apeada>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">USUARIO</label>
                                <input class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name=usuarioada>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">CONTRASEÑA</label>
                                <input type="password" class="form-control" id="exampleInputPassword1" name="claveada">
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">SUELDO</label>
                                <input class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name=sueldoada>
                            </div>
                            <button type="submit" class="btn btn-primary">AGREGAR</button>
                        </form>
                    </div>
                </div>
                <div class="col">
                    <div class="cajalog">
                        <h1 class="log">EDITAR ADMINISTRADOR</h1>
                        <form action="EditarAdmin">
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">ID</label>
                                <input class="form-control" id="i1" aria-describedby="emailHelp" name=idaded>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">NOMBRE(S)</label>
                                <input class="form-control" id="i2" aria-describedby="emailHelp" name=nombreaded>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">APELLIDOS</label>
                                <input class="form-control" id="i3" aria-describedby="emailHelp" name=apeaded>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">USUARIO</label>
                                <input class="form-control" id="i4" aria-describedby="emailHelp" name=usuarioaded>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">CONTRASEÑA</label>
                                <input type="password" class="form-control" id="i5" name="claveaded">
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">SUELDO</label>
                                <input class="form-control" id="i6" aria-describedby="emailHelp" name=sueldoaded>
                            </div>
                            <button type="submit" class="btn btn-primary">EDITAR</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="cajalog">
                        <h1 class="log">ELIMINAR ADMINISTRADOR</h1>
                        <form action="EliminarAdmin">
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">ID</label>
                                <input class="form-control" id="i7" aria-describedby="emailHelp" name=idade>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">NOMBRE(S)</label>
                                <input class="form-control" id="i8" aria-describedby="emailHelp" readonly="readonly"  name=nombreade>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">APELLIDOS</label>
                                <input class="form-control" id="i9" aria-describedby="emailHelp" readonly="readonly"  name=apeade>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">USUARIO</label>
                                <input class="form-control" id="i10" aria-describedby="emailHelp" readonly="readonly"  name=usuarioade>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">CONTRASEÑA</label>
                                <input type="password" class="form-control" id="i11" readonly="readonly"  name="claveade">
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">SUELDO</label>
                                <input class="form-control" id="i12" aria-describedby="emailHelp" readonly="readonly"  name=sueldoade>
                            </div>
                            <button type="submit" class="btn btn-primary">ELIMINAR</button>
                        </form>
                    </div>
                </div>
                <div class="col">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">NOMBRE</th>
                                <th scope="col">APELLIDOS</th>
                                <th scope="col">USUARIO</th>
                                <th scope="col">CONTRASEÑA</th>
                                <th scope="col">SUELDO</th>
                                <th scope="col"></th>
                        </tr>
                        </thead>
                        <tbody>
                            <%
                                try{
                                    Connection con = ConexionDB.getConexionDB();
                                    Statement stm=con.createStatement();
                                    ResultSet check=stm.executeQuery("select * from administrador");  
                                    while(check.next()){
                                %>
                            <tr>
                                <td><%=check.getInt("id")%></td>
                                <td><%=check.getString("nombre")%></td>
                                <td><%=check.getString("apellido")%></td>
                                <td><%=check.getString("usuario")%></td>
                                <td><%=check.getString("clave")%></td>
                                <td><%=check.getInt("sueldo")%></td>
                                <th class="btn btn-danger boton">ESCOGER</th>
                            </tr>
                            <%
                                    }
                                    check.close();
                                    stm.close();
                                    con.close();
                                }
                                catch(SQLException e){
                                    System.out.println("ERROR AL CONSULTAR");
                                }
                                %>
                        </tbody>
                    </table>
                </div>
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

        <script src="js/admin.js"></script>               
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
