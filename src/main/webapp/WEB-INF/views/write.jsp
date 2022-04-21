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
<title>�Խ���</title>
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
					alert("����Ǿ����ϴ�.")
					location.replace("/board");
				}else if(result.value == 2){
					alert("�̹� �����ϴ� IP �Դϴ�.");
					return false;
				}else{
					alert("���忡 �����Ͽ����ϴ�. �����ڿ��� �����Ͽ��ּ���.");
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
			<h4>�ۼ��ϱ�</h4>
			<form id="writeform" name="writeform"   method="post" style="padding:10px;">
				<table class="inputtable">
				<tr>
				<th>��ġ</th>
				<td><select name="location" id="location">
					<option value="����">����</option>
					<option value="����">����</option>
				</select></td>
				<th>������</th><td><input type="text" name="rack_n" value=""/></td>
				</tr>
				<tr>
				<th>UNIT ��ȣ</th><td><input type="text" name="unit_n" value=""/></td>
				<th>������</th><td><input type="text" name="server_name" value=""/></td>
				</tr>
				
				<tr> 
				<th>��</th><td><input type="text" name="server_detail" value=""/></td>
				<th>�����뵵</th><td><input type="text" name="server_use" value=""/></td>
				</tr>
				
				<tr>
				<th>�����</th><td><input type="text" name="manager" value=""/></td>
				<th>�ý��� �߿䵵</th><td><input type="text" name="importance" value=""/></td>
				</tr>
				
				<tr>
				<th>������</th><td><input type="text" name="manufacturer" value=""/></td>
				<th>���� ��</th><td><input type="text" name="server_model" value=""/></td>
				</tr>
				
				<tr>
				<th>�缳 IP</th><td><input type="text" name="private_ip" value=""/></td>
				<th>���� IP</th><td><input type="text" name="public_ip" value=""/></td>
				</tr>
				
				<tr>
				<th>S/N</th><td><input type="text" name="serial_n" value=""/></td>
				<th>���� OS ���̼���</th><td><input type="text" name="os_license" value=""/></td>				
				</tr>
				
				<tr>
				<th>��ġ�� OS</th><td><input type="text" name="installed_os" value=""/></td>
				<th>CPU ���</th><td><input type="text" name="cpu" value=""/></td>
				</tr>
			
				<tr>
				<th>�� Core ��</th><td><input type="text" name="total_core" value=""/></td>
				<th>�� �޸� �뷮</th><td><input type="text" name="total_memory" value=""/></td>
				</tr>
				
				<tr>
				<th>�� HDD �뷮</th><td><input type="text" name="total_hdd" value=""/></td>
				<th>HDD ����</th><td><input type="text" name="hdd_content" value=""/></td>
				</tr>
				
				<tr>
				<th>��Ÿ ���</th><td><input type="text" name="etc_specifi" value=""/></td>
				<th>���� �н�����</th><td><input type="text" name="server_pw" value=""/></td>
				</tr>
				
				<tr>
				<th>���� ���� �ݾ�</th><td><input type="text" name="cost_buying_s" value=""/></td>
				<th>DB ��</th><td><input type="text" name="db_model" value=""/></td>
				</tr>
				
				<tr>
				<th>DB ����</th><td><input type="text" name="db_info" value=""/></td>
				<th>DB �н�����</th><td><input type="text" name="db_pw" value=""/></td>
				</tr>
				
				<tr>
				<th>DB ���űݾ�</th><td><input type="text" name="cost_buying_d" value=""/></td>
				<th>WAS</th><td><input type="text" name="was" value=""/></td>
				</tr>
				
				<tr>
				<th>��Ÿ ���� ��</th><td><input type="text" name="cost_buying_etc" value=""/></td>
				<th>�� ���� �ݾ�(����+DB+��Ÿ)</th><td><input type="text" name="total_cost" value=""/></td>
				</tr>
				
				<tr>
				<th>��������(��ǰ����)</th><td><input type="text" name="buying_date" value=""/></td>
				<th>��ǰ��ü</th><td><input type="text" name="vendor" value=""/></td>
				</tr>
				
				<tr>
				<th>�������� ��ü</th><td><input type="text" name="mainten_com" value=""/></td>
				<th>�������� �Ⱓ</th><td><input type="text" name="mainten_period" value=""/></td>
				</tr>
				
				<tr>
				<th>Vendor/Warranty</th><td><input type="text" name="vendor_warranty" value=""/></td>
				<th>���� SW</th><td><input type="text" name="security_sw" value=""/></td>
				</tr>
				
				<tr>
				<th>���� ���Ⱓ</th><td><input type="text" name="security_period" value=""/></td>
				<th>���谡�Կ���</th>
				<td><select name="insurance" id="insurance">
					<option value="O">O</option>
					<option value="X">X</option>
				</select></td>
				</tr>
				
				<tr>
				<th>���</th><td><input type="text" name="note" value=""/></td>
				</tr>
				
				</table>
			</form>
			<div style="padding:10px;">
				<button type="button"  value="btnSave" id="btnSave">����</button>
				&nbsp;&nbsp;&nbsp;<button type="button" id="btnList" onclick="location.href='board'">���</button>
			</div>
	</div>
</body>
</html>
