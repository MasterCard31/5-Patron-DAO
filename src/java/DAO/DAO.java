/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package DAO;

import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author ACER
 */
public interface DAO<T> {
    void create(T ob) throws SQLException;
    List<T> read()throws SQLException;
    void update(T ob) throws SQLException;
    void delete(String id) throws SQLException;
    // extra
    List<T> reader(String nombre) throws SQLException;
    T findByID(String id) throws SQLException;
    
    
}
