<%-- 
    Document   : formPreVenta
    Created on : 18/01/2019, 05:20:16 PM
    Author     : OCTAVIOH
--%>
<%
    int correlativo = 0;
    int nit = 0;
    String nom1 = "";
    String ape1 = "";
    HttpSession sesionOK2 = request.getSession();
    correlativo = (Integer) sesionOK2.getAttribute("correlativo");
    nit = (Integer) sesionOK2.getAttribute("nit");
    nom1 = (String) sesionOK2.getAttribute("nombre");
    ape1 = (String) sesionOK2.getAttribute("apellido");

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="cabecera">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="template1.jsp" %>
    </div>
    <div class="contenido">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item" ><a href="#">Nit:<%out.println(nit);%></a></li>
                <li class="breadcrumb-item"><a href="#">Nombre:<%out.println(nom1);%></a></li>
                 <li class="breadcrumb-item"><a href="#"><%out.println(ape1);%></a></li>
                 <li class="breadcrumb-item"><a href="ServletClientes?accion=CancelarVenta">Cancelar Venta</a></li>
            </ol>
        </nav>

    </div>
</html>
