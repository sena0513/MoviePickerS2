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
</style>

<form id=movepage method="post">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript"> 
</script>
	<jsp:include page="../admininclude/admintop.jsp" />

			<table border=1 id=tableform>
            <tr>
               <th style="width:150px">상영중인 영화</th>
               <th>상영관 지역</th>
               <th>상영관 구역</th>
               <th>상영관</th>
               <th style="width:100px">상영 날짜</th>
               <th>상영 시간</th>
               <th>연령 제한</th>
               <th>수정</th>
            </tr>
            <c:if test="${list.size() eq 0}">
            <tr>
               <td colspan=8><textarea rows="5" cols="80" readonly="readonly" style="resize: none;">표시할 항목 없음</textarea>
            </tr>
            </c:if>
            <c:forEach items="${list}" var="list" varStatus="sequence">
               <tr>
                  <td id=playingMovie${sequence.index}>${list.playingMovie}</td>
                  <td id=theaterRegion${sequence.index}>${list.theaterRegion}</td>
                  <td id=theaterBranch${sequence.index}>${list.theaterBranch}</td>
                  <td id=theaterScreen${sequence.index}>${list.theaterScreen}</td>
                  <td id=theaterDate${sequence.index}>${list.theaterDate}</td>
                  <td id=theaterTime${sequence.index}>${list.theaterTime}</td>
                  <td id=theaterMovieGrade${sequence.index}>${list.theaterMovieGrade}</td>
                  <td>
                     <input type=button value=수정완료 id=fixschedule${sequence.index}>
                     <input type=button value=수정취소 id=fixtocancle${sequence.index}>
                     <input type=button value=수정 id=modify${sequence.index}>
                  </td>
               </tr>
                  <script> 
                  $("#fixschedule${sequence.index}").hide();
                  $("#fixtocancle${sequence.index}").hide();
                  $("#modify${sequence.index}").click(function(){
                     $("#playingMovie${sequence.index}").html("<input type=text value='${list.playingMovie}' name=playingMovie>");
                     $("#theaterRegion${sequence.index}").html("<input type=text value='${list.theaterRegion}' name=theaterRegion>");
                     $("#theaterBranch${sequence.index}").html("<input type=text value='${list.theaterBranch}' name=theaterBranch>");
                     $("#theaterScreen${sequence.index}").html("<input type=text value='${list.theaterScreen}' name=theaterScreen>");
                     $("#theaterDate${sequence.index}").html("<input type=text value='${list.theaterDate}' name=theaterDate>");
                     $("#theaterTime${sequence.index}").html("<input type=text value='${list.theaterTime}' name=theaterTime>");
                     $("#theaterMovieGrade${sequence.index}").html("<input type=text value=${list.theaterMovieGrade} name=theaterMovieGrade>");
                     $("#fixschedule${sequence.index}").show();
                     $("#fixtocancle${sequence.index}").show();
                     $("#modify${sequence.index}").hide();
                     $("#deleteschedule${sequence.index}").hide();
                  });
                  $("#fixtocancle${sequence.index}").click(function(){
                     $("#playingMovie${sequence.index}").html("${list.playingMovie}");
                     $("#theaterRegion${sequence.index}").html("${list.theaterRegion}");
                     $("#theaterBranch${sequence.index}").html("${list.theaterBranch}");
                     $("#theaterScreen${sequence.index}").html("${list.theaterScreen}");
                     $("#theaterDate${sequence.index}").html("${list.theaterDate}");
                     $("#theaterTime${sequence.index}").html("${list.theaterTime}");
                     $("#theaterMovieGrade${sequence.index}").html("${list.theaterMovieGrade}");
                     $("#fixschedule${sequence.index}").hide();
                     $("#fixtocancle${sequence.index}").hide();
                     $("#modify${sequence.index}").show();
                     $("#deleteschedule${sequence.index}").show();
                   });
               
            
          function makefunc(targetpage){
                 return function(){
                        $("#movepage").attr("action", targetpage);
                        $("#movepage").submit();
                    };
               };
            $("#fixschedule${sequence.index}").click(makefunc("fixschedule.do?seq=${list.seq}"));
            </script>
            </c:forEach>
            <tr>
               <td colspan="8"><input type=text placeholder="삭제할 날짜 입력 ex) xxxx-xx-xx" id=deleteDate style="width:200px;">
               <input type=button value=삭제 id=deletebtn></td>
            </tr>
            <script>
               $("#deletebtn").click(function() {
                  if (confirm("정말로 삭제하시겠습니까?")) {
                     location.href="deleteschedule.do?deleteDate="+$('#deleteDate').val()
                  } else {
                     alert("취소하셨습니다");
                     location.href = "maincategorylist.do"
                  }
               });
            </script>
         </table>
		<jsp:include page="../admininclude/adminbottom.jsp" />
</form>
</body>
</html>