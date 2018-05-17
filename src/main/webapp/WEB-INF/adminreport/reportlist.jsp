<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="../css/adminstyle.css">

<style>
#paging {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
input[type="text"] {
    width: 100px;
}
#tableform th{
	width:50px;
	height: 25px;
}
#tableform td{
	width:50px;
}
#currentPaging {
	color: red;
	text-decoration: urderline;
	cursor: pointer;
}
</style>
<html>
<form action="/mvProject/adminreport/reportlistform.do?pg=${pg}" method="get">
	<jsp:include page="../admininclude/admintop.jsp"/>

			<table border=1 id=tableform>
				<tr>
					<th>고객센터 1:1 문의</th>
					<th>유형</th>
					<th>제목</th>
					<th>등록일</th>
					<th>상태</th>
					<th colspan="2">
                           <input type="text" placeholder="검색어를 입력해주세요." name="searchtext">
                           <input type="submit" value="검색하기">
					</th>
				</tr>
			<c:forEach var="QnaList" items="${QnaList}">
				<c:if test="${QnaList.situation ne '답변대기중'}">
					<tr>
						<td colspan=8><textarea rows="5" cols="80" readonly="readonly" style="resize: none;">표시할 항목 없음</textarea>
					</tr>
				</c:if>
			</c:forEach>
			<c:forEach var="QnaList" items="${QnaList}">
				<c:if test="${QnaList.situation eq '답변대기중'}">
    	           <tbody>
	                  <tr>
	                     <td><input type="checkbox" id="qna${QnaList.seq }" name="qna"
	                        value="${QnaList.seq }"> <label for="qna${QnaList.seq }"><b>${QnaList.rn }</b></label>
	                     </td>
	                     <td>${QnaList.type }</td>
	                     <td style="width:200px;"><a 
	                        href="/mvProject/adminreport/myInquiryQnAView.do?seq=${QnaList.seq }&pg=${pg}&searchtext=${searchtext}">${QnaList.title }</a></td>
	                     <td><b>${QnaList.regidate }</b></td>
	                     <td>${QnaList.situation }</td>
	                  </tr>
	               </tbody>
				</c:if>
        	</c:forEach>
	</table>
</form>
</html>
<div id=paging>
${reportPaging.pagingHTML}
</div>