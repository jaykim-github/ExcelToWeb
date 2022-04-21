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
		    url: "/boardsave2",
		    type: "POST",
		    cache:false,
		    async:true, 
		    data:$("#writeform").serialize(),
		    dataType:"json",
		    success: function(result) {
				if(result.value == 1){
					alert("����Ǿ����ϴ�.")
					location.replace("/workpcboard");
				}else {
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
				<th>��ġ ����</th><td><input type="text" name="location_division" value=""/></td>
				</tr>
				<tr>
				<th>���� ��ġ</th><td><input type="text" name="location_detail" value=""/></td>
				<th>�뵵</th><td><input type="text" name="using" value=""/></td>
				</tr>
				
				<tr> 
				<th>�μ�</th><td><input type="text" name="department" value=""/></td>
				<th>����</th><td><input type="text" name="position" value=""/></td>
				</tr>
				
				<tr>
				<th>�����</th><td><input type="text" name="employee" value=""/></td>
				<th>��ǻ�� �̸�</th><td><input type="text" name="pcname_change" value=""/></td>
				</tr>
				
				<tr>
				<th>IP</th><td><input type="text" name="pc_ip" value=""/></td>
				<th>PC ����</th><td><input type="text" name="pc_division" value=""/></td>
				</tr>
				
				<tr>
				<th>������</th><td><input type="text" name="manufacturer" value=""/></td>
				<th>PC ��</th><td><input type="text" name="pcmodel" value=""/></td>
				</tr>
				
				<tr>
				<th>���̼��� OS</th><td><input type="text" name="pc_os" value=""/></td>
				<th>��ġ�� OS</th><td><input type="text" name="installed_os" value=""/></td>				
				</tr>
				
				<tr>
				<th>���ų⵵</th><td><input type="text" name="buying_year" value=""/></td>
				<th>���� ��</th><td><input type="text" name="buying_month" value=""/></td>
				</tr>
			
				<tr>
				<th>��� �����</th><td><input type="text" name="monitor" value=""/></td>
				<th>������ȣ(��ƼĿ)</th><td><input type="text" name="manage_num" value=""/></td>
				</tr>
				
				<tr>
				<th>office(2007)</th><td><input type="text" name="msoffice" value=""/></td>
				<th>�ѱ�(2007)</th><td><input type="text" name="hanguel" value=""/></td>
				</tr>
				
				<tr>
				<th>�˾�</th><td><input type="text" name="alyak" value=""/></td>
				<th>AutoCAD</th><td><input type="text" name="autocad" value=""/></td>
				</tr>
				
				<tr>
				<th>��Ű˻� ���� : �˾�</th><td><input type="text" name="vaccine" value=""/></td>
				<th>��ġ/���� Ȯ��</th><td><input type="text" name="install_check" value=""/></td>
				</tr>
				
				<tr>
				<th>�ν�����</th><td><input type="text" name="inspector" value=""/></td>
				<th>��ü��/�б�</th><td><input type="text" name="replacement_t" value=""/></td>
				</tr>
				
				<tr>
				<th>���</th><td><input type="text" name="note" value=""/></td>
				</tr>
				
				</table>
			</form>
			<div style="padding:10px;">
				<button type="button"  value="btnSave" id="btnSave">����</button>
				&nbsp;&nbsp;&nbsp;<button type="button" id="btnList" onclick="location.href='workpcboard'">���</button>
			</div>
	</div>
</body>
</html>
