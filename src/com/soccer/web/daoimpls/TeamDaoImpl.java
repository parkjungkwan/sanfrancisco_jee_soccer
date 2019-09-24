package com.soccer.web.daoimpls;

import com.soccer.web.daos.TeamDao;

public class TeamDaoImpl implements TeamDao{
	private static TeamDaoImpl instance = new TeamDaoImpl();

	public static TeamDaoImpl getInstance() {
		return instance;
	}
	private TeamDaoImpl() {}
}
