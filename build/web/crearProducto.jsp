<%-- 
    Document   : crearProducto
    Created on : 29 abr. 2023, 10:20:26
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
            .altura{
                margin-top: 7rem;
            }
        </style>
    </head>
    <body class="">
        <!-- Navbar (sit on top) -->
        <div class="w3-top">
            <div class="w3-bar w3-white w3-card" id="myNavbar">
                <a href="/lab5_DAO/" class="w3-bar-item w3-button w3-wide">VENTAS</a>
                <!-- Right-sided navbar links -->
                <div class="w3-right w3-hide-small">
                    <a href="crearProducto.jsp" class="w3-bar-item w3-button"><i class="fa fa-plus"></i>  AGREGAR PRODUCTO</a>               
                </div>
                <!-- Hide right-floated links on small screens and replace them with a menu icon -->

                <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="w3_open()">
                    <i class="fa fa-bars"></i>
                </a>
            </div>
        </div>


        <form action="crearProducto.do" method="post" class="d-flex container altura mb-5">
            <input class="p-2 m-2 form-control" type="text" name="codigo" placeholder="Codigo: " required/>
            <input class="p-2 m-2 form-control" type="text" name="nombre" placeholder="Nombre: " required/>
            <input class="p-2 m-2 form-control" type="text" name="precio" placeholder="Precio: " required/>
            <input class="p-2 m-2 form-control" type="text" name="stock" placeholder="Stock: " required/>
            <input class="p-2 btn btn-danger form-control" type="submit" value="Registrar" name="btnRegistrar" />
        </form>

        <div class="container mb-5">
            <h3>Productos</h3>
            <form action="" method="post" class="mt-3 mb-5 d-flex w-50">
                <input class="p-2 m-2 form-control" type="search" name="txtBuscar" >
                <input class="p-2 btn btn-primary form-control" type="submit" value="Buscar"/>
            </form>

            <table border="1" class="table table-striped table-bordered">
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
                <tbody>

                    <% DAO_productos dp = new DAO_productos();%>

                    <%for (productos pro : dp.read()) {%>
                    </form>
                    <%
                        if (request.getParameter("idActualizar") != null) {
                            String idActualizar = request.getParameter("idActualizar");

                                if (idActualizar.equals(pro.getCodigo())) {%>
                <form action="actualizarProducto.do" method="post">
                    <tr>
                        <td><input type="hidden" name="codigo" value="<%= pro.getCodigo()%>"/></td>
                        <td><input type="text" name="nombre" value="<%= pro.getNombre()%>"></td>
                        <td><input type="number" name="precio" value="<%= pro.getPrecio()%>"></td>
                        <td><input type="number" name="stock" value="<%= pro.getStock()%>"></td>
                        <td>
                            Eliminar
                        </td>
                        <td>
                            <input type="submit" value="Aceptar"/>
                        </td>
                    </tr>
                </form>
                <%} else {%>
                <tr>
                    <td><%= pro.getCodigo()%></td>
                    <td><%= pro.getNombre()%></td>
                    <td>S/. <%= pro.getPrecio()%></td>
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
                <%}
                            } else {%>
                <tr>
                    <td><%= pro.getCodigo()%></td>
                    <td><%= pro.getNombre()%></td>
                    <td>S/. <%= pro.getPrecio()%></td>
                    <td><%= pro.getStock()%> Uni.</td>
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
                <%}
                %>

                <%}%>


                </tbody>
            </table>
            <%
                String datoProducto = request.getParameter("txtBuscar");
                for (productos p : dp.reader(datoProducto)) {

            %>
            <table border="1" class="mt-5 mtb-5  table table-striped table-bordered">


                <thead>
                    <tr>
                        <th>Codigo</th>
                        <th>Nombre</th>
                        <th>Precio</th>
                        <th>Stock</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%= p.getCodigo()%></td>
                        <td><%= p.getNombre()%></td>
                        <td>S/.<%= p.getPrecio()%></td>
                        <td><%= p.getStock()%> Uni.</td>
                    </tr>
                </tbody>
            </table>

            <%}%>

        </div>
    </body>

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
</html>
