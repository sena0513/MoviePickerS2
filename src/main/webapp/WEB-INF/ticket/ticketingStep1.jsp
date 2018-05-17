<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value="../res/css/ticket/ticketingStep1.css" />" rel="stylesheet">

<script type="text/javascript" src="../res/js/ticketStep1.js"></script>
  
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
 
   <div class="ticketingContents">
      <div class="ticketingCenter">

		

		<!-- 네비 -->
         <div class=ticketNevi>
            <div class=ticketBtn>
               <input type="button" class=ticketingGuide value="예매가이드">
               <input type="button" class=ticketingSchedule value="상영시간표">
               <input type="button" class=backTicketing value="예매다시하기">
            </div>
         </div>
         
       <!-- 로딩바 -->  
 <div class="wrap-loading display-none"> 
    <div><img src="../res/image/ticketingImages/loader.gif" /></div> 
</div>      
         
         <!-- 영화 -->
      <div class=ticketing_Info_Wapper>
         <div class=ticketMovie>
            <div class=ticketMovieHead>
               <span class=ticketMovieHeadText>영화</span>
            </div>
            <div class=ticketMovieList>
               <ul class=ticketMovieListUL>
               </ul>
            </div>
         </div>


         <!-- 극장 -->
         <div class=ticketTheater>
            <div class=ticketTheaterHead>
                     극장
            </div>
            <div class=ticketTheaterArea>
               <div class=ticketTheaterCity>
                  <button id=defaultOpen class=ticketTheaterBtn onclick="openCity(event, 'seoul')">서울</button>
               </div>
               <div class=ticketTheaterCity>
                  <button class=ticketTheaterBtn onclick="openCity(event, 'gyeonggi')">경기</button>
               </div>
               <div class=ticketTheaterCity>
                  <button class=ticketTheaterBtn onclick="openCity(event, 'incheon')">인천</button>
               </div>
               <div class=ticketTheaterCity>
                  <button class=ticketTheaterBtn onclick="openCity(event, 'gangwon')">강원</button>
               </div>
               <div class=ticketTheaterCity>
                  <button class=ticketTheaterBtn onclick="openCity(event, 'daejeon')">대전/충청</button>
               </div>
               <div class=ticketTheaterCity>
                  <button class=ticketTheaterBtn onclick="openCity(event, 'daegu')">대구</button>
               </div>
               <div class=ticketTheaterCity>
                  <button class=ticketTheaterBtn onclick="openCity(event, 'busan')">부산/울산</button>
               </div>
               <div class=ticketTheaterCity>
                  <button class=ticketTheaterBtn onclick="openCity(event, 'gyeongsang')">경상</button>
               </div>
               <div class=ticketTheaterCity>
                  <button class=ticketTheaterBtn onclick="openCity(event, 'gwangju')">전라/제주</button>
               </div>
            </div>
            
            
            <div class=ticketTheaterList>
               <div id="seoul" class=ticketTheaterListCity>
               <ul class=seoulUl>
                
               </ul>
               </div>
            
            <div id="gyeonggi" class=ticketTheaterListCity>
               <ul class=gyeonggiUl>
                
               </ul>
               </div>
              <div id="incheon" class=ticketTheaterListCity>
               <ul class=incheonUl>
                
               </ul>
               </div>
                <div id="gangwon" class=ticketTheaterListCity>
               <ul class=gangwonUl>
                
               </ul>
               </div>
                <div id="daejeon" class=ticketTheaterListCity>
               <ul class=daejeonUl>
                
               </ul>
               </div>
                <div id="daegu" class=ticketTheaterListCity>
               <ul class=daeguUl>
                
               </ul>
               </div>
                <div id="busan" class=ticketTheaterListCity>
               <ul class=busanUl>
                
               </ul>
               </div>
               <div id="gyeongsang" class=ticketTheaterListCity>
               <ul class=gyeongsangUl>
                
               </ul>
               </div>
               <div id="gwangju" class=ticketTheaterListCity>
               <ul class=gwangjuUl>
                
               </ul>
               </div>
            </div>
         </div>
