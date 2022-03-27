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
<title>���̵� ã��</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#findpn").click(function(){
		$.ajax({
		    url: "/findpn",
		    type: "POST",
		    cache:false,
		    async:true, 
		    data:$("#pnfrm").serialize(),
		    dataType:"json",
		    success: function(result) {
		    	if(result.value != null){
		    		$('#req1').text("���̵�� " + result.value + "�Դϴ�.");
		    	}else{
		    		alert("���Ե� ������ �����ϴ�.");
					focus(document.pnfrm.phonenumber.value);
					return false;
		    	}
		    	
			},
			beforeSend:function(){
				if(document.pnfrm.phonenumber.value == ""){
					alert("��ȭ��ȣ�� �Է��� �ּ���.");
					focus(document.pnfrm.phonenumber.value);
					xhr.abort();
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
	<h2>���̵� ã��</h2>
	<form id = "pnfrm" name ="pnfrm">
	<table class="datatable" style="width:200;">
	<tr>
		<th>��ȭ��ȣ : </th>
		<td><input type="text" name="phonenumber" id ="phonenumber"/> <button type="button" class="findpnclass" value="findpn" id="findpn" style="border:1px">�˻�</button></td>
		</tr>
    </table>
         <br>
         <br>
      <div style="float:right">
      <button type="button" class="registerclass" value="register" id="register" onclick="location.href='/register'">ȸ������</button> | <button type="button" onclick="location.href='/findpw'">��й�ȣ ã��</button> | <button type="button" onclick="location.href='/'">�ڷΰ���</button>
      </div>
    </form>
    <div>
    
      
	<br>
	</div>
	</div>
</body>
</html>