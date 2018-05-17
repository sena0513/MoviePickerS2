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
					<th>번호</th>
					<th>영화이름</th>
					<th>아이디</th>
					<th>리뷰내용</th>
					<th>상태</th>
				</tr>
			<c:forEach var="reviewList" items="${reviewList}">
				<c:if test="${reviewList.reportnumber > 0}">
    	           <tbody>
	                  <tr>
	                     <td>${reviewList.rev_seq}</td>
	                     <td>${reviewList.movienameforkr}</td>
	                     <td>${reviewList.id }</td>
	                     <td style="width:200px;">${reviewList.reviewcontents}</td>
	                     <td><input type="button" value="해당사항없음" id=update${reviewList.rev_seq}>
	                     <input type="button" value="삭제" id=delete${reviewList.rev_seq}></td>
	                  </tr>
	               </tbody>
				</c:if>
				
				<script>
				$("#delete${reviewList.rev_seq}").click(function() {
					location.href = "/mvProject/adminreport/deletereview.do?rev_seq=${reviewList.rev_seq}";
				})
				$("#update${reviewList.rev_seq}").click(function() {
					location.href = "/mvProject/adminreport/updatereview.do?rev_seq=${reviewList.rev_seq}";
				})
				</script>
        	</c:forEach>
	</table>
</form>
</html>
<div id=paging>
${reviewPaging.pagingHTML}
</div>