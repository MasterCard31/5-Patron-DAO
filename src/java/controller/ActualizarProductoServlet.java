/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DAO_productos;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.productos;

/**
 *
 * @author ACER
 */
@WebServlet(name = "ActualizarProductoServlet", urlPatterns = {"/actualizarProducto.do"})
public class ActualizarProductoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            productos p = new productos();
            
            p.setCodigo(request.getParameter("codigo"));
            p.setNombre(request.getParameter("nombre"));
            p.setPrecio(request.getParameter("precio"));
            p.setStock(request.getParameter("stock"));
            
            new DAO_productos().update(p);
            
            response.sendRedirect("crearProducto.jsp");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ActualizarProductoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
