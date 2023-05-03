/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelos.conexion;
import modelos.productos;
/**
 *
 * @author ACER
 */
public class DAO_productos extends conexion implements DAO<productos>{


    public DAO_productos() throws ClassNotFoundException, SQLException {
        super("ventas"); 
    }

    


    @Override
    public void create(productos pro) throws SQLException {
        ejecutar("INSERT INTO producto VALUES("
                + "'"+pro.getCodigo()+"',"
                + "'"+pro.getNombre()+"',"
                + "'"+pro.getPrecio()+"',"        
                + "'"+pro.getStock()+"')");
                
    }

    @Override
    public List<productos> read() throws SQLException {
        List<productos> lista = new ArrayList<>();
        
        ResultSet rs = ejecutar("SELECT * FROM producto ORDER BY precio DESC;");
        
        productos pro;
        while(rs.next()){
            pro = new productos();
            
            pro.setCodigo(rs.getString(1));
            pro.setNombre(rs.getString(2));
            pro.setPrecio(rs.getString(3));
            pro.setStock(rs.getString(4));
            
            lista.add(pro);
        }
        
        return lista;
    }

    @Override
    public void update(productos pro) throws SQLException {
        ejecutar("UPDATE producto "
                + "SET nombre = '"+pro.getNombre()+"', "
                + "precio = '"+pro.getPrecio()+"', "        
                + "stock = '"+pro.getStock()+"' "
                + "WHERE codigo = '"+pro.getCodigo()+"'");
    }

    @Override
    public void delete(String id) throws SQLException {
        ejecutar("DELETE FROM producto WHERE codigo = '"+id+"'");
    }

    @Override
    public List<productos> reader(String nombre) throws SQLException {
        List<productos> lista = new ArrayList<>();
        
        ResultSet rs = ejecutar("SELECT * FROM producto WHERE nombre LIKE '%"+nombre+"%';");
        
        productos pro;
        while(rs.next()){
            pro = new productos();
            
            pro.setCodigo(rs.getString(1));
            pro.setNombre(rs.getString(2));
            pro.setPrecio(rs.getString(3));
            pro.setStock(rs.getString(4));
            
            lista.add(pro);
        }
        
        return lista;
    }

    @Override
    public productos findByID(String id) throws SQLException {
        ResultSet rs = ejecutar("SELECT * FROM producto "
                + "WHERE codigo = '"+id+"';");
        
        productos pro = null;
        if(rs.next()){
            pro = new productos();
            
            pro.setCodigo(rs.getString(1));
            pro.setNombre(rs.getString(2));
            pro.setPrecio(rs.getString(3));
            pro.setStock(rs.getString(4));
        }
        
        return pro;
    }


    


    
    
}
