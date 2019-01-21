/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Utils.Conexion;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author OCTAVIOH
 */
public class ProductoBD {

    public static ArrayList<Producto> obtenerProducto() {
        ArrayList<Producto> lista = new ArrayList<Producto>();
        try {
            CallableStatement cl = Conexion.getConexion().prepareCall("select * from tb_producto");
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                Producto p = new Producto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getDouble(6), rs.getInt(7));
                lista.add(p);
            }
        } catch (Exception e) {
        }
        return lista;
    }

    public static Producto obtenerProducto(String codigo) {
        Producto p = null;
        try {
            CallableStatement cl = Conexion.getConexion().prepareCall("select * from tb_producto where codigo=?");
            cl.setString(1, codigo);
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                p = new Producto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getDouble(6), rs.getInt(7));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
   return p;
    }
}
