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
<title>새로운 비밀번호 입력</title>

<script type="text/javascript">
console.log(localStorage.getItem("ID"));
$(document).ready(function(){
	$("#changepw").click(function(){
		changepw();
	});
$("#password2").keypress(function(e){
		if(e.keyCode == 13){
			changepw();
			return false;
		}
	})
	
});

function changepw(){
	$.ajax({
	    url: "/changepwinput",
	    type: "POST",
	    cache:false,
	    async:true, 
	    data:{"id" :localStorage.getItem("ID"),
	    	"password" : document.changefrm.password.value},
	    dataType:"json",
	    success: function(result) {
	    	if(result.value == 1){
	    		alert("변경되었습니다.");
				location.replace("/");
	    	}else if(result.value == 2){
	    		alert("기존에 사용하던 비밀번호 입니다. 다른 비밀번호를 입력해주세요.");
	    		$('#password').focus();
				return false;
	    	}else {
	    		alert("변경에 실패하였습니다. 관리자에게 문의하여주세요.");
				return false;
	    	}
	    	
		},
		beforeSend:function(){
			if(document.changefrm.password.value == ""){
				alert("비밀번호를 입력해 주세요.");
				$('#password').focus();
				return false;
			}else if(document.changefrm.password2.value == ""){
				alert("비밀번호를 다시 입력해 주세요.");
				$('#password2').focus();
				return false;
			}else if(document.changefrm.password.value != document.changefrm.password2.value){
				alert("동일한 비밀번호를  입력해 주세요.");
				$('#password2').focus();
				return false;
			}
		},
	    
 	});
}

</script>
</head>
<body>
<div id="wrap" style="width:500px; padding : 50px;">
<h2>비밀번호 변경</h2>
	
	 <form id = "changefrm" name ="changefrm">
	 <table class="datatable" style="width:200;">
	 	<tr>
 		<th>비밀번호 : </th>
 		<td><input type="text" name="password" id ="password"/></td>
		</tr>
		<tr>
        <th>비밀번호 확인 : </th>
        <td><input type="text" name="password2" id ="password2"/></td>
        </tr>
       </table>
	</form>
	
	<br>
	<button type="button" class="changepwclass" value="changepw" id="changepw">비밀번호 변경</button> 
    <br>
</div>
</body>
</html>