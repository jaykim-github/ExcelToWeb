<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<link rel="stylesheet" type="text/css" href="/css/main.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="EUC-KR">
<title>회원가입</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#register").click(function(){
		$.ajax({
		    url: "/registercheck",
		    type: "POST",
		    cache:false,
		    async:true, 
		    data:$("#regfrm").serialize(),
		    dataType:"json",
		    success: function(result) {
		    	console.log(result.value);
				if(result.value == 1){
					alert("가입 완료 되었습니다.");
					location.replace("/");
				}else if(result.value == 3) {
					alert("이미 존재하는 ID입니다.");
					$('#id').focus();
					return false;
				} else if(result.value == 2) {
					alert("이미 존재하는 전화번호입니다.");
					$('#phonenumber').focus();
					return false;
				} else if(result.value == 0) {
					alert("가입에 실패하였습니다. 관리자에게 문의하여주세요.");
					return false;
				} 
			},
			beforeSend:function(){
				//아이디 혹은 비밀번호 기입 되어있는지 확인
				if(document.regfrm.id.value == ""){
					alert("ID를 입력해 주세요.");
					$('#od').focus();
					return false;
				}else if(document.regfrm.password.value == ""){
					alert("비밀번호를 입력해 주세요.");
					$('#password').focus();
					return false;
				}else if(document.regfrm.password2.value == ""){
					alert("비밀번호를 입력해 주세요.");
					$('#password2').focus();
					return false;
				}else if(document.regfrm.name.value == ""){
					alert("이름을 입력해 주세요.");
					$('#name').focus();
					return false;
				}else if(document.regfrm.email.value == ""){
					alert("이메일을 입력해 주세요.");
					$('#email').focus();
					return false;
				}else if(document.regfrm.phonenumber.value == ""){
					alert("전화번호를 입력해 주세요.");
					$('#phonenumber').focus();
					return false;
				}else if(document.regfrm.password.value != document.regfrm.password2.value){
					alert("비밀번호가 일치하지 않습니다.");
					$('#password2').focus();
					return false;
				}
			},
		    
	 	});
	});

	
});

</script>
</head>
<body>
<div id="wrap" style="width:500px; padding : 50px;">
<br>
	<br>
	<h2>회원가입</h2>
	 <form id = "regfrm" name ="regfrm">
	 <table class="datatable">
	 <tr>
	 	<th>아이디 : </th>
	 	<td><input type="text" name="id" id ="id"/></td>
	 </tr>
	 <tr>
		<th>비밀번호 : </th>
		<td><input type="text" name="password" id ="password"/></td>
	 </tr>
	 <tr>
		<th>비밀번호 확인 : </th>
		<td><input type="text" name="password2" id ="password2"/></td>
	</tr>
	<tr>
        <th>전화번호 : </th>
        <td><input type="text" name="phonenumber" id ="phonenumber"/></td>
    </tr>
    <tr>
        <th>이름 : </th>
        <td><input type="text" name="name" id ="name"/></td>
    </tr>
    <tr>
        <th>이메일 : </th>
        <td><input type="text" name="email" id ="email"/></td>
     </tr>
  
    </table>
	</form>
		<br>
        	<button type="button" class="registerclass" value="register" id="register">회원가입</button> | <button type="button" onclick="location.href='/'">뒤로가기</button>
		<br>
</div>
</body>
</html>