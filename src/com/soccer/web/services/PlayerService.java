package com.soccer.web.services;

import java.util.List;

import com.soccer.web.domains.PlayerBean;

public interface PlayerService {
	// 1. 로그인
	public PlayerBean login(PlayerBean param);
	// 2. 포지션 종류(중복제거,없으면 빈공간)
	public List<String> findPositions();
	// 4. 수원팀(ID: K02)골키퍼
	public List<PlayerBean> findByTeamIdPosition(PlayerBean param);
	// 5. 팀ID, 키, 플레이어네임(성)
	public List<PlayerBean> findByTeamIdHeightName(PlayerBean param);
	
}
