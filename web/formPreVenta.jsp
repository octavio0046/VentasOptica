<%-- 
    Document   : formPreVenta
    Created on : 18/01/2019, 05:20:16 PM
    Author     : OCTAVIOH
--%>
<%
    int correlativo = 0;
    int nit  = 0;
    String nom1 = "";
    String ape1 = "";
    HttpSession sesionOK2 = request.getSession();
        correlativo = (Integer) sesionOK2.getAttribute("correlativo"); 
        nit=(Integer) sesionOK2.getAttribute("nit");
        nom1=(String) sesionOK2.getAttribute("nombre1");
        ape1=(String) sesionOK2.getAttribute("apellido1");
 
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a class="nav-link disabled" ><%out.println("correlativo:  " + correlativo);%></a>
         <a class="nav-link disabled" ><%out.println("Nit:  " + nit);%></a>
          <a class="nav-link disabled" ><%out.println("Nombre:  " + nom1);%></a>
           <a class="nav-link disabled" ><%out.println("Apellido:  " + ape1);%></a>
    </body>
</html>
