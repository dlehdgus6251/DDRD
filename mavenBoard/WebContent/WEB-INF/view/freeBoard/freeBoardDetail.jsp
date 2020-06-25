<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(document).ready(function(){
	/* $('.content').keyup(function (e){
	    var content = $(this).val();
	      if (content.length > 500){
	        alert("최대 1000자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 500));
	        
	    }
	}); */
	$("#modify").click(function(){
		var data = $("#insertForm").serialize() ; 
		data = decodeURIComponent(data);
		if($("#title").val()==""){ 
			alert("제목을 입력하세요.");
			$("#title").focus();
			return false;
			}else if(confirm("글을 수정하시겠습니까?")==true){
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
				});	//ajax end
			}else{
				return false;
			}
				 
		
	}); //modify end

	$("#delete").click(function(){
		var data = $("#insertForm").serialize() ; 
		if(confirm("글을 삭제하시겠습니까?")==true){
			$.ajax({
				url : "freeBoardDelete.do",
				type : "POST",
				dataType : "json",
				data : data,
				success:function(data){
					if(data.reusltStr == "success"){
						alert("삭제되었습니다.");
						location.href = "./main.do";
					}
				},
				error:function (request, status, error){
					alert(error);
				}					
		}); //ajax end
		}else{
			return false;
		}
		
	}); //delete end
}); // end

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
		<input type="hidden" name="num" value="${freeBoardDto.num }" />
		<div style="width: 150px; float: left;">이름 :</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="name" value="${freeBoardDto.name }" readonly/></div>
		
		<div style="width: 150px; float: left;">제목 :</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="title" id="title" value="${freeBoardDto.title }"/></div>
	
		<div style="width: 150px; float: left;">작성날자</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="regdate"  value="${freeBoardDto.regdate }"/></div>
	
		<div style="width: 150px; float: left;">내용 :</div>
		<div style="width: 500px; float: left;" align="left"><textarea class = "content" name="content" rows="25" cols="65"  >${freeBoardDto.content }</textarea></div>
		<div align="right">
		<input type="button" value="수정" id = "modify">
		<input type="button" value="삭제" id = "delete">
		<input type="button" value="취소" onclick="location.href='./main.do'">
		&nbsp;&nbsp;&nbsp;
		</div>
		
	</form>
	
</body>
</html>