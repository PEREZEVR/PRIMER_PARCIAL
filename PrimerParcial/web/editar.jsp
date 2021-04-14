<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSTL</title>
    </head>
    <body>
        <h1>
            <c:if test="${requestScope.op=='nuevo'}" var="res" scope="request">
            RREGISTRO DE
            </c:if>
            <c:if test="${requestScope.op=='modificar'}" var="res" scope="request">
            MODIFICAR
            </c:if>
            VACUNAS
        </h1>
        <jsp:useBean id="mivacu" scope="request" class="com.emergentes.modelo.Vacunas" />
        <form action="Controller" method="post">
            <table>
                <tr>
                    <td>ID</td>
                    <td><input type="text" name="id" 
                               value="<jsp:getProperty name="mivacu" property="id" />">
                    </td>
                </tr>
                <tr>
                    <td>NOMBRE</td>
                    <td><input type="text" name="nombre"
                            value="<jsp:getProperty name="mivacu" property="nombre" />" />
                        
                    </td>
                    
                </tr>
                <tr>
                    <td>PESO</td>
                    <td><input type="text" name="peso"
                            value="<jsp:getProperty name="mivacu" property="peso" />" />
                        
                    </td>
                    
                </tr>
                <tr>
                    <td>TALLA</td>
                    <td><input type="text" name="talla"
                            value="<jsp:getProperty name="mivacu" property="talla" />" />
                        
                    </td>
                    
                </tr>
                <tr>
                    <td>VACUNA</td>
                     <td>
                        <select name="vacuna">
                            <option value="SI"
                                    <c:if test="${mivacu.vacuna == 'SI'}"
                                      var="res" scope="request" >
                                    selected
                                </c:if>>SI
                            </option>
                            <option value="NO"
                                <c:if test="${mivacu.vacuna == 'NO'}"
                                      var="res" scope="request" >
                                    selected
                                </c:if>>NO
                            </option>
                        </select>
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        <input type="hidden" name="opg" value="${requestScope.op}"/>
                        <input type="hidden" name="op" value="grabar"/>
                    </td>
                    <td><input type="submit" value="Enviar" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
