package com.emergentes.controlador;

import com.emergentes.modelo.LibrosG;
import com.emergentes.modelo.Libro;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Controller", urlPatterns = {"/Controller"})
public class Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Libro objLibro = new Libro();
        int id;
        int pos;
        String opcion = request.getParameter("op");
        String op = (opcion != null) ? request.getParameter("op"):"view";
        
        if (op.equals("nuevo")){
            HttpSession ses = request.getSession();
            LibrosG libro = (LibrosG) ses.getAttribute("libro");
            objLibro.setId(libro.obtieneId());
            request.setAttribute("op", op);
            request.setAttribute("Lib", objLibro);
            request.getRequestDispatcher("editar.jsp").forward(request, response);
        }
        
        if (op.equals("editar")){
            id = Integer.parseInt(request.getParameter("id"));
            HttpSession ses = request.getSession();
            LibrosG libro = (LibrosG) ses.getAttribute("libro");
            pos = libro.ubicarLibro(id);
            objLibro = libro.getLista().get(pos);
            
            request.setAttribute("op", op);
            request.setAttribute("Lib", objLibro);
            request.getRequestDispatcher("editar.jsp").forward(request, response);
        }
        
        if (op.equals("eliminar")){
            id = Integer.parseInt(request.getParameter("id"));
            HttpSession ses = request.getSession();
            LibrosG libro = (LibrosG) ses.getAttribute("libro");
            pos = libro.ubicarLibro(id);
            libro.eliminarLibro(pos);
            ses.setAttribute("libro", libro);
            response.sendRedirect("libros.jsp");
        }
        
        if (op.equals("view")) {
            response.sendRedirect("libro.jsp");
        }
        
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       Libro objLibro = new Libro();
       int pos;
       String op = request.getParameter("op");
       
       if (op.equals("grabar")){
           //Recuperar valores del formulario
           //Verificar si es nuevo o ese una modificacion
           objLibro.setId(Integer.parseInt(request.getParameter("id")));
           objLibro.setTitulo(request.getParameter("titulo"));
           objLibro.setAutor(request.getParameter("autor"));
           objLibro.setDisponible(request.getParameter("disponible"));
           objLibro.setCategoria(request.getParameter("categoria"));
           
           HttpSession ses = request.getSession();
           LibrosG libro = (LibrosG) ses.getAttribute("libro");
           
           String opg = request.getParameter("opg");
           if (opg.equals("nuevo")){
               libro.insertarLibro(objLibro);
           }
           else
           {
               pos = libro.ubicarLibro(objLibro.getId());
               libro.editarLibro(pos, objLibro);
           }
           ses.setAttribute("libro", libro);
           response.sendRedirect("libros.jsp");
       }
       
    }


}
