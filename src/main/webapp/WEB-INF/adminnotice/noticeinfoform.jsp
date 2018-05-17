<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/adminstyle.css">
<script>
	$(document).ready(function(){
		
	function makefunc(targetpage){
	   return function(){
       	 $("#movepage").attr("action", targetpage);
     	   $("#movepage").submit();
		};
	};
	$("#modifybtn").click(makefunc("/WEB-INF/adminnotice/modifynotice.do?seq=${list.seq}&pg=${pg}"));
	$("#backbtn").click(function(){
		location.href = "/WEB-INF/adminnotice/noticelistform.do?pg=${pg}"
	});
	$("#deletebtn").click(function() {
		if (confirm("정말로 삭제하시겠습니까?")) {
			location.href = "deletenotice.do?seq=${list.seq}&pg=${pg}";
		} else {
			alert("취소하셨습니다");
			location.href = "noticelistform.do&pg=${pg}"
		}
	});
});
</script>
<form action="/mvProject/adminserivce/noticeregit.do" method="post" id=movepage>
	<jsp:include page="../admininclude/admintop.jsp" />
	
	<table border=1>
		<tr>
			<td>공지사항 제목<input type=hidden value=${list.seq} name=seq></td>
			<td><input type=text name=title value=${list.title}></td>
		</tr>
		<tr>
			<td>글내용</td>
			<td><textarea rows="20" cols="60" name="contents">${list.contents }</textarea></td>
		</tr>
		<tr>
			<td colspan=2 align=right><input type="button" value="수정" id=modifybtn>
			<input type="button" value="삭제" id=deletebtn><input type="button" value="돌아가기" id=backbtn>
		</tr>
	</table>

	<jsp:include page="../admininclude/adminbottom.jsp" />
</form>