package com.soccer.web.daoimpls;

import com.soccer.web.services.StadiumService;

public class StadiumDaoImpl implements StadiumService{

	private static StadiumDaoImpl instance = new StadiumDaoImpl();

	public static StadiumDaoImpl getInstance() {
		return instance;
	}
	
	private StadiumDaoImpl() {}

}
