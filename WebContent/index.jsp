<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
	<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js'></script>
</head>
<body>
<div id="wrapper" style="width: 100%; height:100%">
	<form id="login_form" action="<%=request.getContextPath()%>/player.do">
		<table border="1" style="width:500px;height:200px; margin: 100px auto">
		<tr>
			<td style="width: 300px">
				USERNAME  <input type="text" name="playerId" style="width: 100%"/>
			</td>
			<td rowspan="2">
				<input type="submit" value="로그인" style="width: 100%;height: 100%"/>
			</td>  
		</tr>
		<tr>
			<td>
				PASSWORD  <input type="text" name="solar" style="width: 100%"/>
			</td>
		</tr>
	</table>
	<input type="hidden" name="action" value="move" style="width: 100%;height: 100%"/>
	<input type="hidden" name="page" value="home" style="width: 100%;height: 100%"/>
	</form>
	<h3 style="width:300px;margin: 0 auto"><a id="a_join" href="">회원가입</a></h3>
</div>
<script>
$('#login_form').submit(function(){
	alert('클릭');
});
</script>	
</body>
</html>