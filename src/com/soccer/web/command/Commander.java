package com.soccer.web.command;

import javax.servlet.http.HttpServletRequest;
import com.soccer.web.enums.Action;

public class Commander {

	public static Command direct(HttpServletRequest request) {
		Command cmd = null;
		switch(Action.valueOf(request.getParameter("action").toUpperCase())) {
		case SEARCH : cmd = new SearchCommand(request); break;
		case MOVE : cmd = new MoveCommand(request);break;
		}
		
		return cmd;
	}
}
