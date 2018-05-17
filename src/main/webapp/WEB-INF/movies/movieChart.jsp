<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Collection"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.util.JSONBuilder"%>
<%@page import="net.sf.json.JSONArray"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" type="text/css"
	href="http://kenwheeler.github.io/slick/slick/slick.css" />

<link rel="stylesheet" type="text/css"
	href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

<script type="text/javascript"
	src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>
<link href="<c:url value="../res/css/movies/movieChart.css" />"
	rel="stylesheet">

<script type="text/javascript">
	/* window.onload = function() {
	  document.getElementById('boxoffice_heart').onclick = function() {
	    this.style.color = 'red';
	    
	  }
	}
	 */

	$(document).ready(
			function() {
				function makefunc(targetpage) {
					return function() {
						$("#page").attr("action", targetpage);
						$("#page").submit();
					};
				}
				;
				$(".buyTicket_icon").click(
						makefunc("/mvProject/movieDetail/movieDetail.do"));
			});
	 
	 
	    $('body').on('click', '.buyTicket_icon', function(){
	        var seq = $(this).attr('value');
	     
	        var ticketplayingmovie = $('.movieName'+seq+'').attr('value');
	        var tickettheatermoviegrade = $('.movieGrade'+seq+'').attr('value');
	        var ticketmovieposter = $('.moviePoster'+seq+'').attr('value');
	        if(tickettheatermoviegrade == 'all'){
	        	tickettheatermoviegrade = '전체관람가';
	        }else if(tickettheatermoviegrade == '12'){
	        	tickettheatermoviegrade = '12세관람가';
	        }else if(tickettheatermoviegrade == '15'){
	        	tickettheatermoviegrade = '15세관람가'
	        }else if(tickettheatermoviegrade == 'chungbul'){
	        	tickettheatermoviegrade = '청소년관람불가'
	        }
	        
	         url = '/mvProject/ticket/ticketingStep1.do';
	          var $form = $("<form></form>");
	         
	         $form.attr('action', url);
	         $form.attr('method', 'post');
	         $form.appendTo('body');
	         
	         var hiTicketplayingmovie = $("<input type='hidden' value='"+ticketplayingmovie+"' name='ticketplayingmovie'>");
	         var hiTickettheatermoviegrade = $("<input type='hidden' value='"+tickettheatermoviegrade+"' name='tickettheatermoviegrade'>");
	         var hiTicketmovieposter = $("<input type='hidden' value='"+ticketmovieposter+"' name='ticketmovieposter'>"); 
	         
	         $form.append(hiTicketplayingmovie).append(hiTickettheatermoviegrade).append(hiTicketmovieposter);
	         $form.submit();
	     });
</script>


