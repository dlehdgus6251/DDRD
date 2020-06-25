<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.aa{
width:900px; margin: 0 auto;
}
 table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	var length =0;
	$(document).on('click', function(){
		flag = $("input[type]")
		$("input[type=checkbox]").click(function(){
			var checked = $(this).is(":checked");
			if(!checked){
			
		    	/* $(this).siblings("#FLAG").val("DDD"); */
		    }
		});
	});
	

	   
	$("#modifyButton").click(function(){
			
		var check = $("input[name='checkBox']:checked");
		var ch_td = check.parent();
		var ch_tr = ch_td.parent();
		var TdArr = new Array();
		var del = ch_tr.children("input[value='U']");
		var ins = ch_tr.children("input[value='L']"); 
		var FDel = del.parent();
		var FIns = ins.parent();
		var darr ={};
		check.each(function(i){
			var arr = {};
			var tr = check.parent().parent().eq(i);
			var td = tr.children();
		
			arr.FLAG = td.eq(0).find("input[name='FLAG']").val();
			arr.CODE = td.eq(1).find("input[name='HCODE']").val();
			arr.DCODE = td.eq(2).find("input[name='HDCODE']").val();
			arr.DCODE_NAME = td.eq(3).find("input[name='HDCODE_NAME']").val();
			arr.USE_YN = td.eq(4).find("input[name='HUSE_YN']").val();
				
			TdArr.push(arr);
		});
  
		console.log(TdArr);
		for(var i=0; i<TdArr.length; i++){
			if(TdArr[i].FLAG == "U"){
				ch_tr.eq(i).html("");
				ch_tr.eq(i).append(
						"<td><input type='checkbox' name='checkBox' id='checkBox' style='width: 107px; float: left; text-align: center;'><input type='hidden' id='FLAG' name='FLAG' value='L'></td>" +
						"<td style='width: 107px; align: center;'><input type='hidden' name='HCODE' id='HCODE' value='"+ TdArr[i].CODE +"'/>" + TdArr[i].CODE + "</td>" +
						"<td style='width: 207px; align: center;'><input type='hidden' name='HDCODE' id='HDCODE' value='"+ TdArr[i].DCODE +"'>" + TdArr[i].DCODE +"</td>" +
						"<td style='width: 258px; align: center;'><input type='hidden' name='HDCODE_NAME' id='HDCODE_NAME' value='"+ TdArr[i].DCODE_NAME +"'/>"+ TdArr[i].DCODE_NAME +"</td>" +	
						"<td style='width: 209px; align: center;'><input type='hidden' name='HUSE_YN' id='HUSE_YN' value='"+ TdArr[i].USE_YN +"'/>"+ TdArr[i].USE_YN +"</td>"					
				);
			}
			if(TdArr[i].FLAG == "L"){
				ch_tr.eq(i).html("");
				ch_tr.eq(i).append(
					"<td><input type='checkbox' name='checkBox' id='checkBox' checked='checked' style='width: 107px; float: left; text-align: center;'><input type='hidden' name='FLAG' id='FLAG' value='U'/></td>" +
					"<td><input type='hidden' name='HCODE' id='HCODE' value='"+ TdArr[i].CODE +"'/>" + TdArr[i].CODE + "</td>" +
					"<td><input type='hidden' name='HDCODE' id='HDCODE' value='"+ TdArr[i].DCODE +"'>" + TdArr[i].DCODE +"</td>" +
					"<td><input type='text' style='width: 294px;' id='HDCODE_NAME' name='HDCODE_NAME' value='"+ TdArr[i].DCODE_NAME +"'/><input type='hidden' name='HDCODE_NAME' id='HDCODE_NAME' disabled value='"+ TdArr[i].DCODE_NAME +"'/></td>"				
				);
				if(TdArr[i].USE_YN =="Y"){
					ch_tr.eq(i).append(
						"<td><input type='radio' style='width: 20px;' name='USE_YN"+length +"' checked='checked' value='Y'/>Y" +
						"<input type='radio' style='width: 20px;' name='USE_YN"+ length +"' value='N'/>N<input type='hidden' name='HUSE_YN' id='HUSE_YN' value='"+ TdArr[i].USE_YN +"'/></td>");
				}else{
					ch_tr.eq(i).append(
						"<td><input type='radio' style='width: 20px;' name='USE_YN"+ length +"' value='Y'/>Y" +
						"<input type='radio' style='width: 20px;' name='USE_YN"+ length +"' checked='checked' value='N'/>N<input type='hidden' name='HUSE_YN' id='HUSE_YN' value='"+ TdArr[i].USE_YN +"'/></td>");
				}				
				length++;
			}
		}	
	});
	var CODE = $("#HCODE").val();
	var INSERTCOUNT = 0;
	var lista = new Array();
	$("#insertButton").click(function(){
		INSERTCOUNT++;
		if(INSERTCOUNT >3){
			alert("3개만 추가 할 수 있습니다.");
			return false;
		}
		$(".list").append(
				"<input type='text' style='width: 122px;' id='CODE' name='CODE' value='" + CODE + "' readonly/>" +
				"<input type='text' style='width: 236px;' id='DCODE"+ INSERTCOUNT +"' name='DCODE'/>" +
				"<input type='text' style='width: 294px;' id='DCODE_NAME' name='DCODE_NAME'/>" +
				"<input type='radio' style='width: 20px;' checked='checked' name='IUSE_YN"+ INSERTCOUNT +"' value='Y'/>Y" +
				"<input type='radio' style='width: 20px;' name='IUSE_YN"+ INSERTCOUNT +"' value='N'/>N" + 	
				"<input type='hidden' name='FLAG' id='FLAG' value='I'/>" + 
				"<br>"
		);// list.append end
		
		
	}); // insertButton end
	$("#deleteButton").click(function(){
		var check = $("input[name='checkBox']:checked");
		var ch_td = check.parent();
		var ch_tr = ch_td.parent();
		var TdArr = new Array();
		var del = ch_tr.children("input[value='U']");
		var ins = ch_tr.children("input[value='L']");
		var FDel = del.parent();
		var FIns = ins.parent();

		check.each(function(i){
			var arr = {};
			var tr = check.parent().parent().eq(i);
			var td = tr.children();
			
			arr.FLAG = td.eq(0).find("input[name='FLAG']").val();
			arr.CODE = td.eq(1).find("input[name='HCODE']").val();
			arr.DCODE = td.eq(2).find("input[name='HDCODE']").val();
			arr.DCODE_NAME = td.eq(3).find("input[name='HDCODE_NAME']").val();
			arr.USE_YN = td.eq(4).find("input[name='HUSE_YN']").val();
				
			TdArr.push(arr);
			console.log(TdArr);
		});
			 
		for(var i=0; i<TdArr.length; i++){
			if(TdArr[i].FLAG == "D"){
				ch_tr.eq(i).html("");
				ch_tr.eq(i).append(
						"<td><input type='checkbox' name='checkBox' id='checkBox' style='width: 107px; float: left; text-align: center;'><input type='hidden' id='FLAG' name='FLAG' value='L'></td>" +
						"<td style='width: 107px; align: center;'><input type='hidden' name='HCODE' id='HCODE' value='"+ TdArr[i].CODE +"'/>" + TdArr[i].CODE + "</td>" +
						"<td style='width: 207px; align: center;'><input type='hidden' name='HDCODE' id='HDCODE' value='"+ TdArr[i].DCODE +"'>" + TdArr[i].DCODE +"</td>" +
						"<td style='width: 258px; align: center;'><input type='hidden' name='HDCODE_NAME' id='HDCODE_NAME' value='"+ TdArr[i].DCODE_NAME +"'/>"+ TdArr[i].DCODE_NAME +"</td>" +	
						"<td style='width: 209px; align: center;'><input type='hidden' name='HUSE_YN' id='HUSE_YN' value='"+ TdArr[i].USE_YN +"'/>"+ TdArr[i].USE_YN +"</td>"					
				);
			}
			if(TdArr[i].FLAG == "L"){
				ch_tr.eq(i).html("");
				ch_tr.eq(i).append(
					"<td><input type='checkbox' name='checkBox' id='checkBox' checked='dcecked' style='width: 107px; float: left; text-align: center;'><input type='hidden' id='FLAG' name='FLAG' value='D'></td>" +
					"<td style='width: 107px; align: center; color : silver;'><input type='hidden' name='HCODE' id='HCODE' value='"+ TdArr[i].CODE +"'/>" + TdArr[i].CODE + "</td>" +
					"<td style='width: 207px; align: center; color : silver;'><input type='hidden' name='HDCODE' id='HDCODE' value='"+ TdArr[i].DCODE +"'>" + TdArr[i].DCODE +"</td>" +
					"<td style='width: 258px; align: center; color : silver;'><input type='hidden' name='HDCODE_NAME' id='HDCODE_NAME' value='"+ TdArr[i].DCODE_NAME +"'/>"+ TdArr[i].DCODE_NAME +"</td>" +	
					"<td style='width: 209px; align: center; color : silver;'><input type='hidden' name='USE_YN"+ length +"' id='USE_YN"+ length +"' value='"+ TdArr[i].USE_YN +"'/><input type='hidden' name='HUSE_YN' id='HUSE_YN' value='"+ TdArr[i].USE_YN +"'/>"+ TdArr[i].USE_YN +"</td>"					
				);
				length++;
			}			
		}
	}); // deleteButton end
	$("#sendButton").click(function(){
		var CODE = $("#HCODE").val();
		var a = $("input:checked").length;
		var check = $("input[name='checkBox']:checked");
		var ch_td = check.parent();
		var ch_tr = ch_td.parent();
		
		/* var ins.children("input").attr("disabled",true); */
		/* var ins.children().find("input")attr("disabled",true); */
		/* var ins.children("#HCODE").attr("disabled",true); */
		
		/* var dd = .not("input[value=]") */
	
		/* for(var i =0; i<check.length; i++){
			var srchDiv = ch_div.eq(i);
				alert('srchDiv = '+srchDiv);
			if($("input:checkbox[id='ID']").is(":checked")){
				var result = $("input:checkbox[id='ID']").is(":checked");
				var eq 
				var flag
				if(flag != 'L' ){
					
				}
			}
		} */
		
		
		if($('#insertForm [name="DCODE"]').val()=="" || $('#insertForm [name="DCODE_NAME"]').val()==""){
			alert("입력하지 않은 항목이 존재합니다");
			return false;
		}
		
		if($("#DCODE2").val() != null && $("#DCODE3").val() != null){
			if($("#DCODE1").val() == $("#DCODE2").val() || $("#DCODE1").val() == $("#DCODE3").val() || $("#DCODE2").val() == $("#DCODE3").val()){
				
				alert("등록하려고 하는 코드가 중복됩니다");
				return false;
			}
		}
		if($("#DCODE2").val() != null){
			if($("#DCODE1").val() == $("#DCODE2").val()){
			
				alert("등록하려고 하는 코드가 중복됩니다");
				return false;
			}
		}
		var list = decodeURIComponent(ch_tr.find('input').serialize());
	/* 
		if($("#insertForm").serialize() !== ''){
			list += "&" + $("#insertForm").serialize();
		} 
	*/
		 list += "&" + decodeURIComponent($("#insertForm").serialize());
	/* 	var updateForm = $("input:checked").parent().children();
			
			var list =+ '&'+decodeURIComponent(updateForm.serialize()); */
		
	  		console.log("Ilist="+list);
	  		/* list = list.replace("checkBox0","checkBox");
	  		list = list.replace("USE_YN0","USE_YN");
			list = list.replace("USE_YN1","USE_YN");
			list = list.replace("USE_YN2","USE_YN");
			list = list.replace("USE_YN3","USE_YN"); */
			
			for(var i=0; i<=a; i++){
				list = list.replace("checkBox=on&","");
				list = list.replace("HCODE","CODE");
				list = list.replace("HDCODE","DCODE");
			/* 	list = list.replace("HUSE_YN","USE_YN");
				list = list.replace("UUSE_YN"+i,"USE_YN");
				list = list.replace("DUSE_YN"+i,"USE_YN"); */
				list = list.replace("IUSE_YN"+i,"USE_YN");
				list = list.replace("USE_YN"+i,"USE_YN");
		/* 		list = list.replace("HUSE_YN","USE_YN"); */
				list = list.replace("HDcode_name","DCODE_NAME");
			/* 	list = list.replace("HUSE_YN"+i,"USE_YN");	
				list = list.replace("checkBox"+i,"checkBox"); */
			/* 	list = list.replace("Hcode","CODE"); */
			}
			console.log("Ilist="+list);
			if(list!="&" && list !== ""){
		$.ajax({
			url : "commonCodeInsert.do",
			type : "POST",
			dataType : "json",
			data : list,
			success:function(data){
				if(data != -1){
					if(data != 0) {
					   	alert("코드가 중복 됩니다.");
					   	return false;
				  	}else{		  		
				  		alert("성공했습니다.");
					 location.href = "./commonCodeDetail.do?CODE="+CODE;
				  	}
				}else{
					alert("등록하려는 코드가 이미 존재하거나 입력하려는 내용이 너무깁니다.");
					 location.href = "./commonCodeDetail.do?CODE="+CODE; 
				}					
			},
			error:function (request, status, error){
				alert(error);
			}
		}); //ajax end	  	
			}
	}); // sendButton end
}); // script end
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body> 
<button id="insertButton" name="insertButton">추가</button>
<button id="modifyButton" name="modifyButton">수정</button>
<button id="sendButton" name="sendButton">저장</button>
<button id="deleteButton" name="deleteButton">삭제</button>
	
