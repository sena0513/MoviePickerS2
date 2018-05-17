<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
 
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="<c:url value="../res/css/ticket/ticketPaymentComplete.css" />" rel="stylesheet" >


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

<div class="ticketPaymentCompleteWrapper">

	<div class="paymentCompleteHead">
		<span class="paymentCompleteHead-text">예매 완료</span>
	</div>
	<div class="paymentCompleteBody">
		<div class="paymentCompleteBody-title">
			<span class="movieUserId"></span><span class="paymentCompleteBody-title-text">예매가 완료 되었습니다</span>
		</div>
		<div class="paymentCompleteBody-movieInfoWrapper">
			<div class="poster">
				<img src="../res/image/moviePoster/${ticketmovieposter}">
			</div>
			<div class="paymentCompleteBody-movieInfo">
				<div class="movieReservationNumWrapper">
					<div class="ticketMovieCodeLabel"><span>예매번호</span></div>
					<div class="ticketMovieCodeWrapper">
						<div><span class="ticketMovieCode">${ticketMovieCode}</span></div>
					</div>
				</div>
				<div class="movieNameWrapper">
					<div class="ticketMovieTitleLabel"><span>영화명</span></div>
					<div class="ticketMovieTitleWrapper">
						<span class="ticketplayingmovie">${ticketmoviename}</span>
					</div>
				</div>
				<div class="movieGradeWrapper">
					<div class="ticketMovieGradeLabel"><span>관람가</span></div>
					<div class="ticketMovieGradeWrapper">
						<span class="tickettheatermoviegrade">${ticketmoviegrade}</span>
					</div>
				</div>
				<div class="moviePlaceWrapper">
					<div class="ticketMoviePlaceLabel"><span>극장</span></div>
					<div class="ticketMoviePlaceWrapper">
						<span class="ticketMoviePlace">${ticketmoviebranch}&nbsp;${ticketmoviescreen}</span>
					</div>
				</div>
				<div class="movieDateWrapper">
					<div class="ticketMovieDateLabel"><span>날짜</span></div>
					<div class="ticketMovieDateWrapper">
						<span class="ticketMovieDate">${ticketmoviedate}&nbsp;${ticketmovietime}</span>
					</div>
				</div>
				<div class="moviePeopleWrapper">
					<div class="ticketMoviePeopleLabel"><span>인원</span></div>
					<div class="ticketMoviePeopleWrapper">
						<span class="ticketMoviePeople">${ticketmoviepeople}명</span>
					</div>
				</div>
				<div class="movieSeatWrapper">
					<div class="ticketMovieSeatLabel"><span>좌석</span></div>
					<div class="ticketMovieSeatWrapper">
						<span class="ticketMovieSeat">
						${ticketmovieseat1}&nbsp;${ticketmovieseat2}&nbsp;${ticketmovieseat3}&nbsp;${ticketmovieseat4}&nbsp;${ticketmovieseat5}
						</span>
					</div>
				</div>
				
				<div class="moviePriceWrapper">
					<div class="ticketMoviePriceLabel"><span>결제금액</span></div>
					<div class="ticketMoviePriceWrapper">
						<span class="ticketMoviePrice">${ticketmovieprice}원</span>
					</div>
				</div>
				
				<div class="pointPlusedWrapper">
					<div class="pointPlusedLabel">
						<span>적립 된 포인트</span>
					</div>
					<div class="pointPlused">
						<span>${pointPlused}pt</span>
					</div>
				</div>
			</div>
		</div>
		<div class="paymentCompleteBody-reservationInfo">
			<div class="paymentCompleteBody-reservationInfo-title">
				<span>예매 유의사항</span>
			</div>
			<div class="paymentCompleteBody-reservationInfo-content">
				<span>CJ ONE 포인트는 상영일 익일 적립됩니다.(영화관람권, 비회원 예매 제외)</span><br>
				<span>영화 상영 스켸줄은 영화관사정에 의해 변경될 수 있습니다.</span><br>
				<span>비회원 예매하신 경우는 예매내역이 이메일로 발송되지 않습니다.</span>
			</div>
		</div>
		<div class="ticketPaymentCompleteGotoHome">
         <input type="button" value="메인으로" onclick="window.location.href='/mvProject/main/index.do'">
      </div>
	</div>
</div>
</div>