<%@page import="com.emergentes.modelo.LibrosG"%>
<%@page import="com.emergentes.modelo.Libro"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    if (session.getAttribute("agen")==null) {
            LibrosG libaux = new LibrosG();
            session.setAttribute("agen", libaux);
        }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSTL </title>
    </head>
    <body>
          <h1 style="text-align: center">Biblioteca</h1>
        <a href="libros.jsp">Libros</a>
        <br>
        <br>
        <a href="categoria.jsp">Categoria</a>
    </body>
</html>
