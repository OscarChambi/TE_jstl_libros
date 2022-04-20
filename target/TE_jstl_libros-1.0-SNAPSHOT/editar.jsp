<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSTL</title>
    </head>
    <body>
        <h1>
            <c:if test="${requestScope.op == 'nuevo'}" var="r" scope="request"> REGISTRO

            </c:if>
            <c:if test="${requestScope.op == 'editar'}" var="r" scope="request">
                EDITAR
            </c:if>
            LIBRO
        </h1>
        <jsp:useBean id="Lib" scope="request" class="com.emergentes.modelo.Libro" />


        <form action="Controller" method="post">
            <table>
                <tr>
                    <td>Id</td>
                    <td><input type="text" name="id" value="<jsp:getProperty name="Lib" property="id" />" >
                    </td>
                </tr>
                <tr>
                    <td>Titulo</td>
                    <td><input type="text" name="titulo" value="<jsp:getProperty name="Lib" property="titulo" />" >
                    </td>
                </tr>
                <tr>
                    <td>Autor</td>
                    <td><input type="text" name="autor" value="<jsp:getProperty name="Lib" property="autor" /> " >
                    </td>
                </tr>

                <tr>
                    <td>Disponible</td>
                    <td>
                        <select name="disponible">
                            <option value="Si"
                                    <c:if test="${Lib.disponible == 'Si'}"
                                          var="r" scope="request">
                                        selected
                                    </c:if>
                                    >Si</option>
                            <option value="No"
                                    <c:if test="${Lib.disponible == 'No'}"
                                          var="res" scope="request">
                                        selected
                                    </c:if>
                                    >No</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>Categoria</td>
                    <td><input type="text" name="categoria" value="<jsp:getProperty name="Lib" property="categoria" /> " >
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
