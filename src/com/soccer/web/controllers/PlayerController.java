package com.soccer.web.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.soccer.web.command.Commander;
import com.soccer.web.command.Receiver;
import com.soccer.web.command.Sender;
import com.soccer.web.daoimpls.PlayerDaoImpl;
import com.soccer.web.daos.PlayerDao;
import com.soccer.web.domains.PlayerBean;
import com.soccer.web.enums.Action;
import com.soccer.web.serviceimpls.PlayerServiceImpl;
import com.soccer.web.services.PlayerService;

@WebServlet("/player.do")
public class PlayerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Receiver.init(request);
		switch(Action.valueOf(request.getParameter("action").toUpperCase())) {
		case CREATE : request.setAttribute("page", "login"); break;
		default:break;
		}
		Sender.forward(request, response);
	}
}
