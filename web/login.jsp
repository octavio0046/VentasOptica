<%-- 
    Document   : login
    Created on : 10/05/2018, 09:32:49 AM
    Author     : Octavio Herrera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<%
    String usu = "";
    String nom = "";
    HttpSession sesionOK = request.getSession();

    if (sesionOK.getAttribute("perfil") != null) {
        nom = (String) sesionOK.getAttribute("nom") + " " + (String) sesionOK.getAttribute("ape");

    }


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       <link rel="stylesheet" href="estilos22.css"/>
    </head>
    <body>
  <table border="0" width="1000" align="center">
            <tr bgcolor="skyblue" style="width: 50px; height: 50px;">
                <th><a href="index.jsp"> Inicio</a> </th>
                    <%                   if (sesionOK.getAttribute("perfil") != null && sesionOK.getAttribute("perfil").equals("ADMIN")) {


                    %>
                 <th><a href="obtenerPagosDia.jsp"> Buscar Pagos Dia</a> </th>
                  <th><a href="obtenerPagosInter.jsp"> Buscar Pagos En Intervalo</a> </th>
                <th><a href="registrarUsuario.jsp"> Regisrar Usuario</a> </th>
                
                    <%                }

                        
                    %>

         
                 

                <%        if (sesionOK.getAttribute("perfil") != null && sesionOK.getAttribute("perfil").equals("ADMIN")) {


                %>

                   <th><a href="ServletControlador?accion=MostrarUsuarios"> Mostrar Usuarios</a> </th>
                <th><a href="ServletControlador?accion=BuscarPaciente"> Buscar Paciente</a> </th>

                <%                    }

if (sesionOK.getAttribute("perfil") != null && sesionOK.getAttribute("perfil").equals("ASISTENTE")) {



                %>
<th><a href="ServletControlador?accion=BuscarPaciente"> Buscar Paciente</a> </th>
                
                 <%                    }



                %>
                
                
                <%if (sesionOK.getAttribute("perfil") != null) {

                        //si alguien ya inicio sesion entonces mostrar su nombre 
                %>
                <th><a href="ServletLogueo?accion=cerrar"> Cerrar Sesion</a> </th>
                <th width="200"><%out.println("Bienvenido:  " + nom);%>

                </th> 
                <%
                    }
                %>

                <%
                    //si alguien no ha iniciado sesion entonces muestra el iniciar sesion
                    if (sesionOK.getAttribute("perfil") == null) {


                %>
                <th with="200"><a href="login.jsp"> Iniciar Sesion</a> </th>
                    <%                }
                    %>



            </tr>  

        </table>
        
    <center>          
     
        </center>
        <h2 align="center">Logueo de Usuarios</h2>
    <center>
            <form action="ServletLogueo" method="post" >
        
                
                
                <input type="hidden" name="accion" value="loguin"/>
                
                                    
                    <label>Usuario:</label>
                <input type="text" placeholder="Usuario" name="txtUsu"  pattern="[A-Z]+"  required=""  title="SOLO MAYUSCULAS">
                    
                <br>
                   <label>Contraseña:</label>
                   <input type="password" placeholder="Password" name="txtPas" required="">
                     
                   <br>  <input type="submit"  name="btn" value="Iniciar Sesion" >    
                
                
  
            </form>
           
   </center> 
        <h4 align="center">
           <%
           if(request.getAttribute("msg")!=null){
             out.println(request.getAttribute("msg"));
               
           }
           
           
           %> 
            
            
        </h4>
           
           
    </body>
</html>
