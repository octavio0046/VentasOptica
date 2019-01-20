/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Utils.Conexion;
import java.sql.CallableStatement;
import java.sql.Connection;

/**
 *
 * @author OCTAVIOH
 */
public class ClienteBD {
    
    
public static boolean insertarCliente(Cliente c)
  {
    boolean rpta = false;
    try
    {
      Connection cn = Conexion.getConexion();
      CallableStatement cl = cn.prepareCall("{call insertar_cliente(?,?,?,?)}");
      cl.setInt(1, c.getNit());
      cl.setString(2, c.getNombre());
      cl.setString(3, c.getNombre2());
      cl.setString(4, c.getDireccion());
      
      
      int i = cl.executeUpdate();
      if (i == 1) {
        rpta = true;
      } else {
        rpta = false;
      }
    }
    catch (Exception localException) {}
    return rpta;
  }
    
        
    
    
}
