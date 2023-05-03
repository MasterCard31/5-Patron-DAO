/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author ACER
 */
public class conexion {
    
    private Statement sen;
    private final Connection con;

    public conexion(String bd) throws ClassNotFoundException, SQLException{
        String url = "jdbc:mysql://localhost/" + bd + "?user=root&password=tecsup";
        System.out.println(url);
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(url);
    }
    
    protected ResultSet ejecutar(String query) throws SQLException{
        System.out.println(query);
        sen = con.createStatement();
        
        if(
            query.toLowerCase().startsWith("insert")||
            query.toLowerCase().startsWith("update")||
            query.toLowerCase().startsWith("find")||
            query.toLowerCase().startsWith("delete")
        ){
            sen.executeUpdate(query);
            close();
            return null;
        }
        return sen.executeQuery(query);
    }

    private void close() throws SQLException{
        sen.close(); 
    }
    
    
    
}
