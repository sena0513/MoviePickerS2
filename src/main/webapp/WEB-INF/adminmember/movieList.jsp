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
<form id=movepage method="post">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript"> 
</script>
	<jsp:include page="../admininclude/admintop.jsp" />

			<table border=1 id=tableform>
				<tr>
					<th>seq</th>
					<th>영화 이름(한글)</th>
					<th>영화 이름(영문)</th>
					<th>영화 장르</th>
					<th>주연 배우</th>
					<th>영화 감독</th>
					<th>영화 타임</th>
					<th>연령 제한</th>
					<th>개봉일</th>
					<th>제작 국가</th>
					<th>삭제</th>
					<th>상세폼 수정</th>
				</tr>
				<c:forEach items="${list}" var="list">
					<tr>
						<td>${list.seq}
						<td id=mod${list.movienameforkr}${list.seq}>${list.movienameforkr}</td>
						<td id=mod${list.movienameforeng}${list.seq}>${list.movienameforeng}</td>
						<td id=mod${list.moviegenre}${list.seq}>${list.moviegenre}</td>
						<td id=mod${list.movieactor}${list.movienameforkr}>${list.movieactor}</td>
						<td id=mod${list.moviemaker}${list.seq}>${list.moviemaker}</td>
						<td id=mod${list.movierunningtime}${list.seq}>${list.movierunningtime}</td>
						<td id=mod${list.movieagelimit}${list.seq}>${list.movieagelimit}</td>
						<td id=mod${list.moviedate}${list.seq}>${list.moviedate}</td>
						<td id=mod${list.moviemakecountry}${list.seq}>${list.moviemakecountry}</td>
						
						<!-- 위쪽은 수정 리스트 불러오는것             밑에는 수정눌렀을경우의 텍스트 방식 바꾸기-->
						<td>
							<input type=button value=삭제 id=deletemovie${list.seq}></td>
						<td><input type=button value="상세폼 수정" id=modifyform${list.seq}></td>
						<script>
							
						
					
				 function makefunc(targetpage){
	        		   return function(){
	       		       	 $("#movepage").attr("action", targetpage);
	       		     	   $("#movepage").submit();
	           			};
		   			};
					$("#modifyform${list.seq}").click(makefunc("modifymovieform.do?seq=${list.seq}&pg=${pg}"));
					$("#deletemovie${list.seq}").click(function() {
						if (confirm("정말로 삭제하시겠습니까?")) {
							location.href = "deletemovie.do?number=${list.seq}&pg=${pg}";
						} else {
							alert("취소하셨습니다");
							location.href = "adminmovieList.do?pg=${pg}"
						}
					})   
							
					</script>
						
					</tr>
				</c:forEach>
			</table>
		<jsp:include page="../admininclude/adminbottom.jsp" />
</form>
</body>
</html>
<div id=paging>
${moviePaging.pagingHTML}
</div>