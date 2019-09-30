<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/head.jsp"/>
 <div></div>
 <div>
 	<img id="soccer_intro" src="${img}/soccer_intro.jpg" alt="" />
</div>
 <div></div>
 <div></div>
 <div>
 <form id="login_form">
	<div id="login_tab" >
			<div id="login_tab_item_1" >
				USERNAME  <input class="input_text" type="text" name="playerId"/>
			</div>
			<div id="login_tab_item_2">
				<input id="login_submit" type="submit" value="로그인" />
			</div>  
			<div id="login_tab_item_3">
				PASSWORD  <input class="input_text" type="text" name="solar">
			</div>
	</div>
	<input type="hidden" name="action" value="login" />
	<input type="hidden" name="page" value="home" />
 </form>
</div>
 <div></div>
 <div></div>
 <div>
 	<h3 id="join_a"><a id="a_join" href="#">회원가입</a></h3>
 </div>
 <div></div>
<jsp:include page="../common/foot.jsp"/>
<script>
app.init('${ctx}');
</script>	
