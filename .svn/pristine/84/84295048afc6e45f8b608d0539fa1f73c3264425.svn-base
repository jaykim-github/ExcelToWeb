<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<head>
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<link rel="stylesheet" type="text/css" href="/css/main.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<meta charset="EUC-KR">
<title>아이디 찾기</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#findpn").click(function(){
		findID();
	});

	$("#phonenumber").keypress(function(e){
		if(e.keyCode == 13){
			findID();
			return false;
		}
	})
	
});
function findID(){
	$.ajax({
	    url: "/findpn",
	    type: "POST",
	    cache:false,
	    async:true, 
	    data:$("#pnfrm").serialize(),
	    dataType:"json",
	    success: function(result) {
	    	if(result.value != null){
	    		//$('#req1').text("아이디는 " + result.value + "입니다.");
	    		showID(result);
	    	}else{
	    		alert("가입된 정보가 없습니다.");
	    		$('#pnfrm').focus();
				return false;
	    	}
	    	
		},
		beforeSend:function(){
			if(document.pnfrm.phonenumber.value == ""){
				alert("전화번호를 입력해 주세요.");
				$('#phonenumber').focus();
				return false;
			}
		},
	    
 	});
}

function showID(result){
	var html = "<br>";
	html += "<br>";
	html += "아이디는 " + result.value +" 입니다.";
	$("#display").append(html);
}

</script>
</head>
<body>
<div id="wrap" style="width:500px; padding : 50px;">
	<br>
	<h2>아이디 찾기</h2>
	<form id = "pnfrm" name ="pnfrm">
	<table class="datatable" style="width:200;">
	<tr>
		<th>전화번호 : </th>
		<td><input type="text" name="phonenumber" id ="phonenumber"/> <button type="button" class="findpnclass" value="findpn" id="findpn" style="border:1px">검색</button></td>
		</tr>
    </table>
    <h6> - 를 제외하고 입력하여 주세요.</h6>
	 <br>
         <div id = "display">
         </div>
        
      <div style="float:right">
      <button type="button" class="registerclass" value="register" id="register" onclick="location.href='/register'">회원가입</button> | <button type="button" onclick="location.href='/findpw'">비밀번호 찾기</button> | <button type="button" onclick="location.href='/'">뒤로가기</button>
      </div>
    </form>
    <div>
      
	<br>
	</div>
	</div>
</body>
</html>