<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
$(document).ready(function(){
	$("#logoutButton").click(function(){
		location.href = "./logout.do";
	}); // logoutButton end
	$(".a1").click(function(){
		if($(".hide1").css("display")=="none"){
			$(".hide1").show();
		}else{
			$(".hide1").hide();
			$(".hide1-1").hide();
			$(".hide2-1").hide();
		}
		
	});
	$(".a1-1").click(function(){
		if($(".hide1-1").css("display")=="none"){
			$(".hide1-1").show();
			$(".hide2-1").hide();
		}else{
			$(".hide1-1").hide();
		}
	});
	$(".a1-2").click(function(){
		if($(".hide2-1").css("display")=="none"){
			$(".hide2-1").show();
			$(".hide1-1").hide();
		}else{
			$(".hide2-1").hide();
		}
	});
});
</script>
<style type="text/css">
img{
width:20px;
height:16px;
}

/* 

ul{
list-style:none;
margin:0px; 
padding:0px;
position:relative;
text-align:center;
} */
/* 
ul li a{
text-decoration:none;

width:80px;
height: 35px; 
line-height:35px;
}
li{
width:80px;
background-color:#9FC93C;
}
ul li:hover{
background-color:#D4F4FA;
}*/
 ul ul{
display:none;

left: 80px; 
top: 20px;
}  
/* ul li a:visited {
background-color:red;
display:block;
}
ul li:hover > ul {
display:block;
}  */

</style>
</head>
<body>
	<c:if test="${sessionScope.USER_ID != null }">
	<button id="logoutButton" name="logoutButton">Logout</button>
	</c:if>
	<br><br><br><br>
	<div class="sidebar">
		<ul>
			<c:forEach var="i" items="${list }">
				<c:if test="${i.OBJNAME =='main'}">
					<li class="menu"><a class="a1">메인</a><a href="./usermain.do"><img alt="zz" src="./css/img/icons8-fast-forward-32.png" }></a>
						<ul class="hide1">
							<c:forEach var="n" items="${list }">					
								<c:if test="${n.OBJNAME =='권한처리'}">
									<li class="menu"><a class="a1-1">권한처리</a><a href="./masterControllerMain.do"><img alt="zz" src="./css/img/icons8-fast-forward-32.png"></a>
										<ul class="hide1-1">
											<c:forEach var="q" items="${list }">
												<c:if test="${q.OBJNAME =='게시판'}">
													<li class="menu"><a class="a2-1">게시판</a><a href="./sell1.do"><img alt="zz" src="./css/img/icons8-fast-forward-32.png"></a></li>
												</c:if>
											</c:forEach>
										</ul>
									</li>
								</c:if>
								<c:if test="${n.OBJNAME =='공통코드'}"> 
									<li class="menu"><a class="a1-2">공통코드</a><a href="./commonCode.do"><img alt="zz" src="./css/img/icons8-fast-forward-32.png"></a>
										<ul class="hide2-1">
											<c:forEach var="b" items="${list }">
												<c:if test="${b.OBJNAME =='이벤트'}">
													<li class="menu"><a class="a2-1">이벤트</a><a href="./sell2.do"><img alt="zz" src="./css/img/icons8-fast-forward-32.png"></a></li>
												</c:if>
												<c:if test="${b.OBJNAME =='공지사항'}">
													<li class="menu"><a class="a2-2">공지사항</a><a href="./sell2.do"><img alt="zz" src="./css/img/icons8-fast-forward-32.png"></a></li>
												</c:if>
											</c:forEach>
										</ul>
									</li>
								</c:if>					
							</c:forEach>
						</ul>
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>	
</body>
</html>