<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Collection"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.util.JSONBuilder"%>
<%@page import="net.sf.json.JSONArray"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<%
    // 파라메터 설정
   String targetDt = request.getParameter("targetDt")==null?"20180301":request.getParameter("targetDt");         //조회일자
   String itemPerPage = request.getParameter("itemPerPage")==null?"10":request.getParameter("itemPerPage");      //결과row수
   String multiMovieYn = request.getParameter("multiMovieYn")==null?"":request.getParameter("multiMovieYn");      //“Y” : 다양성 영화 “N” : 상업영화 (default : 전체)
   String repNationCd = request.getParameter("repNationCd")==null?"":request.getParameter("repNationCd");         //“K: : 한국영화 “F” : 외국영화 (default : 전체)
   String wideAreaCd = request.getParameter("wideAreaCd")==null?"":request.getParameter("wideAreaCd");            //“0105000000” 로서 조회된 지역코드

   // 발급키
   String key = "03502e5952b22549d2eb8ff76c8e24c3";
   // KOBIS 오픈 API Rest Client를 통해 호출
    KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);

   // 일일 박스오피스 서비스 호출 (boolean isJson, String targetDt, String itemPerPage,String multiMovieYn, String repNationCd, String wideAreaCd)
    String dailyResponse = service.getDailyBoxOffice(true,targetDt,itemPerPage,multiMovieYn,repNationCd,wideAreaCd);

   // Json 라이브러리를 통해 Handling
   ObjectMapper mapper = new ObjectMapper();
   HashMap<String,Object> dailyResult = mapper.readValue(dailyResponse, HashMap.class);

   request.setAttribute("dailyResult",dailyResult);

   // KOBIS 오픈 API Rest Client를 통해 코드 서비스 호출 (boolean isJson, String comCode )
   String codeResponse = service.getComCodeList(true,"0105000000");
   HashMap<String,Object> codeResult = mapper.readValue(codeResponse, HashMap.class);
   request.setAttribute("codeResult",codeResult);
    %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
   href="http://kenwheeler.github.io/slick/slick/slick.css" />
   
<link rel="stylesheet" type="text/css"
   href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />
   
<script src="http://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha256-k2WSCIexGzOj3Euiig+TlR8gA0EmPjuc79OEeY5L45g="
   crossorigin="anonymous"></script>
   
<script type="text/javascript"
   src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>

    

<link href="<c:url value="res/css/realMovieChart.css" />" rel="stylesheet">

<div id=form>
<jsp:include page="/include/header.jsp"></jsp:include>

