<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript">
var mappingList = new Array();	//mappingTable 에 있는 OBJID 와 HIGH_OBJ 값
var objectList = new Array();	//objectTable 에 있는 전체 데이터
var w = 0;						//클릭된 GROUPID 값
var checkList = new Array();	//체크된 OBJID, HIGH_OBJ
var unCheckList = new Array();	//체크해제된 OBJID, HIGH_OBJ
var list = new Array();
	//등록버튼 클릭시 실행
	$(document).on('click',"input[name=sendButton]", function(){
		var OBJList = $(".OBJList");
		list = new Array();		
		var listAll = $("input[type='checkBox']");
		listAll.each(function(i){
			var Arr = {};
			var listTr = listAll.parent().parent().eq(i);
			var listTd = listTr.children();
			Arr.FLAG = listTd.eq(0).find("input[name='FLAG']").val();
			Arr.GROUPID = listTd.eq(0).find("input[name='GROUPID']").val();
			Arr.GROUPNAME = listTd.eq(0).find("input[name='GROUPNAME']").val();
			Arr.OBJNAME = listTd.eq(3).find("input[name='OBJNAME']").val();
			Arr.OBJID = listTd.eq(2).find("input[name='OBJID']").val();
			Arr.HIGH_OBJ = listTd.eq(4).find("input[name='HIGH_OBJ']").val();
			Arr.DEPT = listTd.eq(5).find("input[name='DEPT']").val();
			list.push(Arr);	
		});
		console.log(list);
		/* var list = decodeURIComponent($("#insertForm").serialize()); */
		var	subString = "불가";
		if(list.includes(subString)==true){
			alert("계층구조에 어긋납니다.");
			callFunction(w)
			return false;
		}
		if(list.includes(subString)==false){
			var result = confirm("변경 사항을 저장하시겠습니까?");
			if(result){
				$.ajax({
					url : "Insert.do",
					type : "POST",
					data : JSON.stringify(list),
					contentType: "application/json",
					success:function(data){
						alert("저장되었습니다");	
						callFunction(w)
					},
					error:function (request, status, error){
						alert(error);
					}
				});// ajax end
			}else{
				return false;
			}
		}
	});// sendButton end
	// 체크 클릭 했을시 실행
	$(document).on('click',"input[type='checkbox']", function(){
		var checked = $(this).is(":checked");				
		var check = $("input[type='checkBox']:checked");
		var td = $(this).parent().parent().children();
		var checkOBJID = td.children("input[name='OBJID']").val();		
		var checkHIGH_OBJ = td.children("input[name='HIGH_OBJ']").val();
		var dept = td.children("input[name='DEPT']").val();		
		var unCheck = $("input[type='checkBox']:not(:checked)");
		if(checked == true){
			checkList = new Array();
			unCheckList = new Array();
			check.each(function(i){
				var Arr = {};
				var checkTr = check.parent().parent().eq(i);
				var checkTd = checkTr.children();
				Arr.OBJID = checkTd.eq(2).find("input[name='OBJID']").val();
				Arr.HIGH_OBJ = checkTd.eq(4).find("input[name='HIGH_OBJ']").val();
				Arr.DEPT = checkTd.eq(5).find("input[name='DEPT']").val();
				checkList.push(Arr);	
			});
			unCheck.each(function(i){
				var Arr = {};
				var unCheckTr = unCheck.parent().parent().eq(i);
				var unCheckTd = unCheckTr.children();
				Arr.OBJID = unCheckTd.eq(2).find("input[name='OBJID']").val();
				Arr.HIGH_OBJ = unCheckTd.eq(4).find("input[name='HIGH_OBJ']").val();
				Arr.DEPT = unCheckTd.eq(5).find("input[name='DEPT']").val();
				unCheckList.push(Arr);	
			});
			console.log(checkList)
			$(this).siblings("#FLAG").val("불가");
			if(checkHIGH_OBJ == 'TOP'){				
				$(this).siblings("#FLAG").val("등록");
			}
			for(var i=0; i<unCheckList.length; i++){
				if(unCheckList[i].OBJID == checkHIGH_OBJ){					 
					 alert("계층구조에 어긋납니다");
					 callFunction(w)
					 return false;		 
				}
			}			
			loop:
			for(var i=0; i<checkList.length; i++){
				var deptPlus = checkList[i].DEPT
				deptPlus *=1;
				for(var z=0; z<checkList.length; z++){
					if(checkList[i].OBJID == checkList[z].HIGH_OBJ){						 
						$(this).siblings("#FLAG").val("등록");
						var checkFlag = $(this).siblings("#FLAG").val();
						if(checkFlag == "등록"){
							break loop;
						}
					}
					if(deptPlus+1 < checkList[z].DEPT){							
						alert("계층구조에 어긋납니다");	
						callFunction(w)						
						break loop;
					}					
				}
			}				
		}else if(checked == false){
			checkList = new Array();		
			check.each(function(i){
				var Arr = {};
				var checkTr = check.parent().parent().eq(i);
				var checkTd = checkTr.children();
				Arr.OBJID = checkTd.eq(2).find("input[name='OBJID']").val();
				Arr.HIGH_OBJ = checkTd.eq(4).find("input[name='HIGH_OBJ']").val();
				Arr.DEPT = checkTd.eq(5).find("input[name='DEPT']").val();
				checkList.push(Arr);	
			});
			unCheck.each(function(i){
				var Arr = {};
				var unCheckTr = unCheck.parent().parent().eq(i);
				var unCheckTd = unCheckTr.children();
				Arr.OBJID = unCheckTd.eq(2).find("input[name='OBJID']").val();
				Arr.HIGH_OBJ = unCheckTd.eq(4).find("input[name='HIGH_OBJ']").val();
				Arr.DEPT = unCheckTd.eq(5).find("input[name='DEPT']").val();
				unCheckList.push(Arr);	
			});			
			$(this).siblings("#FLAG").val("삭제");
			for(var i=0; i<mappingList.length; i++){
				if(checkHIGH_OBJ == "TOP" && mappingList == null){
					$(this).siblings("#FLAG").val("삭제");
				}
			}
			for(var i=0; i<checkList.length; i++){
				for(var z=0; z<checkList.length; z++){
					if(checkOBJID == checkList[z].HIGH_OBJ){
						alert("하위계층이 해제되지않았습니다");
						$(this).siblings("#FLAG").val("사용중");
						return false;
					}
				}
			}
		}		
		if(checkOBJID == checkHIGH_OBJ){
			$(this).siblings("#FLAG").val("불가");
		}	
	}); // check click end
