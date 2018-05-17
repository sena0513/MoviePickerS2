<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/adminstyle.css">

<form action="/mvProject/adminnotice/noticeregit.do" method="post">
	<jsp:include page="../admininclude/admintop.jsp" />

	<table border=1>
		<tr>
			<td>공지사항 제목</td>
			<td><input type=text placeholder="공지사항 (100글자이내)" name=title></td>
		</tr>
		<tr>
			<td>글내용</td>
			<td><textarea rows="20" cols="60" placeholder="상새내용"
					name="contents"></textarea></td>
		</tr>
		<tr>
			<td colspan=2 align=right><input type="submit" value="등록">
			<input type="reset" value="다시 입력">
		</tr>
	</table>

	<jsp:include page="../admininclude/adminbottom.jsp" />
</form>