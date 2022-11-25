<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>

<link rel="stylesheet" href="/cyworld/resources/css/guestbook.css">
</head>
<body>


	<div id="main_box">
	
		<h1>방명록 목록</h1>
		
		<div align="center">
			<input type="button" value="방명록 작성"
					onclick="location.href='insert_form.do'">
		</div> 		
	</div>
	
 	<c:forEach var="vo" items="${ list }"> 
	
 		<div class="guestbook_box">
			
			<div class="type_guestbookContentName">${ vo.guestbookContentName }</div>
 			<div class="type_guestbookContent"> ${ vo.guestbookContent }</div>
 			<div class="type_guestbookRegdate">작성일: ${ vo.guestbookRegdate }</div>
			
			
 			<form>
			<input type="text" name="guestbookContentNum" value="${ vo.guestbookContentNum }"> 
 			<input type="button" value="수정" onclick="modify(this.form);">
 			<input type="button" value="삭제" onclick="del(this.form);">
 			</form>
			
 		</div>
 		
	</c:forEach>
		 			 			

	<script src="/cyworld/resources/js/httpRequest.js"></script>

<script>
	function del(f){
		
		if( !confirm('정말 삭제하시겠습니까?') ){
			return;
		}
		
		var url = "delete.do";
		var param = "guestbookContentNum=" + f.guestbookContentNum.value;
		alert(f.guestbookContentNum.value);
		sendRequest(url, param, resultFn, "GET");
	}
	
	//콜백메서드를 생성
    function resultFn(){
        //서버에서 넘어온 데이터를 받아오기 위한 메서드
        //xhr.readyState 
        //1 ~ 3 : 페이지 로드중
        //4 : 페이지로드 완료

        //xhr.status
        //404, 500등의 오류를 가지고 오거나 200의 정상적인 결과를 가지고 오는 속성

        if( xhr.readyState == 4 && xhr.status == 200 ){

            //xhr.responseText : 컨트롤러에서 return으로 보내준 결과값
            var data = xhr.responseText;

            if( data == 'no' ){
                alert("삭제 실패");
                return;
            }

            alert("삭제성공");
            location.href="list.do";
        }
    }
	
  	//게시글 수정
	function modify(f){
		
		f.action = 'modify_form.do';
		f.method = "post";
		f.submit();
		
	}

</script>
</body>
</html>