<form id="updateForm" name="updateForm">
<table style="width: 900px" align="center">
	<tr>
			<th>선택</th>
			<th>코드</th>
			<th>상세코드</th>
			<th>상세코드명</th>
			<th>사용유무</th>			
		</tr>
<c:forEach var="map" items="${map.list }">
	<tr>
			<td><input type="checkbox" name="checkBox" id="checkBox" style="width: 107px; float: left; text-align: center "><input type="hidden" id="FLAG" name="FLAG" disabled value="L"></td> 
			<td style="width: 107px; align: center;">${map.CODE }<input type="hidden" id="HCODE" name="HCODE" disabled value="${map.CODE }"/></td>
			<td style="width: 207px; align: center;">${map.DCODE }<input type="hidden" id="HDCODE" name="HDCODE" disabled value="${map.DCODE }"/></td>
			<td style="width: 258px; align: center;">${map.DCODE_NAME }<input type="hidden" name="HDCODE_NAME" id="HDCODE_NAME" disabled value="${map.DCODE_NAME }"/></td>
			<td style="width: 209px; align: center;">${map.USE_YN }<input type="hidden" name="HUSE_YN" id="HUSE_YN" disabled value="${map.USE_YN }"/></td>
	</tr>		
</c:forEach>	
		
	
</table>
</form>
	
		
<form id="insertForm" name="insertForm">
	<div class="list" style="margin-right: 98px;" align="center">
</div>	
</form>
</body>
</html>