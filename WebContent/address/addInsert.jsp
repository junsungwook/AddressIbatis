<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여기에 제목을 입력하십시오</title>
</head>
<body>
<form action="insertAction" method="post">
	<div class="container">
	   <table>
	      <tr>
	         <td>이름 </td>
	         <td><input type="text" name="name" id="name"></td>
	      </tr>
	      <tr>
	         <td>PHONE</td>
	         <td>
	         <input type="text" name="tel" id="tel">
	         </td>
	      </tr>
	      <tr>
	         <td>우편번호</td>
	         <td><input type="text" name="zipcode" id="zipcode"></td>
	         <td><input type="button" name="btnZip" id="btnZip" value='검색'></td>
	      </tr>
	      <tr>
	         <td>주소</td>
	         <td colspan=2><input type="text" name="addr" id="addr"></td>
	      </tr>
	      <tr>
	         <td colspan=2><input type="submit" id="insert_bt" value="확인">
	         <input type="button" value="취소"></td>
	      </tr>
	   </table>
	</div>
   </form>
</body>
</html>