<div class="wholepage">
	<!-- navi부분 -->
	<div class="navi">
		<div class="naviMenuDiv">
			<div class="naviImageDiv">
				<a href="/mvProject/main/index.do"> <img
					src="../res/image/main/homeImage.png">
				</a>
			</div>

			<div class="naviSecondDiv">
				<a href="/mvProject/movieChart/movieChart.do">> 영화</a>
			</div>

			<div class="naviThirdDiv">
				<a href="/mvProject/movieChart/movieChart.do">> 무비차트</a>
			</div>
		</div>
	</div>
	<div class="contents">


		<form id="page" method="post">


			<!-- ----------Top of top----------------------------- -->

			<!-- <div class="movieChart_index"> -->

			<h1>무비차트</h1>
			<div class="movieChart_hr">
				<hr>
			</div>
			<!-- </div>    -->

			<!-- ------------Option Select----------------------------- -->
			<!--   
      <div class="movieChart_selectOption"> 
      <div class="order">
      <label for="order_type" class="hidden">정렬</label> 
      <select id="order_type" name="order-type">
         <option title="현재 선택됨" selected="" value="1">예매율순</option>
         <option value="2">평점순</option>
         <option value="3">관람객순</option>
      </select>
      <div class="movieChart_goBtn_div">
         <input type="button" id="movieChart_goBtn" value="GO">
      </div>
      </div>
   </div>
 -->

			<!-- ------------Movie Chart(No.1~No.3)----------------------------- -->
			<div id="MovieSet1">
				<c:if
					test="${not empty dailyResult.boxOfficeResult.dailyBoxOfficeList}">
					<c:forEach begin="0" end="2"
						items="${dailyResult.boxOfficeResult.dailyBoxOfficeList}"
						var="boxoffice" varStatus="status">

						<div id="movieN">
							<div class="box-image">
								<strong class="rank"> <c:out
										value="No.${boxoffice.rank}" /></strong>
								<div class="thumb-image">
									<img
										src="../res/image/movies/agelim_${movieplatformDTO[status.index].movieagelimit}.png"
										class="boxoffice_agelim"
										onERROR="this.src='../res/image/moviePoster/onerror_age.png'">
									<a
										href="/mvProject/movieDetail/movieDetail.do?seq=${movieplatformDTO[status.index].seq}">
										<img
										src="../res/image/moviePoster/${movieplatformDTO[status.index].movienameforkr}.jpg"
										class="boxoffice_moviePoster"
										onERROR="this.src='../res/image/moviePoster/poster_preparing.jpg'">
									</a>
								</div>
							</div>

							<div class="boxoffice_movieNm">${boxoffice.movieNm}</div>
							<input type=hidden value="${boxoffice[status.index].movieNm}"
								name="movienameforkr">

							<div class="boxoffice_salesShare">예매율 :
								${boxoffice.salesShare}%</div>
							<div class="boxoffice_openDate">${boxoffice.openDt}개봉</div>
							<div class="boxoffice_audiAcc">
								<fmt:formatNumber value="${boxoffice.audiAcc}" pattern="#,###" />
								명 관람
							</div>
							<div class="boxoffice_heart">
								<c:choose>
									<c:when test="${empty wishlistDTO}">
										<button class="grey_heart pinkheart" type="button"
											style="border: 0; outline: 0;" value="${boxoffice.movieNm}"></button>
									</c:when>
									<c:otherwise>
										<c:if test="${movieplatformDTO[status.index].movienameforkr ne null }">
										<c:set var="pink_test" value="false"/>
											<c:forEach items="${wishlistDTO}" var="wishlistDTO">
												<c:if test="${wishlistDTO.movienameforkr eq movieplatformDTO[status.index].movienameforkr}">
													<c:set var="pink_test" value="true"/>
														</c:if>
											</c:forEach>
											<c:choose>
												<c:when test="${pink_test eq true }">
												<button class="grey_heart pinkheart_active" type="button"
															value="${movieplatformDTO[status.index].movienameforkr}"></button>
												</c:when>
												<c:otherwise>
												<button class="grey_heart pinkheart" type="button"
															value="${movieplatformDTO[status.index].movienameforkr}"></button>
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:otherwise>
								</c:choose>
							</div>

							<div class='movie_likeit ${movieplatformDTO[status.index].movienameforkr}' value='${arrMoviePointDTO[status.index].heart}'>
								<fmt:formatNumber value="${arrMoviePointDTO[status.index].heart}" pattern="#,###" />
							</div>
							   <div class="buyTicket_icon" value='${movieplatformDTO[status.index].seq}'>
                           <img src="../res/image/movies/ticketingBtn2.png"
                              class="ticketIcon">
                        <input type='hidden' class='movieName${movieplatformDTO[status.index].seq}' value='${movieplatformDTO[status.index].movienameforkr}'>
                        <input type='hidden' class='moviePoster${movieplatformDTO[status.index].seq}' value='${movieplatformDTO[status.index].movienameforkr}.jpg'>
                        <input type='hidden' class='movieGrade${movieplatformDTO[status.index].seq}' value='${movieplatformDTO[status.index].movieagelimit}'>
                     </div>

						  </div>
					</c:forEach>

					<div id="ad1">
						<img src="../res/image/movies/AD2.png" id="adimg">
					</div>
				</c:if>
			</div>
			<!-- <script>
				$('body').on('click', '.grey_heart', function() {
					if ($(this).attr('class') == "grey_heart pinkheart") {
						$(this).removeClass('pinkheart');
						$(this).addClass('pinkheart_active');
						$.ajax({
							type : "POST",
							url : "/mvProject/movieChart/wishUp.do",
							data : {
								"movienameforkr" : movienameforkr
							},
							dataType : "json",
							success : function(wishlistDTO) {

							}
						});
					} else {
						$(this).removeClass('pinkheart_active');
						$(this).addClass('pinkheart');
						$.ajax({
							type : "POST",
							url : "/mvProject/movieChart/wishUp.do",
							data : {
								"movienameforkr" : movienameforkr
							},
							dataType : "json",
							success : function(wishlistDTO) {
								
							}
						});
					}
				});
			</script> -->
			<div class="tit-heading-wrap2"></div>

			<!-- ------------Movie Chart(No.4~No.7)----------------------------- -->

			<div id="MovieSet2">
				<c:if
					test="${not empty dailyResult.boxOfficeResult.dailyBoxOfficeList}">
					<c:forEach begin="3" end="6" var="boxoffice"
						items="${dailyResult.boxOfficeResult.dailyBoxOfficeList}"
						varStatus="status">

						<div id="movieN2">
							<div class="box-image">
								<strong class="rank2"> <c:out
										value="No.${boxoffice.rank}" /></strong>
								<div class="thumb-image">
									<img
										src="../res/image/movies/agelim_${movieplatformDTO[status.index].movieagelimit}.png"
										class="boxoffice_agelim"
										onERROR="this.src='../res/image/moviePoster/onerror_age.png'">
									<a
										href="/mvProject/movieDetail/movieDetail.do?seq=${movieplatformDTO[status.index].seq}">
										<img
										src="../res/image/moviePoster/${movieplatformDTO[status.index].moviepostimg}"
										class="boxoffice_moviePoster"
										onERROR="this.src='../res/image/moviePoster/poster_preparing.jpg'">
									</a>
								</div>
							</div>

							<div class="boxoffice_movieNm">${boxoffice.movieNm}</div>
							<input type=hidden
								value="${movieplatformDTO[status.index].movienameforkr}"
								name="movienameforkr">
							<div class="boxoffice_salesShare">예매율 :
								${boxoffice.salesShare}%</div>
							<div class="boxoffice_openDate">${boxoffice.openDt}개봉</div>
							<div class="boxoffice_audiAcc">
								<fmt:formatNumber value="${boxoffice.audiAcc}" pattern="#,###" />
								명 관람
							</div>
							<div class="boxoffice_heart">
								<c:choose>
									<c:when test="${empty wishlistDTO}">
										<button class="grey_heart pinkheart" type="button"
											style="border: 0; outline: 0;" value="${boxoffice.movieNm}"></button>
									</c:when>
									<c:otherwise>
										<c:if test="${movieplatformDTO[status.index].movienameforkr ne null }">
										<c:set var="pink_test" value="false"/>
											<c:forEach items="${wishlistDTO}" var="wishlistDTO">
												<c:if test="${wishlistDTO.movienameforkr eq movieplatformDTO[status.index].movienameforkr}">
													<c:set var="pink_test" value="true"/>
														</c:if>
											</c:forEach>
											<c:choose>
												<c:when test="${pink_test eq true }">
												<button class="grey_heart pinkheart_active" type="button"
															value="${movieplatformDTO[status.index].movienameforkr}"></button>
												</c:when>
												<c:otherwise>
												<button class="grey_heart pinkheart" type="button"
															value="${movieplatformDTO[status.index].movienameforkr}"></button>
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:otherwise>
								</c:choose>
							</div>
							<div class='movie_likeit ${movieplatformDTO[status.index].movienameforkr}' value='${arrMoviePointDTO[status.index].heart}'>
								<fmt:formatNumber value="${arrMoviePointDTO[status.index].heart}" pattern="#,###" />
							</div>
							  <div class="buyTicket_icon" value='${movieplatformDTO[status.index].seq}'>
                           <img src="../res/image/movies/ticketingBtn2.png"
                              class="ticketIcon">
                        <input type='hidden' class='movieName${movieplatformDTO[status.index].seq}' value='${movieplatformDTO[status.index].movienameforkr}'>
                        <input type='hidden' class='moviePoster${movieplatformDTO[status.index].seq}' value='${movieplatformDTO[status.index].movienameforkr}.jpg'>
                        <input type='hidden' class='movieGrade${movieplatformDTO[status.index].seq}' value='${movieplatformDTO[status.index].movieagelimit}'>
                     </div>

						</div>
					</c:forEach>

				</c:if>
			</div>

			<div class="tit-heading-wrap3"></div>

			<div class="ad02">
				<img src="../res/image/movies/ad02.jpg" class="adimg02">
			</div>

			<div class="ad03">
				<img src="../res/image/movies/ad03.jpg" class="adimg03">
			</div>

		</form>

	</div>
	<!-- contents div -->
