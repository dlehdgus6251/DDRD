<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<c:if test="${sessionScope.USER_ID != null }">
	<button id="logoutButton" name="logoutButton">Logout</button>
	</c:if>
	<br><br><br><br>
	<div class="sidebar">
		<ul>
			<li class="menu"><a class="a1" href="./usermain.do">메인</a></li>										
			<li class="menu"><a class="a1-1" href="./ddrdMeeting.do">모임등록</a></li>	
			<li class="menu"><a class="a1-2" href="./financesMain.do">예산관리</a></li>
		</ul>	
	</div>	
</body>
</html>