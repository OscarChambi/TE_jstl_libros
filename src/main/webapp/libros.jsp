<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.emergentes.modelo.Libro" %>
<%@page import="com.emergentes.modelo.LibrosG" %>
<%
    if (session.getAttribute("libro") == null) {
        LibrosG objeto1 = new LibrosG();

        objeto1.insertarLibro(new Libro(1, "El Principito", "Antoine de Sain", "Si", "Cuento"));
        objeto1.insertarLibro(new Libro(2, "La Conspiración", "Don Brown", "No", "Novela"));
        objeto1.insertarLibro(new Libro(3, "Historia de Bolivia", "Historia", "Si", "Editor"));

        session.setAttribute("libro", objeto1);

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
      <h1 style="text-align: center">Libros</h1>
      
       <a href="Controller?op=nuevo">Nuevo</a>
  
        <table border="1" cellspacing="0">
            <tr>
                <th>Id</th>
                <th>Titulo</th>
                <th>Autor</th>
                <th>Disponible</th>
                <th>Categoria</th>
                <th></th>
                <th></th>

            </tr>
            <c:forEach var="item" items="${sessionScope.libro.getLista()}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.titulo}</td>
                    <td>${item.autor}</td>
                    <td>${item.disponible}</td>
                    <td>${item.categoria}</td>
                    <td><a href="Controller?op=editar&id=${item.id}">Editar</a></td>
                    <td><a href="Controller?op=eliminar&id=${item.id}">Eliminar</a></td>
                </tr>
            </c:forEach>
        </table>
       <br>
       <a  href="index.jsp">Volver a la biblioteca</a>
    </body>
</html>
