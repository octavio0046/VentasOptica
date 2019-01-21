<%-- 
    Document   : formPreVenta
    Created on : 18/01/2019, 05:20:16 PM
    Author     : OCTAVIOH
--%>
<%@page import="Modelo.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.ProductoBD"%>
<%
    int correlativo = 0;
    int nit = 0;
    String nom1 = "";
    String ape1 = "";
    String dire = "";
    HttpSession sesionOK2 = request.getSession();
    correlativo = (Integer) sesionOK2.getAttribute("correlativo");
    nit = (Integer) sesionOK2.getAttribute("nit");
    nom1 = (String) sesionOK2.getAttribute("nombre");
    ape1 = (String) sesionOK2.getAttribute("apellido");
    dire = (String) sesionOK2.getAttribute("direccion");

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
                <li class="breadcrumb-item"><a href="#"><%out.println(dire);%></a></li>
                <li class="breadcrumb-item"><a href="ServletClientes?accion=CancelarVenta">Cancelar Venta</a></li>
            </ol>
        </nav>




        <p>
            <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample1" role="button" aria-expanded="false" aria-controls="collapseExample">
                Productos
            </a>
            <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample2" aria-expanded="false" aria-controls="collapseExample">
                Lentes
            </button>
        </p>
        <div class="collapse" id="collapseExample1">
            <div class="card card-body">

                <div class="table-responsive-md">
                    <table class="table">

                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Nombre</th>
                                    <th scope="col">Descripcion</th>
                                    <th scope="col">Existencia</th>
                                    <th scope="col">Precio Venta</th>
                                </tr>
                            </thead>


                            <%

                                ArrayList<Producto> lista = ProductoBD.obtenerProducto();
                                for (Producto p : lista) {
                            %>


                            <tbody>
                                <tr>
                                    <th scope="row"><%=p.getCod_producto()%></th>
                                    <td><%=p.getNombre()%></td>
                                    <td><%=p.getDescripcion()%></td>
                                    <td><%=p.getExistencia()%></td>
                                    <td><%=p.getPrecio_venta()%></td>
                                    <td>añadir</td>
                                    <td>actualizar</td>
                                </tr>
                            </tbody>


                            <%
                                }
                            %>
                        </table>
                </div>  

            </div>
        </div> 
        <div class="collapse" id="collapseExample2">
            <div class="card card-body">
                Lista de lentes
            </div>
        </div> 

    </div>
</html>
