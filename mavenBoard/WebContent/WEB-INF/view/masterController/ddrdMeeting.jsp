<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
/* 	var userList = new Array();
	var select_th = 
		"<tr>"+
			"<th style='width:50px'>선택</th>" +
			"<th style='width:80px'>회원번호</th>"+
			"<th style='width:100px'>이름</th>"+
			"<th style='width:50px'>성별</th>"+
			"<th style='width:50px'>나이</th>"+
			"<th style='width:150px'>가입일</th>"+
			"<th style='width:80px'>참석횟수</th>"+
			"<th style='width:70px'>참석률</th>"+
		"</tr>";
	 */
	/* var select = 
		"<tr>" +	
			"<td style='width:50px'><input type='checkbox' name='checkbox' id='checkbox'><input type='hidden' name='FLAG' id='FLAG' value='L'></td>" +
			"<td style='width:80px'>" + userList[i].USER_NUMBER +"<input type='hidden' name='USER_NUMBER' id='USER_NUMBER' value='" + userList[i].USER_NUMBER + "'></td>"+
			"<td style='width:100px'>" + userList[i].NAME + "<input type='hidden' name='NAME' id='NAME' value='" + userList[i].NAME + "'></td>"+
			"<td style='width:50px'>" + userList[i].SEX + "<input type='hidden' name='SEX' id='SEX' value='" + userList[i].SEX + "'></td>"+
			"<td style='width:50px'>" + userList[i].AGE + "<input type='hidden' name='AGE' id='AGE' value='" + userList[i].AGE + "'></td>"+
			"<td style='width:150px'>" + userList[i].JOIN_DATE + "<input type='hidden' name='JOIN_DATE' id='JOIN_DATE' value='" + userList[i].JOIN_DATE + "'></td>"+
			"<td style='width:80px'>" + userList[i].ATTENDING_COUNT + "<input type='hidden' name='ATTENDING_COUNT' id='ATTENDING_COUNT' value='" + userList[i].ATTENDING_COUNT + "'></td>"+
			"<td style='width:70px'>" + userList[i].ATTENDANCE_RATE + "<input type='hidden' name='ATTENDANCE_RATE' id='ATTENDANCE_RATE' value='" + userList[i].ATTENDANCE_RATE + "'></td>" +
		"</tr>"; */
	
	$("#I_JOIN_DATE").keyup(function() {
        if( this.value.length > 10){
             this.value = this.value.substr(0, 10);
         }
         var val         = this.value.replace(/\D/g, ''); // 숫자가 아닌 문자를 찾아 지움
         var original    = this.value.replace(/\D/g, '').length; 
         var conversion  = '';
         for(i=0;i<2;i++){
             if (val.length > 4 && i===0) {
                 conversion += val.substr(0, 4) + '-';
                 val         = val.substr(4);
             }
             else if(original>6 && val.length > 2 && i===1){
                 conversion += val.substr(0, 2) + '-';
                 val         = val.substr(2);
             }
         }
         conversion += val;
         this.value = conversion;
     });// firstDate end
	$("#insert").click(function(){
		var JOIN_DATE_STRING = $("#I_JOIN_DATE").val();
		var date_pattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
		var NAME = $("#I_NAME").val();
		var SEX = $("#I_SEX").val();
		var AGE = $("#I_AGE").val();
		var JOIN_DATE_SPLIT = JOIN_DATE_STRING.split("-");
		var JOIN_DATE="";
		for(var i=0; i<JOIN_DATE_SPLIT.length; i++){
			JOIN_DATE += JOIN_DATE_SPLIT[i];
		}
		console.log(JOIN_DATE_STRING);
		console.log(JOIN_DATE_SPLIT);
		console.log(JOIN_DATE);
		if(!date_pattern.test(JOIN_DATE_STRING)){
			alert("날짜형식이 맞지않습니다");
			return false;
		}
		var TdArr = new Array();
		var arr = {};
		arr.NAME = NAME;
		arr.SEX = SEX;
		arr.AGE = AGE;
		arr.JOIN_DATE = JOIN_DATE;
		TdArr.push(arr);
		console.log(TdArr);
		$.ajax({
			url : "userInsert.do",
			type : "POST",
			dataType : "json",
			data : JSON.stringify(TdArr),
			contentType: "application/json",
			success:function(data){
				var userList = data.UserList;
				$("#JOIN_DB")[0].reset();
				$("#table").empty();
				
				var str='';
								
				str+="<tbody><tr>"+
						"<th style='width:50px'>선택</th>" +
						"<th style='width:100px'>모임명</th>"+
						"<th style='width:50px'>모이는날</th>"+
						"<th style='width:50px'>장소</th>"+
						"<th style='width:150px'>인원</th>"+
						"<th style='width:80px'>참석횟수</th>"+
						"<th style='width:70px'>참석률</th>"+
					"</tr>";
				for(var i=0; i<userList.length; i++){
					str+="<tr>" +	
							"<td style='width:50px'><input type='checkbox' name='checkbox' id='checkbox'><input type='hidden' name='FLAG' id='FLAG' value='L'></td>" +
							"<td style='width:100px'>" + meetingList[i].MEETING_NAME + "<input type='hidden' name='MEETING_NAME' id='MEETING_NAME' value='" + meetingList[i].MEETING_NAME + "'></td>"+
							"<td style='width:150px'>" + meetingList[i].MEETING_DATE + "<input type='hidden' name='MEETING_DATE' id='MEETING_DATE' value='" + meetingList[i].MEETING_DATE + "'></td>"+
							"<td style='width:80px'>" + meetingList[i].MEETING_AD + "<input type='hidden' name='MEETING_AD' id='MEETING_AD' value='" + meetingList[i].MEETING_AD + "'></td>"+
							"<td style='width:70px'>" + meetingList[i].TOTAL_USER + "<input type='hidden' name='TOTAL_USER' id='TOTAL_USER' value='" + meetingList[i].TOTAL_USER + "'></td>" +
						"</tr>";
				}
				str+='</tbody>'
				$('#table').html(str);
				
			},
			error:function (request, status, error){
				alert(error);
			}
		}); //ajax end
	}); // insert end
	$("#update").click(function(){
		var check = $("input[name='checkbox']:checked");
		var check_td = check.parent();
		var check_tr = check_td.parent();
		var TdArr = new Array();
		check.each(function(i){
			var arr = {};
			var tr = check.parent().parent().eq(i);
			var td = tr.children();
		
			arr.FLAG = td.eq(0).find("input[name='FLAG']").val();
			arr.USER_NUMBER = td.eq(1).find("input[name='USER_NUMBER']").val();
			arr.NAME = td.eq(2).find("input[name='NAME']").val();
			arr.SEX = td.eq(3).find("input[name='SEX']").val();
			arr.AGE = td.eq(4).find("input[name='AGE']").val();
			arr.JOIN_DATE = td.eq(5).find("input[name='JOIN_DATE']").val();
			arr.ATTENDING_COUNT = td.eq(6).find("input[name='ATTENDING_COUNT']").val();
			arr.ATTENDANCE_RATE = td.eq(7).find("input[name='ATTENDANCE_RATE']").val();
				
			TdArr.push(arr);
		});
		for(var i=0; i<TdArr.length; i++){
			check_tr.eq(i).html("");
			check_tr.eq(i).append(
					"<td style='width:50px'><input type='checkbox' name='checkbox' id='checkbox' checked='checked'><input type='hidden' name='FLAG' id='FLAG' value='U'></td>" +
					"<td style='width:80px'><input type='text' style='width:100%' name='USER_NUMBER' id='USER_NUMBER' value='" + TdArr[i].USER_NUMBER + "'></td>"+
					"<td style='width:100px'><input type='text' style='width:100%' name='NAME' id='NAME' value='" + TdArr[i].NAME + "'></td>"+
					"<td style='width:50px'><input type='text' style='width:100%' name='SEX' id='SEX' value='" + TdArr[i].SEX + "'></td>"+
					"<td style='width:50px'><input type='text' style='width:100%' name='AGE' id='AGE' value='" + TdArr[i].AGE + "'></td>"+
					"<td style='width:150px'><input type='text' style='width:100%' name='JOIN_DATE' id='JOIN_DATE' value='" + TdArr[i].JOIN_DATE + "'></td>"+
					"<td style='width:80px'><input type='text' style='width:100%' name='ATTENDING_COUNT' id='ATTENDING_COUNT' value='" + TdArr[i].ATTENDING_COUNT + "'></td>"+
					"<td style='width:70px'><input type='text' style='width:100%' name='ATTENDANCE_RATE' id='ATTENDANCE_RATE' value='" + TdArr[i].ATTENDANCE_RATE + "'></td>"
			);
		}
	}); // update end
	$("#delete").click(function(){
		var check = $("input[name='checkbox']:checked");
		var check_td = check.parent();
		var check_tr = check_td.parent();
		var TdArr = new Array();
		check.each(function(i){
			var arr = {};
			var tr = check.parent().parent().eq(i);
			var td = tr.children();
			
			arr.USER_NUMBER = td.eq(1).find("input[name='USER_NUMBER']").val();
			
			TdArr.push(arr);
		});
		var result = confirm("선택하신 회원을 삭제하시겠습니까?");
		if(result){
			
			$.ajax({
				url : "userDelete.do",
				type : "POST",
				dataType : "json",
				data : JSON.stringify(TdArr),
				contentType: "application/json",
				success:function(data){
					var userList = data.UserList;
					
					$("#table").empty();
					
					var str='';
					
					
					str+="<tbody><tr>"+
							"<th style='width:50px'>선택</th>" +
							"<th style='width:80px'>회원번호</th>"+
							"<th style='width:100px'>이름</th>"+
							"<th style='width:50px'>성별</th>"+
							"<th style='width:50px'>나이</th>"+
							"<th style='width:150px'>가입일</th>"+
							"<th style='width:80px'>참석횟수</th>"+
							"<th style='width:70px'>참석률</th>"+
						"</tr>";
					for(var i=0; i<userList.length; i++){
						str+="<tr>" +	
								"<td style='width:50px'><input type='checkbox' name='checkbox' id='checkbox'><input type='hidden' name='FLAG' id='FLAG' value='L'></td>" +
								"<td style='width:80px'>" + userList[i].USER_NUMBER +"<input type='hidden' name='USER_NUMBER' id='USER_NUMBER' value='" + userList[i].USER_NUMBER + "'></td>"+
								"<td style='width:100px'>" + userList[i].NAME + "<input type='hidden' name='NAME' id='NAME' value='" + userList[i].NAME + "'></td>"+
								"<td style='width:50px'>" + userList[i].SEX + "<input type='hidden' name='SEX' id='SEX' value='" + userList[i].SEX + "'></td>"+
								"<td style='width:50px'>" + userList[i].AGE + "<input type='hidden' name='AGE' id='AGE' value='" + userList[i].AGE + "'></td>"+
								"<td style='width:150px'>" + userList[i].JOIN_DATE + "<input type='hidden' name='JOIN_DATE' id='JOIN_DATE' value='" + userList[i].JOIN_DATE + "'></td>"+
								"<td style='width:80px'>" + userList[i].ATTENDING_COUNT + "<input type='hidden' name='ATTENDING_COUNT' id='ATTENDING_COUNT' value='" + userList[i].ATTENDING_COUNT + "'></td>"+
								"<td style='width:70px'>" + userList[i].ATTENDANCE_RATE + "<input type='hidden' name='ATTENDANCE_RATE' id='ATTENDANCE_RATE' value='" + userList[i].ATTENDANCE_RATE + "'></td>" +
							"</tr>";
					}
					str+='</tbody>'
					$('#table').html(str);
					
				},
				error:function (request, status, error){
					alert(error);
				}
			});
		}
		
	}); // delete end
	$("#submit").click(function(){
		var check = $("input[name='checkbox']:checked");
		var check_td = check.parent();
		var check_tr = check_td.parent();
		var TdArr = new Array();
		check.each(function(i){
			var arr = {};
			var tr = check.parent().parent().eq(i);
			var td = tr.children();
		
			arr.FLAG = td.eq(0).find("input[name='FLAG']").val();
			arr.USER_NUMBER = td.eq(1).find("input[name='USER_NUMBER']").val();
			arr.NAME = td.eq(2).find("input[name='NAME']").val();
			arr.SEX = td.eq(3).find("input[name='SEX']").val();
			arr.AGE = td.eq(4).find("input[name='AGE']").val();
			arr.JOIN_DATE = td.eq(5).find("input[name='JOIN_DATE']").val();
			arr.ATTENDING_COUNT = td.eq(6).find("input[name='ATTENDING_COUNT']").val();
			arr.ATTENDANCE_RATE = td.eq(7).find("input[name='ATTENDANCE_RATE']").val();
				
			TdArr.push(arr);
		});
		var result = confirm("선택하신 회원을 수정하시겠습니까?");
		if(result){
			
			$.ajax({
				url : "userUpdate.do",
				type : "POST",
				dataType : "json",
				data : JSON.stringify(TdArr),
				contentType: "application/json",
				success:function(data){
					var userList = data.UserList;
					
					$("#table").empty();
					
					var str='';
					
					
					str+="<tbody><tr>"+
							"<th style='width:50px'>선택</th>" +
							"<th style='width:80px'>회원번호</th>"+
							"<th style='width:100px'>이름</th>"+
							"<th style='width:50px'>성별</th>"+
							"<th style='width:50px'>나이</th>"+
							"<th style='width:150px'>가입일</th>"+
							"<th style='width:80px'>참석횟수</th>"+
							"<th style='width:70px'>참석률</th>"+
						"</tr>";
					for(var i=0; i<userList.length; i++){
						str+="<tr>" +	
								"<td style='width:50px'><input type='checkbox' name='checkbox' id='checkbox'><input type='hidden' name='FLAG' id='FLAG' value='L'></td>" +
								"<td style='width:80px'>" + userList[i].USER_NUMBER +"<input type='hidden' name='USER_NUMBER' id='USER_NUMBER' value='" + userList[i].USER_NUMBER + "'></td>"+
								"<td style='width:100px'>" + userList[i].NAME + "<input type='hidden' name='NAME' id='NAME' value='" + userList[i].NAME + "'></td>"+
								"<td style='width:50px'>" + userList[i].SEX + "<input type='hidden' name='SEX' id='SEX' value='" + userList[i].SEX + "'></td>"+
								"<td style='width:50px'>" + userList[i].AGE + "<input type='hidden' name='AGE' id='AGE' value='" + userList[i].AGE + "'></td>"+
								"<td style='width:150px'>" + userList[i].JOIN_DATE + "<input type='hidden' name='JOIN_DATE' id='JOIN_DATE' value='" + userList[i].JOIN_DATE + "'></td>"+
								"<td style='width:80px'>" + userList[i].ATTENDING_COUNT + "<input type='hidden' name='ATTENDING_COUNT' id='ATTENDING_COUNT' value='" + userList[i].ATTENDING_COUNT + "'></td>"+
								"<td style='width:70px'>" + userList[i].ATTENDANCE_RATE + "<input type='hidden' name='ATTENDANCE_RATE' id='ATTENDANCE_RATE' value='" + userList[i].ATTENDANCE_RATE + "'></td>" +
							"</tr>";
					}
					str+='</tbody>'
					$('#table').html(str);
					
				},
				error:function (request, status, error){
					alert(error);
				}
			});
		}
	});
	$("#search").click(function(){
		var searchWord = $("#searchWord").val();
		console.log(searchWord);
		$.ajax({
			url : "search.do",
			type : "POST",
			dataType : "json",
			data : {"searchWord":searchWord},
			success:function(data){
				var userList = data.UserList;
				
				$("#table").empty();
				
				var str='';
				
				
				str+="<tbody><tr>"+
						"<th style='width:50px'>선택</th>" +
						"<th style='width:80px'>회원번호</th>"+
						"<th style='width:100px'>이름</th>"+
						"<th style='width:50px'>성별</th>"+
						"<th style='width:50px'>나이</th>"+
						"<th style='width:150px'>가입일</th>"+
						"<th style='width:80px'>참석횟수</th>"+
						"<th style='width:70px'>참석률</th>"+
					"</tr>";
				for(var i=0; i<userList.length; i++){
					str+="<tr>" +	
							"<td style='width:50px'><input type='checkbox' name='checkbox' id='checkbox'><input type='hidden' name='FLAG' id='FLAG' value='L'></td>" +
							"<td style='width:80px'>" + userList[i].USER_NUMBER +"<input type='hidden' name='USER_NUMBER' id='USER_NUMBER' value='" + userList[i].USER_NUMBER + "'></td>"+
							"<td style='width:100px'>" + userList[i].NAME + "<input type='hidden' name='NAME' id='NAME' value='" + userList[i].NAME + "'></td>"+
							"<td style='width:50px'>" + userList[i].SEX + "<input type='hidden' name='SEX' id='SEX' value='" + userList[i].SEX + "'></td>"+
							"<td style='width:50px'>" + userList[i].AGE + "<input type='hidden' name='AGE' id='AGE' value='" + userList[i].AGE + "'></td>"+
							"<td style='width:150px'>" + userList[i].JOIN_DATE + "<input type='hidden' name='JOIN_DATE' id='JOIN_DATE' value='" + userList[i].JOIN_DATE + "'></td>"+
							"<td style='width:80px'>" + userList[i].ATTENDING_COUNT + "<input type='hidden' name='ATTENDING_COUNT' id='ATTENDING_COUNT' value='" + userList[i].ATTENDING_COUNT + "'></td>"+
							"<td style='width:70px'>" + userList[i].ATTENDANCE_RATE + "<input type='hidden' name='ATTENDANCE_RATE' id='ATTENDANCE_RATE' value='" + userList[i].ATTENDANCE_RATE + "'></td>" +
						"</tr>";
				}
				str+='</tbody>'
				$('#table').html(str);
				
			},
			error:function (request, status, error){
				alert(error);
			}
		});
	});
}); //end

