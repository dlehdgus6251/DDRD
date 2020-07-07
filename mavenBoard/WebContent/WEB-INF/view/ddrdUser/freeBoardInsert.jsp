<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script>
$(document).ready(function(){
	$("#submit").click(function(){
		var name = $("#name").val();
		var title = $("#title").val();
		var content = $("#content").val();
		var data = {"name":name,"title":title,"content":content};
		
		if($("#name").val()==""){ 
			alert("이름을 입력하세요.");
			$("#name").focus();
			return false;
			}else if($("#title").val()==""){ 
			alert("제목을 입력하세요.");
			$("#title").focus();
			return false;
			}else if(confirm("글을 등록하시겠습니까?")==true){
				$.ajax({
					url : "freeBoardFunction.do",
					type : "POST",
					dataType : "json",
					data : data,
					success:function(data){
						if(data.reusltStr == "success"){
							alert("등록되었습니다.");
							location.href = "./main.do";
						}else{
							alert("내용이 너무 길어요");
							return false;
						}
								 
					},
					error:function (request, status, error){
						alert(error);
					}
				}); //ajax end
			}else{
				return false;
			}
	}); // submit end

	$("#gomain").click(function(){
		location.href = "./main.do";
	});
});
</script>
</head>
<body>

	<div>
		<h1>자유게시판</h1>
	</div>
	<div style="width:650px;" align="right">
		<a href="./main.do">리스트로</a>
	</div>
	<hr style="width: 600px">
	
	<form name="insertForm" id="insertForm">
	  
		<div style="width: 150px; float: left;">이름 :</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="name" id="name"/></div>
		
		<div style="width: 150px; float: left;">제목 :</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="title" id="title"/></div>
	
		<div style="width: 150px; float: left;">내용 :</div>
		<div style="width: 500px; float: left;" align="left"><textarea class="content" name="content" id="content" rows="25" cols="65"  ></textarea></div>
		<div align="right">
		<input type="button" id="submit" value="글쓰기">
		<input type="button" value="다시쓰기" onclick="reset()">
		<input type="button" value="취소" id="gomain">
		&nbsp;&nbsp;&nbsp;
		</div>
	
	</form>


	
</body>
</html>