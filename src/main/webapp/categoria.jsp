<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.emergentes.modelo.Categoria" %>
<%@page import="com.emergentes.modelo.CategoriaG" %>
<%
    if (session.getAttribute("cate") == null) {
        CategoriaG objeto1 = new CategoriaG();

        objeto1.insertarCategoria(new Categoria(1, "Novela"));
        objeto1.insertarCategoria(new Categoria(2, "Historia"));
        objeto1.insertarCategoria(new Categoria(3, "Cuento"));

        session.setAttribute("cate", objeto1);

    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 style="text-align: center">Categorias</h1> <br>
        <a href="Controller_categ?op=nuevo">Nuevo</a>
        
        <table border="1" cellspacing="0">
            <tr>
                <th>Id</th>
                <th>Categoria</th>
                <th></th>
                <th></th>

            </tr>
            <c:forEach var="item" items="${sessionScope.cate.getLista()}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.categoria}</td>
                    <td><a href="Controller_categ?op=editar&id=${item.id}">Editar</a></td>
                    <td><a href="Controller_categ?op=eliminar&id=${item.id}">Eliminar</a></td>
                </tr>
            </c:forEach>
        </table>
        <br>
        <a style="text-align: center"href="index.jsp">Volver a la biblioteca</a>
    </body>
</html>
