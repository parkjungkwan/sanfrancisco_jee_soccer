package com.soccer.web.serviceimpls;

import java.util.List;

import com.soccer.web.daoimpls.PlayerDaoImpl;
import com.soccer.web.daos.PlayerDao;
import com.soccer.web.domains.PlayerBean;
import com.soccer.web.services.PlayerService;

public class PlayerServiceImpl implements PlayerService{
	private static PlayerServiceImpl instance = new PlayerServiceImpl();
	public static PlayerServiceImpl getInstance() {return instance;}
	public PlayerServiceImpl() {}
	@Override
	public boolean login(PlayerBean param) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public List<String> findPositions() {
		return PlayerDaoImpl.
				getInstance().
				selectPositions();
	}

	@Override
	public List<PlayerBean> findByTeamIdPosition(PlayerBean param) {
		return PlayerDaoImpl
				.getInstance().selectByTeamIdPosition(param);
	}

	@Override
	public List<PlayerBean> findByTeamIdHeightName(PlayerBean param) {
		return null;
	}
	

}