//그룹 리스트 클릭시 발생 
function callFunction(e){
	var OBJList = $("#OBJList");
	mappingList = new Array();
	objectList = new Array();
	checkList = new Array();	
	unCheckList = new Array();
	unCheckOBJID = "";
	checkHIGH_OBJ = "";
	w=e;
	data={"GROUPID": w};	
	$.ajax({
		url : "OBJList.do",
		type : "POST",
		dataType : "json",
		async: false,
		data : data,
		success:function(data){
			mappingList = data.MList;
			objectList = data.list;
			OBJList.html("")
			OBJList.append(
					"<h1>객체리스트</h1>" +
					"<input type='button' id='sendButton' name='sendButton' value='등록' style='float:right;'/>" +
					"<br>" +
					"<table class='type11'>" +
						"<tbody id='tbody'>" +
							"<tr>" +
								"<th>check</th>" +
								"<th>사용여부</th>" +
								"<th>객체ID</th>" +
								"<th>객체명</th>" +
								"<th>상위객체</th>" +
								"<th>dept</th>" +
							"</tr>"+
						"</tbody>"
			);
			var tbody = $("#tbody");			
			$(objectList).each(function(i){//
				tbody.append(
					"<tr id='tr"+i+"'>" +
						"<td><input type='checkbox' name='checkbox"+ i +"' id='checkbox"+ i +"' value='미사용'/><input type='hidden' name='FLAG' id='FLAG' value='미사용'/><input type='hidden' id='GROUPID' name='GROUPID' value='"+ e +"'/><input type='hidden' name='GROUPNAME' id='GROUPNAME' value='"+ data.list[i].GROUPNAME +"'/></td>" +
						"<td>미사용</td>" +
						"<td><input type='hidden' name='OBJID' id='OBJID' value='"+ objectList[i].OBJID +"'>"+ objectList[i].OBJID +"</td>" +
						"<td><input type='hidden' name='OBJNAME' id='OBJNAME' value='"+ objectList[i].OBJNAME +"'>"+ objectList[i].OBJNAME +"</td>" +
						"<td><input type='hidden' name='HIGH_OBJ' id='HIGH_OBJ' value='"+ objectList[i].HIGH_OBJ +"'>"+ objectList[i].HIGH_OBJ +"</td>" +
						"<td><input type='hidden' name='DEPT' id='DEPT' value='"+ objectList[i].DEPT +"'>"+ objectList[i].DEPT +"</td>" +
					"</tr>"
				);
				var objecListOBJID = objectList[i].OBJID;
				$(mappingList).each(function(z){//mapping table
					var mappingListMOBJID = mappingList[z].OBJID;
					if(mappingListMOBJID == objecListOBJID){
						
						$("input[id='checkbox"+i+"']").prop('checked',true);
						if($("input[id='checkbox"+i+"']").is(':checked')==true){
							var td = $("#tr"+i).children();
							td.eq(1).html("");
							td.eq(1).append("사용중");
						}
					}
					if($("input[id='checkbox"+i+"']").is(':checked')==true){
						$("input[id='checkbox"+i+"']").siblings("#FLAG").val("사용중");					
					}					
				});				
			});						
		},
		error:function (request, status, error){
			alert(error);
		}
	});//ajax end
}//callFunction end
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
table.type11 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: center;
    line-height: 1.5;
    margin: 20px 10px;
}
table.type11 th {
    width: 155px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #dcdcdc;
    background: #3C5A91;
}
table.type11 td {
    width: 155px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #eee;
}
</style>
<body>	
	<h1>권한처리 main</h1>
	<table class='type11'>
		<tr>
			<th>회사ID</th>
			<th>회사명</th>
			<th>사용유무</th>
		</tr>
		<c:forEach var='map' items='${map.list }'>
			<tr>
				<td id="GROUPID"><a href="javascript:void(0);" onclick="callFunction(${map.GROUPID });">${map.GROUPID }</a></td>
				<td id="GROUPNAME"><a href="javascript:void(0);" onclick="callFunction(${map.GROUPID });">${map.GROUPNAME }</a></td>
				<td>${map.USE_YN }</td>
			</tr>		
		</c:forEach>		
	</table>
	<br>
	<form id="insertForm" name="insertForm">
		<div id="OBJList"></div>
	</form>
</body>
</html>