<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script  src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여기에 제목을 입력하십시오</title>
<script>
$(document).ready(function(){
	$("#btnSearch").click(function(){
		$.get("searchAction",{"field":$("#field").val(),"word":$("#word").val()},function(data){
			data = $.parseJSON(data);
			var htmlStr="";
			htmlStr +="총게시물수: "+data.length+"<br>";
			htmlStr +="<table>";
			for(var i=0; i<data.length;i++){
				htmlStr +="<tr>";
				htmlStr +="<td>"+data[i].name+"</td>";
				htmlStr +="<td>"+data[i].addr+"</td>";
				htmlStr +="<td>"+data[i].zipcode+"</td>";
				htmlStr +="<td>"+data[i].tel+"</td>";
				htmlStr +="</tr>";
			}
			htmlStr +="</table>";
			$("#result").html(htmlStr);	
		});
		
	});
})
</script>
</head>
<body>
<div id="result">
${lists.size() }
<table>
	<thead>
		<tr>
			<td>이름</td>
			<td>주소</td>
			<td>우편번호</td>
			<td>전화번호</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${lists}" var="man" >
			<tr>
				<td><a href="viewAction?num=${man.num }">${man.name }</a></td>
				<td>${man.addr }</td>
				<td>${man.zipcode }</td>
				<td>${man.tel }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</div>
<form action="search" id="search">
<select name="field" id="field">
	<option value="name">이름</option>
	<option value="tel">번호</option>
</select>
<input type="text" name="word" id="word">
<input type="button" value="찾기" id="btnSearch">
</form>
</body>
</html>