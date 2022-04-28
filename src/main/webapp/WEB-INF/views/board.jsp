<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<link rel="stylesheet" type="text/css" href="/css/main.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<meta charset="EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>서버 리스트</title>
<script  type="text/javascript">

$(document).ready(function(){
	$("#location2, #location1").click(function(){
		$.ajax({
			url: "/location2",
		    type: "POST",
		    cache:false,
		    async:true, 
		    data:{"location" : $(this).attr('value')},
		    dataType:"json",
		    success: function(list) {
		    	console.log(list);
		    	resultHtml(list);
			},
		})
	})
	
	$("#serbtn").click(function(){
		searching();
	})
	
	$("#searchText").keypress(function(e){
		if(e.keyCode == 13){
			searching();
			return false;
		}
	})
	
	$("#beforepage").click(function(){
		pagelist2();
	})
	
	$("#afterpage").click(function(){
		pagelist3();
	})
		
	function searching(){
		var searchid = document.getElementById('searchField').value;
		var searchtxt = document.getElementById('searchText').value;
		var location = document.getElementById('location').value;
		console.log(searchid);
		console.log(searchtxt);
		$.ajax({
			url: "/searchlist",
		    type: "POST",
		    cache:false,
		    async:true, 
		    data:{ searchid : searchid,
		    	  searchtxt : searchtxt,
		    	  location : location},
		    dataType:"json",
		    success: function(list) {
		    	console.log(list);
		    	resultHtml(list);
			},
			beforeSend:function(){
				if(document.getElementById('searchText').value == ""){
					alert("검색어를 입력해 주세요.");
					$('#searchText').focus();
					return false;
				}
				if(document.getElementById('searchField').value == "0"){
					alert("검색할 컬럼을 선택해주세요.");
					return false;
				}
			}
		})
	}
	r
});



function pagelist(num){
	var location = document.getElementById('location').value;
	var searchid = document.getElementById('searchField').value;
	var searchtxt = document.getElementById('searchText').value;
	console.log(location);
	console.log(num);
	$.ajax({
		url: "/pagelist",
	    type: "POST",
	    cache:false,
	    async:true, 
	    data:{ "location" :location,
	    	  "page" : num,
	    	  searchid : searchid,
	    	  searchtxt : searchtxt },
	    dataType:"json",
	    success: function(list) {
	    	console.log(list);
	    	resultHtml(list);
		},

	})
}

function pagelist2(){
	var location = document.getElementById('location').value;
	var searchid = document.getElementById('searchField').value;
	var searchtxt = document.getElementById('searchText').value;
	
	var rownum = document.getElementById('rownum').value;
	var bn = (rownum/10) +1;
	var endpage = document.getElementById('endpage').value;
	var bnint = parseInt(bn)-1;

	$.ajax({
		url: "/pagelist",
	    type: "POST",
	    cache:false,
	    async:true, 
	    data:{ "location" :location,
	    	  "page" : bnint,
	    	  searchid : searchid,
	    	  searchtxt : searchtxt },
	    dataType:"json",
	    success: function(list) {
	    	console.log(list);
	    	resultHtml(list);
		},
		beforeSend:function(){
			if(bnint == 0){
				alert("첫 페이지 입니다.");
				return false;
			}
			
		},

	})
}

function pagelist3(){
	var location = document.getElementById('location').value;
	var searchid = document.getElementById('searchField').value;
	var searchtxt = document.getElementById('searchText').value;
	
	var rownum = document.getElementById('rownum').value;
	var bn = (rownum/10) +1;
	var endpage = document.getElementById('endpage').value;
	var bnint = parseInt(bn)+1;

	$.ajax({
		url: "/pagelist",
	    type: "POST",
	    cache:false,
	    async:true, 
	    data:{ "location" :location,
	    	  "page" : bnint,
	    	  searchid : searchid,
	    	  searchtxt : searchtxt },
	    dataType:"json",
	    success: function(list) {
	    	console.log(list);
	    	resultHtml(list);
		},
		beforeSend:function(){
			if(bnint > endpage){
				alert("마지막 페이지 입니다.");
				return false;
			}
			
		},

	})
}


function openPopup(){
	window.open("/checkping","popup","width=850, height=550, top=150, left=200");
}

