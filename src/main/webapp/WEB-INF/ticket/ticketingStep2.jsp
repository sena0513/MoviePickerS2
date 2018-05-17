<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value="../res/css/ticket/ticketingStep2.css" />" rel="stylesheet">
<script type="text/javascript" src="../res/js/ticketStep2.js"></script>
<script>
window.onload = function(){
      if(${seatDTO.a1} != 0){
         $('#1').addClass('reservedSeat_Active');
      }
      if(${seatDTO.a2} != 0){
         $('#2').addClass('reservedSeat_Active');
      }
      if(${seatDTO.a3} != 0){
         $('#3').addClass('reservedSeat_Active');
      }
      if(${seatDTO.a4} != 0){
         $('#4').addClass('reservedSeat_Active');
      }
      if(${seatDTO.a5} != 0){
         $('#5').addClass('reservedSeat_Active');
      }
      if(${seatDTO.b1} != 0){
         $('#6').addClass('reservedSeat_Active');
      }
      if(${seatDTO.b2} != 0){
         $('#7').addClass('reservedSeat_Active');
      }
      if(${seatDTO.b3} != 0){
         $('#8').addClass('reservedSeat_Active');
      }
      if(${seatDTO.b4} != 0){
         $('#9').addClass('reservedSeat_Active');
      }
      if(${seatDTO.b5} != 0){
         $('#10').addClass('reservedSeat_Active');
      }
      if(${seatDTO.c1} != 0){
         $('#11').addClass('reservedSeat_Active');
      }
      if(${seatDTO.c2} != 0){
         $('#12').addClass('reservedSeat_Active');
      }
      if(${seatDTO.c3} != 0){
         $('#13').addClass('reservedSeat_Active');
      }
      if(${seatDTO.c4} != 0){
         $('#14').addClass('reservedSeat_Active');
      }
      if(${seatDTO.c5} != 0){
         $('#15').addClass('reservedSeat_Active');
      }
      if(${seatDTO.d1} != 0){
         $('#16').addClass('reservedSeat_Active');
      }
      if(${seatDTO.d2} != 0){
         $('#17').addClass('reservedSeat_Active');
      }
      if(${seatDTO.d3} != 0){
         $('#18').addClass('reservedSeat_Active');
      }
      if(${seatDTO.d4} != 0){
         $('#19').addClass('reservedSeat_Active');
      }
      if(${seatDTO.d5} != 0){
         $('#20').addClass('reservedSeat_Active');
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

   <!-- 네비 -->
   <div class=ticketingContents>
      <div class=ticketingCenter>
      <div class=ticketNevi>
         <div class=ticketBtn>
            <input type="button" class=ticketingGuide value="예매가이드">
            <input type="button" class=ticketingSchedule value="상영시간표">
            <input type="button" class=backTicketing value="예매다시하기">
         </div>
      </div>



<!-- movieSeat 섹션 -->
<!-- SEAT 섹션 -->

<div class=ticketing_Info_Wapper>
   <div class="colHead">인원/좌석</div>
   <div class="person_screen">
      <div class="numberOfPeople" style="display: block;">
         <span class="ticketType">일반</span>
         <ul>   
            <li class='selected ticket_total_active' value="0">0</li>
            <li class='selected' value="1">1</li>
            <li class='selected' value="2">2</li>
            <li class='selected' value="3">3</li>
            <li class='selected' value="4">4</li>
            <li class='selected' value="5">5</li>
         </ul>
      </div>
      <div class="userSelect-movieInfo">
         <p class="theaterInfo">
            <span class="userSelect-theaterPlace">${tickettheaterbranch}</span> <span
               class="userSelect-screen">${tickettheaterscreen}</span> <span
               class="userSelect-seatNum"><b class="restNum">${seatDTO.totalseat}</b> /
               <b class="totalNum">20석</b>
            </span>
         </p>
         <p class="moviePlayYMD-info">
            <b>${tickettheaterdate}&ensp;</b><b>${tickettheatertime}</b>
         </p>
      </div>
   </div>
   


   <!--좌석 -->
   
         <div class='seatWrapper seatWapper_active'>
            <div class=seatScreenBar>
               <div class=screen>SCREEN</div>
            </div>
            
            <div class=seatList>
               <div class=seats>
                  <input id=totalPeopleCount type="hidden" value="0">
                  <input type=hidden id='SelectSeatCount' value="1">
                  <div class=row>A</div>
                  <div id=1 class=col value=A1>1</div>
                  <div id=2 class=col value=A2>2</div>
                  <div id=3 class=col value=A3>3</div>
                  <div id=4 class=col value=A4>4</div>
                  <div id=5 class=col value=A5>5</div>
                  
                  <div class=row>B</div>
                  <div id=6 class=col value=B1>1</div>
                  <div id=7 class=col value=B2>2</div>
                  <div id=8 class=col value=B3>3</div>
                  <div id=9 class=col value=B4> 4</div>
                  <div id=10 class=col value=B5>5</div>
      
                  <div class=row>C</div>
                  <div id=11 class=col value=C1>1</div>
                  <div id=12 class=col value=C2>2</div>
                  <div id=13 class=col value=C3>3</div>
                  <div id=14 class=col value=C4>4</div>
                  <div id=15 class=col value=C5>5</div>
                  
                  <div class=row>D</div>
                  <div id=16 class=col value=D1>1</div>
                  <div id=17 class=col value=D2>2</div>
                  <div id=18 class=col value=D3> 3</div>
                  <div id=19 class=col value=D4>4</div>
                  <div id=20 class=col value=D5>5</div>
                  
                </div>
            </div>
            </div>
         </div>
         </div>
         </div>
         
         
          
      <!-- 선택창 -->
      <div class=ticketSelectBar_Wrapper>
      <div class=ticketSelectBar_Wrapper2>
      <div class=ticketSelectBar>
         <div class=ticketSelectBar_Back_Movie>
               <img src="../res/image/ticketingImages/movieSelectBack_Btn.png">
         </div>
         <div class=selectBarPoster>
            <img src="../res/image/moviePoster/${ticketmovieposter}">
            <input class=movieposterimg type=hidden value="${ticketmovieposter}">
            <div class=ticketMovie_Name_Grade>
            <div class=ticketMovieName value="${ticketplayingmovie}">
               <a href="#" onclick="return false;">${ticketplayingmovie}</a>
            </div>
            <div class=ticketMovieGrade value="${tickettheatermoviegrade}">
                  ${tickettheatermoviegrade}
            </div>
            </div>
         </div>
         
         
         <div class=selectBar_Info_Theater_Date>
            <div class=selectBarTheater value='${tickettheaterbranch}'>
               <span class=selectBar_Span>극장 </span>&emsp;<span>${tickettheaterbranch}</span>
            </div>
            <div class=selectBarDate value='${tickettheaterdate}'>
               <span class=selectBar_Span>일시</span>&emsp; ${tickettheaterdate} ${tickettheatertime}
               <input type=hidden class=selectBarTime  value="${tickettheatertime}">
            </div>
               <div class=selectBarAuditorium value='${tickettheaterscreen}'>
               <span class=selectBar_Span>상영관</span>&nbsp; ${tickettheaterscreen}
            </div>
               <div class=selectBarPeople value="">
               <span class=selectBar_Span>인원</span>&ensp;<span class=selectBar_Span_People></span>
            </div>
         </div>
         
         <div class=selectBar_Seat_Info>
            <div class="selectBar_Seat_Name">
               <span class=selectBar_Span>좌석번호</span><br>
               
            <span class=movieSeat1Span></span>&emsp;
            <input type=hidden id=movieSeat1 value="">
            
            <span class=movieSeat2Span></span><br>
            <input type=hidden id=movieSeat2 value="">
            
            <span class=movieSeat3Span></span>&emsp;
            <input type=hidden id=movieSeat3 value="">
            
            <span class=movieSeat4Span></span><br>
            <input type=hidden id=movieSeat4 value="">
            
            <span class=movieSeat5Span></span>
            <input type=hidden id=movieSeat5 value="">
            <input type=hidden id=selectMovieSeq value="${ticketselectMovieSeq}">   
            </div>
         </div>
         <div class=selectBar_Payment_Info>
            <div class=selectBar_Payment_Price>
            <span class=selectBar_Span>좌석 금액</span>&emsp;&emsp;&emsp;9,000</div>
            <div class=selectBar_Payment_Total value="">
            <span class=selectBar_Span>총 금액</span>&emsp;&emsp;&emsp;&emsp;<span class=totalPrice></span></div>
         </div>
         <div class=selectBar_Payment_Selection_Next_Btn>
            <a href="#" onclick="return false;">
               <img src="../res/image/ticketingImages/paymentNext_Btn.png">
            </a>
         </div>
      </div>
   </div>
</div>


   <div class=ticketingAdWraper>
      <div class=ticketingAdWraper2>
         <div class=ticketingAdWraper3>
            <img src="../res/image/ticketingImages/7years_night.jpg">
         </div>
      </div>
   </div>
 </div>       
 
