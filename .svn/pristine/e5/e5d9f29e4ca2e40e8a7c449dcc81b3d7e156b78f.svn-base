<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<link rel="stylesheet" type="text/css" href="/css/main.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>게시판</title>
<style>
pre{white-space : pre-wrap;}
</style>
<script type="text/javascript">
var id = localStorage.getItem("ID");

$(document).ready(function(){
	$("#delete").click(function(){
			if(confirm("삭제 하시겠습니까?") == true){
				$.ajax({
					url: "/deletelist2",
				    type: "POST",
				    cache:false,
				    async:true, 
				    data: {"SEQ" : $("#SEQ").val()},
				    dataType:"json",
				    success: function(result) {
				    	console.log(result);
				    	if(result == 1){
					    	alert("삭제 되었습니다.");
					    	location.replace("/workpcboard"); 
				    	}else {
							alert("삭제에 실패하였습니다. 관리자에게 문의하여주세요.");
							return false;
						} 
					},
				});
			}else{
				return;
			}

	})
	
	
});

</script>

</head>
<body>

	<div id="wrap" style="width:1000px; margin:30px 20px 30px 20px;">
			<h4>상세보기</h4>			 
			<form id="updateform" name="updateform"   method="post" style="padding:10px;">
				<table class="datatable">
				<tbody> 
				<c:if test="${fn:length(list) > 0}">
				<c:forEach var="list" items="${list}" varStatus="i">
				<caption>${list.DEPARTMENT} / ${list.EMPLOYEE}</caption>
				<br>
				<tr>
				<th>위치</th><td><pre>${list.LOCATION}</pre></td>
				<th><b>위치 구분</b></th><td><pre><b>${list.LOCATION_DIVISION}</b></pre></td>
				</tr>
				<tr>
				<th><b>세부 위치</b></th><td><pre><b>${list.LOCATION_DETAIL}</b></pre></td>
				<th>용도</th><td><pre>${list.USING}</pre></td>
				</tr>
				<tr>
				<th>부서</th><td><pre>${list.DEPARTMENT}</pre></td>
				<th>직급</th><td><pre>${list.POSITION}</pre></td>
				</tr>
				
				<tr>
				<th>사용자</th><td><pre>${list.EMPLOYEE}</pre></td>
				<th>컴퓨터 이름</th><td><pre>${list.PCNAME_CHANGE}</pre></td>
				</tr>
				
				<tr>
				<th>IP</th><td><pre>${list.PC_IP}</pre></td>
				<th>PC 구분</th><td><pre>${list.PC_DIVISION}</pre></td>
				</tr>
				
				<tr>
				<th>제조사</th><td><pre>${list.MANUFACTURER}</pre></td>
				<th>PC 모델</th><td><pre>${list.PCMODEL}</pre></td>
				</tr>
				
				<tr>
				<th>라이선스 OS</th><td><pre>${list.PC_OS}</pre></td>
				<th>설치된 OS</th><td><pre>${list.INSTALLED_OS}</pre></td>
				</tr>
				
				<tr>
				<th>구매 년도</th><td><pre>${list.BUYING_YEAR}</pre></td>
				<th>구매 월</th><td><pre>${list.BUYING_MONTH}</pre></td>			
				</tr>
				
				<tr>
				<th>듀얼 모니터</th><td><pre>${list.MONITOR}</pre></td>					
				<th>관리번호(스티커)</th><td><pre>${list.MANAGE_NUM}</pre></td>
				</tr>
			
				<tr>
				<th>office(2007)</th><td><pre>${list.MSOFFICE}</pre></td>				
				<th>한글(2007)</th><td><pre>${list.HANGUEL}</pre></td>
				</tr>
				
				<tr>
				<th>알약</th><td><pre>${list.ALYAK}</pre></td>				
				<th>AutoCAD</th><td><pre>${list.AUTOCAD}</pre></td>
				</tr>
				
				<tr>
				<th>백신검사 유무/알약</th><td><pre>${list.VACCINE}</pre></td>				
				<th>설치/제거 확인</th><td><pre>${list.INSTALLED_CHECK}</pre></td>
				</tr>
				
				<tr>
				<th>인스펙터</th><td><pre>${list.INSPECTOR}</pre></td>				
				<th>교체년/분기</th><td><pre>${list.REPLACEMENT_T}</pre></td>
				</tr>
				<tr>
				<th>비고</th><td colspan="3"><pre>${list.NOTE}</pre></td>
				</tr>
				<div id ="seq" style="display:none"><input type="text" id ="SEQ" name="SEQ" value="${list.SEQ}"/>
				</div>

				</c:forEach>
				</c:if>

				</tbody>
				</table>
			</form>	
		<br>
		<br>
		<br>		
			<div id = "display">
		<c:if test="${fn:length(list2) > 0}">
		<table class="datatable">	
			<thead>
				<tr>
					<th align="center" scope="col">No</th>
					<th align="center" scope="col">변경자</th>
					<th align="center" scope="col">변경내역</th>
					<th align="center" scope="col">변경일</th>
				</tr>
		</thead>
		<tbody>
		<c:forEach var="list2" items="${list2}" varStatus="i">
		<tr>	
				<td align="center">${list2.H_SEQ}</td>
				<td align="center">${list2.CHANGE_USER}</td>
				<td align="center">${list2.CHANGE_CONTENT}</td>
				<td align="center">${list2.CHANGE_DATE}</td>
		</tr>
		</c:forEach>
		</tbody>

		</table>
		</c:if>
		<br>
			</div>

			<div style="padding:10px;">
				<button type="button"  value="Update" id="Update" onclick="location.href='/changepcboard?seq='+$('#SEQ').val()">수정하기</button>
				&nbsp;&nbsp;&nbsp;&nbsp;<button type="button"  value="delete" id="delete" >삭제</button>
				&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" id="btnList" onclick="location.href='workpcboard'">목록</button>
			</div>
</div>
</body>
</html>
