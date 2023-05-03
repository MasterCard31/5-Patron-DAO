<%-- 
    Document   : resultadoBusqueda
    Created on : 30 abr. 2023, 13:41:25
    Author     : ACER
--%>
<%@page import="java.util.List"%>
<%@page import="modelos.productos"%>
<%@page import="DAO.DAO_productos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PRODUCTOS | VENTAS</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            body,h1,h2,h3,h4,h5,h6 {
                font-family: "Raleway", sans-serif
            }

            body, html {
                height: 100%;
                line-height: 1.8;
            }

            /* Full height image header */
            .bgimg-1 {
                background-position: center;
                background-size: cover;
                background-image: url("fondo.jpg");
                min-height: 100%;
            }

            .w3-bar .w3-button {
                padding: 16px;
            }
        </style>
    </head>
    <body>
        <h1>Busqueda Productos</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Nombre</th>
                    <th>Precio</th>
                    <th>Stock</th>
                    <th>Eliminar</th>
                    <th>Actualizar</th>
                </tr>
            </thead>
            <%
                DAO_productos dp = new DAO_productos();
                for (productos pro : dp.reader("nombre")) {
            %>

            <tr>
                <td><%= pro.getCodigo()%></td>
                <td><%= pro.getNombre()%><</td>
                <td><%= pro.getPrecio()%></td>
                <td><%= pro.getStock()%></td>
                <td>
                    <form action="confirmacion.jsp" method="post">
                        <input type="hidden" name="codigo" value="<%= pro.getCodigo()%>"/>
                        <input type="submit" value="Eliminar"/>
                    </form>
                </td>
                <td>
                    <form action="crearProducto.jsp" method="post">
                        <input type="hidden" name="idActualizar" value="<%= pro.getCodigo()%>"/>
                        <input type="submit" value="Actualizar"/>
                    </form>
                </td>
            </tr>
            <%}%> 
        </table>

        <!-- Footer -->
        <footer class="w3-center w3-black w3-padding-64">
            <a href="#home" class="w3-button w3-light-grey"><i class="fa fa-arrow-up w3-margin-right"></i>Volver al Inicio</a>
            <div class="w3-xlarge w3-section">
                <i class="fa fa-facebook-official w3-hover-opacity"></i>
                <i class="fa fa-instagram w3-hover-opacity"></i>
                <i class="fa fa-twitter w3-hover-opacity"></i>
                <i class="fa fa-linkedin w3-hover-opacity"></i>
            </div>
            <p>Todos los Derechos Reservados 2023</p>
        </footer>
    </body>
</html>
