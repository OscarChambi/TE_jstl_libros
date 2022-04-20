
package com.emergentes.controlador;

import com.emergentes.modelo.Categoria;
import com.emergentes.modelo.CategoriaG;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Controller_categ", urlPatterns = {"/Controller_categ"})
public class Controller_categ extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Categoria objCate = new Categoria();
        int id;
        int pos;
        String opcion = request.getParameter("op");
        String op = (opcion != null) ? request.getParameter("op"):"view";
        
        if (op.equals("nuevo")){
            HttpSession sesi = request.getSession();
            CategoriaG cate = (CategoriaG) sesi.getAttribute("cate");
            objCate.setId(cate.obtieneId());
            request.setAttribute("op", op);
            request.setAttribute("Cat", objCate);
            request.getRequestDispatcher("editarc.jsp").forward(request, response);
        }
        
        if (op.equals("editar")){
            id = Integer.parseInt(request.getParameter("id"));
            HttpSession sesi = request.getSession();
            CategoriaG cate = (CategoriaG) sesi.getAttribute("cate");
            pos = cate.ubicarCategoria(id);
            objCate = cate.getLista().get(pos);
            
            request.setAttribute("op", op);
            request.setAttribute("Cat", objCate);
            request.getRequestDispatcher("editarc.jsp").forward(request, response);
        }
        
        if (op.equals("eliminar")){
            id = Integer.parseInt(request.getParameter("id"));
            HttpSession sesi = request.getSession();
            CategoriaG cate = (CategoriaG) sesi.getAttribute("cate");
            pos = cate.ubicarCategoria(id);
            cate.eliminarCategoria(pos);
            sesi.setAttribute("cate", cate);
            response.sendRedirect("categoria.jsp");
        }
        
        if (op.equals("view")) {
            response.sendRedirect("categoria.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Categoria objCate = new Categoria();
       int pos;
       String op = request.getParameter("op");
       
       if (op.equals("grabar")){
           
           objCate.setId(Integer.parseInt(request.getParameter("id")));
           objCate.setCategoria(request.getParameter("categoria"));
           
           
           HttpSession sesi = request.getSession();
           CategoriaG cate = (CategoriaG) sesi.getAttribute("cate");
           
           String opg = request.getParameter("opg");
           if (opg.equals("nuevo")){
               cate.insertarCategoria(objCate);
           }
           else
           {
               pos = cate.ubicarCategoria(objCate.getId());
               cate.modificarCategoria(pos, objCate);
           }
           sesi.setAttribute("cate", cate);
           response.sendRedirect("categoria.jsp");
       }
    }

}
