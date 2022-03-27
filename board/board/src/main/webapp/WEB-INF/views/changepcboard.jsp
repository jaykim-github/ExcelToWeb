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
<title>수정하기</title>
<script type="text/javascript">
var id = localStorage.getItem("ID");

$(document).ready(function(){ 	 
	$("#btnUpdate").click(function(){
		$.ajax({
		    url: "/btnupdate2",
		    type: "POST",
		    cache:false,
		    async:true, 
		    data:$("#updateform").serialize() + "&ID=" + id + "&changecontent=" + $("#changecontent").val(),
		    dataType:"json",
		    success: function(result) {
				if(result.value == 1){
					alert("수정되었습니다.")
					location.replace("/workpcboard");
				}else {
					alert("저장에 실패하였습니다. 관리자에게 문의하여주세요.");
					return false;
				} 
			},
			beforeSend:function(){
				if($("#changecontent").val() == ""){
					alert("수정 내용을 입력해 주세요.");
					xhr.abort();
				}
			}
	 	});
		
	});
	
});

</script>

</head>
<body>

	<div id="wrap" style="width:1000px; margin:30px 20px 30px 20px;">
			<h4>수정하기</h4>			 
			<form id="updateform" name="updateform"   method="post" style="padding:10px;">
				<table class="inputtable">
				<tbody> 
				<c:if test="${fn:length(list) > 0}">
				<c:forEach var="list" items="${list}" varStatus="i">
				<caption>${list.DEPARTMENT} / ${list.EMPLOYEE}</caption>
				<tr>
				<th>위치</th>
				<td><select name="location" id="location">
				<c:if test="${list.LOCATION eq '본사'}">
					<option value="본사" selected>본사</option>
					<option value="석포">석포</option>
				</c:if>
				
				<c:if test="${list.LOCATION eq '석포'}">
					<option value="본사">본사</option>
					<option value="석포" selected>석포</option>
				</c:if>
				</select></td>
				<th>위치 구분</th><td><input type="text" name="location_division" value="${list.LOCATION_DIVISION}"/></td>
				</tr>
				
				<tr>
				<th>세부 위치</th><td><input type="text" name="location_detail" value="${list.LOCATION_DETAIL}"/></td>
				<th>용도</th><td><input type="text" name="using" value="${list.USING}"/></td>
				</tr>
				
				<tr> 
				<th>부서</th><td><input type="text" name="department" value="${list.DEPARTMENT}"/></td>
				<th>직급</th><td><input type="text" name="position" value="${list.POSITION}"/></td>
				</tr>
				
				<tr>
				<th>사용자</th><td><input type="text" name="employee" value="${list.EMPLOYEE}"/></td>
				<th>컴퓨터 이름</th><td><input type="text" name="pcname_change" value="${list.PCNAME_CHANGE}"/></td>
				</tr>
				
				<tr>
				<th>IP</th><td><input type="text" name="pc_ip" value="${list.PC_IP}"/></td>
				<th>PC 구분</th><td><input type="text" name="pc_division" value="${list.PC_DIVISION}"/></td>
				</tr>
				
				<tr>
				<th>제조사</th><td><input type="text" name="manufacturer" value="${list.MANUFACTURER}"/></td>
				<th>PC 모델</th><td><input type="text" name="pcmodel" value="${list.PCMODEL}"/></td>
				</tr>
				
				<tr>
				<th>라이선스 OS</th><td><input type="text" name="pc_os" value="${list.PC_OS}"/></td>
				<th>설치된 OS</th><td><input type="text" name="installed_os" value="${list.INSTALLED_OS}"/></td>				
				</tr>
				
				<tr>
				<th>구매년도</th><td><input type="text" name="buying_year" value="${list.BUYING_YEAR}"/></td>
				<th>구매 월</th><td><input type="text" name="buying_month" value="${list.BUYING_MONTH}"/></td>
				</tr>
			
				<tr>
				<th>듀얼 모니터</th><td><input type="text" name="monitor" value="${list.MONITOR}"/></td>
				<th>관리번호(스티커)</th><td><input type="text" name="manage_num" value="${list.MANAGE_NUM}"/></td>
				</tr>
				
				<tr>
				<th>office(2007)</th><td><input type="text" name="msoffice" value="${list.MSOFFICE}"/></td>
				<th>한글(2007)</th><td><input type="text" name="hanguel" value="${list.HANGUEL}"/></td>
				</tr>
				
				<tr>
				<th>알약</th><td><input type="text" name="alyak" value="${list.ALYAK}"/></td>
				<th>AutoCAD</th><td><input type="text" name="autocad" value="${list.AUTOCAD}"/></td>
				</tr>
				
				<tr>
				<th>백신검사 유무 : 알약</th><td><input type="text" name="vaccine" value="${list.VACCINE}"/></td>
				<th>설치/제거 확인</th><td><input type="text" name="install_check" value="${list.INSTALLED_CHECK}"/></td>
				</tr>
				
				<tr>
				<th>인스펙터</th><td><input type="text" name="inspector" value="${list.INSPECTOR}"/></td>
				<th>교체년/분기</th><td><input type="text" name="replacement_t" value="${list.REPLACEMENT_T}"/></td>
				</tr>
				
				<tr>
				<th>비고</th><td><input type="text" name="note" value="${list.NOTE}"/></td>
				</tr>
				
				<div id ="seq" style="display:none"><input type="text" name="SEQ" value="${list.SEQ}"/>
				</div>

				</c:forEach>
				</c:if>

				</tbody>
				</table>
			</form>	
		<br>
			<h4>수정 내역</h4>	
			<p><input type="text" id="changecontent" name="changecontent" style=""/></p>
			<div style="padding:5px;">
				<button type="button"  value="btnUpdate" id="btnUpdate" >수정</button>
				&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" id="btnList" onclick="location.href='workpcboard'">목록</button>
			</div>
</div>
</body>
</html>
