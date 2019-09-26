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
	public PlayerBean login(PlayerBean param) {
		System.out.println("★★★ 6. PlayerServiceImpl 의 login() 으로 이동 ★★★ ");
		System.out.println(String.format("param 값 출력 : %s, %s ",
				param.getPlayerId(), 
				param.getSolar()));
		return PlayerDaoImpl.getInstance().seletByPlayerIdSolar(param);
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
