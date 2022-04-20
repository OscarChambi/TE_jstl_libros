<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <h1>
            <c:if test="${requestScope.op == 'nuevo'}" var="r" scope="request">
                REGISTRO 
            </c:if>
            <c:if test="${requestScope.op == 'editar'}" var="r" scope="request">
                EDITAR
            </c:if>
            CATEGORIAS
        </h1>
        <jsp:useBean id="cat" scope="request" class="com.emergentes.modelo.Categoria" />
        

        <form action="Controller_categ" method="post">
            <table>
                <tr>
                    <td>Id</td>
                    <td><input type="text" name="id" value="<jsp:getProperty name="cat" property="id" />" >
                    </td>
                </tr>
                <tr>
                    <td>Categoria</td>
                    <td><input type="text" name="categoria" value="<jsp:getProperty name="cat" property="categoria" />" >
                    </td>
                </tr>
                
                
                <tr>
                    <td>
                        <input type="hidden" name="opg" value="${requestScope.op}" />
                        <input type="hidden" name="op" value="grabar" />
                    </td>
                  
                    <td><input type="submit" value="Enviar" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
