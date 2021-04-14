package com.emergentes.controlador;

import com.emergentes.modelo.Gestorvacunas;
import com.emergentes.modelo.Vacunas;
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
       Vacunas objvac=new Vacunas();
       int id;
       int pos;
       String op = request.getParameter("op");
       
       if(op.equals("nuevo")){
           HttpSession ses=request.getSession();
           Gestorvacunas vacu= (Gestorvacunas) ses.getAttribute("agenda");
           objvac.setId(vacu.obtenerID());
           request.setAttribute("op", op);
           request.setAttribute("mivacu", objvac);
           request.getRequestDispatcher("editar.jsp").forward(request, response);
       }
       if(op.equals("modificar")){
           id=Integer.parseInt(request.getParameter("id"));
           HttpSession ses = request.getSession();
           Gestorvacunas agenda=(Gestorvacunas) ses.getAttribute("agenda");
           pos=agenda.ubicar(id);
           objvac=agenda.getLista().get(pos);
           
           request.setAttribute("op", op);
           request.setAttribute("mivacu", objvac);
           request.getRequestDispatcher("editar.jsp").forward(request, response);;
           
               
       }
       if(op.equals("eliminar")){
           id=Integer.parseInt(request.getParameter("id"));
           HttpSession ses = request.getSession();
           Gestorvacunas agenda=(Gestorvacunas) ses.getAttribute("agenda");
           pos= agenda.ubicar(id);
           agenda.eleiminar(pos);
           ses.setAttribute("agenda", agenda);
           response.sendRedirect("index.jsp");
       }
       
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       Vacunas objvac = new Vacunas();
       int pos;
       String op=request.getParameter("op");
       
       if(op.equals("grabar")){
           objvac.setId(Integer.parseInt(request.getParameter("id")));
           objvac.setNombre(request.getParameter("nombre"));
           objvac.setPeso(Double.parseDouble(request.getParameter("peso")));
           objvac.setTalla(Double.parseDouble(request.getParameter("talla")));
           objvac.setVacuna(request.getParameter("vacuna"));
           HttpSession ses = request.getSession();
           Gestorvacunas agenda=(Gestorvacunas) ses.getAttribute("agenda");
           String opg=request.getParameter("opg");
           if(opg.equals("nuevo")){
               agenda.insertar(objvac);
           }else{
               pos=agenda.ubicar(objvac.getId());
               agenda.modificar(pos, objvac);
           }
           ses.setAttribute("agenda", agenda);
           response.sendRedirect("index.jsp");
           
       }
    }
}