<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- script 영역 -->
<script type="text/javascript">
function popup(url, name, option){
    window.open(url, name, option);
}
</script>
</head>
<body>
	<div>
		<h1>공통코드 Main</h1>
	</div>
	<div style="width:650px;" align="right">
		<a href="./commonCodeInsert.do">등록</a>
	</div>

	<hr style="width: 600px">
	<table style="width: 600px">
		<tr>
			<th align="left">코드</th>
			<th>코드명</th>
			<th>사용유무</th>
		</tr>

	</table>
	<c:forEach var="map" items="${map.list }">
		<div style="width: 120px; float: left;">${map.CODE }</div>
			<div style="width: 300px; float: left;">
			<a href="javascript:popup('./commonCodeDetail.do?CODE=${map.CODE}', 'popup test', 'width = 1000, height = 500, top = 100, left = 50, location = no' )">${map.CODE_NAME }</a></div>
			<div style="width: 150px; float: left;">${map.USE_YN }</div>
		<hr style="width: 600px">
	</c:forEach>

</body>
</html>