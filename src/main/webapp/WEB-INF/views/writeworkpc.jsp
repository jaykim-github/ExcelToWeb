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
<script type="text/javascript">
$(document).ready(function(){
	$("#btnSave").click(function(){
		$.ajax({
		    url: "/boardsave2",
		    type: "POST",
		    cache:false,
		    async:true, 
		    data:$("#writeform").serialize(),
		    dataType:"json",
		    success: function(result) {
				if(result.value == 1){
					alert("저장되었습니다.")
					location.replace("/workpcboard");
				}else {
					alert("저장에 실패하였습니다. 관리자에게 문의하여주세요.");
					return false;
				} 
			},		    
	 	});
	});
	
});

</script>

</head>
<body>
	<div id="wrap" style="width:1000px; margin:30px 20px 30px 20px;">
			<h4>작성하기</h4>
			<form id="writeform" name="writeform"   method="post" style="padding:10px;">
				<table class="inputtable">
				<tr>
				<th>위치</th>
				<td><select name="location" id="location">
					<option value="본사">본사</option>
					<option value="석포">석포</option>
				</select></td>
				<th>위치 구분</th><td><input type="text" name="location_division" value=""/></td>
				</tr>
				<tr>
				<th>세부 위치</th><td><input type="text" name="location_detail" value=""/></td>
				<th>용도</th><td><input type="text" name="using" value=""/></td>
				</tr>
				
				<tr> 
				<th>부서</th><td><input type="text" name="department" value=""/></td>
				<th>직급</th><td><input type="text" name="position" value=""/></td>
				</tr>
				
				<tr>
				<th>사용자</th><td><input type="text" name="employee" value=""/></td>
				<th>컴퓨터 이름</th><td><input type="text" name="pcname_change" value=""/></td>
				</tr>
				
				<tr>
				<th>IP</th><td><input type="text" name="pc_ip" value=""/></td>
				<th>PC 구분</th><td><input type="text" name="pc_division" value=""/></td>
				</tr>
				
				<tr>
				<th>제조사</th><td><input type="text" name="manufacturer" value=""/></td>
				<th>PC 모델</th><td><input type="text" name="pcmodel" value=""/></td>
				</tr>
				
				<tr>
				<th>라이선스 OS</th><td><input type="text" name="pc_os" value=""/></td>
				<th>설치된 OS</th><td><input type="text" name="installed_os" value=""/></td>				
				</tr>
				
				<tr>
				<th>구매년도</th><td><input type="text" name="buying_year" value=""/></td>
				<th>구매 월</th><td><input type="text" name="buying_month" value=""/></td>
				</tr>
			
				<tr>
				<th>듀얼 모니터</th><td><input type="text" name="monitor" value=""/></td>
				<th>관리번호(스티커)</th><td><input type="text" name="manage_num" value=""/></td>
				</tr>
				
				<tr>
				<th>office(2007)</th><td><input type="text" name="msoffice" value=""/></td>
				<th>한글(2007)</th><td><input type="text" name="hanguel" value=""/></td>
				</tr>
				
				<tr>
				<th>알약</th><td><input type="text" name="alyak" value=""/></td>
				<th>AutoCAD</th><td><input type="text" name="autocad" value=""/></td>
				</tr>
				
				<tr>
				<th>백신검사 유무 : 알약</th><td><input type="text" name="vaccine" value=""/></td>
				<th>설치/제거 확인</th><td><input type="text" name="install_check" value=""/></td>
				</tr>
				
				<tr>
				<th>인스펙터</th><td><input type="text" name="inspector" value=""/></td>
				<th>교체년/분기</th><td><input type="text" name="replacement_t" value=""/></td>
				</tr>
				
				<tr>
				<th>비고</th><td><input type="text" name="note" value=""/></td>
				</tr>
				
				</table>
			</form>
			<div style="padding:10px;">
				<button type="button"  value="btnSave" id="btnSave">저장</button>
				&nbsp;&nbsp;&nbsp;<button type="button" id="btnList" onclick="location.href='workpcboard'">목록</button>
			</div>
	</div>
</body>
</html>
