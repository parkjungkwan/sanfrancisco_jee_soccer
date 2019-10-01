package com.soccer.web.command;

import javax.servlet.http.HttpServletRequest;
import com.soccer.web.enums.Action;

public class Commander {

	public static Command direct(HttpServletRequest request) {
		Command cmd = null;
		System.out.println(">>> "+request.getParameter("action"));
		switch(Action.valueOf(request.getParameter("action").toUpperCase())) {
		case CREATE : cmd = new CreateCommand(request); break;
		case SEARCH : break;
		case UPDATE : break;
		case DELETE : break;
		case MOVE : cmd = new MoveCommand(request); break;
		default:
			break;
		}
		
		return cmd;
	}
}
