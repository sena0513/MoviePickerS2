<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link href="<c:url value="../res/css/movies/movieWriteGrade.css" />"
	rel="stylesheet">
	
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
		

<div id="bodyWrapper">
	<div class="writeGradeDiv">
	<form action="/mvProject/movieDetail/reviewWrite.do" id=reviewregit method="post">
		<div class="writeGradeSubjectDiv">
			<h2>평점작성</h2>
		</div>

		<div class="writeGradeMovieNameDiv">
			<h2>${Movienameforkr}</h2>
			<input type="hidden" id=Movienameforkr name="Movienameforkr" value="${Movienameforkr }">
			<input type="hidden" id=mv_seq name="mv_seq" value="${mv_seq}">
			<input type="hidden" id=page name="page" value="${page}">
		</div>

		<div class="realtimeAudienceDiv">
			<div class="realtimeAudienceFirstDiv">
				<button class="realtimeAudienceFirstButton" id=goodbtn onclick="button1_click()" type="button">
					<img src="../res/image/movieWrite/leftDiv.PNG">
				</button>
				<div id=GoodAndBedBtn>
					
				</div>
			</div>
			
			<div class="realtimeAudienceSecondDiv">
				<img src="../res/image/movieWrite/center.PNG">
			</div>
			<div class="realtimeAudienceThirdDiv">
				<button class="realtimeAudienceThirdButton" id=bedbtn onclick="button2_click();" type="button">
					<img src="../res/image/movieWrite/rightDiv.PNG">
					
				</button>
			</div>
		</div>

		<div class="showMessageDiv">
			<div class="inputShowMessageDiv">
				
				<textarea id=reviewcontents name="reviewcontents"  cols="97" rows="5"
					onKeyUp="javascript:fnChkByte(this,'140')"
					placeholder="운영원칙에 어긋나는 게시물로 판단되는 글은 제재 조치를 받을 수 있습니다."></textarea>
			</div>

			<div class="inputShowMessageConfirmDiv">
				<div class="inputShowMessageConfirmButtonDiv">
					<div class="inputWordRestrict">
						<span id="byteInfo">0</span>/140Byte
					</div>
					<div class="confirmButtonDiv">
						<input type="button" value="작성완료"
							class="inputShowMessageConfirmButton"
							onclick="javascript:reviewSubmit()">
					</div>
				</div>

			</div>
		</div>
		</form>
	</div>
</div>

<script>
function fnChkByte(obj, maxByte){
	var str = obj.value;
	var str_len = str.length;

	var rbyte = 0;
	var rlen = 0;
	var one_char = "";
	var str2 = "";

	for(var i=0; i<str_len; i++){
	one_char = str.charAt(i);
	if(escape(one_char).length > 4){
	    rbyte += 2;                                         //한글2Byte
	}else{
	    rbyte++;                                            //영문 등 나머지 1Byte
	}

	if(rbyte <= maxByte){
	    rlen = i+1;                                          //return할 문자열 갯수
	}
	}

	if(rbyte > maxByte){
	    alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
	    str2 = str.substr(0,rlen);                                  //문자열 자르기
	    obj.value = str2;
	    fnChkByte(obj, maxByte);
	}else{
	    document.getElementById('byteInfo').innerText = rbyte;
	}
	}
	
	function button1_click() {
		$('#GoodAndBedBtn').empty();
		$('#GoodAndBedBtn').append("<input type='hidden' value='100' id='reviewpoint' name='reviewpoint'>");
	}
	function button2_click() {
		$('#GoodAndBedBtn').empty();
		$('#GoodAndBedBtn').append("<input type='hidden' value='0' id='reviewpoint' name='reviewpoint'>");
	}
	
	function reviewSubmit(){
		var seq = $('mv_seq').attr('value');
		if($('#reviewcontents').attr('value') == ""){
			$('#reviewcontents').focus();
			return false;
		}else{
			$.ajax({
		        type : "GET",
		        url : "/mvProject/movieDetail/reviewWrite.do",
		        data :{"movienameforkr" : $('#Movienameforkr').attr('value'),
		              "mv_seq" : $('#mv_seq').attr('value'),
		              "reviewcontents" :$('textarea#reviewcontents').val(),
		              "reviewpoint" : $('#reviewpoint').val()},
		        dataType : "json",
		        success : function(result) {/* 
		           alert(JSON.stringify(list)); */
		           if(result.result > 0){
		        	  if (confirm("평가를 남기시겠습니까?")) {
		                     location.href="/mvProject/movieDetail/charmPoint.do?mv_seq="+$('#mv_seq').val()+
		                    		 "&Movienameforkr="+$('#Movienameforkr').val()+
		                    		 "&page="+$('#page').val()
		                  }else {
		                   location.href = "/mvProject/movieDetail/movieDetail.do?seq="+${seq }+"mv_seq="+$('#mv_seq').val()+
		                   				   "&Movienameforkr="+$('#Movienameforkr').val()+
                  						   "&page="+$('#page').val()
		                  }
		           }else{
		        	  location.href="/mvProject/movieDetail/movieDetail.do?seq="+${seq }+"mv_seq="+$('#mv_seq').val()+
              				   "&Movienameforkr="+$('#Movienameforkr').val()+
      						   "&page="+$('#page').val()
		           }
		           /* $.each(data.regionInfo, function(index, item) {
		              
		           } */
		        }
		     });
		}
	}
	
</script>



