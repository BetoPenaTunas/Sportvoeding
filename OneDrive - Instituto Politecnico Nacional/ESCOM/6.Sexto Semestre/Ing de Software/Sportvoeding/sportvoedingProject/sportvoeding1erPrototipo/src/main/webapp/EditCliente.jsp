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
        
        <meta http-equiv="Expires" content="0">
        <meta http-equiv="Last-Modified" content="0">
        <meta http-equiv="Cache-Control" content="no-cache, mustrevalidate">
        <meta http-equiv="Pragma" content="no-cache">
        
        <link rel="stylesheet" href="css/principal.css">
        <link rel="stylesheet" href="css/admin.css">
        <link rel="stylesheet" href="css/cliente.css">
        <link rel="stylesheet" href="css/carrito.css">
        <link rel="shortcut icon" href="img/logo.ico">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@800&display=swap" rel="stylesheet">
        <link rel="stylesheet"  href="http://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">      
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
            <div class="row tamtam">
                <div class="col">
                    <div class="cajalog">
                        <h1 class="log">AGREGAR CLIENTE</h1>
                        <form action="AgregarCliente">
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">ID</label>
                                <input class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name=idca>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">NOMBRE(S)</label>
                                <input class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name=nombreca>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">APELLIDOS</label>
                                <input class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name=apeca>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">CORREO</label>
                                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name=usuarioca>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">CONTRASEÑA</label>
                                <input type="password" class="form-control" id="exampleInputPassword1" name="claveca">
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">SEXO</label>
                                <label for="exampleInputEmail1" class="form-label aviso">SOLO SE PERMITE M/F MAYUSCULA</label>
                                <input class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name=sexoca>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">ESCUELA</label>
                                <input class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name=escuelaca>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">DINERO</label>
                                <input class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name=dineroca>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">TELEFONO</label>
                                <input class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name=numeroca>
                            </div>
                            <button type="submit" class="btn btn-primary">AGREGAR</button>
                        </form>
                    </div>
                </div>
                <div class="col">
                    <div class="cajalog">
                        <h1 class="log">EDITAR CLIENTE</h1>
                        <form action="EditarCliente">
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">ID</label>
                                <input class="form-control" id="i1" aria-describedby="emailHelp" name=idced>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">NOMBRE(S)</label>
                                <input class="form-control" id="i2" aria-describedby="emailHelp" name=nombreced>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">APELLIDOS</label>
                                <input class="form-control" id="i3" aria-describedby="emailHelp" name=apeced>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">CORREO</label>
                                <input type="email" class="form-control" id="i4" aria-describedby="emailHelp" name=usuarioced>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">CONTRASEÑA</label>
                                <input type="password" class="form-control" id="i5" name="claveced">
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">SEXO</label>
                                <label for="exampleInputEmail1" class="form-label aviso">SOLO SE PERMITE M/F MAYUSCULA</label>
                                <input class="form-control" id="i6" aria-describedby="emailHelp" name=sexoced>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">ESCUELA</label>
                                <input class="form-control" id="i7" aria-describedby="emailHelp" name=escuelaced>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">DINERO</label>
                                <input class="form-control" id="i8" aria-describedby="emailHelp" name=dineroced>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">TELEFONO</label>
                                <input class="form-control" id="i9" aria-describedby="emailHelp" name=numeroced>
                            </div>
                            <button type="submit" class="btn btn-primary">EDITAR</button>
                        </form>
                    </div>
                </div>
            </div>
            <br><br><br><br><br><br><br><br>
            <div class="row tamtam">
                <div class="col">
                    <div class="cajalog">
                        <h1 class="log">ELIMINAR CLIENTE</h1>
                        <form action="EliminarCliente">
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">ID</label>
                                <input class="form-control" id="i10" aria-describedby="emailHelp" name=idce>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">NOMBRE(S)</label>
                                <input class="form-control" id="i11" aria-describedby="emailHelp" readonly="readonly"  name=nombrece>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">APELLIDOS</label>
                                <input class="form-control" id="i12" aria-describedby="emailHelp" readonly="readonly"  name=apece>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">CORREO</label>
                                <input type="email" class="form-control" id="i13" aria-describedby="emailHelp" readonly="readonly"  name=usuarioce>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">CONTRASEÑA</label>
                                <input type="password" class="form-control" id="i14" readonly="readonly"  name="clavece">
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">SEXO</label>
                                <label for="exampleInputEmail1" class="form-label aviso">SOLO SE PERMITE M/F MAYUSCULA</label>
                                <input class="form-control" id="i15" aria-describedby="emailHelp" readonly="readonly"  name=sexoce>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">ESCUELA</label>
                                <input class="form-control" id="i16" aria-describedby="emailHelp" readonly="readonly"  name=escuelace>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">DINERO</label>
                                <input class="form-control" id="i17" aria-describedby="emailHelp" readonly="readonly" name=dineroce>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">TELEFONO</label>
                                <input class="form-control" id="i18" aria-describedby="emailHelp" readonly="readonly" name=numeroce>
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
                                <th scope="col">CORREO</th>
                                <th scope="col">CONTRASEÑA</th>
                                <th scope="col">SEXO</th>
                                <th scope="col">ESCUELA</th>
                                <th scope="col">DINERO</th>
                                <th scope="col">TELEFONO</th>
                                <th scope="col"></th>
                        </tr>
                        </thead>
                        <tbody>
                            <%
                                try{
                                    Connection con = ConexionDB.getConexionDB();
                                    Statement stm=con.createStatement();
                                    ResultSet check=stm.executeQuery("select * from cliente");  
                                    while(check.next()){
                                %>
                            <tr>
                                <td><%=check.getInt("id")%></td>
                                <td><%=check.getString("nombre")%></td>
                                <td><%=check.getString("apellidos")%></td>
                                <td><%=check.getString("correo")%></td>
                                <td><%=check.getString("clave")%></td>
                                <td><%=check.getString("sexo")%></td>
                                <td><%=check.getString("escuela")%></td>
                                <td><%=check.getFloat("dinero")%></td>
                                <td><%=check.getString("numero")%></td>
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
            <br><br><br><br><br><br><br><br><br><br>
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

        <script src="js/cliente.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
