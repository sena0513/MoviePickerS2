<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

<link href="<c:url value="../res/css/ticket/ticketPaymentAsk.css" />"
	rel="stylesheet">


<script>
	function CheckBox() {
		if ($("#paymentCheck-checkbox").prop("checked")) {
			$('#ticketInfoConfirmed').submit(); 
		} else {
			alert('약관에 동의해 주세요.');
		}
	}
</script>

<div class="bodyWrapper"> 
 	<!-- Navi부분 -->
		<div class="ticketingNavi">
			<div class="ticketingMenuDiv">
				<div class="ticketingImageDiv">
					<a href="/mvProject/main/index.do"> <img
						src="../res/image/main/homeImage.png">
					</a>
				</div>

				<div class="ticketingSecondDiv">
					<a href="/mvProject/ticket/ticketingStep1.do">> 예매</a>
				</div>

				<div class="ticketingThirdDiv">
					> 빠른예매
				</div>

			</div>
		</div>


<form action="/mvProject/ticket/ticketPaymentComplete.do" method="post"
	id="ticketInfoConfirmed">

	<input type="hidden" id="usedPoint" name="usedPoint" value="${usedPoint}"> 
	<input type="hidden" id="ticketselectMovieSeq" name="ticketselectMovieSeq" value="${ticketselectMovieSeq}">
	
		
	<div class="ticketPaymentAskWrapper">

		<div class="ticketingContents">
			<div class="paymentAskHead">
				<span class="paymentAskHead-text">예매내역 확인</span>
			</div>
			<div class="paymentAskBody">
				<div class="movieAndPaymentConfirmSection">
					<div class="movieConfirmSection">
						<div class="movieConfirmHead">
							<div class="movieConfirmHead-text">
								<span class="movieConfirmHead-text-title">* 예매정보</span> <span
									class="movieConfirmHead-text-info"> 결제하시기 전 예매내역을 다시 한번
									확인해 주세요. </span>
							</div>
						</div>
						<div class="movieConfirmBody">
							<div class="poster">
								<img
									src="../res/image/moviePoster/${ticketmovieposter}">
								<input type="hidden" name="ticketmovieposter" value="${ticketmovieposter}">
							</div>
							<div class="movieInfoWrapper">
								<div class="movieNameWrapper">
									<div class="movieNameLabel">영화명</div>
									<div class="movieName">
										<input type="hidden" name="ticketplayingmovie" value="${ticketplayingmovie}">${ticketplayingmovie}
									</div>
								</div>
								<div class="movieGradeWrapper">
									<div class="movieGradeLabel">관람가</div>
									<div class="movieName">
										<input type="hidden" name="tickettheatermoviegrade" value="${tickettheatermoviegrade}">${tickettheatermoviegrade}
									</div>
								</div>
								<div class="movieBranchWrapper">
									<div class="movieBranchLabel">극장</div>
									<div class="movieBranch">
										<input type="hidden" name="tickettheaterbranch" value="${tickettheaterbranch}">${tickettheaterbranch}
									</div>
								</div>
								<div class="movieScreenWrapper">
									<div class="movieScreenLabel">상영관</div>
									<div class="movieScreen">
										<input type="hidden" name="tickettheaterscreen" value="${tickettheaterscreen}">${tickettheaterscreen}
									</div>
								</div>
								<div class="movieDateWrapper">
									<div class="movieDateLabel">일시</div>
									<div class="movieDate">
										${tickettheaterdate}&nbsp;${tickettheatertime}
										<input type="hidden" name="tickettheaterdate" value="${tickettheaterdate}">
										<input type="hidden" name="tickettheatertime" value="${tickettheatertime}">
									</div>
								</div>
								<div class="moviePeopleWrapper">
									<div class="moviePeopleLabel">인원</div>
									<div class="moviePeople">
										<input type="hidden" name="ticketpeople" value="${ticketpeople}"><strong>${ticketpeople}명</strong>
									</div>
								</div>
								<div class="movieSeatWrapper">
									<div class="movieSeatLabel">좌석</div>
									<div class="movieSeat">
										<span>
										${ticketseats1}&nbsp;${ticketseats2}&nbsp;${ticketseats3}&nbsp;${ticketseats4}&nbsp;${ticketseats5}
										</span> 
										<input type="hidden" id="ticketseats1" name="ticketseats1" value="${ticketseats1}">
										<input type="hidden" id="ticketseats2" name="ticketseats2" value="${ticketseats2}">
										<input type="hidden" id="ticketseats3" name="ticketseats3" value="${ticketseats3}"> 
										<input type="hidden" id="ticketseats4" name="ticketseats4" value="${ticketseats4}">
										<input type="hidden" id="ticketseats5" name="ticketseats5" value="${ticketseats5}">
									</div>

								</div>
							</div>
						</div>
					</div>
					<div class="paymentConfirmSection">
						<div class="paymentConfirmHead">
							<div class="paymentConfirmHead-text">
								<span class="paymentConfirmHead-text-title">* 결제정보</span> <span
									class="paymentConfirmHead-text-info"> 결제하시기 버튼을 클릭하시면
									결제가 완료됩니다. </span>
							</div>
						</div>
						<div class="paymentConfirmBody">
							<div class="paymentConfirmBody-text">
								<div class="moviePriceLabel">결제금액</div>
								<div class="moviePriceWrapper">
									<input type="hidden" name="ticketprice" value="${ticketprice}"><strong>${ticketprice}원</strong>
								</div>
							</div>
						</div>
					</div>
				</div>
			
			<!-- 결제버튼 누르기 전 주의사항 -->
			<div class="paymentInfoSection">
				<div class="paymentInfo">
					<span class="paymentInfo-text"> · 인터넷 예매는 온라인상으로 영화상영 시간 20분
						전 까지 취소 가능하며 이후에는 현장에서 취소를 하셔야 합니다. </span><br> <span
						class="paymentInfo-text"> · 취소는 상영시간 전 까지 하실 수 있으며, 전화로 취소
						요청을 하실 경우 취소가 되지 않습니다. </span><br> <span class="paymentInfo-text">
						· 입장 지연에 따른 관람 불편을 최소화하기 위해 본 영화는 10분 후 상영이 시작됩니다. </span>
				</div>
			</div>


			<!-- 결제버튼 누르기 전 체크박스 -->
			<div class="paymentCheckSection">
				<div class="paymentCheck">
					<input type="checkbox" id="paymentCheck-checkbox"
						name="paymentCheck-checkbox" style="width:17px; height: 17px; float: left;">
						<div class="paymentCheck-text"> 상기 결제 내역을 모두 확인 했습니다 </div>
				</div>
			</div>

			<!-- 결제하기 & 취소 버튼 -->
			<div class="paymentButtonsSection">
				<div class="paymentButtons">
					<img src="../res/image/ticketingImages/paymentFinal_Btn.png" onclick="CheckBox();">
					<img src="../res/image/ticketingImages/cancelButton.png" onclick="backToTicktePay()">
				</div>
			</div>