</div>
<!-- wholepage div -->

<c:if test="${empty loginId }">
	<script type="text/javascript">
		$('body')
				.on(
						'click',
						'.grey_heart',
						function() {
							if (confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?") == true) {
								location.href = "/mvProject/main/loginForm.do?returnURL=movieChart";
							} else {
								return;
							}
						});
	</script>
</c:if>

<c:if test="${not empty loginId }">
	<script>
		$('body').on('click', '.grey_heart', function() {
				var movienameforkr = $(this).attr('value');
				var movieNameHeart = movienameforkr.replace(/(\s)/g, ".");
				
			if ($(this).attr('class') == "grey_heart pinkheart") {
				var likeCount = $('.movie_likeit.'+movieNameHeart).attr('value');
				
				$(this).removeClass('pinkheart');
				$(this).addClass('pinkheart_active');
				$.ajax({
					type : "POST",
					url : "/mvProject/movieChart/wishInsert.do",
					data : {
						"movienameforkr" : movienameforkr
					},
					dataType : "json",
					success : function(wishlistDTO) {
						likeCount *= 1;
						likeCount+=1;
						likeCount += "";
						$('.movie_likeit.'+movieNameHeart+'').attr('value', likeCount);
						$('.movie_likeit.'+movieNameHeart+'').text(likeCount);
					}
				});
			} else {
				var movienameforkr = $(this).val();
				var likeCount = $('.movie_likeit.'+movieNameHeart+'').attr('value');
				
				$(this).removeClass('pinkheart_active');
				$(this).addClass('pinkheart');
				$.ajax({
					type : "POST",
					url : "/mvProject/movieChart/wishDelete.do",
					data : {
						"movienameforkr" : movienameforkr
					},
					dataType : "json",
					success : function(wishlistDTO) {
						likeCount *= 1;
						likeCount-=1;
						likeCount += "";
						$('.movie_likeit.'+movieNameHeart+'').attr('value', likeCount);
						$('.movie_likeit.'+movieNameHeart+'').text(likeCount);
					}	
				});
			}
		});
	</script>
</c:if>