<script type="text/javascript">
function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("ticketTheaterListCity");
    for (i = 0; i < tabcontent.length; i++) {
       tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("ticketTheaterBtn");
    for (i = 0; i < tablinks.length; i++) {
       tablinks[i].className = tablinks[i].className
             .replace(" ticket_Theater_Btn_active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " ticket_Theater_Btn_active";
 }
 
 document.getElementById("defaultOpen").click();
</script>     
      

   <!-- 날짜 -->
         <div class=ticketDate>
            <div class=ticketDateHead>
                  날짜
            </div>
            <div class=ticketDateList>
            
            </div>
         </div>
         
         
         <!-- 시간 -->
         
         <div class=ticketTime>
            <div class=ticketTimeHead>
                  시간
            </div>
            <div class=ticketTimeList>
            <div class=ticketTimeListFor>
               영화, 극장, 날짜를 선택해주세요.
               </div>
            </div>
         </div>
        </div>
      </div>
   </div>
         
         
         
   
 <c:choose>
 <c:when test="${ticketplayingmovie eq null}" >
       <!-- 선택창 -->
   <div class=ticketSelectBar_Wrapper>
      <div class=ticketSelectBar_Wrapper2>
      <div class=ticketSelectBar>
         <div class=selectBarPoster>
            <img class=selectBarPosterSrc src="../res/image/ticketingImages/noposter.png">
            <div class=ticketMovie_Name_Grade>
            <input type='hidden' value="" id='selectMovieSeq'>
            <div class=ticketMovieName value="">
                            영화이름
            </div>
            <div class=ticketMovieGrade>
                  관람등급
            </div>
            </div>
         </div>
         <div class=selectBar_Info_Theater_Date>
            <div class=selectBarTheater value="">
               <span class=selectBar_Span>극장 </span>&emsp;<span class=selectBarTheater_span></span>
            </div>
            <div class=selectBarDate value="">
               <span class=selectBar_Span>일시</span>&emsp;<span class=selectBarDate_span></span>&emsp;<span class=selectBarTime_span></span>
            </div>
               <div class=selectBarAuditorium value="">
               <span class=selectBar_Span>상영관</span>&nbsp;<span class=selectBarScreen_span></span>
            </div>
               <div class=selectBarTime value="">
               <span class=selectBar_Span>인원</span>&ensp;
            </div>
         </div>
         
         <div class=selectBar_Seat_Picture>
            <img src="../res/image/ticketingImages/selectSeat_Text.png">
         </div>
         <div class=selectBar_Payment_Picture>
            <img src="../res/image/ticketingImages/selectPayment_Text.png">
         </div>
         <div class=selectBar_Seat_Selection_Next_Btn>
            <a href="#" onclick="return false;">
               <input class=movieposterimg type='hidden' value="${ticketmovieposter}">
               <img class=seatNextSelect_Img src="../res/image/ticketingImages/selectSeatNext_Btn.png">
            </a>
         </div>
         </div>
         </div>
      </div>
</c:when>
<c:otherwise>

      <!-- 선택창 -->
   <div class=ticketSelectBar_Wrapper>
      <div class=ticketSelectBar_Wrapper2>
      <div class=ticketSelectBar>
         <div class=selectBarPoster>
            <img class=selectBarPosterSrc src="../res/image/moviePoster/${ticketmovieposter}">
            <div class=ticketMovie_Name_Grade>
            <input type='hidden' id='selectMovieSeq' value="${selectMovieSeq}">
            <div class=ticketMovieName value="${ticketplayingmovie}">
                            ${ticketplayingmovie}
            </div>
            <div class=ticketMovieGrade value="${tickettheatermoviegrade}">
                  ${tickettheatermoviegrade}
            </div>
            </div>
         </div>
 <div class=selectBar_Info_Theater_Date>
            <div class=selectBarTheater value="${tickettheaterbranch}">
               <span class=selectBar_Span>극장 </span>&emsp;<span class=selectBarTheater_span>${tickettheaterbranch}</span>
            </div>
            <div class=selectBarDate value="${tickettheaterdate}">
               <span class=selectBar_Span>일시</span>&emsp;<span class=selectBarDate_span>${tickettheaterdate}</span>&emsp;<span class=selectBarTime_span>${tickettheatertime}</span>
            </div>
               <div class=selectBarAuditorium value="${tickettheaterscreen}">
               <span class=selectBar_Span>상영관</span>&nbsp;<span class=selectBarScreen_span>${tickettheaterscreen}</span>
            </div>
               <div class=selectBarTime value="${tickettheatertime}">
               <span class=selectBar_Span>인원</span>&ensp;
            </div>
         </div>
         
         <div class=selectBar_Seat_Picture>
            <img src="../res/image/ticketingImages/selectSeat_Text.png">
         </div>
         <div class=selectBar_Payment_Picture>
            <img src="../res/image/ticketingImages/selectPayment_Text.png">
         </div>
         <div class=selectBar_Seat_Selection_Next_Btn>
            <a href="#" onclick="return false;">
               <input class=movieposterimg type=hidden value="${ticketmovieposter}">
               <img class=seatNextSelect_Img src="../res/image/ticketingImages/selectSeatNext_Btn.png">
            </a>
         </div>
         </div>
         </div>
      </div>

</c:otherwise>
 </c:choose>
  
  
  
  <!-- 광고 -->
   <div class=ticketingAdWraper>
      <div class=ticketingAdWraper2>
         <div class=ticketingAdWraper3>
            <img src="../res/image/ticketingImages/7years_night.jpg">
         </div>
      </div>
   </div>
 </div> 