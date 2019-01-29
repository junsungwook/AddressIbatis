<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script  src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>여기에 제목을 입력하십시오</title>
<script>
	$(document).ready(function(){
		$("#btnZip").click(function(){
			window.open("zipAction","","width=700 height=500");
		});
	})
</script>
</head>
<body>

<h1>상세보기 페이지</h1>
<form action="updateAction">
	<table>
		<tr>
			<td>번호 : </td><td><input type="text" name="num" value="${lists.num }"></td>
		</tr>
		<tr>
			<td>이름 : </td><td><input type="text" name="name" value="${lists.name }"></td>
		</tr>
		<tr>	
			<td>주소 : </td><td><input type="text" id="addr" name="addr" value="${lists.addr }"></td>
		</tr>
		<tr>
			<td>우편번호 : </td><td><input type="text" id="zipcode" name="zipcode" value="${lists.zipcode }"><input type="button" id="btnZip" value="검색"></td>
		</tr>
		<tr>	
			<td>번호 : </td><td><input type="text" name="tel" value="${lists.tel }"></td>
		</tr>
		<tr>
			<td>버튼맨 : </td><td><input type="submit" value="수정"></td>
			<td>삭제 맨 : <input type="button" value="삭제" onclick="location.href='deleteAction?num=${lists.num }'"></td>
		</tr>
	</table>
</form>
</body>
</html>