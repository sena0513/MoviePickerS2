<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:parseDate var="regiDate" value="${qnaDTO.regidate}" pattern="yyyy-MM-dd HH:mm:ss" />
<fmt:parseDate var="replyDate" value="${qnaDTO.replydate}" pattern="yyyy-MM-dd HH:mm:ss" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
</style>
<html>
<form action="/mvProject/adminreport/reportregit.do" method="get" id=movepage>
	<jsp:include page="../admininclude/admintop.jsp" />
	
	<table border=1>
		<tr>
			<th>자주하는질문 제목</th>
			<th width="50">글상태</th>
			<th>등록일</th>
			<th>연락처</th>
			<th>이메일</th>
		</tr>
		<tr>
			<td>${qnaDTO.title}<input type=hidden value="${qnaDTO.seq}" name=seq></td>
			<td>${qnaDTO.situation }</td>
			<td><fmt:formatDate value="${regiDate }" pattern="yyyy.MM.dd" /></td>
			<td>${qnaDTO.phone1 }-${qnaDTO.phone2 }-${qnaDTO.phone3 }</td>
			<td>${qnaDTO.email1 }@${qnaDTO.email2 }</td>
		</tr>
		<tr>
			<td colspan="5"><textarea rows="20" cols="80" name="contents" readonly="readonly" style="resize: none;">${qnaDTO.contents }</textarea></td>
		</tr>
		<tr>
			<td>답변 <input type="hidden" value='답변완료' name=situation></td>
			<td colspan="4"><textarea rows="20" cols="60" name=replycontents></textarea>
		</tr>
		<tr>
			<td colspan=5 align=right><input type="submit" value="등록" id=reply>
			<input type="hidden" value="${pg}" name=pg>
			<input type="button" value="돌아가기" id=backbtn onclick="location.href='/mvProject/adminQnA/qnaregit.do'">
		</tr>
	</table>

	<jsp:include page="../admininclude/adminbottom.jsp" />
</form>
</html>