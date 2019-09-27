package com.soccer.web.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/facade.do")
public class FacadeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    enum Resources{
    	CONTEXT,CSS,JS,IMG
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("퍼사드로 들어옴");
		HttpSession session = request.getSession();
		session.setAttribute("ctx", request.getContextPath());
		session.setAttribute("img", request.getContextPath()+"/resources/img");
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/facade/login.jsp");
		rd.forward(request, response);
	}

	
}
