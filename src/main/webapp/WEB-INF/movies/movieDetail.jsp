<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link href="<c:url value="../res/css/movies/movieDetail.css" />" rel="stylesheet">
<link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="http://vjs.zencdn.net/c/video.js"></script>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

<div class="wholepage">
   <div class="contents">
   
   <!-- ----------Top of top----------------------------- -->
   <div class="movieDetail_index">
   
   <h1>영화상세</h1>
   <div class="movieChart_hr"><hr></div>
   </div>   
   
   <!-- ---------- Movie Basic Info ----------------------------- -->
   
   <c:if test="${not empty MovieplatformDTO}">
   <div id="MovieInfo">
   <div class="thumb-image">
        <a href="/movies/detail-view/?midx=80593">
        <img src="../res/image/moviePoster/${MovieplatformDTO.moviepostimg}" class="movie_poster"></a>
    </div>
                        
      <div id="movie_info_detail">
         <div class="movieDetail_KoName">${MovieplatformDTO.movienameforkr}</div>
         <div class="movieDetail_EnName">${MovieplatformDTO.movienameforeng}</div>
         <div class="movieDetail_sales">예매율 31.3%</div>
         <input type='hidden' class=mv_seq value='${mv_seq }'>
         
         <div class="tit-heading-wrap2"></div>
         
         <div class="movieDetail_people">감독 : ${MovieplatformDTO.moviemaker} / 배우 : ${MovieplatformDTO.movieactor}</div>
         <div class="movieDetail_genre">장르 : ${MovieplatformDTO.moviegenre}</div>
         <div class="movieDetail_basicInfo1">기본 : ${ageLimit} / ${MovieplatformDTO.movierunningtime} / ${MovieplatformDTO.moviemakecountry}</div>
         <div class="movieDetail_basicInfo2">개봉 : ${MovieplatformDTO.moviedate}</div>
      
         <div class="boxoffice_heart">
         <c:choose>
									<c:when test="${empty wishlistDTO}">
										<button class="grey_heart pinkheart" type="button"
											style="border: 0; outline: 0;" value="${boxoffice.movieNm}"></button>
									</c:when>
									<c:otherwise>
										<c:if test="${moviePointDTO ne null }">
										<c:set var="pink_test" value="false"/>
											<c:forEach items="${wishlistDTO}" var="wishlistDTO">
												<c:if test="${wishlistDTO.movienameforkr eq moviePointDTO.movienameforkr}">
													<c:set var="pink_test" value="true"/>
														</c:if>
											</c:forEach>
											<c:choose>
												<c:when test="${pink_test eq true }">
												<button class="grey_heart pinkheart_active" type="button"
															value="${moviePointDTO.movienameforkr}"></button>
												</c:when>
												<c:otherwise>
												<button class="grey_heart pinkheart" type="button"
															value="${moviePointDTO.movienameforkr}"></button>
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:otherwise>
								</c:choose>
         </div>
         <div class='movie_likeit ${mv_seq }' value='${moviePointDTO.heart}'>${moviePointDTO.heart }</div>
         <div class="buyTicket_icon"><img src="../res/image/movies/ticketingBtn2.png" class="ticketIcon"></div>
      </div>
   </div>
   </c:if>
   
   <!-- ---------- Movie detail ----------------------------- -->
   
    <div class="movieDetail_story">
      <pre style="font-family: arial;">${MovieplatformDTO.moviecontent}</pre>
      </div>
   
   <!-- ------------Bar -------------------------- -->

   <div class="movieDetail_bar">
      <div class="bar_yellow"></div>
      <div class="bar_black">&nbsp;&nbsp;트레일러</div>
   </div>
   
   <!-- ------------Trailer -------------------------- -->

         <div class="movieDetail_trailerBox">
            <div class="movieDetail_trailer">
               <video id="testVideo" width="713" height="368" controls="controls"
                  preload="metadata" class="video-js vjs-default-skin"
                  data-setup="{}">
                  <source src="../res/image/movieTrailer/${MovieplatformDTO.movietrailer }" type="video/mp4">
                  <source src="nature.ogg" type="video/ogg">

               </video>
               <script type="text/javascript">
                  
               </script>


            </div>
         </div>


         <!-- ------------Bar -------------------------- -->

   <div class="movieDetail_bar">
      <div class="bar_yellow"></div>
      <div class="bar_black">&nbsp;&nbsp;스틸컷</div>
   </div>
   
      <!-- ------------steelCut -------------------------- -->
   
         <div class="slideshow-container">

            <!-- Full-width images with number and caption text -->
            <div class="mySlides fade">
               
              <img src="../res/image/movieSteelCut/${MovieplatformDTO.moviesteelcutimg1 }"
              onERROR="this.src='../res/image/moviePoster/poster_preparing.jpg'">
               
            </div>
      
            <div class="mySlides fade">
               
               <img src="../res/image/movieSteelCut/${MovieplatformDTO.moviesteelcutimg2 }"
               onERROR="this.src='../res/image/moviePoster/poster_preparing.jpg'">
               
            </div>
      
            <div class="mySlides fade">
              
              <img src="../res/image/movieSteelCut/${MovieplatformDTO.moviesteelcutimg3 }"
              onERROR="this.src='../res/image/moviePoster/poster_preparing.jpg'">
               
            </div>
           
            <!-- Next and previous buttons -->
            <a class="prev" onclick="plusSlides(-1)">&#10094;</a> 
            <a class="next" onclick="plusSlides(1)">&#10095;</a>
            </div>
   
      <!-- ------------Bar -------------------------- -->
   
    <!--   <div class="realClientEvaluation">
         <div class="realClientEvaluation_label">
            <h4>실관람객 평점▷</h4>
         </div>
         
         <div class="realClientEvaluation_explanation">
            <h4>관람일 포함 7일 이내 관람평을 남기시면 CJ ONE 20P가 적립됩니다.</h4>
         </div>
         
         <div class="realClientEvaluation_button">
            <input type="button" value="평점작성" class="writeGradeButton" name="writeGradeButton"
            onclick="">
            <input type="button" value="내 평점" class="myGradeButton" name="myGradeButton"
            onclick="">
         </div>
      </div>  -->
      
      
      
    
    
        
 
     
   
      </div> <!-- contents div -->
   </div> <!-- wholepage div -->

