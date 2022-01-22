package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import beans.Machine;
import beans.Salle;
import service.SalleService;

@WebServlet("/SalleController")
public class SalleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	SalleService ss = new SalleService();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 
    	if (request.getParameter("op") != null) {
            if (request.getParameter("op").equals("load")) {
                response.setContentType("application/json");
                List<Salle> salles = ss.findAll();
                Gson json = new Gson();
                response.getWriter().write(json.toJson(salles));
                System.out.println("load");
            }
        }
    	else
    	{
    		response.setContentType("application/json");
            ss.create(new Salle(request.getParameter("code"),request.getParameter("type")));
            List<Salle> salles = ss.findAll();
            Gson json = new Gson();
            response.getWriter().write(json.toJson(salles));
    	}
	 }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);

	}

}