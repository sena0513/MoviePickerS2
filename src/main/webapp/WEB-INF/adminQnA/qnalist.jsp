<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#paging {
	
	color: black;
	text-decoration: none;
	cursor: pointer;
}
input[type="text"] {
    width: 100px;
}
td{
	width: 100px;
}
th{
	width: 100px;
}
#tableform .
#currentPaging {
	color: red;
	text-decoration: urderline;
	cursor: pointer;
}
</style>
<form action=/mvProject/adminQnA/qnalistform.do method="get">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript"> 
</script>
	<jsp:include page="../admininclude/admintop.jsp" />

			<table border=1 id=tableform>
				<tr>
					<th colspan="3">
                           <input type="text" placeholder="검색어를 입력해주세요." name="searchtext">
                           <input type="submit" value="검색하기">
					</th>
				</tr>
				<tr>
					<th>글 번호 </th>
					<th>자주하는질문 제목</th>
					<th>자주하는질문 날짜</th>
				</tr>
				<c:forEach items="${list}" var="list">
					<tr>
						<td>${list.seq}</td>
						<td><a onclick="location.href='/mvProject/adminQnA/qnainfoform.do?seq=${list.seq}&pg=${pg}'">${list.title}</a></td>
						<td>${list.logtime}</td>
						<!-- 위쪽은 수정 리스트 불러오는것             밑에는 수정눌렀을경우의 텍스트 방식 바꾸기-->
					</tr>
				</c:forEach>
			</table>
		<jsp:include page="../admininclude/adminbottom.jsp" />
</form>
</body>
</html>
<div id=paging>
${qnaPaging.pagingHTML}
</div>