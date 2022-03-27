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
<title>�����ϱ�</title>
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
					alert("�����Ǿ����ϴ�.")
					location.replace("/workpcboard");
				}else {
					alert("���忡 �����Ͽ����ϴ�. �����ڿ��� �����Ͽ��ּ���.");
					return false;
				} 
			},
			beforeSend:function(){
				if($("#changecontent").val() == ""){
					alert("���� ������ �Է��� �ּ���.");
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
			<h4>�����ϱ�</h4>			 
			<form id="updateform" name="updateform"   method="post" style="padding:10px;">
				<table class="inputtable">
				<tbody> 
				<c:if test="${fn:length(list) > 0}">
				<c:forEach var="list" items="${list}" varStatus="i">
				<caption>${list.DEPARTMENT} / ${list.EMPLOYEE}</caption>
				<tr>
				<th>��ġ</th>
				<td><select name="location" id="location">
				<c:if test="${list.LOCATION eq '����'}">
					<option value="����" selected>����</option>
					<option value="����">����</option>
				</c:if>
				
				<c:if test="${list.LOCATION eq '����'}">
					<option value="����">����</option>
					<option value="����" selected>����</option>
				</c:if>
				</select></td>
				<th>��ġ ����</th><td><input type="text" name="location_division" value="${list.LOCATION_DIVISION}"/></td>
				</tr>
				
				<tr>
				<th>���� ��ġ</th><td><input type="text" name="location_detail" value="${list.LOCATION_DETAIL}"/></td>
				<th>�뵵</th><td><input type="text" name="using" value="${list.USING}"/></td>
				</tr>
				
				<tr> 
				<th>�μ�</th><td><input type="text" name="department" value="${list.DEPARTMENT}"/></td>
				<th>����</th><td><input type="text" name="position" value="${list.POSITION}"/></td>
				</tr>
				
				<tr>
				<th>�����</th><td><input type="text" name="employee" value="${list.EMPLOYEE}"/></td>
				<th>��ǻ�� �̸�</th><td><input type="text" name="pcname_change" value="${list.PCNAME_CHANGE}"/></td>
				</tr>
				
				<tr>
				<th>IP</th><td><input type="text" name="pc_ip" value="${list.PC_IP}"/></td>
				<th>PC ����</th><td><input type="text" name="pc_division" value="${list.PC_DIVISION}"/></td>
				</tr>
				
				<tr>
				<th>������</th><td><input type="text" name="manufacturer" value="${list.MANUFACTURER}"/></td>
				<th>PC ��</th><td><input type="text" name="pcmodel" value="${list.PCMODEL}"/></td>
				</tr>
				
				<tr>
				<th>���̼��� OS</th><td><input type="text" name="pc_os" value="${list.PC_OS}"/></td>
				<th>��ġ�� OS</th><td><input type="text" name="installed_os" value="${list.INSTALLED_OS}"/></td>				
				</tr>
				
				<tr>
				<th>���ų⵵</th><td><input type="text" name="buying_year" value="${list.BUYING_YEAR}"/></td>
				<th>���� ��</th><td><input type="text" name="buying_month" value="${list.BUYING_MONTH}"/></td>
				</tr>
			
				<tr>
				<th>��� �����</th><td><input type="text" name="monitor" value="${list.MONITOR}"/></td>
				<th>������ȣ(��ƼĿ)</th><td><input type="text" name="manage_num" value="${list.MANAGE_NUM}"/></td>
				</tr>
				
				<tr>
				<th>office(2007)</th><td><input type="text" name="msoffice" value="${list.MSOFFICE}"/></td>
				<th>�ѱ�(2007)</th><td><input type="text" name="hanguel" value="${list.HANGUEL}"/></td>
				</tr>
				
				<tr>
				<th>�˾�</th><td><input type="text" name="alyak" value="${list.ALYAK}"/></td>
				<th>AutoCAD</th><td><input type="text" name="autocad" value="${list.AUTOCAD}"/></td>
				</tr>
				
				<tr>
				<th>��Ű˻� ���� : �˾�</th><td><input type="text" name="vaccine" value="${list.VACCINE}"/></td>
				<th>��ġ/���� Ȯ��</th><td><input type="text" name="install_check" value="${list.INSTALLED_CHECK}"/></td>
				</tr>
				
				<tr>
				<th>�ν�����</th><td><input type="text" name="inspector" value="${list.INSPECTOR}"/></td>
				<th>��ü��/�б�</th><td><input type="text" name="replacement_t" value="${list.REPLACEMENT_T}"/></td>
				</tr>
				
				<tr>
				<th>���</th><td><input type="text" name="note" value="${list.NOTE}"/></td>
				</tr>
				
				<div id ="seq" style="display:none"><input type="text" name="SEQ" value="${list.SEQ}"/>
				</div>

				</c:forEach>
				</c:if>

				</tbody>
				</table>
			</form>	
		<br>
			<h4>���� ����</h4>	
			<p><input type="text" id="changecontent" name="changecontent" style=""/></p>
			<div style="padding:5px;">
				<button type="button"  value="btnUpdate" id="btnUpdate" >����</button>
				&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" id="btnList" onclick="location.href='workpcboard'">���</button>
			</div>
</div>
</body>
</html>
