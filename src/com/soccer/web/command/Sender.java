package com.soccer.web.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Sender {
	public static void forward(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			System.out.println("★★★ 6. Sender 들어옴 ★★★ ");
			System.out.println(String.format("request 값 출력 : %s, %s, %s, %s ",
					request.getParameter("playerId"), 
					request.getParameter("solar"),
					request.getParameter("action"),
					request.getParameter("page")));
			System.out.println("도착지 :: "+Receiver.cmd.getView());
			request
			.getRequestDispatcher(Receiver.cmd.getView())
			.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
	}
	public static void redirect(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			response
			.sendRedirect("");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
	}
}
