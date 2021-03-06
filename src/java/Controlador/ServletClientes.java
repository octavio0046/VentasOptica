/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Cliente;
import Modelo.ClienteBD;
import Utils.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author OCTAVIOH
 */
@WebServlet(name = "ServletClientes", urlPatterns = {"/ServletClientes"})
public class ServletClientes extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    String accion = request.getParameter("accion");
    if  (accion.equals("ValidarCliente")) {
      ValidarCliente(request, response);
    } else if (accion.equals("CancelarVenta")) {
     CancelarVenta(request, response);
    } else if (accion.equals("RegistrarCliente")) {
     RegistrarCliente(request, response);
    } else if (accion.equals("RegistrarUsuario")) {
      //registrarUsuario(request, response);
    
    }else if (accion.equals("RegistrarUsuarioA")) {
      //registrarCliente(request, response);
    
    }
  }
   
    private void CancelarVenta(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
      HttpSession sesionOK2 = request.getSession();     
      sesionOK2.removeAttribute("correlativo");
      sesionOK2.removeAttribute("nit");
      sesionOK2.removeAttribute("nombre");
      sesionOK2.removeAttribute("apellido");
      sesionOK2.invalidate();
      request.getRequestDispatcher("index.jsp").forward(request, response);
    }
  
   
   
   private void ValidarCliente(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    int nit = Integer.parseInt(request.getParameter("txtNit"));  
    try
      {
        CallableStatement cl = Conexion.getConexion().prepareCall("select * from tb_cliente where nit=? and estado=1");
        cl.setInt(1, nit);
        ResultSet rs = cl.executeQuery();
        if (rs.next())
        {
          HttpSession sesionOK2 = request.getSession();
          sesionOK2.setAttribute("correlativo", rs.getInt(1));
          sesionOK2.setAttribute("nit", rs.getInt(2));
          sesionOK2.setAttribute("nombre", rs.getString(3));
          sesionOK2.setAttribute("apellido", rs.getString(4));
          sesionOK2.setAttribute("direccion", rs.getString(5));
          request.getRequestDispatcher("formPreVenta.jsp").forward(request, response);
        }
        else
        {
          request.setAttribute("msg", "no existe la persona");
          request.getRequestDispatcher("formRegistrarCliente.jsp?nit="+nit+"").forward(request, response);
        }
      } catch (Exception e)
      {
        System.out.println(e);
      }
    
  }
  
private void RegistrarCliente(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    int  nit = Integer.parseInt(request.getParameter("txtNit"));
    String nom = request.getParameter("txtNombre");
    String nom2 = request.getParameter("txtNombre2");
    String direccion = request.getParameter("txtDireccion");

    Cliente c = new Cliente(nit, nom, nom2, direccion);
    
    boolean rpta = ClienteBD.insertarCliente(c);
    if (rpta) {
      response.sendRedirect("index.jsp");
    } else {
      response.sendRedirect("mensaje2.jsp?men=No se regisro  correctamente");
    }
  }
  

  /*
  private void eliminarUsuarios(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    int cod = Integer.parseInt(request.getParameter("txtCodigoUsuario"));
    
    boolean rpta = UsuariosBD.EliminarUsuario(cod);
    if (rpta) {
      response.sendRedirect("formFichaUsuarioCliente.jsp?cod="+cod+"");
    } else {
      response.sendRedirect("mensaje2.jsp?men = No se elimino el Usuario correctamente");
    }
  }
  
 
  
  private void actualizarUsuario(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    int codigo = Integer.parseInt(request.getParameter("txtCodigo"));
    String apellido = request.getParameter("txtApellido");
    String nombre = request.getParameter("txtNombre");
    String pais = request.getParameter("txtPais");
    String perfil = request.getParameter("txtPerfil");
    String correo = request.getParameter("txtCorreo");
    String clave = request.getParameter("txtClave");
    String fecha = request.getParameter("txtFecha");
    String estado = request.getParameter("txtEstado");
    
    Usuarios p = new Usuarios(codigo, apellido, nombre, pais, perfil, correo, clave, fecha, estado);
    boolean rpta = UsuariosBD.actualizarUsuario(p);
    if (rpta) {
      response.sendRedirect("mensaje2.jsp?men=Se actualizo de manera correcta");
    } else {
      response.sendRedirect("mensaje2.jsp?men=No se actualizo ");
    }
  }
  

  
  
 
  private void mostrarUsuarios(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    ArrayList<Usuarios> lista = new ArrayList();
    lista = UsuariosBD.obtenerUsuarios();
    request.setAttribute("lista", lista);
    request.getRequestDispatcher("mostrarUsuarios.jsp").forward(request, response);
  }
  
  
  
  
    private void registrarCliente(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
     int id_cliente = Integer.parseInt(request.getParameter("txtId_cliente"));
        String nombre_usuario = request.getParameter("txtNombreUsuario");
        int id_usuario_cliente = Integer.parseInt(request.getParameter("txtId_cliente"));
        String nombre1 = request.getParameter("txtNombre1");
        String nombre2 = request.getParameter("txtNombre2");
        String apellido1 = request.getParameter("txtApellido1");
        String apellido2 = request.getParameter("txtApellido2");
        String nacimiento = request.getParameter("txtNacimiento");
        int edad = Integer.parseInt(request.getParameter("txtEdad"));
        String pais = request.getParameter("txtPais");
        String departamento = request.getParameter("txtDepartamento");
        String recidencia = request.getParameter("txtRecidencia");
        String direccion = request.getParameter("txtDireccion");
        int tel1 = Integer.parseInt(request.getParameter("txtTelefono1"));
        int tel2 = Integer.parseInt(request.getParameter("txtTelefono2"));
        int recidencial = Integer.parseInt(request.getParameter("txtRecidencial"));
        String correo = request.getParameter("txtCorreo");


     Cliente p = new Cliente(id_cliente, nombre_usuario, id_usuario_cliente, nombre1, nombre2, apellido1,
            apellido2, nacimiento, edad, pais, departamento, recidencia, direccion, tel1, tel2, recidencial, correo);
    
    boolean rpta = ClienteBD.insertarCliente(p);
    if (rpta) {
      response.sendRedirect("mensaje2.jsp?men=se Registro  correctamente");
    } else {
      response.sendRedirect("mensaje2.jsp?men=No se regisro  correctamente");
    }
  }
*/
  

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    processRequest(request, response);
  }
  
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    processRequest(request, response);
  }
  
  public String getServletInfo()
  {
    return "Short description";
  }
}