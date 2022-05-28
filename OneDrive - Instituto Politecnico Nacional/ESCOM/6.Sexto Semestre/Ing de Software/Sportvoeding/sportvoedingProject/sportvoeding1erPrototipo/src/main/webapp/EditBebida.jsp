<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="BaseDatos.ConexionDB"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
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
            <form action="AgregarBebida">
            <div class="row">
                <div class="col">
                    <div class="cajalog2">
                        <h1 class="log">AGREGAR BEBIDA</h1>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">ID</label>
                                <input class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name=idpra>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">ALIMENTO</label>
                                <input class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name=alimentopra>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">COSTO</label>
                                <input class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name=costopra>
                            </div>
                            <div class="mb-3">
                                <label for="formFile" class="form-label">IMAGEN</label>
                                <input class="form-control" type="file" id="formFile" name="imagenpra">
                            </div>
                            <div class="mb-3">
                                <label for="exampleFormControlTextarea1" class="form-label">DESCRIPCIÓN</label>
                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="10" name="descpra"></textarea>
                            </div>
                    </div>
                </div>
                <div class="col">
                    <div class="cajalog2">
                        <h1 class="log">INFORMACIÓN NUTRICIONAL</h1>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">CANTIDAD EN GRAMOS</label>
                                <input class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name=cantidadpra>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">CALORIAS</label>
                                <input class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name=caloriaspra>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">GRASAS TOTALES EN GRAMOS</label>
                                <input class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name=grasaspra>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">COLESTEROL EN MILIGRAMOS</label>
                                <input class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name=colesterolpra>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">SODIO EN MILIGRAMOS</label>
                                <input class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name=sodiopra>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">POTASIO EN MILIGRAMOS</label>
                                <input class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name=potasiopra>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">CARBOHIDRATOS EN GRAMOS</label>
                                <input class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name=carpra>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">PROTEINAS EN GRAMOS</label>
                                <input class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name=proteinaspra>
                            </div>
                            <button type="submit" class="btn btn-primary">AGREGAR</button>
                    </div>
                </div>
            </div>
        </form>
            <form action="EditarBebida">
            <div class="row">
                <div class="col">
                    <div class="cajalog2">
                        <h1 class="log">EDITAR BEBIDA</h1>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">ID</label>
                                <input class="form-control" id="i1" aria-describedby="emailHelp" name=idpred>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">ALIMENTO</label>
                                <input class="form-control" id="i2" aria-describedby="emailHelp" name=alimentopred>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">COSTO</label>
                                <input class="form-control" id="i3" aria-describedby="emailHelp" name=costopred>
                            </div>
                            <div class="mb-3">
                                <label for="formFile" class="form-label">IMAGEN</label>
                                <input class="form-control" type="file" id="i4" name="imagenpred">
                            </div>
                            <div class="mb-3">
                                <label for="exampleFormControlTextarea1" class="form-label">DESCRIPCIÓN</label>
                                <textarea class="form-control" id="i5" rows="10" name="descpred"></textarea>
                            </div>
                    </div>
                </div>
                <div class="col">
                    <div class="cajalog2">
                        <h1 class="log">INFORMACIÓN NUTRICIONAL</h1>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">CANTIDAD EN GRAMOS</label>
                                <input class="form-control" id="i6" aria-describedby="emailHelp" name=cantidadpred>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">CALORIAS</label>
                                <input class="form-control" id="i7" aria-describedby="emailHelp" name=caloriaspred>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">GRASAS TOTALES EN GRAMOS</label>
                                <input class="form-control" id="i8" aria-describedby="emailHelp" name=grasaspred>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">COLESTEROL EN MILIGRAMOS</label>
                                <input class="form-control" id="i9" aria-describedby="emailHelp" name=colesterolpred>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">SODIO EN MILIGRAMOS</label>
                                <input class="form-control" id="i10" aria-describedby="emailHelp" name=sodiopred>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">POTASIO EN MILIGRAMOS</label>
                                <input class="form-control" id="i11" aria-describedby="emailHelp" name=potasiopred>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">CARBOHIDRATOS EN GRAMOS</label>
                                <input class="form-control" id="i12" aria-describedby="emailHelp" name=carpred>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">PROTEINAS EN GRAMOS</label>
                                <input class="form-control" id="i13" aria-describedby="emailHelp" name=proteinaspred>
                            </div>
                            <button type="submit" class="btn btn-primary">EDITAR</button>
                    </div>
                </div>
            </div>
        </form>
            <form action="EliminarBebida">
            <div class="row">
                <div class="col">
                    <div class="cajalog2">
                        <h1 class="log">ELIMINAR BEBIDA</h1>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">ID</label>
                                <input class="form-control" id="i14" aria-describedby="emailHelp" name=idpre>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">ALIMENTO</label>
                                <input class="form-control" id="i15" aria-describedby="emailHelp" readonly="readonly" name=alimentopre>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">COSTO</label>
                                <input class="form-control" id="i16" aria-describedby="emailHelp" readonly="readonly" name=costopre>
                            </div>
                            <div class="mb-3">
                                <label for="exampleFormControlTextarea1" class="form-label">DESCRIPCIÓN</label>
                                <textarea class="form-control" id="i18" rows="10" readonly="readonly" name="descpre"></textarea>
                            </div>
                    </div>
                </div>
                <div class="col">
                    <div class="cajalog2">
                        <h1 class="log">INFORMACIÓN NUTRICIONAL</h1>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">CANTIDAD EN GRAMOS</label>
                                <input class="form-control" id="i19" aria-describedby="emailHelp" readonly="readonly" name=cantidadpre>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">CALORIAS</label>
                                <input class="form-control" id="i20" aria-describedby="emailHelp" readonly="readonly" name=caloriaspre>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">GRASAS TOTALES EN GRAMOS</label>
                                <input class="form-control" id="i21" aria-describedby="emailHelp" readonly="readonly" name=grasaspre>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">COLESTEROL EN MILIGRAMOS</label>
                                <input class="form-control" id="i22" aria-describedby="emailHelp" readonly="readonly" name=colesterolpre>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">SODIO EN MILIGRAMOS</label>
                                <input class="form-control" id="i23" aria-describedby="emailHelp" readonly="readonly" name=sodiopre>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">POTASIO EN MILIGRAMOS</label>
                                <input class="form-control" id="i24" aria-describedby="emailHelp" readonly="readonly" name=potasiopre>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">CARBOHIDRATOS EN GRAMOS</label>
                                <input class="form-control" id="i25" aria-describedby="emailHelp" readonly="readonly" name=carpre>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">PROTEINAS EN GRAMOS</label>
                                <input class="form-control" id="i26" aria-describedby="emailHelp" readonly="readonly" name=proteinaspre>
                            </div>
                            <button type="submit" class="btn btn-primary">ELIMINAR</button>
                    </div>
                </div>
            </div>
        </form>
            <div>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">ALIMENTO</th>
                            <th scope="col">COSTO</th>
                            <th scope="col">FOTO</th>
                            <th scope="col">DESCRIPCION</th>
                            <th scope="col">CANTIDAD<br>GR</th>
                            <th scope="col">CALORIAS</th>
                            <th scope="col">GRASAS<br>TOTALES<br>GR</th>
                            <th scope="col">COLESTEROL<br>MG</th>
                            <th scope="col">SODIO<br>MG</th>
                            <th scope="col">POTASIO<br>MG</th>
                            <th scope="col">CARBOHIDRATOS<br>GR</th>
                            <th scope="col">PROTEINAS<br>GR</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            try{
                                Connection con = ConexionDB.getConexionDB();
                                Statement stm=con.createStatement();
                                ResultSet check=stm.executeQuery("select id,alimento,tipo,costo,foto,descripcion,"
                                + "cantidad,calorias,grasastotales,colesterol,sodio,potasio,carbohidratos,proteinas from alimentos WHERE tipo='BEBIDA'");  
                                while(check.next()){    
                            %>
                        <tr>
                            <td><%=check.getString("id")%></td>
                            <td><%=check.getString("alimento")%></td>
                            <td><%=check.getInt("costo")%></td>
                            <td><%=check.getString("foto")%></td>
                            <td><p class="ov"><%=check.getString("descripcion")%></p></td>
                            <td><%=check.getInt("cantidad")%></td>
                            <td><%=check.getInt("calorias")%></td>
                            <td><%=check.getInt("grasastotales")%></td>
                            <td><%=check.getInt("colesterol")%></td>
                            <td><%=check.getInt("sodio")%></td>
                            <td><%=check.getInt("potasio")%></td>
                            <td><%=check.getInt("carbohidratos")%></td>
                            <td><%=check.getInt("proteinas")%></td>
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

        <script src="js/preparado.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
