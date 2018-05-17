<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="<c:url value="../res/css/myPage/myPoint.css" />"
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
     /* showOn: "both", */ // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
     /* altField: "#startdate", */
     /* buttonImage: "/application/db/jquery/images/calendar.gif", // 버튼 이미지 */
     /* buttonImageOnly: true, // 버튼에 있는 이미지만 표시한다. */    
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
    /*  showOn: "both",  */// 버튼과 텍스트 필드 모두 캘린더를 보여준다.
     /* buttonImage: "/application/db/jquery/images/calendar.gif", // 버튼 이미지 */
     /* buttonImageOnly: true, // 버튼에 있는 이미지만 표시한다. */
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
       var val =date.getFullYear()+"/"+leadingZeros(date.getMonth()+1,2)+"/"+leadingZeros(date.getDate(),2);
       $("#enddate").val(val);
       var val2 =date.getFullYear()+"/"+leadingZeros(date.getMonth(),2)+"/"+leadingZeros(date.getDate()-3,2);
       $("#startdate").val(val2);
    });
    $("#btn2").click(function(){ //2주일
       var val =date.getFullYear()+"/"+leadingZeros(date.getMonth()+1,2)+"/"+leadingZeros(date.getDate(),2);
       $("#enddate").val(val);
       var val2 =date.getFullYear()+"/"+leadingZeros(date.getMonth()+1,2)+"/"+leadingZeros(date.getDate()-14,2);
       $("#startdate").val(val2);
    });
    $("#btn3").click(function(){ //3개월
       var val =date.getFullYear()+"/"+leadingZeros(date.getMonth()+1,2)+"/"+leadingZeros(date.getDate(),2);
       $("#enddate").val(val);
       var val2 =date.getFullYear()+"/"+leadingZeros(date.getMonth()-1,2)+"/"+leadingZeros(date.getDate()-3,2);
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
    
    $('#searchbtn').click(function() {
       $('.buySectorFirstContents').empty();/* 
         alert($("#startdate").attr('value')) */
       $.ajax({
            type : "POST",
            url : "/mvProject/mypage/pointusedhistory.do",
            data :{"startdate" : $('#startdate').attr('value'),
                  "enddate" : $('#enddate').attr('value')},
            dataType : "json",
            success : function(list) {/* 
               alert(JSON.stringify(list)); */
               if(list.list.length > 0){
                  $.each(list.list,function(index, items){ 
                  $('.buySectorFirstContents').append("<div class='firstBuy'>매표사용</div>"+
                           "<div class='firstRegion'>"+items.ticketmovieBranch+"</div>"+
                           "<div class='firstDate'>"+items.pointUsedDate+"</div>"+
                           "<div class='firstPoint'>"+items.pointUsed+"</div>");
                  });
               }else{
                  $(".buySectorFirstContents").append("<tr><td><strong>사용 내역이 없습니다</strong></td></tr>");
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
				<a href="/mvProject/myPage/mypoint.do">> My Point</a>
			</div>

			<div class="myPointIndexNaviFourthDiv">
				<a href="/mvProject/myPage/mypoint.do">> 포인트 적립/사용내역</a>
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
				<div class="myPointLabel">
					<h2>MY 포인트</h2>
				</div>

				<div class="myPointInfo">
					<span> 마이페이지 이용/ 마이포인트 적립 및 사용내역 </span>
				</div>

				<div class="possibleMyPointWrapper">

					<div class="possibleMyPointLabel">
						<div class="possibleMyPointSection">
							<h4>구분</h4>
						</div>
						<div class="possibleMyPointContents">
							<h4>내용</h4>
						</div>
					</div>

					<div class="possibleMyPoint">
						<div class="possibleMyPointFirstLabel">
							<h5>사용 가능한 마이포인트</h5>
						</div>
						<div class="possibleMyPointFirstContents">
							<h5>${memberDTO.memberPoint }점</h5>
						</div>
					</div>

					<div class="choiceVipPoint">
						<div class="choiceVipPointFirstLabel">
							<h5>VIP 선정 포인트</h5>
						</div>
						<div class="choiceVipPointFirstContents">
							<h5><fmt:formatNumber pattern="#,###" value="${memberDTO.gradePoint }"/>점</h5>
						</div>
					</div>
				</div>

				<div class="adviceMyPoint">
					<div class="firstAdvice">
						<p>※ MoviePicker VIP 선정은 이벤트 포인트를 제외한 매표/매점/구매 포인트 합산 기준으로
							적용됩니다.</p>
					</div>
					<div class="secondAdvice">
						<p>※ 매표/매점 구매 누적 포인트는 관람 후 2-3일 후에 반영됩니다.</p>
					</div>
					<div class="thirdAdvice">
						<p>※ 포인트 조회 시 표시되는 적립일은 VIP 선정기준 적립일이며 MoviePicker 가용일자와 상이할 수
							있습니다.</p>
					</div>
				</div>

				<div class="inquiryTerm">

					<div class="inquiryTermLabel">
						<h3>조회기간</h3>
					</div>

					<div class="inquiryTermWrapper">
						<div class="inquiryTermPeriod">
							<div class="twoWeeksWrapper">
								<input type="button" id=btn2 value="2주일" class="twoWeeksButton">
							</div>

							<div class="monthWrapper">
								<input type="button" id=btn1 value="1개월" class="oneMonthButton">
							</div>

							<div class="threeMonthsWrapper">
								<input type="button" id=btn3 value="3개월"
									class="threeMonthsButton">
							</div>
						</div>

						<div class="inquiryTermContents">
							<div class="startTextDiv">
								<input type="text" id="startdate" value="" readonly="readonly">
							</div>

							<div class="startButtonDiv">
								<input type="button" id="startdatebtn" name="startButton"
									value="시작일">
							</div>

							<div class="endTextDiv">
								<input type="text" id="enddate" value="" readonly="readonly">
							</div>

							<div class="endButtonDiv">
								<input type="button" name="endButton" value="종료일">
							</div>

							<div class="searchButtonDiv">
								<input type="button" id="searchbtn" value="조회하기">
							</div>
						</div>
					</div>

				</div>

				<div class="buySectorWrapper">

					<div class="buySectorLabel">
						<div class="buySector">
							<h4>구매 구분</h4>
						</div>

						<div class="buyTheather">
							<h4>구매 극장</h4>
						</div>

						<div class="savePointDate">
							<h4>적립일</h4>
						</div>

						<div class="savePoint">
							<h4>적립</h4>
						</div>
					</div>

					<div class="buySectorFirstContents">
						<!-- <div class="firstBuy">매표사용</div>
                  <div class="firstRegion">성신여대입구역점</div>
                  <div class="firstDate">2018.03.28</div>
                  <div class="firstPoint">150000점</div> -->
					</div>

				</div>
			</div>
		</div>
	</div>
</div>
