<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 4. 팀아이디로 해당 팀의 포지션별 선수 검색기능 예) 수원팀(ID: K02), 골키퍼 -->
<h2>4. 팀아이디와 포지션 입력하면 해당 선수 정보 출력</h2>
<form id="btn4" action="${ctx}/player.do">
	팀아이디 : <input type="text" name="teamId" /><br />
	포지션 : <input type="text" name="position" /><br />
	<input type="hidden" name="action" value="find" /><br />
	<input type="hidden" name="page" value="4_find_by_teamid_position" /><br />
	<input type="submit" value="전 송"/>
</form>

<!-- 4. 결과 -->
해당 ID가 ${player.teamId} 팀의 포지션 ${player.position}이 
일치하는 선수는 홍길동입니다.
