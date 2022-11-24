<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진첩 수정</title>

	<!-- Ajax활용을 위한 js파일 로드 -->
	<script src="/cyworld/resources/js/httpRequest.js"></script>

	<script>
		function send(f){

			
			var url = "modify.do";
			var param = "guestbookContentNum="+f.guestbookContentNum.value +
			            "&guestbookContent="+ encodeURIComponent(f.guestbookContent.value) +
			            "&guestbookContentName=" + encodeURIComponent(f.guestbookContentName.value);
			sendRequest( url, param, sendCallback, "POST");
		}
		
		function sendCallback(){
			
			if( xhr.readyState == 4 && xhr.status == 200 ){
				
				//"{'result':'no'}"
				var data = xhr.responseText;
				
				//문자열 구조로 넘어온 data를 실제 JSON타입으로 변경
				var json = (new Function('return'+data))();
				
				if( json.result == 'no' ){
					alert("수정실패");
					return;
				}
				
				alert("수정성공");
				location.href="list.do";
				
			}
			
		}
		
		
	</script>

</head>
<body>
	<form>
		<input type="hidden" name="guestbookContentNum" value="${ vo.guestbookContentNum }">
		
		<table border="1" align="center">
		
			<caption>:::방명록 수정:::</caption>
			
			<tr>
				<th>내용</th>
				<td><pre><textarea rows="5" cols="50" name="content">${vo.guestbookContent}</textarea></pre></td>
			</tr>
			
			
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="수정" onclick="send(this.form);">
					<input type="button" value="취소" onclick="location.href='list.do'">
				</td>
			</tr>
			
		</table>
	</form>
</body>
</html>