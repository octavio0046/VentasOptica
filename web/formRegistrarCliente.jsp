<%-- 
    Document   : formRegistrarCliente
    Created on : 20/01/2019, 02:21:23 PM
    Author     : OCTAVIOH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="cabecera">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="template1.jsp" %>
    </div>
    <div class="contenido">
        <h5 align="center">
            <%  
                int nit=0;
                nit = Integer.parseInt(request.getParameter("nit"));

        
                   if (request.getAttribute("msg") != null) {
                    out.println(request.getAttribute("msg"));

                }
            %>
            <a class="dropdown-item" href="formRegistrarCliente.jsp">RegistrarCliente</a>
        </h5>  

        <%---EMPIEZA el formulario de registro de cliente---%>
        <center>
            <form action="ServletClientes" method="post">

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputEmail4">NIT</label>
                        <input type="text" name="txtNit" class="form-control" value="<%out.println(nit);%>" id="inputEmail4" >
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputPassword4">DIRECCION</label>
                        <input type="text" name="txtDireccion" class="form-control" id="inputPassword4">
                    </div>
                </div>


                <div class="form-row">

                    <div class="form-group col-md-12">
                        <label for="inputPassword4">Nombre</label>
                        <input type="text" name="txtNombre" class="form-control" id="inputPassword4">
                    </div>                           
                </div>

                <div class="form-group">
                    <label for="inputAddress2">Nombre</label>
                    <input type="text" name="txtNombre2" class="form-control" id="inputAddress2" >
                </div>


                    <input type="submit" value="registrar" class="btn btn-primary">
                     <input type="hidden" name="accion" value="RegistrarCliente"/>
            </form>
        </center>
        <%---termina el formulario de registro de cliente---%>

    </div>
</html>
