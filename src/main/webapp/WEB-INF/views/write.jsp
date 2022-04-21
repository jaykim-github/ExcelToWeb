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
		    url: "/boardsave",
		    type: "POST",
		    cache:false,
		    async:true, 
		    data:$("#writeform").serialize(),
		    dataType:"json",
		    success: function(result) {
				if(result.value == 1){
					alert("저장되었습니다.")
					location.replace("/board");
				}else if(result.value == 2){
					alert("이미 존재하는 IP 입니다.");
					return false;
				}else{
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
				<th>랙구분</th><td><input type="text" name="rack_n" value=""/></td>
				</tr>
				<tr>
				<th>UNIT 번호</th><td><input type="text" name="unit_n" value=""/></td>
				<th>서버명</th><td><input type="text" name="server_name" value=""/></td>
				</tr>
				
				<tr> 
				<th>명세</th><td><input type="text" name="server_detail" value=""/></td>
				<th>서버용도</th><td><input type="text" name="server_use" value=""/></td>
				</tr>
				
				<tr>
				<th>담당자</th><td><input type="text" name="manager" value=""/></td>
				<th>시스템 중요도</th><td><input type="text" name="importance" value=""/></td>
				</tr>
				
				<tr>
				<th>제조사</th><td><input type="text" name="manufacturer" value=""/></td>
				<th>서버 모델</th><td><input type="text" name="server_model" value=""/></td>
				</tr>
				
				<tr>
				<th>사설 IP</th><td><input type="text" name="private_ip" value=""/></td>
				<th>공인 IP</th><td><input type="text" name="public_ip" value=""/></td>
				</tr>
				
				<tr>
				<th>S/N</th><td><input type="text" name="serial_n" value=""/></td>
				<th>구매 OS 라이선스</th><td><input type="text" name="os_license" value=""/></td>				
				</tr>
				
				<tr>
				<th>설치된 OS</th><td><input type="text" name="installed_os" value=""/></td>
				<th>CPU 사양</th><td><input type="text" name="cpu" value=""/></td>
				</tr>
			
				<tr>
				<th>총 Core 수</th><td><input type="text" name="total_core" value=""/></td>
				<th>총 메모리 용량</th><td><input type="text" name="total_memory" value=""/></td>
				</tr>
				
				<tr>
				<th>총 HDD 용량</th><td><input type="text" name="total_hdd" value=""/></td>
				<th>HDD 구성</th><td><input type="text" name="hdd_content" value=""/></td>
				</tr>
				
				<tr>
				<th>기타 사양</th><td><input type="text" name="etc_specifi" value=""/></td>
				<th>서버 패스워드</th><td><input type="text" name="server_pw" value=""/></td>
				</tr>
				
				<tr>
				<th>서버 구매 금액</th><td><input type="text" name="cost_buying_s" value=""/></td>
				<th>DB 모델</th><td><input type="text" name="db_model" value=""/></td>
				</tr>
				
				<tr>
				<th>DB 정보</th><td><input type="text" name="db_info" value=""/></td>
				<th>DB 패스워드</th><td><input type="text" name="db_pw" value=""/></td>
				</tr>
				
				<tr>
				<th>DB 구매금액</th><td><input type="text" name="cost_buying_d" value=""/></td>
				<th>WAS</th><td><input type="text" name="was" value=""/></td>
				</tr>
				
				<tr>
				<th>기타 구매 건</th><td><input type="text" name="cost_buying_etc" value=""/></td>
				<th>총 구매 금액(서버+DB+기타)</th><td><input type="text" name="total_cost" value=""/></td>
				</tr>
				
				<tr>
				<th>구입일자(납품일자)</th><td><input type="text" name="buying_date" value=""/></td>
				<th>납품업체</th><td><input type="text" name="vendor" value=""/></td>
				</tr>
				
				<tr>
				<th>유지보수 업체</th><td><input type="text" name="mainten_com" value=""/></td>
				<th>유지보수 기간</th><td><input type="text" name="mainten_period" value=""/></td>
				</tr>
				
				<tr>
				<th>Vendor/Warranty</th><td><input type="text" name="vendor_warranty" value=""/></td>
				<th>보안 SW</th><td><input type="text" name="security_sw" value=""/></td>
				</tr>
				
				<tr>
				<th>보안 계약기간</th><td><input type="text" name="security_period" value=""/></td>
				<th>보험가입여부</th>
				<td><select name="insurance" id="insurance">
					<option value="O">O</option>
					<option value="X">X</option>
				</select></td>
				</tr>
				
				<tr>
				<th>비고</th><td><input type="text" name="note" value=""/></td>
				</tr>
				
				</table>
			</form>
			<div style="padding:10px;">
				<button type="button"  value="btnSave" id="btnSave">저장</button>
				&nbsp;&nbsp;&nbsp;<button type="button" id="btnList" onclick="location.href='board'">목록</button>
			</div>
	</div>
</body>
</html>
