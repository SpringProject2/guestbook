<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 새로 쓰기</title>

</head>
<body>

	<form method="post" enctype="multipart/form-data">
		<table border="1" align="center">
			<caption>:::방명록 새로 쓰기:::</caption>
			
			<tr>
				<th>내용</th>
				<td><textarea rows="5" cols="50" name="guestbookContent"></textarea></td>
			</tr>
			
			<tr>
				<th>작성자</th>
				<td><input name="guestbookContentName"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="글쓰기" onclick="send(this.form);">
					<input type="button" value="취소" onclick="location.href='list.do'">
				</td>
			</tr>
		</table>
	</form>
	
	<script>
	function send(f){
	
		alert("xh");
		f.action = "insert.do";
		f.submit();
	}
</script>
</body>
</html>














