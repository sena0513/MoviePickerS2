<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/adminstyle.css">
<style>
#tableform{
	width: 1100px;
}
#tableform1{
	float: left;
}
#tableform2{
	float: left;
}
</style>
<c:if test="${result.length() > 0}">
<script>
	alert("${result}");
</script>
</c:if>
<form action="/mvProject/adminmoviecategory/maincategoryregit.do" method="post">
	<jsp:include page="../admininclude/admintop.jsp" />
	<div id=tableform>
	<table border=1 id=tableform1>
		<tr>
			<td>이미지 슬라이더 1</td>
			<td><input type=text placeholder="imageslider1.png" name=imageslider1></td>
		</tr>
		<tr>
			<td>이미지 슬라이더 2</td>
			<td><input type=text placeholder="imageslider1.png" name=imageslider2></td>
		</tr>
		<tr>
			<td>이미지 슬라이더 3</td>
			<td><input type=text placeholder="imageslider1.png" name=imageslider3></td>
		</tr>
		<tr>
			<td>이미지 슬라이더 4</td>
			<td><input type=text placeholder="imageslider1.png" name=imageslider4></td>
		</tr>
		<tr>
			<td>이미지 슬라이더 5</td>
			<td><input type=text placeholder="imageslider1.png" name=imageslider5></td>
		</tr>
		<tr>
			<td>이미지 슬라이더 6</td>
			<td><input type=text placeholder="imageslider1.png" name=imageslider6></td>
		</tr>
		<tr>
			<td>이미지 슬라이더 7</td>
			<td><input type=text placeholder="imageslider1.png" name=imageslider7></td>
		</tr>
		<tr>
			<td>이미지 슬라이더 8</td>
			<td><input type=text placeholder="imageslider1.png" name=imageslider8></td>
		</tr>
		<tr>
			<td>trailerMovie (video-mp4)</td>
			<td><input type="text" placeholder="trailerMovie.mp4 (video-mp4)"
				name="trailermovie"></td>
		</tr>
		<tr>
			<td>trailerMoviePoster (img)</td>										
			<td><input type="text" placeholder="trailerMoviePoster.png (img)" name="trailermovieposter"></td>
		</tr>
		<tr>
			<td>event1(img)</td>
			<td><input type="text" placeholder="event1.png" name="event1"></td>
		</tr>
		<tr>
			<td>event2(img)</td>
			<td><input type="text" placeholder="event1.png"
				name="event2"></td>
		</tr>
		<tr>
			<td>event3(img)</td>
			<td><input type="text" placeholder="event1.png"
				name="event3"></td>
		</tr>
		<tr>
			<td>event4(img)</td>
			<td><input type="text" placeholder="event1.png"
				name="event4"></td>
		</tr>
		
	</table>
	<table id=tableform2>
		<tr>
			<td>공지사항 1,날짜등록
			<td><input type=text placeholder="공지사항 등록" name=notice1>
			<td><input type=text placeholder="날짜등록" name=notice1date>
		</tr>
		<tr>
			<td>공지사항 2,날짜등록
			<td><input type=text placeholder="공지사항 등록" name=notice2>
			<td><input type=text placeholder="날짜등록" name=notice2date>
		</tr>
		<tr>
			<td>공지사항 3,날짜등록
			<td><input type=text placeholder="공지사항 등록" name=notice3>
			<td><input type=text placeholder="날짜등록" name=notice3date>
		</tr>
		<tr>
			<td>공지사항 4,날짜등록
			<td><input type=text placeholder="공지사항 등록" name=notice4>
			<td><input type=text placeholder="날짜등록" name=notice4date>
		</tr>
		<tr>
			<td>공지사항 5,날짜등록
			<td><input type=text placeholder="공지사항 등록" name=notice5>
			<td><input type=text placeholder="날짜등록" name=notice5date>
		</tr>
		<tr>
			<td>공지사항 6,날짜등록
			<td><input type=text placeholder="공지사항 등록" name=notice6>
			<td><input type=text placeholder="날짜등록" name=notice6date>
		</tr>
		<tr>
			<td colspan=3 align=right><input type="submit" value="등록">
			<input type="reset" value="다시 입력">
		</tr>
	</table>
	</div>

	<jsp:include page="../admininclude/adminbottom.jsp" />
</form>