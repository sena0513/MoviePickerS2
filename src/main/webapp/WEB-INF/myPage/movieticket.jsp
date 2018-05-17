<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link
	href="<c:url value="../res/css/myPage/havingMovieTicketForm.css" />"
	rel="stylesheet">
<!-- // jQuery UI CSS파일  -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<!-- // jQuery 기본 js파일 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<!-- // jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">

$(function(){
   $("#startdate").datepicker({
     //showOn: "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
     /* buttonImage: "/application/db/jquery/images/calendar.gif", // 버튼 이미지 */
     /* buttonImageOnly: true, // 버튼에 있는 이미지만 표시한다. */
     //buttonText:'시작일',
     changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
     changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
     minDate: '-10y', // 현재날짜로부터 100년이전까지 년을 표시한다.
     nextText: '다음 달', // next 아이콘의 툴팁.
     prevText: '이전 달', // prev 아이콘의 툴팁.
     numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
     //stepMonths: 3, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
     yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
     showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 
     currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
     closeText: '닫기',  // 닫기 버튼 패널
     dateFormat: "yy/mm/dd", // 텍스트 필드에 입력되는 날짜 형식.
     showAnim: "slide", //애니메이션을 적용한다.
     showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
     dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
     monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식.              
    });
});

$(function(){
   $("#enddate").datepicker({
     //showOn: "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
     /* buttonImage: "/application/db/jquery/images/calendar.gif", // 버튼 이미지 */
     /* buttonImageOnly: true, // 버튼에 있는 이미지만 표시한다. */
     //buttonText:'종료일',
     changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
     changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
     minDate: '-10y', // 현재날짜로부터 100년이전까지 년을 표시한다.
     nextText: '다음 달', // next 아이콘의 툴팁.
     prevText: '이전 달', // prev 아이콘의 툴팁.
     numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
     //stepMonths: 3, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
     yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
     showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 
     currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
     closeText: '닫기',  // 닫기 버튼 패널
     dateFormat: "yy/mm/dd", // 텍스트 필드에 입력되는 날짜 형식.
     showAnim: "slide", //애니메이션을 적용한다.
     showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
     dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
     monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식.              
    });
    var date = new Date();
    $("#btn1").click(function(){ //1개월
       var val =date.getFullYear()+"-"+leadingZeros(date.getMonth()+1,2)+"-"+leadingZeros(date.getDate(),2);
       $("#enddate").val(val);
       var val2 =date.getFullYear()+"-"+leadingZeros(date.getMonth(),2)+"-"+leadingZeros(date.getDate(),2);
       $("#startdate").val(val2);
    });
    $("#btn2").click(function(){ //2주일
       var val =date.getFullYear()+"-"+leadingZeros(date.getMonth()+1,2)+"-"+leadingZeros(date.getDate(),2);
       $("#enddate").val(val);
       var val2 =date.getFullYear()+"-"+leadingZeros(date.getMonth()+1,2)+"-"+leadingZeros(date.getDate()-14,2);
       $("#startdate").val(val2);
    });
    $("#btn3").click(function(){ //3개월
       var val =date.getFullYear()+"-"+leadingZeros(date.getMonth()+1,2)+"-"+leadingZeros(date.getDate(),2);
       $("#enddate").val(val);
       var val2 =date.getFullYear()+"-"+leadingZeros(date.getMonth()-1,2)+"-"+leadingZeros(date.getDate(),2);
       $("#startdate").val(val2);
    });
    function leadingZeros(n, digits) {
        var zero = '';
        n = n.toString();

        if (n.length < digits) {
          for (i = 0; i < digits - n.length; i++)
            zero += '0';
        }
        return zero + n;
      }
});
$(document).ready(function(){
    var date = new Date();
    var val =date.getFullYear()+"/"+leadingZeros(date.getMonth()+1,2)+"/"+leadingZeros(date.getDate(),2);
    $("#enddate").val(val);
    $("#startdate").val(val);
    
   
    function leadingZeros(n, digits) {
        var zero = '';
        n = n.toString();

        if (n.length < digits) {
          for (i = 0; i < digits - n.length; i++)
            zero += '0';
        }
        return zero + n;
      }
    
    $('#search').click(function() {
       $('.havingMovieTicketContents').empty();
       $.ajax({
            type : "POST",
            url : "/mvProject/mypage/couponusedhistory.do",
            data :{"startdate" : $('#startdate').attr('value'),
                  "enddate" : $('#enddate').attr('value')},
            dataType : "json",
            success : function(list) {
               if(list.list.length > 0){
                  $.each(list.list,function(index, items){
                  $('.havingMovieTicketContents').append(
                        "<div class='firstTicketNumber'>무료관람권</div>"+
                           "<div class='firstTicketGroup'>"+items.ticketmovieBranch+"</div>"+
                           "<div class='firstTicketExpirationDate'>"+items.couponUsedDate+"</div>"+
                           "<div class='firstTicketExplanation'>"+items.couponUsed+"장</div>");
                  });
                  }else{
                  $(".resultcoupon").append("<tr><td><strong>사용 내역이 없습니다</strong></td></tr>");
               }
               /* $.each(data.regionInfo, function(index, item) {
                  
               } */
            }
         });
    });
});
</script>