<div class="wholepage">
   <div class="contents">
   
   <!-- ----------Top of top----------------------------- -->
   
   <div class="moviePoint_index">
   
   <div class="submenu">
         <ul>
            <li><a href="/movies/pre-movies.aspx">내가 쓴 평점</a></li>
            <li class="on"><a href="/movies/" title="선택">일반평점</a></li>
         </ul>
   </div>
   
   <h1>일반평점</h1>
      <div class="moviePoint_hr"><hr></div>
   </div>   
   
   <!-- ---------- Movie Slide(Slick) ----------------------------- -->
   <div class="movieSlide_slick">
   <div class="slick_prev">
      <img src="res/movieImage/slick_prev.png" class="prev_movie">
   </div>

   <div id="slick_container">
    <div class="row">
      <div class="col-md-12 heroSlider-fixed">
        <div class="overlay">
      </div>
        <div class="responsive">
        
            <!-- -----Movie Slide data ----------- -->
         
           <c:if test="${not empty dailyResult.boxOfficeResult.dailyBoxOfficeList}">
         <c:forEach begin="0" end="7" items="${dailyResult.boxOfficeResult.dailyBoxOfficeList}" var="boxoffice">
              
        <div class="movieN">
        
       <div class="moviePorint_Posterdiv">
         <a href="/movies/detail-view/?midx=80593">
         <img src="res/movieImage/movie_imageMR962NYL3.jpg" class="moviePoint_poster">
            </a>
          </div>   
         
         <div class="boxoffice_movieNm">${boxoffice.movieNm}</div>
         <div class="boxoffice_salesShare">예매율 : ${boxoffice.salesShare}%</div>
         <div class="boxoffice_openDate">${boxoffice.openDt} 개봉</div>
         <div class="boxoffice_audiAcc"><fmt:formatNumber value="${boxoffice.audiAcc}" pattern="#,###"/>명 관람</div>
         <div class="boxoffice_heart"><img src="res/movieImage/grey_heart.png" class="grey_heart"></div>
         <div class="movie_likeit"><fmt:formatNumber value="3433" pattern="#,###" /></div>
         <div class="buyTicket_icon"><img src="res/movieImage/ticketingBtn2.png" class="ticketIcon"></div>
            
         </div>
         
         </c:forEach>
         </c:if>
        </div>
     
      </div>
    </div>
  </div> <!-- Slick Container -->
     
     <div class="slick_next">
      <img src="res/movieImage/slick_next.png" class="next_movie">
   </div>
  </div>
  
  <!-- Golden egg & Point Chart -->
  <div id=moviePoint_chart>
  	<div class="moviePoint_header">
  	실 관람객 평점 |         관람일 포함 7일이내 뭐시기 어쩌구 포인트 적립 | 평점 작성 | 내 평점
  	</div>
  	
  	<div class="moviePoint_body">
  		<div class="moviePoint_body_left">
  			<div class="moviePoint_body_left_header">
  			
  			레프트 헤더 부분입니다.
  			</div>
  		
  			<div class="body_left_bottom">
  				<div class="body_left_bottom_1">
  					이미지
  				</div>
  				<div class="body_left_bottom_2">
  					퍼센트
  				</div>
  				<div class="body_left_bottom_3">
  					~~명 관람
  				</div>
  			</div>
  		
  		</div>
  		
  		<div class="moviePoint_graph">
  		<canvas id="myChart"></canvas>
				<script type="text/javascript">
					var ctx = document.getElementById('myChart').getContext('2d');
					var chart = new Chart(ctx, {
					    // The type of chart we want to create
					    type: 'radar',
					
					    // The data for our dataset
					    data: {
					        labels: ["감독연출", "스토리", "영상미", "배우연기", "OST"],
					        datasets: [{
					            label: "매력포인트",
					            backgroundColor: 'rgba(179, 181, 198, 0.2)',
					            borderColor: 'rgba(179, 181, 198, 1)',				          				            
					            data: [17, 25, 50, 75, 65],
					        }]
					    },
					
					    // Configuration options go here
					    options: {}
					});
				</script>
  	</div>
  	
  	</div>
  	
  </div>
  
  
  <!-- ------------User's reviews ---------------------------*/ -->
  
  <!-- moviePoint_reviews(forEach) -->
   
<!--  <div id=fake2>
     <img src="res/movieImage/movie_imageMR962NYL3.jpg" class="moviePoint_poster" style="width:200px;height:100px;">
  </div> -->   
   
      </div> <!-- contents div -->
   </div> <!-- wholepage div -->
   
<!-- -----Slick slider script------------ -->

   <script type="text/javascript">
      $('.responsive').slick({
         dots : true,
         arrow : true, //돌리는 것
         prevArrow : $('.slick_prev'), //클래스 값 
         nextArrow : $('.slick_next'),
         infinite : false, //무제한으로 도는 것
         speed : 300,
         slidesToShow : 4, //한 페이지 당 보여주는 최대 갯수
         slidesToScroll : 4, //넘어가는 갯수
         responsive : [ {
            breakpoint : 1024,
            settings : {
               slidesToShow : 3,
               slidesToScroll : 3,
               infinite : true,
               dots : true
            }
         }, {
            breakpoint : 600,
            settings : {
               slidesToShow : 2,
               slidesToScroll : 2
            }
         }, {
            breakpoint : 480,
            settings : {
               slidesToShow : 1,
               slidesToScroll : 1
            }
         }
         // You can unslick at a given breakpoint now by adding:
         // settings: "unslick"
         // instead of a settings object
         ]
      });
   </script>
<jsp:include page="/include/footer.jsp"/>
</div> <!-- form div -->