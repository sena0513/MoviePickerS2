<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="<c:url value="../res/css/ticket/ticketPay.css" />" rel="stylesheet" >

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	
	
<script>
	function restartReservation() {
		location.href = "/mvProject/ticket/ticketingStep1.do";
	};
	
	$(document).ready(function() {
		
		$('#toAskPage_btn').click(function(){
			 if(usedPoint == "0"){
	                $("#discountFooter-resultPrice").text('');
					$("#totalDiscountFooter-resultPrice").text('');
					$('#totalCostFooter-resultPrice').val(${ticketprice});
					$('#finalTotalCostFooter-resultPrice').val(${ticketprice});
					
					$('#usedPoint').attr('value', "0");
	             }
			
			 var usePointInput = document.getElementById("usedPoint").value;
	            var isPOINTINPUT = /^[0-9]+$/;
	             if (!isPOINTINPUT.test(usePointInput)) {
	                alert("포인트 입력란에 부적절한 값이 들어갔습니다.");
	                $("#usedPoint").val("");
	                $("#usedPoint").focus();
					$("#discountFooter-resultPrice").text('');
					$("#totalDiscountFooter-resultPrice").text('');
					$('#totalCostFooter-resultPrice').val(${ticketprice});
					$('#finalTotalCostFooter-resultPrice').val(${ticketprice});
	              	return false;
	             }
	             
	             else if(usePointInput < 500 && usePointInput > 0){
	            	alert('500pt 이상부터 사용 가능합니다.');
	            	$("#usedPoint").val("");
	                $("#usedPoint").focus();
	                $("#discountFooter-resultPrice").text('');
					$("#totalDiscountFooter-resultPrice").text('');
					$('#totalCostFooter-resultPrice').val(${ticketprice});
					$('#finalTotalCostFooter-resultPrice').val(${ticketprice});
	              	return false;
	             }
	             
	             else if ($('#usedPoint').val() > ${ticketprice}){
	            	 alert('결제금액보다 더 많은 포인트를 사용하실 수 없습니다');
	 				$('#usedPoint').val('');
	 				$("#discountFooter-resultPrice").text('');
	 				$("#totalDiscountFooter-resultPrice").text('');
	 				$('#totalCostFooter-resultPrice').val(${ticketprice});
	 				$('#finalTotalCostFooter-resultPrice').val(${ticketprice});
	 				return false;
	 			}

	             $('#ticketprice').attr('value', ${ticketprice} - $("#usedPoint").val());
	      });
		
		$("#usedPoint").keyup(function(event) {
			
			var usePointInput = document.getElementById("usedPoint").value;
            var isPOINTINPUT = /^[0-9]+$/;
             if (!isPOINTINPUT.test(usePointInput)) {
                $("#usedPoint").val("");
                $("#usedPoint").focus();
				$("#discountFooter-resultPrice").text('');
				$("#totalDiscountFooter-resultPrice").text('');
				$('#totalCostFooter-resultPrice').val(${ticketprice});
				$('#finalTotalCostFooter-resultPrice').val(${ticketprice});
                alert("포인트 입력란에 부적절한 값이 들어갔습니다.");
              	return false;
             }
			
             else if ($('#usedPoint').val() > ${userPoint}){
				alert('보유 포인트를 확인해주세요');
				$('#usedPoint').val('');
				$("#discountFooter-resultPrice").text('');
				$("#totalDiscountFooter-resultPrice").text('');
				$('#totalCostFooter-resultPrice').val(${ticketprice});
				$('#finalTotalCostFooter-resultPrice').val(${ticketprice});
			}
			else if ($('#usedPoint').val() > ${ticketprice}) {
				$("#discountFooter-resultPrice").text('');
				$("#totalDiscountFooter-resultPrice").text('');
				$('#totalCostFooter-resultPrice').val(${ticketprice});
				$('#finalTotalCostFooter-resultPrice').val(${ticketprice});
			}
		
			
			$("#discountFooter-resultPrice").text(
					$(this).val());
			$("#totalDiscountFooter-resultPrice").text(
					"-" + $("#usedPoint").val());
			$("#totalCostFooter-resultPrice").text(
					${ticketprice} - $("#usedPoint").val());
			$("#finalTotalCostFooter-resultPrice").text(
					${ticketprice} - $("#usedPoint").val());
			
			
		});
		$('#ticketprice').attr('value', ${ticketprice} - $("#usedPoint").val());
	});

	function reservationGuide() {
		window.open("/mvProject/ticket/reservationGuide.do", "EventFrame",
				"width=440px,height=470px, top=60px, left=450px");
	}
	
	function sendPointVal() {
		$('#ticketPayForm').submit();
	}
	
	function backToStep2(){
		$('#ticketPayForm2').submit();
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

<form id="ticketPayForm" action="/mvProject/ticket/ticketPaymentAsk.do" method='post'>

<input type="hidden" id="ticketselectMovieSeq" name="ticketselectMovieSeq" value="${ticketselectMovieSeq}">

<div id="popDiv" class="ticketingContents">
	<div class="ticketingCenter">

		<!-- topNaviButtons -->
		<div class=ticketNevi>
			<div class=ticketBtn>
				<input type="button" onclick="reservationGuide()" class=ticketingGuide value="예매가이드"> <input
					type="button" onclick="" class=ticketingSchedule value="상영시간표"> <input
					type="button" onclick="restartReservation()" class=backTicketing value="예매다시하기">
			</div>
		</div>
		<div class="ticketPayWrapper">
			<!-- step1 Discount -->
			<div class="ticketDiscountSection">
				<div class="ticket-colHeader">
					<span class="title0">할인수단</span>
				</div>
				<div class="cjPointWrapper">
					<div class="ticket-point">
						<h1>* CJ One 포인트 *</h1>
					</div>
					<div class="pointInfo">
						<div class="showPoint-top">
							<label class="title">현재 보유 포인트: </label><span class="userPoints">${userPoint}</span>&nbsp;pt
							<label class="title title2">사용할 포인트: </label><input type="text"
								id="usedPoint" name="usedPoint" style="width: 100px;" value="0">&nbsp;pt
						</div>
						<div class="showPoint-bottom">
							<span>CJ One 포인트는 500p 이상부터 사용가능합니다.</span>
						</div>
					</div>
				</div>
				<div class="ticket-freeTicket-wrapper">
					<div class="ticket-freeTicket">
						<h1>* CGV 영화관람권 *</h1>
					</div>
					<div class="ticket-freeTicket-list">
						<table frame="hsides" rules="rows" align="center">
							<tr>
								<td width="250px" align="center">사용가능 관람권</td>
								<td width="250px" align="center">관람권 번호</td>
								<td width="250px" align="center">유효기간</td>
							</tr>
						<%-- 	<c:choose>
								<c:when test="${freeTicket == null }"> --%>
									<tr>
										<td colspan="3" align="center">사용 가능한 영화관람권이 없습니다.</td>
									</tr>
								<%-- </c:when>
							</c:choose> --%>
							<tr>
								<td align="right" colspan="3">
									<span>할인금액: </span>&emsp;
									<span>0 원</span>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>

			<!-- step2 Price -->
			<div class="ticketPriceSection">

				<!-- (1) 결제하실 금액 -->
				<div class="ticketCost">
					<div class="paymentHeader">
						<span class="paymentHeader-text">결제하실 금액</span>
					</div>
					<div class="paymentFooter">
						<span class="paymentFooter-resultPrice" id="paymentFooter-resultPrice">${ticketprice}</span>&nbsp;원&nbsp;
					</div>
				</div>

				<!-- (2) 할인내역 -->
				<div class="ticketDiscountPrice">
					<div class="discountHeader">
						<span class="discountHeader-text">할인내역</span>
					</div>
					<div class="discountFooter">
						<span class="discountFooter-resultPrice" id="discountFooter-resultPrice">0</span>&nbsp;원&nbsp;
					</div>
					<div class="totalDiscountHeader">
						<span class="totalDiscountHeader-text">총 할인금액</span>
					</div>
					<div class="totalDiscountFooter">
						<span class="totalDiscountFooter-resultPrice" id="totalDiscountFooter-resultPrice">0</span>&nbsp;원&nbsp;
					</div>
				</div>

				<!-- (3) 결제내역 -->
				<div class="ticketTotalCost">
					<div class="totalCostHeader">
						<span class="totalCostHeader-text">결제내역</span>
					</div>
					<div class="totalCostFooter">
						<span class="totalCostFooter-resultPrice" id="totalCostFooter-resultPrice" >${ticketprice}</span>&nbsp;원&nbsp;
					</div>
					<div class="finalTotalCostHeader">
						<span class="finalTotalCostHeader-text">남은 결제내역</span>
					</div>
					<div class="finalTotalCostFooter">
						<span class="finalTotalCostFooter-resultPrice" id="finalTotalCostFooter-resultPrice">${ticketprice}</span>&nbsp;원&nbsp;
						<input type="hidden" id="ticketprice" name="ticketprice" value="${ticketprice}"  >
					</div>
				</div>
			</div>
		</div>

	</div>
</div>
<!-- step3 Info -->
<!-- 선택창 -->
<div class=ticketSelectBar_Wrapper>    
	<div class=ticketSelectBar_Wrapper2>
		<div class=ticketSelectBar>
			<div class=ticketSelectBar_Back_Movie>
				<a href="javascript:backToStep2()" class="backtostep2">
					<img src="../res/image/ticketingImages/selectSeatBack_Btn.png" class="toStep2_btn">
				</a>
			</div>
			<div class=selectBarPoster>
				<img src="../res/image/moviePoster/${ticketmovieposter}">
				<input type="hidden" id="ticketmovieposter" name="ticketmovieposter" value="${ticketmovieposter}">
				<div class=ticketMovie_Name_Grade>
					<div class=ticketMovieName>
						<span>${ticketplayingmovie}</span>
						<input type="hidden" id="ticketplayingmovie" name="ticketplayingmovie" value="${ticketplayingmovie}">
					</div>
					<div class=ticketMovieGrade>
						<span>${tickettheatermoviegrade}</span>
						<input type="hidden" id="tickettheatermoviegrade" name="tickettheatermoviegrade" value="${tickettheatermoviegrade}">
					</div>
				</div>
			</div>


			<div class=selectBar_Info_Theater_Date>
				<div class=selectBarTheater>
					<span class=selectBar_Span>극장 </span>&emsp;<span>${tickettheaterbranch}</span>
					<input type="hidden" id="tickettheaterbranch" name="tickettheaterbranch" value="${tickettheaterbranch}">
				</div>
				<div class=selectBarDate>
					<span class=selectBar_Span>일시</span>&emsp; <span>${tickettheaterdate} ${tickettheatertime}</span>
					<input type="hidden" id="tickettheaterdate" name="tickettheaterdate" value="${tickettheaterdate}">
					<input type="hidden" id="tickettheatertime" name="tickettheatertime" value="${tickettheatertime}">
				</div>
				<div class=selectBarDate>
					<span class=selectBar_Span>상영관</span>&nbsp; <span>${tickettheaterscreen}</span>
					<input type="hidden" id="tickettheaterscreen" name="tickettheaterscreen" value="${tickettheaterscreen}">
				</div>
				<div class=selectBarDate>
					<span class=selectBar_Span>인원</span>&ensp; <span>${ticketpeople}명</span>
					<input type="hidden" id="ticketpeople" name="ticketpeople" value="${ticketpeople}">
				</div>
			</div>

			<div class=selectBar_Seat_Info>
				<div class="selectBar_Seat_Name">
					<span class=selectBar_Span>좌석번호</span>&ensp;
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
			<div class=selectBar_Payment_Btn>
				<a href="javascript:sendPointVal()" class="ticketPayNextPage">
					<img src="../res/image/ticketingImages/payment_Btn.png" class="toAskPage_btn" id="toAskPage_btn">
				</a>
			</div>
		</div>
	</div>
</div>
</form>

<!-- 광고 -->
<div class=ticketingAdWraper>
	<div class=ticketingAdWraper2>
		<div class=ticketingAdWraper3>
			<img src="../res/image/ticketingImages/7years_night.jpg">
		</div>
	</div>
</div>
</div>

<form id="ticketPayForm2" action="/mvProject/ticket/ticketingStep2.do" method='post'>
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
	function restartReservation() {
		location.href = "/mvProject/ticket/ticketingStep1.do";
	};
	
	$(document).ready(function() {
		
		$('#toAskPage_btn').click(function(){
			 if(usedPoint == "0"){
	                $("#discountFooter-resultPrice").text('');
					$("#totalDiscountFooter-resultPrice").text('');
					$('#totalCostFooter-resultPrice').val(${ticketprice});
					$('#finalTotalCostFooter-resultPrice').val(${ticketprice});
					
					$('#usedPoint').attr('value', "0");
	             }
			
			 var usePointInput = document.getElementById("usedPoint").value;
	            var isPOINTINPUT = /^[0-9]+$/;
	             if (!isPOINTINPUT.test(usePointInput)) {
	                alert("포인트 입력란에 부적절한 값이 들어갔습니다.");
	                $("#usedPoint").val("");
	                $("#usedPoint").focus();
					$("#discountFooter-resultPrice").text('');
					$("#totalDiscountFooter-resultPrice").text('');
					$('#totalCostFooter-resultPrice').val(${ticketprice});
					$('#finalTotalCostFooter-resultPrice').val(${ticketprice});
	              	return false;
	             }
	             
	             else if(usePointInput < 500 && usePointInput > 0){
	            	alert('500pt 이상부터 사용 가능합니다.');
	            	$("#usedPoint").val("");
	                $("#usedPoint").focus();
	                $("#discountFooter-resultPrice").text('');
					$("#totalDiscountFooter-resultPrice").text('');
					$('#totalCostFooter-resultPrice').val(${ticketprice});
					$('#finalTotalCostFooter-resultPrice').val(${ticketprice});
	              	return false;
	             }
	             
	             else if ($('#usedPoint').val() > ${ticketprice}){
	            	 alert('결제금액보다 더 많은 포인트를 사용하실 수 없습니다');
	 				$('#usedPoint').val('');
	 				$("#discountFooter-resultPrice").text('');
	 				$("#totalDiscountFooter-resultPrice").text('');
	 				$('#totalCostFooter-resultPrice').val(${ticketprice});
	 				$('#finalTotalCostFooter-resultPrice').val(${ticketprice});
	 				return false;
	 			}

	 			
	      });
		
		$("#usedPoint").keyup(function(event) {
			var usePointInput = document.getElementById("usedPoint").value;
            var isPOINTINPUT = /^[0-9]+$/;
             if (!isPOINTINPUT.test(usePointInput)) {
                $("#usedPoint").val("");
                $("#usedPoint").focus();
				$("#discountFooter-resultPrice").text('');
				$("#totalDiscountFooter-resultPrice").text('');
				$('#totalCostFooter-resultPrice').val(${ticketprice});
				$('#finalTotalCostFooter-resultPrice').val(${ticketprice});
                alert("포인트 입력란에 부적절한 값이 들어갔습니다.");
              	return false;
             }
             else if ($('#usedPoint').val() > ${userPoint}){
				alert('보유 포인트를 확인해주세요');
				$('#usedPoint').val('');
				$("#discountFooter-resultPrice").text('');
				$("#totalDiscountFooter-resultPrice").text('');
				$('#totalCostFooter-resultPrice').val(${ticketprice});
				$('#finalTotalCostFooter-resultPrice').val(${ticketprice});
			}
			else if ($('#usedPoint').val() > ${ticketprice}) {
				$('#usedPoint').val('');
				$("#discountFooter-resultPrice").text('');
				$("#totalDiscountFooter-resultPrice").text('');
				$('#totalCostFooter-resultPrice').val(${ticketprice});
				$('#finalTotalCostFooter-resultPrice').val(${ticketprice});
			}else if(usePointInput.length > $('#ticketprice').attr('value').length){
            	$("#usedPoint").val("0");
            	$("#discountFooter-resultPrice").text('');
				$("#totalDiscountFooter-resultPrice").text('');
            }
		
			
			$("#discountFooter-resultPrice").text(
					$(this).val());
			$("#totalDiscountFooter-resultPrice").text(
					 + $("#usedPoint").val());
			$("#totalCostFooter-resultPrice").text(
					${ticketprice} - $("#usedPoint").val());
			$("#finalTotalCostFooter-resultPrice").text(
					${ticketprice} - $("#usedPoint").val());
			
			
		});
		$('#ticketprice').attr('value', ${ticketprice} - $("#usedPoint").val());
	});

	function reservationGuide() {
		window.open("/mvProject/ticket/reservationGuide.do", "EventFrame",
				"width=440px,height=470px, top=60px, left=450px");
	}
	
	function sendPointVal() {
		$('#ticketPayForm').submit();
	}
	
	function backToStep2(){
		$('#ticketPayForm2').submit();
	}
	
</script>