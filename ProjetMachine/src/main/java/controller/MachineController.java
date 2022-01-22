package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import beans.Machine;
import service.MachineService;
import service.SalleService;

@WebServlet("/MachineController")
public class MachineController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MachineService ms = new MachineService();
	SalleService ss = new SalleService();
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 
    	if (request.getParameter("op") != null) {
            if (request.getParameter("op").equals("load")) {
            	response.setContentType("application/json");
            	Gson json = new Gson();
                response.getWriter().write(json.toJson(ms.findAll()));
                System.out.println("load");
            }
        }
    	else
    	{
    		response.setContentType("application/json");
            ms.create(new Machine(request.getParameter("ref"),
            		request.getParameter("marque"),
            		new Date(request.getParameter("dateAchat").replace("-", "/")),
            		Double.parseDouble(request.getParameter("prix")),
            		ss.findById(Integer.parseInt(request.getParameter("salle")))));
            Gson json = new Gson();
            response.getWriter().write(json.toJson(ms.findAll()));
            System.out.println("add");
    	}
	 }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);

	}

}