<script type="text/javascript">
   var slideIndex = 1;
   showSlides(slideIndex);

   // Next/previous controls
   function plusSlides(n) {
     showSlides(slideIndex += n);
   }

   // Thumbnail image controls
   function currentSlide(n) {
     showSlides(slideIndex = n);
   }

   function showSlides(n) {
     var i;
     var slides = document.getElementsByClassName("mySlides");
     var dots = document.getElementsByClassName("dot");
     if (n > slides.length) {slideIndex = 1} 
     if (n < 1) {slideIndex = slides.length}
     for (i = 0; i < slides.length; i++) {
         slides[i].style.display = "none"; 
     }
     for (i = 0; i < dots.length; i++) {
         dots[i].className = dots[i].className.replace(" active", "");
     }
     slides[slideIndex-1].style.display = "block"; 
     dots[slideIndex-1].className += "active";
   }   
   
   var slideIndex = 0;
   carousel();

   function carousel() {
        var i;
       var x = document.getElementsByClassName("mySlides");
        for (i = 0; i < x.length; i++) {
         x[i].style.display  = "none"; 
       }
       slideIndex++;
        if (slideIndex > x.length) {slideIndex = 1} 
        x[slideIndex-1].style.display = "block"; 
   }
</script>


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
			var likeCount = $(".movie_likeit").attr('value');
			
			
			
			if ($(this).attr('class') == "grey_heart pinkheart") {
				var movienameforkr = $(this).val();
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
						$(".movie_likeit").attr('value', likeCount);
						$(".movie_likeit").text(likeCount);
					}
				});
			} else {
				var movienameforkr = $(this).val();
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
						likeCount -=1;
						likeCount += "";
						$(".movie_likeit").attr('value', likeCount);
						$(".movie_likeit").text(likeCount);
					}
				});
			}
		});
	</script>
</c:if>