function resultHtml(list){
	var html = "<table class='datatable'>";
	html += "<thead>";
	html += "<tr>";
	html += "<th align='center' scope='col' width='50'>No</th>";
	html += "<th align='center' scope='col' width='100'>랙구분</th>";
	html += "<th align='center' scope='col' width='150'>IP</th>";
	html += "<th align='center' scope='col' width='250'>명세</th>";
	html += "<th align='center' scope='col' width='175'>서버명</th>";
	html += "<th align='center' scope='col' width='175'>서버 모델명</th>";
	html += "<th align='center' scope='col' width='100'>담당자</th>";
	html += "<tr>";
	html += "</thead>";
	html += "<tbody>";
	
	
	
	if(list.length>1){
		for(var key=0; key<list.length-1; key++){
			html += "<tr align='center' onClick='location=`/detail?seq=" + list[key].SEQ +"`;' style='cursor:pointer;'>"
			
			if(list[key].SEQ != null){
				html += "<td>" +list[key].SEQ+ "</td>";
			}
			
			html += "<td>" +list[key].RACK_N+ "</td>";
			
			if(list[key].PRIVATE_IP == null){
				html += "<td> - </td>" ;
			}else{
				html += "<td>" +list[key].PRIVATE_IP+ "</td>";
			}
			
			// <a href='/detail?seq=" + list[key].SEQ+"'>"
			html += "<td>";
			html += list[key].SERVER_DETAIL;
			
			//html += "</a>";
			html += "</td>";
			
			if(list[key].SERVER_NAME == null){
				html += "<td> - </td>" ;
			}else{
				html += "<td>" +list[key].SERVER_NAME+ "</td>";
			}
			
			if(list[key].SERVER_MODEL == null){
				html += "<td> - </td>" ;
			}else{
				html += "<td>" +list[key].SERVER_MODEL+ "</td>";
			}

			if(list[key].MANAGER == null){
				html += "<td> - </td>" ;
			}else{
				html += "<td>" +list[key].MANAGER+ "</td>";
			}
			
			html += "</tr>";
		}
		
	}else {
		html += "<tr><td align='center' colspan='20'>조회된 내역이 없습니다.</td></tr>";
	}
	html += "</tbody>";
	html += "</table>";
		html += "<br>"
		html += "<br>"
		html += "<center>";
		html += "<a href='javascript:pagelist2()' id ='beforepage' > 이전 </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		for(var i = list[list.length-1].startpage; i<=list[list.length-1].endpage;i++ ){
			if(i == list[list.length-1].page){
				html += "<a href='javascript:pagelist(" + i + ")' id ='pagenum' > <b>" + i + " </b></a> &nbsp;";
			}else{
				html += "<a href='javascript:pagelist(" + i + ")' id ='pagenum' >" + i + "</a> &nbsp;";
			}
		}
		html += "&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:pagelist3()' id ='afterpage' >다음 </a>";
		html += "</center>";
	
	html += "<div style='display:none'><input type='text' id ='location' name='location' value='" + list[0].LOCATION + "'/></div>";
	html += "<div style='display:none'><input type='text' id ='rownum' name='rownum' value='" + list[0].RNUM +  "'/></div>";
	html += "<div style='display:none'><input type='text' id ='endpage' name='endpage' value='" + list[list.length-1].endpage +  "'/></div>";
	
	
	$("#display").empty();
	$("#display").append(html);
}

