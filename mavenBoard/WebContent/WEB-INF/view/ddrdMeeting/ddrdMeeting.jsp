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
	$(".td").on("click",function(){
		var tr = $(this).parent();
		var td = tr.children();
		
		var click_number = td.eq(0).text();
		var click_name = td.eq(1).text();
		var click_date = td.eq(2).text();
		console.log(click_name);
		window.open("./ddrdMeetingDetail.do?MEETING_NUMBER=" + click_number + "&MEETING_NAME=" + encodeURI(encodeURIComponent(click_name)) + "&MEETING_DATE=" +click_date,"ddrdMeetingDetail","width = 1000, height = 500, top = 100, left = 50, location = no");
	});
	/*유효성 검사 */
	$("#I_MEETING_DATE").keyup(function() {
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
/*모임 등록 function*/
	$("#insert").click(function(){
		var MEETING_DATE_STRING = $("#I_MEETING_DATE").val();
		var date_pattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
		var I_MEETING_NAME = $("#I_MEETING_NAME").val();
		var I_MEETING_AD = $("#I_MEETING_AD").val();
		
		var MEETING_DATE_SPLIT = MEETING_DATE_STRING.split("-");
		var MEETING_DATE="";
		for(var i=0; i<MEETING_DATE_SPLIT.length; i++){
			MEETING_DATE += MEETING_DATE_SPLIT[i];
		}
		console.log(MEETING_DATE_STRING);
		console.log(MEETING_DATE_SPLIT);
		console.log(MEETING_DATE);
		if(!date_pattern.test(MEETING_DATE_STRING)){
			alert("날짜형식이 맞지않습니다");
			return false;
		}
		var TdArr = new Array();
		var arr = {};
		arr.MEETING_NAME = I_MEETING_NAME;
		arr.MEETING_DATE = MEETING_DATE;
		arr.MEETING_AD = I_MEETING_AD;
		
		TdArr.push(arr);
		console.log(TdArr);
		$.ajax({
			url : "ddrdMeetingInsert.do",
			type : "POST",
			dataType : "json",
			data : JSON.stringify(TdArr),
			contentType: "application/json",
			success:function(data){
				var meetingList = data.MeetingList;
				$("#JOIN_DB")[0].reset();
				$("#table").empty();
				var str='';
								
				str+="<tbody><tr>"+
				"<th style='width:50px'>모임번호</th>"+
				"<th style='width:100px'>모임명</th>"+
				"<th style='width:120px'>모이는날</th>"+
				"<th style='width:80px'>장소</th>"+
				"<th style='width:80px'>총원</th>"+
				"<th style='width:50px'>저장</th>"+
				"<th style='width:50px'>삭제</th>"+
									"</tr>";
				for(var i=0; i<meetingList.length; i++){
					str+="<tr>" +	
					"<td class='td' style='width:50px'>"+meetingList[i].MEETING_NUMBER +"</td>" +
					"<td class='td' style='width:100px'>"+meetingList[i].MEETING_NAME +"<input type='hidden' name='MEETING_NAME' id='MEETING_NAME' value='"+meetingList[i].MEETING_NAME +"'></td>" +
					"<td class='td' style='width:120px'>"+meetingList[i].MEETING_DATE +"<input type='hidden' name='MEETING_DATE' id='MEETING_DATE' value='"+meetingList[i].MEETING_DATE +"'></td>" +
					"<td class='td' style='width:80px'>"+meetingList[i].MEETING_AD +"<input type='hidden' name='MEETING_AD' id='MEETING_AD' value='"+meetingList[i].MEETING_AD +"'></td>" +
					"<td class='td' style='width:80px'>"+meetingList[i].TOTAL_USER +"<input type='hidden' name='TOTAL_USER' id='TOTAL_USER' value='"+meetingList[i].TOTAL_USER +"'></td>" +
					"<td style='width:50px'><input type='button' name='save' id='save' value='저장'/></td>" +
					"<td style='width:50px'><input type='button' name='delete' id='delete' value='삭제'/></td>" +
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
}); //end

//삭제 버튼 event
$(document).on("click","input[name='delete']",function(){
	var meetingTr = $(this).parent().parent();
	var MEETING_NUMBER = meetingTr.children().eq(0).text();
	$.ajax({
		url : "deleteMeeting.do",
		type : "post",
		dataType : "json",
		data : {"MEETING_NUMBER": MEETING_NUMBER},
		success : function(data){
			var meetingList = data.MeetingList;
			$("#JOIN_DB")[0].reset();
			$("#table").empty();
			var str='';
							
			str+="<tbody><tr>"+
			"<th style='width:50px'>모임번호</th>"+
			"<th style='width:100px'>모임명</th>"+
			"<th style='width:120px'>모이는날</th>"+
			"<th style='width:80px'>장소</th>"+
			"<th style='width:80px'>총원</th>"+
			"<th style='width:50px'>저장</th>"+
			"<th style='width:50px'>삭제</th>"+
								"</tr>";
							for(var i=0; i<meetingList.length; i++){
								str+="<tr>" +	
								"<td class='td' style='width:50px'>"+meetingList[i].MEETING_NUMBER +"</td>" +
								"<td class='td' style='width:100px'>"+meetingList[i].MEETING_NAME +"<input type='hidden' name='MEETING_NAME' id='MEETING_NAME' value='"+meetingList[i].MEETING_NAME +"'></td>" +
								"<td class='td' style='width:120px'>"+meetingList[i].MEETING_DATE +"<input type='hidden' name='MEETING_DATE' id='MEETING_DATE' value='"+meetingList[i].MEETING_DATE +"'></td>" +
								"<td class='td' style='width:80px'>"+meetingList[i].MEETING_AD +"<input type='hidden' name='MEETING_AD' id='MEETING_AD' value='"+meetingList[i].MEETING_AD +"'></td>" +
								"<td class='td' style='width:80px'>"+meetingList[i].TOTAL_USER +"<input type='hidden' name='TOTAL_USER' id='TOTAL_USER' value='"+meetingList[i].TOTAL_USER +"'></td>" +
								"<td style='width:50px'><input type='button' name='save' id='save' value='저장'/></td>" +
								"<td style='width:50px'><input type='button' name='delete' id='delete' value='삭제'/></td>" +
									"</tr>";
							}
							str+='</tbody>'
			$('#table').html(str);
		},
		error : function(request, status, error){
			alert(error);
		}
	});
});
</script>
</head>
<style>

</style>
<body>

	<div>
		<h1>모임관리</h1>
	</div>
	
 	<form name="JOIN_DB" id="JOIN_DB">
 	
	<div style="float: left;"><input type="text" class="form-control" style="width:200px;" name="I_MEETING_NAME" id="I_MEETING_NAME" placeholder="모임명"></div>
	<div style="float: left;"><input type="text" class="form-control" style="width:200px;" name="I_MEETING_DATE" id="I_MEETING_DATE" placeholder="모이는날"></div>
	<div style="float: left;"><input type="text" class="form-control" style="width:200px;" name="I_MEETING_AD" id="I_MEETING_AD" placeholder="장소"></div>
	<div style="float: left;"><button id="insert"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></button></div>
	
	</form> 
	
	<div style="width:1000px; height:400px; overflow:auto">

	<table class="table" id="table" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<th style='width:50px'>모임번호</th>
			<th style='width:100px'>모임명</th>
			<th style='width:120px'>모이는날</th>
			<th style='width:80px'>장소</th>
			<th style='width:80px'>총원</th>
			<th style='width:50px'>저장</th>
			<th style='width:50px'>삭제</th>
		</tr>
		<c:forEach var="meetingList" items="${map.list }">
			<tr class="tr">
				<td class="td" style='width:50px' id="MEETING_NUMBER">${meetingList.MEETING_NUMBER }</td>
				<td class="td" style='width:100px' id="MEETING_NAME">${meetingList.MEETING_NAME }<input type='hidden' name='MEETING_NAME' id='MEETING_NAME' value='${meetingList.MEETING_NAME }'></td>
				<td class="td" style='width:120px' id="MEETING_DATE">${meetingList.MEETING_DATE }<input type='hidden' name='MEETING_DATE' id='MEETING_DATE' value='${meetingList.MEETING_DATE }'></td>
				<td class="td" style='width:80px' id="MEETING_AD">${meetingList.MEETING_AD }<input type='hidden' name='MEETING_AD' id='MEETING_AD' value='${meetingList.MEETING_AD }'></td>
				<td class="td" style='width:80px' id="TOTAL_USER">${meetingList.TOTAL_USER }<input type='hidden' name='TOTAL_USER' id='TOTAL_USER' value='${meetingList.TOTAL_USER }'></td>
				<td style='width:50px'><input type='button' name='save' id='save' value='저장'/></td>
				<td style='width:50px'><input type='button' name='delete' id='delete' value='삭제'/></td>
			</tr>
		</c:forEach>
		
	</table>
	</div>
</body>
</html>