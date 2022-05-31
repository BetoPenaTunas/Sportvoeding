<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="BaseDatos.ConexionDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Estilos -->
    <link rel="stylesheet" href="css/index.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- Íconos -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <title>Sportvoeding</title>
</head>
<body>
    <div id="contenedor_carga"><div id="carga"></div></div>
    <!-- Barra de navegación -->
    <header>
        <nav>
            <div class="nav_logo">
                <img src="">
            </div>
            <div class="nav_options">
                <ul class="options_list">
                    <li><a href="index.html">Inicio</a></li>
                    <li><a href="inicioCliente.html">Tienda</a></li>
                    <li><a href="InicioAdmin.jsp">Administración</a></li>
                    <li><a href="#">Nosotros</a></li>
                </ul>
            </div>
        </nav>
    </header>

    <!-- Contenido principal de la página -->
    <main>
        <!-- Sección para visualizar imágenes -->
        <div id="slider_img">
            <!-- <a href="#" class="control_next">></a>
            <a href="#" class="control_prev"><</a> -->
            <ul>
              <li><img src="img/tenis.jpg" alt=""></li>
              <li><img src="img/Katinka.jpg" alt=""></li>
              <li><img src="img/nutricion.jpg" alt=""></li>
              <li><img src="img/gel.jpg" alt=""></li>
            </ul>  
        </div>

        <!-- Formulario para inicio de sesión -->
        <div class="section_login">
            <form action="Controlador" method="post" id="login_form">
                <h3>Inicio de sesión</h3>
                <div class="input_group">
                    <label for="">Correo electrónico</label>
                    <input type="text" name="usuario" id="" class="input_data" placeholder="Correo electrónico">
                    <span>Nuestra empresa no comparte tu correo con alguien más.</span>
                </div>
                <div class="input_group">
                    <label for="">Contraseña</label>
                    <input type="password" name="contra" id="" class="input_data" placeholder="Contraseña">
                </div>
                <button type="submit" name="accion" value="Ingresar" class="btn_form">Ingresar</button>
                
            </form>
    
            <c:if test="${notFound==true}">
                <div class="btn btn-warning">
                    <div>Credenciales incorrectas, intente de nuevo.</div>
                </div>
            </c:if>
        </div>
    </main>

    <script src="js/principal.js"></script>
    
    <!-- Script para el funcionamiento del slider -->
    <script>
        jQuery(document).ready(function ($) {
        
            setInterval(function () { 
                moveRight();
            }, 3000);

            var slideCount = $('#slider_img ul li').length;
            var slideWidth = $('#slider_img').width();
            var slideHeight = $('#slider_img').height();
            var sliderUlWidth = slideCount * slideWidth;
            
            // $('#slider_img').css({ width: slideWidth, height: slideHeight });
            
            // $('#slider_img ul').css({ width: sliderUlWidth, marginLeft: - slideWidth });
            
            $('#slider_img ul li:last-child').prependTo('#slider_img ul');

            function moveLeft() {
                $('#slider_img ul').animate({
                    left: + slideWidth
                }, 200, function () {
                    $('#slider_img ul li:last-child').prependTo('#slider_img ul');
                    $('#slider_img ul').css('left', '');
                });
            };

            function moveRight() {
                $('#slider_img ul').animate({
                    left: - slideWidth
                }, 200, function () {
                    $('#slider_img ul li:first-child').appendTo('#slider_img ul');
                    $('#slider_img ul').css('left', '');
                });
            };

            $('a.control_prev').click(function () {
                moveLeft();
            });

            $('a.control_next').click(function () {
                moveRight();
            });
        
        });
    </script>
</body>
</html>