<!-- 바디를 전체감싸고있는 Wrapper -->

<div id="bodyWrapper">
	<!-- 네비부분 -->
	<div class="myPointIndexNavi">
		<div class="myPointMenuDiv">
			<div class="myPointMenuImageDiv">
				<a href="/mvProject/main/index.do"> <img
					src="../res/image/main/homeImage.png">
				</a>
			</div>

			<div class="myPointNaviSecondDiv">
				<a href="/mvProject/myPage/index.do">> My Page</a>
			</div>

			<div class="myPointIndexNaviThirdDiv">
				<a href="/mvProject/myPage/movieticket.do">> My ticket</a>
			</div>

			<div class="myPointIndexNaviFourthDiv">
				<a >> 영화관람권 사용내역</a>
			</div>
		</div>
	</div>

	<!-- 실질적인 컨텐츠부분 -->

	<div class="moviePickerTotalWrapper">

		<div class="myCgvProfileContentsDiv">
			<img src="../res/image/myPage/myCgvProfileRealBackGround.jpg"
				class="myCgvProfileContentsDivImg">
			<div class="myCgvProfileFirstContents">

				<div class="profileImageContents">
					<img src="../res/image/myPage/profileimage.png">
				</div>

				<div class="secondMyCgvProfileRealContents">
					<div class="profileNameDiv">
						<div class="firstNameDiv">
							<h2>${memberDTO.name }님</h2>
						</div>
						<div class="secondNameDiv">
							<h4>${memberDTO.id }</h4>
						</div>
						
					</div>

					<div class="profileGradeDiv">
						<h3>
							고객님은 <span>${memberDTO.grade }</span>입니다.
						</h3>
					</div>

				</div>
			</div>

			<div class="myCgvProfileSecondContents">
				<div class="myCgvCouponDiv">
					<div class="couponLabelDiv">
						<img src="../res/image/myPage/mycoupon.png">
					</div>

					<div class="couponContentDiv">
						<div class="movieTicketLabel">
							<h4>영화관람권</h4>
						</div>
						<div class="movieTicketCount">${memberDTO.couponNumber }개</div>
					</div>
				</div>
				<div class="myCgvOnePointDiv">
					<div class="onePointLabelDiv">
						<img src="../res/image/myPage/realMyPoint.png">
					</div>

					<div class="onePointContentsDiv">
						<div class="possiblePoint">
							<div class="possiblePointLabel">
								<h4>CJ ONE 사용가능 포인트</h4>
							</div>
							<div class="possiblePointValue">
								<h4>
									<fmt:formatNumber pattern="#,###"
										value="${memberDTO.memberPoint }" />
									점
								</h4>
							</div>
						</div>
						<div class="vipCheckPoint">
							<div class="vipCheckPointLabel">
								<h4>VIP선정 포인트</h4>
							</div>
							<div class="vipCheckPointValue">
								<h4>
									<fmt:formatNumber pattern="#,###"
										value="${memberDTO.gradePoint }" />
									점
								</h4>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

		<!-- leftDiv+centerDiv를 포함하고있는 Wrapper -->
		<div class="bothDivWrapper">

			<!-- leftDiv -->
			<div class="leftDiv">
				<div class="mvHome">
					<span> <a href="/mvProject/myPage/index.do">MY HOME</a>
					</span>
				</div>
				<ul>
					<li class="myReservation"><a href="/mvProject/myPage/myReservationStep1.do">나의 예매내역</a></li>
					<li class="discountCoupon"><a href="/mvProject/myPage/movieticket.do">MY 영화관람권</a></li>
					<li class="mvPoint"><a href="/mvProject/myPage/mypoint.do">MY 포인트</a></li>
					<li class="clientInfo"><a href="/mvProject/myPage/index.do">회원 정보</a>
						<div class="inLineUlDivFirst">
							<ul>
								<li><a href="/mvProject/myPage/myInfoForm.do"> > 개인정보 변경</a></li>
								<li><a href="/mvProject/myPage/myInfoDelete.do"> > 회원탈퇴</a></li>
							</ul>
						</div></li>
					<li class="myInquiryList"><a
						href="/mvProject/myPage/myInquiryQnAList.do">나의 문의 내역</a></li>
					<li class="watchMovieList"><a href="/mvProject/myPage/myMovielog.do">내가 본 영화</a></li>
				</ul>
			</div>


			<!-- centerDiv -->
			<div class="centerDiv">
				<div class="havingMovieTicketLabel">
					<h2>MoviePicker 영화관람권</h2>
				</div>

				<div class="havingMovieTicketInfo">
					<span> MoviePicker 영화관람권 사용 내역</span>
				</div>

				<div class="havingMovieTicketContentsWrapper">

					<div class="inquiryTerm">

						<div class="inquiryTermLabel">
							<h3>조회기간</h3>
						</div>

						<div class="inquiryTermWrapper">
							<div class="inquiryTermPeriod">
								<div class="twoWeeksWrapper">
									<input type="button" value="2주일" id=btn2 class="twoWeeksButton">
								</div>

								<div class="monthWrapper">
									<input type="button" value="1개월" id=btn1 class="oneMonthButton">
								</div>

								<div class="threeMonthsWrapper">
									<input type="button" value="3개월" id=btn3
										class="threeMonthsButton">
								</div>
							</div>

							<div class="inquiryTermContents">
								<div class="startTextDiv">
									<input type="text" id=startdate name="startText" value="">
								</div>

								<div class="startButtonDiv">
									<input type="button" name="startButton" value="시작일">
								</div>

								<div class="endTextDiv">
									<input type="text" id=enddate name="endText" value="">
								</div>

								<div class="endButtonDiv">
									<input type="button" name="endButton" value="종료일">
								</div>

								<div class="searchButtonDiv">
									<input type="button" id="search" value="조회하기">
								</div>
							</div>
						</div>

					</div>


					<div class="havingMovieTicketContentsLabel">
						<div class="havingMovieTicketNumber">
							<h4>관람권 이름</h4>
						</div>

						<div class="havingMovieTicketGroup">
							<h4>사용 지점</h4>
						</div>

						<div class="havingMovieTicketExpirationDate">
							<h4>사용일</h4>
						</div>

						<div class="havingMovieTicketExplanation">
							<h4>사용매수</h4>
						</div>
					</div>

					<div class="havingMovieTicketContents"></div>
				</div>
			</div>
		</div>
	</div>
</div>
