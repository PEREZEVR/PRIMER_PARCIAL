<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.emergentes.modelo.Vacunas"%>
<%@page import="com.emergentes.modelo.Gestorvacunas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
if(session.getAttribute("agenda")==null){
    Gestorvacunas objeto1=new Gestorvacunas();
    objeto1.insertar(new Vacunas(1,"Brunito Diaz",25,1.4,"SI"));
    objeto1.insertar(new Vacunas(2,"Juancito Pinto",30,1.52,"NO"));
    
    session.setAttribute("agenda", objeto1);
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VACUNA_EPEREZ</title>
    </head>
    <body>
        <table border="1" cellspacing="0" align="center">
            <tr>
                <td>PRIMER PARCIAL TEM-742
                <br>Nombre: EVER PEREZ CHAVEZ
                <br> Carnet: 6932756 LP</td>
            </tr>
        </table>
        <br>
        <h1>REGISTRO DE VACUNAS</h1>
        <a href="Controller?op=nuevo">NUEVO</a>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>NOMBRE</th>
                <th>PESO</th>
                <th>TALLA</th>
                <th>TALLA</th>
                <th>VACUNA</th>
                <th>ELIMINAR</th>
            </tr>
            <c:forEach var="item" items="${sessionScope.agenda.getLista()}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.nombre}</td>
                    <td>${item.peso}</td>
                    <td>${item.talla}</td>
                    <td>${item.vacuna}</td>
                    <td><a href="Controller?op=modificar&id=${item.id}">Modificar</a></td>
                    <td><a href="Controller?op=eliminar&id=${item.id}">Eliminar</a></td>
                </tr>
                
            </c:forEach>
        </table>
    </body>
</html>
