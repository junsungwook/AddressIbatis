<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script  src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여기에 제목을 입력하십시오</title>
<script>
	$(document).ready(function(){
		$("#send").click(function(){
			$.post("zipAction",{"dong":$("#dong").val()},function(data){
				data = $.parseJSON(data);
				var htmlStr="";
				htmlStr +="<table>";
				for(var i=0; i<data.length;i++){
					htmlStr +="<tr>";
					htmlStr +="<td>"+data[i].zipcode+"</td>";
					htmlStr +="<td>"+data[i].sido+"</td>";
					htmlStr +="<td>"+data[i].gugun+"</td>";
					htmlStr +="<td>"+data[i].dong+"</td>";
					htmlStr +="<td>"+data[i].bunji+"</td>";
					htmlStr +="</tr>";
				}
				htmlStr +="</table>";
				$("#result").html(htmlStr);	
			});
		});
		$("#result").on("click","tr",function(){
			//이떄 this는 tr을 의미
			//"td:eq(e)"는 e번째의 td라는 뜻
			var address = $("td:eq(1)",this).text()+" "+
						$("td:eq(2)",this).text()+" "+
						$("td:eq(3)",this).text()+" "+
						$("td:eq(4)",this).text()+" ";
			//opener는 윈도우 오픈 한 놈들중에 원하는 요소를 찾아서 
			//그쪽으로 값을 넘겨줄 수 있음
			$(opener.document).find("#zipcode").val($("td:eq(0)",this).text());
			$(opener.document).find("#addr").val(address);
			self.close();
		});
	})
</script>
</head>
<body>
<form>
	<table>
		<tr>
			<td>동이름 입력 <input type="text" name="dong" id="dong"> <input type="button" id="send" value="검색">
			</td>
		</tr>
	</table>
</form>
*검색 후 우편번호 클릭하면 자동을 입력될거다
<div id="result"></div>
</body>
</html>