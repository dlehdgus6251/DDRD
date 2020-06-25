<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript">
		var message = "${message}";
		if(message !=null && message !=""){
			alert(message);
		}
</script>
</head>
<body>
<c:if test="${sessionScope.USER_ID == null }">
	<div id="welcome"></div>
	<h1>로그인</h1>

<div id='loginList'>
<form name='loginForm' id='loginForm' action="./join.do" method="post">
<input type='text'  placeholder="아이디" style="width:140px;" name='USER_ID' id='USER_ID'/>
<br>
<input type='text'  placeholder="비밀번호" style="width:140px;" name='USER_PW' id='USER_PW'/>
<br>
<button type="submit" id="loginButton" name="loginButton">Login</button>
</form>
</div>
<div id="buttonChange">

</div>
	</c:if>

</body>
</html>