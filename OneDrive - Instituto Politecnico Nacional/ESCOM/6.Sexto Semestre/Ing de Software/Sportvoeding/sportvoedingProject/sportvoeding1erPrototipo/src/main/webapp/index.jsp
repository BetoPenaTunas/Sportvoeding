<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="BaseDatos.ConexionDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sportvoeding</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/principal.css">
        <link rel="shortcut icon" href="img/logo.ico">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@800&display=swap" rel="stylesheet">
        <link rel="stylesheet"  href="http://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    </head>
    <body>
        <div id="contenedor_carga"><div id="carga"></div></div>
        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="index.">
                        <img src="img/sportvoeding.png" alt="" width="300">
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="index.jsp">INICIO</a>
                            </li>

                            

                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="InicioAdmin.jsp">SOY ADMIN</a>
                            </li>


                            <li class="nav-item">
                                <a class="nav-link" href="#">NOSOTROS</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <section class="inise">
            <div id="carouselExampleControls" class="carousel slide tamcar" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="img/tenis.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="img/Katinka.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="img/nutricion.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="img/gel.jpg" class="d-block w-100" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            <div class="tam">
                <div class="cajalog">
                    <h1 class="log">INICIO DE SESIÓN</h1>
                    <form action="Controlador" method="post">
                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Correo</label>
                            <input type="email" class="form-control" name="usuario" id="exampleInputEmail1" aria-describedby="emailHelp">
                            <div id="emailHelp" class="form-text">Nuestra empresa no comparte tu correo con alguien mas.</div>
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Contraseña</label>
                            <input type="password" class="form-control" name="contra" id="exampleInputPassword1">
                        </div>
                        <input type="submit" name="accion" value="Ingresar" class="btn btn-primary">



                    </form>



                    <c:if test="${notFound==true}">
                        <div class='mt-3'>
                            <div class="btn btn-dark">Credenciales Incorrectas, intente de nuevo</div>
                        </div>
                    </c:if>

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
                    <p class="pf">Diseño</p>
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

