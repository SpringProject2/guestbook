<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 새로 쓰기</title>

<script>
	function send(f){
		
		var guestbookContent = f.guestbookContent.value;
		var guestbookContentName = f.guestbookContentName.value;
		
		f.action = "insert.do";
		f.method = "post";
		f.submit();
	}
</script>

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
				<td><input name="name" name="guestbookContentName"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="글쓰기" onclick="send(this.form);">
					<input type="button" value="취소" onclick="location.href='list.do'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>














