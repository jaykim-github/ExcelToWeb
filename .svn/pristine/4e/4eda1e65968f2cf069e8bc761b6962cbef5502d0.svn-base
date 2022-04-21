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
					url: "/deletelist",
				    type: "POST",
				    cache:false,
				    async:true, 
				    data: {"SEQ" : $("#SEQ").val()},
				    dataType:"json",
				    success: function(result) {
				    	console.log(result);
				    	if(result == 1){
					    	alert("삭제 되었습니다.");
					    	location.replace("/board");
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
				<caption>${list.SERVER_NAME} / ${list.SERVER_MODEL}</caption>
				<br>
				<tr>
				<th><b>서버명</b></th><td><pre><b>${list.SERVER_NAME}</b></pre></td>
				<th><b>서버 모델</b></th><td><pre><b>${list.SERVER_MODEL}</b></pre></td>
				</tr>
				<tr>
				<th>위치</th><td><pre>${list.LOCATION}</pre></td>
				<th>UNIT 번호</th><td><pre>${list.UNIT_N}</pre></td>
				</tr>
				
				<tr> 
				<th>명세</th><td><pre>${list.SERVER_DETAIL}</pre></td>
				<th>서버용도</th><td><pre>${list.SERVER_USE}</pre></td>
				</tr>
				
				<tr>
				<th>담당자</th><td><pre>${list.MANAGER}</pre></td>
				<th>시스템 중요도</th><td><pre>${list.IMPORTANCE}</pre></td>
				</tr>
				
				<tr>
				<th>제조사</th><td><pre>${list.MANUFACTURER}</pre></td>
				<th>랙구분</th><td><pre>${list.RACK_N}</pre></td>
				</tr>
				
				<tr>
				<th>사설 IP</th><td><pre>${list.PRIVATE_IP}</pre></td>
				<th>공인 IP</th><td><pre>${list.PUBLIC_IP}</pre></td>
				</tr>
				
				<tr>
				<th>S/N</th><td><pre>${list.SERIAL_N}</pre></td>
				<th>구매 OS 라이선스</th><td><pre>${list.OS_LICENSE}</pre></td>				
				</tr>
				
				<tr>
				<th>설치된 OS</th><td><pre>${list.INSTALLED_OS}</pre></td>
				<th>CPU 사양</th><td><pre>${list.CPU}</pre></td>
				</tr>
			
				<tr>
				<th>총 Core 수</th><td><pre>${list.TOTAL_CORE}</pre></td>
				<th>총 메모리 용량</th><td><pre>${list.TOTAL_MEMORY}</pre></td>
				</tr>
				
				<tr>
				<th>총 HDD 용량</th><td><pre>${list.TOTAL_HDD}</pre></td>
				<th>HDD 구성</th><td><pre>${list.HDD_CONTENT}</pre></td>
				</tr>
				
				<tr>
				<th>기타 사양</th><td><pre>${list.ETC_SPECIFI}</pre></td>
				<th>서버 패스워드</th><td><pre>${list.SERVER_PW}</pre></td>
				</tr>
				
				<tr>
				<th>서버 구매 금액</th><td><pre>${list.COST_BUYING_S}</pre></td>
				<th>DB 모델</th><td><pre>${list.DB_MODEL}</pre></td>
				</tr>
				
				<tr>
				<th>DB 정보</th><td><pre>${list.DB_INFO}</pre></td>
				<th>DB 패스워드</th><td><pre>${list.DB_PW}</pre></td>
				</tr>
				
				<tr>
				<th>DB 구매금액</th><td><pre>${list.COST_BUYING_D}</pre></td>
				<th>WAS</th><td><pre>${list.WAS}</pre></td>
				</tr>
				
				<tr>
				<th>기타 구매 건</th><td><pre>${list.COST_BUYING_ETC}</pre></td>
				<th>총 구매 금액(서버+DB+기타)</th><td><pre>${list.TOTAL_COST}</pre></td>
				</tr>
				
				<tr>
				<th>구입일자(납품일자)</th><td><pre>${list.BUYING_DATE}</pre></td>
				<th>납품업체</th><td><pre>${list.VENDOR}</pre></td>
				</tr>
				
				<tr>
				<th>유지보수 업체</th><td><pre>${list.MAINTEN_COM}</pre></td>
				<th>유지보수 기간</th><td><pre>${list.MAINTEN_PERIOD}</pre></td>
				</tr>
				
				<tr>
				<th>Vendor/Warranty</th><td><pre>${list.VENDOR_WARRANTY}</pre></td>
				<th>보안 SW</th><td><pre>${list.SECURITY_SW}</pre></td>
				</tr>
				
				<tr>
				<th>보안 계약기간</th><td><pre>${list.SECURITY_PERIOD}</pre></td>
				<th>보험가입여부</th><td><pre>${list.INSURANCE}</pre></td>
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
				<button type="button"  value="Update" id="Update" onclick="location.href='/changeboard?seq='+$('#SEQ').val()">수정하기</button>
				&nbsp;&nbsp;&nbsp;&nbsp;<button type="button"  value="delete" id="delete" >삭제</button>
				&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" id="btnList" onclick="location.href='board'">목록</button>
			</div>
</div>
</body>
</html>
