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
<style>
pre{white-space : pre-wrap;}
</style>
<script type="text/javascript">
var id = localStorage.getItem("ID");

$(document).ready(function(){
	$("#delete").click(function(){
			if(confirm("���� �Ͻðڽ��ϱ�?") == true){
				$.ajax({
					url: "/deletelist2",
				    type: "POST",
				    cache:false,
				    async:true, 
				    data: {"SEQ" : $("#SEQ").val()},
				    dataType:"json",
				    success: function(result) {
				    	console.log(result);
				    	if(result == 1){
					    	alert("���� �Ǿ����ϴ�.");
					    	location.replace("/workpcboard"); 
				    	}else {
							alert("������ �����Ͽ����ϴ�. �����ڿ��� �����Ͽ��ּ���.");
							return false;
						} 
					},
				});
			}else{
				return;
			}

	})
	
	
});

</script>

</head>
<body>

	<div id="wrap" style="width:1000px; margin:30px 20px 30px 20px;">
			<h4>�󼼺���</h4>			 
			<form id="updateform" name="updateform"   method="post" style="padding:10px;">
				<table class="datatable">
				<tbody> 
				<c:if test="${fn:length(list) > 0}">
				<c:forEach var="list" items="${list}" varStatus="i">
				<caption>${list.DEPARTMENT} / ${list.EMPLOYEE}</caption>
				<br>
				<tr>
				<th>��ġ</th><td><pre>${list.LOCATION}</pre></td>
				<th><b>��ġ ����</b></th><td><pre><b>${list.LOCATION_DIVISION}</b></pre></td>
				</tr>
				<tr>
				<th><b>���� ��ġ</b></th><td><pre><b>${list.LOCATION_DETAIL}</b></pre></td>
				<th>�뵵</th><td><pre>${list.USING}</pre></td>
				</tr>
				<tr>
				<th>�μ�</th><td><pre>${list.DEPARTMENT}</pre></td>
				<th>����</th><td><pre>${list.POSITION}</pre></td>
				</tr>
				
				<tr>
				<th>�����</th><td><pre>${list.EMPLOYEE}</pre></td>
				<th>��ǻ�� �̸�</th><td><pre>${list.PCNAME_CHANGE}</pre></td>
				</tr>
				
				<tr>
				<th>IP</th><td><pre>${list.PC_IP}</pre></td>
				<th>PC ����</th><td><pre>${list.PC_DIVISION}</pre></td>
				</tr>
				
				<tr>
				<th>������</th><td><pre>${list.MANUFACTURER}</pre></td>
				<th>PC ��</th><td><pre>${list.PCMODEL}</pre></td>
				</tr>
				
				<tr>
				<th>���̼��� OS</th><td><pre>${list.PC_OS}</pre></td>
				<th>��ġ�� OS</th><td><pre>${list.INSTALLED_OS}</pre></td>
				</tr>
				
				<tr>
				<th>���� �⵵</th><td><pre>${list.BUYING_YEAR}</pre></td>
				<th>���� ��</th><td><pre>${list.BUYING_MONTH}</pre></td>			
				</tr>
				
				<tr>
				<th>��� �����</th><td><pre>${list.MONITOR}</pre></td>					
				<th>������ȣ(��ƼĿ)</th><td><pre>${list.MANAGE_NUM}</pre></td>
				</tr>
			
				<tr>
				<th>office(2007)</th><td><pre>${list.MSOFFICE}</pre></td>				
				<th>�ѱ�(2007)</th><td><pre>${list.HANGUEL}</pre></td>
				</tr>
				
				<tr>
				<th>�˾�</th><td><pre>${list.ALYAK}</pre></td>				
				<th>AutoCAD</th><td><pre>${list.AUTOCAD}</pre></td>
				</tr>
				
				<tr>
				<th>��Ű˻� ����/�˾�</th><td><pre>${list.VACCINE}</pre></td>				
				<th>��ġ/���� Ȯ��</th><td><pre>${list.INSTALLED_CHECK}</pre></td>
				</tr>
				
				<tr>
				<th>�ν�����</th><td><pre>${list.INSPECTOR}</pre></td>				
				<th>��ü��/�б�</th><td><pre>${list.REPLACEMENT_T}</pre></td>
				</tr>
				<tr>
				<th>���</th><td colspan="3"><pre>${list.NOTE}</pre></td>
				</tr>
				<div id ="seq" style="display:none"><input type="text" id ="SEQ" name="SEQ" value="${list.SEQ}"/>
				</div>

				</c:forEach>
				</c:if>

				</tbody>
				</table>
			</form>	
		<br>
		<br>
		<br>		
			<div id = "display">
		<c:if test="${fn:length(list2) > 0}">
		<table class="datatable">	
			<thead>
				<tr>
					<th align="center" scope="col">No</th>
					<th align="center" scope="col">������</th>
					<th align="center" scope="col">���泻��</th>
					<th align="center" scope="col">������</th>
				</tr>
		</thead>
		<tbody>
		<c:forEach var="list2" items="${list2}" varStatus="i">
		<tr>	
				<td align="center">${list2.H_SEQ}</td>
				<td align="center">${list2.CHANGE_USER}</td>
				<td align="center">${list2.CHANGE_CONTENT}</td>
				<td align="center">${list2.CHANGE_DATE}</td>
		</tr>
		</c:forEach>
		</tbody>

		</table>
		</c:if>
		<br>
			</div>

			<div style="padding:10px;">
				<button type="button"  value="Update" id="Update" onclick="location.href='/changepcboard?seq='+$('#SEQ').val()">�����ϱ�</button>
				&nbsp;&nbsp;&nbsp;&nbsp;<button type="button"  value="delete" id="delete" >����</button>
				&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" id="btnList" onclick="location.href='workpcboard'">���</button>
			</div>
</div>
</body>
</html>
