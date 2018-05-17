<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
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
#tableform textarea{
	resize: none;
}
</style>

<form id=movepage method="post">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript"> 
</script>
	<jsp:include page="../admininclude/admintop.jsp" />

			<table border=1 id=tableform>
				<c:if test="${list.size() eq 0}">
				<tr>
					<td colspan=8><textarea rows="5" cols="80" readonly="readonly" style="resize: none;">표시할 항목 없음</textarea>
				</tr>
				</c:if>
				<c:forEach items="${list}" var="list">
				<tr>
					<th>imageslider1</th>
					<th>imageslider2</th>
					<th>imageslider3</th>
					<th>imageslider4</th>
					<th>imageslider5</th>
					<th>imageslider6</th>
					<th>imageslider7</th>
					<th>imageslider8</th>
				</tr>
					<tr>
						<td id=imageslider1>${list.imageslider1}</td>
						<td id=imageslider2>${list.imageslider2}</td>
						<td id=imageslider3>${list.imageslider3}</td>
						<td id=imageslider4>${list.imageslider4}</td>
						<td id=imageslider5>${list.imageslider5}</td>
						<td id=imageslider6>${list.imageslider6}</td>
						<td id=imageslider7>${list.imageslider7}</td>
						<td id=imageslider8>${list.imageslider8}</td>
						</tr>
						<tr>
							<th>trailerMovie</th>
							<th>trailerMoviePoster</th>
							<th>event1</th>
							<th>event2</th>
							<th>event3</th>
							<th>event4</th>
							<th colspan=2>수정및 삭제
						</tr>
						<tr>
						<td id=trailermovie>${list.trailermovie}</td>
						<td id=trailermovieposter>${list.trailermovieposter}</td>
						<td id=event1>${list.event1}</td>
						<td id=event2>${list.event2}</td>
						<td id=event3>${list.event3}</td>
						<td id=event4>${list.event4}</td>
						<!-- 위쪽은 수정 리스트 불러오는것             밑에는 수정눌렀을경우의 텍스트 방식 바꾸기-->
						<td colspan=2><input type=button value=수정완료 id=fixcategory>
							<input type=button value=수정취소 id=fixtocancle>
							<input type=button value=수정 id=modify>
							<input type=button value=삭제 id=deletecategory></td>
						
						
					</tr>
				<tr>
					<th colspan=7>공지사항 1</th>
					<th>날짜</th>
				</tr>
				<tr>
					<td colspan=7 id=notice1>${list.notice1}</td>
					<td id=notice1date>${list.notice1date}</td>
				</tr>
				<tr>
					<th colspan=7>공지사항 2</th>
					<th>날짜</th>
				</tr>
				<tr>
					<td colspan=7 id=notice2>${list.notice2}</td>
					<td id=notice2date>${list.notice2date}</td>
				</tr>
				<tr>
					<th colspan=7>공지사항 3</th>
					<th>날짜</th>
				</tr>
				<tr>
					<td colspan=7 id=notice3>${list.notice3}</td>
					<td id=notice3date>${list.notice3date}</td>
				</tr>
				<tr>	
					<th colspan=7>공지사항 4</th>
					<th>날짜</th>
				</tr>
				<tr>
					<td colspan=7 id=notice4>${list.notice4}</td>
					<td id=notice4date>${list.notice4date}</td>
				</tr>
				<tr>
					<th colspan=7>공지사항 5</th>
					<th>날짜</th>
				</tr>
				<tr>
					<td colspan=7 id=notice5>${list.notice5}</td>
					<td id=notice5date>${list.notice5date}</td>
				</tr>
				<tr>	
					<th colspan=7>공지사항 6</th>
					<th>날짜</th>
				</tr>
				<tr>
					<td colspan=7 id=notice6>${list.notice6}</td>
					<td id=notice6date>${list.notice6date}</td>
				</tr>
						<!-- 위쪽은 수정 리스트 불러오는것             밑에는 수정눌렀을경우의 텍스트 방식 바꾸기-->
						<!-- <td><input type=button value=수정완료 id=fixcategory>
							<input type=button value=수정취소 id=fixtocancle>
							<input type=button value=수정 id=modify>
							<input type=button value=삭제 id=deletecategory></td> -->
						<script>
						$("#fixcategory").hide();
						$("#fixtocancle").hide();
						$("#modify").click(function(){
							$("#imageslider1").html("<input type=text value=${list.imageslider1} name=imageslider1>");
							$("#imageslider2").html("<input type=text value=${list.imageslider2} name=imageslider2>");
							$("#imageslider3").html("<input type=text value=${list.imageslider3} name=imageslider3>");
							$("#imageslider4").html("<input type=text value=${list.imageslider4} name=imageslider4>");
							$("#imageslider5").html("<input type=text value=${list.imageslider5} name=imageslider5>");
							$("#imageslider6").html("<input type=text value=${list.imageslider6} name=imageslider6>");
							$("#imageslider7").html("<input type=text value=${list.imageslider7} name=imageslider7>");
							$("#imageslider8").html("<input type=text value=${list.imageslider8} name=imageslider8>");
							$("#trailermovie").html("<input type=text value=${list.trailermovie} name=trailermovie>");
							$("#trailermovieposter").html("<input type=text value=${list.trailermovieposter} name=trailermovieposter>");
							$("#event1").html("<input type=text value=${list.event1} name=event1>");
							$("#event2").html("<input type=text value=${list.event2} name=event2>");
							$("#event3").html("<input type=text value=${list.event3} name=event3>");
							$("#event4").html("<input type=text value=${list.event4} name=event4>");
							$("#notice1").html("<textarea rows='2' cols='55' name=notice1 </textarea>${list.notice1}");
							$("#notice2").html("<textarea rows='2' cols='55' name=notice2 </textarea>${list.notice2}");
							$("#notice3").html("<textarea rows='2' cols='55' name=notice3 </textarea>${list.notice3}");
							$("#notice4").html("<textarea rows='2' cols='55' name=notice4 </textarea>${list.notice4} ");
							$("#notice5").html("<textarea rows='2' cols='55' name=notice5 </textarea>${list.notice5}");
							$("#notice6").html("<textarea rows='2' cols='55' name=notice6 </textarea>${list.notice6} ");
							$("#notice1date").html("<input type=text value=${list.notice1date} name=notice1date>");
							$("#notice2date").html("<input type=text value=${list.notice2date} name=notice2date>");
							$("#notice3date").html("<input type=text value=${list.notice3date} name=notice3date>");
							$("#notice4date").html("<input type=text value=${list.notice4date} name=notice4date>");
							$("#notice5date").html("<input type=text value=${list.notice5date} name=notice5date>");
							$("#notice6date").html("<input type=text value=${list.notice6date} name=notice6date>");
							
							$("#fixcategory").show();
							$("#fixtocancle").show();
							$("#modify").hide();
							$("#deletecategory").hide();
						});
						$("#fixtocancle").click(function(){
							$("#imageslider1").html("${list.imageslider1}");
							$("#imageslider2").html("${list.imageslider2}");
							$("#imageslider3").html("${list.imageslider3}");
							$("#imageslider4").html("${list.imageslider4}");
							$("#imageslider5").html("${list.imageslider5}");
							$("#imageslider6").html("${list.imageslider6}");
							$("#imageslider7").html("${list.imageslider7}");
							$("#imageslider8").html("${list.imageslider8}");
							$("#trailermovie").html("${list.trailermovie}");
							$("#trailermovieposter").html("${list.trailermovieposter}");
							$("#event1").html("${list.event1}");
							$("#event2").html("${list.event2}");
							$("#event3").html("${list.event3}");
							$("#event4").html("${list.event4}");
							$("#notice1").html("${list.notice1}");
							$("#notice1date").html("${list.notice1date}");
							$("#notice2").html("${list.notice2}");
							$("#notice2date").html("${list.notice2date}");
							$("#notice3").html("${list.notice3}");
							$("#notice3date").html("${list.notice3date}");
							$("#notice4").html("${list.notice4}");
							$("#notice4date").html("${list.notice4date}");
							$("#notice5").html("${list.notice5}");
							$("#notice5date").html("${list.notice5date}");
							$("#notice6").html("${list.notice6}");
							$("#notice6date").html("${list.notice6date}");
							$("#fixcategory").hide();
							$("#fixtocancle").hide();
							$("#modify").show();
							$("#deletecategory").show();
					    });
					
				
			 function makefunc(targetpage){
        		   return function(){
       		       	 $("#movepage").attr("action", targetpage);
       		     	   $("#movepage").submit();
           			};
	   			};
				$("#fixcategory").click(makefunc("fixmaincategory.do?seq=${list.seq}"));
				$("#deletecategory").click(function() {
					if (confirm("정말로 삭제하시겠습니까?")) {
						location.href = "deletemaincategory.do?number=${list.seq}";
					} else {
						alert("취소하셨습니다");
						location.href = "maincategorylist.do"
					}
				});
				</script>
			</tr>
				</c:forEach>
			</table>
		<jsp:include page="../admininclude/adminbottom.jsp" />
</form>
</body>
</html>