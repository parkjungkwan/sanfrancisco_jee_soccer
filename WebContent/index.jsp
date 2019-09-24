<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<h2><input id="btn2" type="button" value="2. 포지션 종류 보기"/></h2>
<!-- 4. 팀아이디로 해당 팀의 포지션별 선수 검색기능 예) 수원팀(ID: K02), 골키퍼 -->
<h2>4. 팀아이디와 포지션 입력하면 해당 선수 정보 출력</h2>
<form id="btn4" action="<%=request.getContextPath()%>/player.do">
	팀아이디 : <input type="text" name="teamId" /><br />
	포지션 : <input type="text" name="position" /><br />
	<input type="hidden" name="action" value="find" /><br />
	<input type="hidden" name="page" value="4_find_by_teamid_position" /><br />
	<input type="submit" value="전 송"/>
</form>
<h2>5. 팀아이디와 포지션 입력하면 해당 선수 정보 출력</h2>
<script>
$('#btn2').click(function(){
	alert('클릭');
	location.assign('<%=request.getContextPath()%>/player.do?action=find2&page=2_positions');
});
$('#btn4').submit(function(){
	alert('클릭');
});
</script>
</body>
</html>