</script>
</head>
<style>

</style>
<body>

	<div>
		<h1>회원관리</h1>
	</div>
	<button id="insert"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></button>
	<button id="update"><span class="glyphicon glyphicon-transfer" aria-hidden="true"></span></button>
	<button id="delete"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></button>
	<button id="submit"><span class="glyphicon glyphicon-floppy-saved" aria-hidden="true"></span></button>
 	<form name="JOIN_DB" id="JOIN_DB">
 	
	<div style="float: left;"></div><input type="text" class="form-control" style="float: left; width:200px;" name="I_MEETING_NAME" id="I_MEETING_NAME" placeholder="모임명">
	<div style="float: left;"></div><input type="text" class="form-control" style="float: left; width:200px;" name="I_MEETING_DATE" id="I_MEETING_DATE" placeholder="모이는날">
	<div style="float: left;"></div><input type="text" class="form-control" style="float: left; width:200px;" name="I_MEETING_AD" id="I_MEETING_AD" placeholder="장소">
	
	</form> 
	 <div class="input-group">
      <span class="input-group-btn">
        <button class="btn btn-default" id="search" type="button"><span class="glyphicon glyphicon-search" aria-hidden="true"></button>
      </span>
      <form action="./search.do">
		<input type="text" class="form-control" style="width:200px;" name="searchWord" id="searchWord" placeholder="이름을 검색하세요">
	</form>
     </div>
	
	<div style="width:1000px; height:400px; overflow:auto">

	<table class="table" id="table" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<th style='width:50px'>모임번호</th>
			<th style='width:100px'>모임명</th>
			<th style='width:120px'>모이는날</th>
			<th style='width:80px'>장소</th>
			<th style='width:80px'>총원</th>
		</tr>
		<c:forEach var="meetingList" items="${map.MeetingList }">
			<tr onclick="window.open('./ddrdMeetingDetail.do?MEETING_NUMBER=${meetingList.MEETING_NUMBER }','ddrdMeetingDetailPopup','width=430,height=500,location=no,status=no,scrollbars=yes');">
				<td style='width:50px'>${meetingList.MEETING_NUMBER }</td>
				<td style='width:100px'>${meetingList.MEETING_NAME }<input type='hidden' name='MEETING_NAME' id='MEETING_NAME' value='${meetingList.MEETING_NAME }'></td>
				<td style='width:120px'>${meetingList.MEETING_DATE }<input type='hidden' name='MEETING_DATE' id='MEETING_DATE' value='${meetingList.MEETING_DATE }'></td>
				<td style='width:80px'>${meetingList.MEETING_AD }<input type='hidden' name='MEETING_AD' id='MEETING_AD' value='${meetingList.MEETING_AD }'></td>
				<td style='width:80px'>${meetingList.TOTAL_USER }<input type='hidden' name='TOTAL_USER' id='TOTAL_USER' value='${meetingList.TOTAL_USER }'></td>
			</tr>
		</c:forEach>
		
	</table>
	</div>
</body>
</html>