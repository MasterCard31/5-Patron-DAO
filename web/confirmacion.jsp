<%-- 
    Document   : confirmacion
    Created on : 29 abr. 2023, 11:07:40
    Author     : ACER
--%>

<%@page import="DAO.DAO_productos"%>
<%@page import="modelos.productos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
productos pro = new DAO_productos().findByID(request.getParameter("codigo"));
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Confirmación</h1>
        
        <div>
            <h3>Datos del producto</h3>
            <div>
                <table border="0">
                    <tbody>
                        <tr>
                            <td>Codigo:</td>
                            <td><%= pro.getCodigo()%></td>
                        </tr>
                        <tr>
                            <td>Nombre:</td>
                            <td><%= pro.getNombre()%></td>
                        </tr>
                        <tr>
                            <td>Precio:</td>
                            <td>$ <%= pro.getPrecio()%></td>
                        </tr>
                        <tr>
                            <td>Stock</td>
                            <td><%= pro.getStock()%></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <br>
            ¿Desea eliminar dicho producto?
            
            <form action="eliminarProducto.do" method="post">
                <input type="hidden" name="codigo" value="<%= pro.getCodigo()%>">
                <input type="submit" value="Si">
            </form>
            
            <form action="crearProducto.jsp" method="post">
                <input type="submit" value="No">
            </form>
            
            
            <!--
            2 formularios (SI, NO)
            
            NO -> action -> crearProducto.jsp
            SI -> action -> EliminarProductoServlet 
                -> id -> hidden -> eliminarProducto.do
            
            -->
        </div>
    </body>
</html>