</script>
<style>
li{float : left;}
li a {text-align : center; padding : 8px 10px;  }
li a.current{font-weight : bold; border-bottom: 2px solid #23262d;}

</style>
</head>

<body>
<div style="padding:15px; ">
	<ul class="l_menu">
		<li><a class="current" href="/board">서버 현황 </a></li>
		<li><a href="/workpcboard">업무용 PC</a></li>
	</ul>
</div>

	<div id="wrap" style="width:1000px; padding:50px;">
		<h4>위치 선택</h4>
		<div style="padding:10px;"> 
		<button type="button" id="location1" value="location1" > 본사 </button>
		&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" id="location2" value="location2"> 석포 </button> 
		<br>
		<br>
		<button style="float: right;" type="button" id="checkping" onclick="openPopup()"> 네트워크 연결</button> 
		<br>
		<br>
		</div>
		<form id = "search" method="post" >
		<h4>검색</h4>
		<table id="searchtable" class="datatable">
			<tr>
			<td><select class="selectfield" id="searchField">
			<option value="0">선택</option>
			<option value="PRIVATE_IP">IP</option>
			<option value="SERVER_NAME">서버명</option>
			<option value="MANAGER">담당자</option>
			</select></td>
			<td>
			<input type="text" name="searchText" id ="searchText"/> 
			&nbsp;&nbsp;&nbsp;<button type="button" id="serbtn" value="serbtn">검색</button>
			</td>
			</tr>
		</table>
		</form>
		<br>
		
		<br>
		<br>
		
		<h4>서버 리스트</h4>
		<br>
		<button style="float: right;" type="button" id="newregister" value="newregister"> 최신순 </button> 
		<br>
		<br>
		<div id = "display">
		<table class="datatable">
			<thead>
				<tr>
					<th align="center" scope="col" width="50">No</th>
					<th align="center" scope="col" width="100">랙구분</th>
					<th align="center" scope="col" width="150">IP</th>
					<th align="center" scope="col" width="250">명세</th>
					<th align="center" scope="col" width="175">서버명</th>
					<th align="center" scope="col" width="175">서버 모델명</th>
					<th align="center" scope="col" width="100">담당자</th>
				</tr>
			</thead>
			<tbody>
		<c:if test="${fn:length(list) > 0}">

		<c:forEach var="list" items="${list}" varStatus="i" end="${fn:length(list)-1}">
			<c:if test="${list.SEQ ne null}">
		<tr align="center" onClick="location='/detail?seq=${list.SEQ}';" style="cursor:pointer;">	
		</c:if>
		<c:if test="${list.SEQ eq null}">
			<tr style="display:none;">	
		</c:if>
				<td align="center">${list.SEQ}</td>
				<td align="center">${list.RACK_N}</td>
				<c:if test="${list.PRIVATE_IP eq null}">
				<td align="center"> - </td>
				</c:if>
				<c:if test="${list.PRIVATE_IP ne null}">
				<td align="center">${list.PRIVATE_IP}</td>
				</c:if>
				
				<td>
				<c:out value="${list.SERVER_DETAIL}"/>
				</td>
				
				<c:if test="${list.SERVER_NAME eq null}">
				<td align="center"> - </td>
				</c:if>
				<c:if test="${list.SERVER_NAME ne null}">
				<td align="center">${list.SERVER_NAME}</td>
				</c:if>
				
				<c:if test="${list.SERVER_MODEL eq null}">
				<td align="center"> - </td>
				</c:if>
				<c:if test="${list.SERVER_MODEL ne null}">
				<td align="center">${list.SERVER_MODEL}</td>
				</c:if>

				<td align="center">${list.MANAGER}</td> 
				
		</tr>
		</c:forEach>
		</c:if>
		<c:if test="${fn:length(list) == 0}">
			<tr><td align="center" colspan="20">조회된 내역이 없습니다.</td></tr>
		</c:if>
		
			</tbody>
		</table>
		
		<br>
		<br>
			
		<center>
		<button type="button" id="beforepage" value="beforepage">이전</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<c:forEach var="i" begin="${list[fn:length(list)-1].startpage}" end="${list[fn:length(list)-1].endpage}">
		<c:choose>
		<c:when test= "${i eq list[fn:length(list)-1].page}">
		<a href="javascript:pagelist(${i})" id ="pagenum" ><b>${i}</b></a>&nbsp;
		</c:when>
		<c:otherwise>
		<a href="javascript:pagelist(${i})" id ="pagenum"> ${i} </a>&nbsp;
		</c:otherwise>
		</c:choose>
		</c:forEach>
		&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" id="afterpage" value="afterpage">다음</button>
		</center>
			
		<div style="display:none"><input type="text" id ="location" name="location" value="${list[0].LOCATION}"/></div>
		<div style="display:none"><input type="text" id ="rownum" name="rownum" value="${list[0].RNUM}"/></div>
		<div style="display:none"><input type="text" id ="endpage" name="endpage" value="${list[fn:length(list)-1].endpage}"/></div>
		</div>
	
		<div style="padding:10px;">
			<button type="button" id="write" onclick="location.href='write'">추가하기</button>
		</div>
</body>
</html>