</div>
		</div>
	</div>
</form>
</div>

<form id="backToTicketpay" action="/mvProject/ticket/ticketPay.do" method='post'>
	<input type="hidden" name="ticketprice" value="${ticketprice}" >
	<input type="hidden" id="ticketmovieposter" name="ticketmovieposter" value="${ticketmovieposter}">
	<input type="hidden" id="ticketplayingmovie" name="ticketplayingmovie" value="${ticketplayingmovie}">
	<input type="hidden" id="tickettheatermoviegrade" name="tickettheatermoviegrade" value="${tickettheatermoviegrade}">
	<input type="hidden" id="tickettheaterbranch" name="tickettheaterbranch" value="${tickettheaterbranch}">
	<input type="hidden" id="tickettheaterdate" name="tickettheaterdate" value="${tickettheaterdate}">
	<input type="hidden" id="tickettheatertime" name="tickettheatertime" value="${tickettheatertime}">
	<input type="hidden" id="tickettheaterscreen" name="tickettheaterscreen" value="${tickettheaterscreen}">
	<input type="hidden" id="ticketpeople" name="ticketpeople" value="${ticketpeople}">
	<input type="hidden" id="ticketseats1" name="ticketseats1" value="${ticketseats1}">
	<input type="hidden" id="ticketseats2" name="ticketseats2" value="${ticketseats2}">
	<input type="hidden" id="ticketseats3" name="ticketseats3" value="${ticketseats3}">
	<input type="hidden" id="ticketseats4" name="ticketseats4" value="${ticketseats4}">
	<input type="hidden" id="ticketseats5" name="ticketseats5" value="${ticketseats5}">
	<input type="hidden" id="ticketselectMovieSeq" name="ticketselectMovieSeq" value="${ticketselectMovieSeq}">
</form>

<script>
	function backToTicktePay(){
		$('#backToTicketpay').submit();
	}
</script>