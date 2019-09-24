package com.soccer.web.serviceimpls;

import com.soccer.web.services.TeamService;

public class TeamServiceImpl implements TeamService{
	private static TeamServiceImpl instance = new TeamServiceImpl();
	
	public static TeamServiceImpl getInstance() {
		return instance;
		
	}
	private TeamServiceImpl() {
		// TODO Auto-generated constructor stub
	}

}
