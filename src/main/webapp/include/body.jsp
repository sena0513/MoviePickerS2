<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
   
<link href="<c:url value="../res/css/main/body.css" />" rel="stylesheet">
<link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet" />
<script src="http://vjs.zencdn.net/c/video.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

<div id="bodyWrapper">
   <div class="slideshow-border">
      <img src="../res/image/main/horizontal-line.png">
   </div>
   <div class="contents">
      <div class="slideshow-container">
         
         <!-- Full-width images with number and caption text -->
         <c:forEach items="${list}" var="item">
         <div class="mySlides fade">
            <img alt="청소년 페스티벌"
               src="../res/image/main/${item.imageslider1 }">
         </div>

         <div class="mySlides fade">
            <img alt="커플저격 프로젝트"
               src="../res/image/main/${item.imageslider2 }">
         </div>

         <div class="mySlides fade">
            <img alt="LET'S PLAY AT CGV!"
               src="../res/image/main/${item.imageslider3 }">
         </div>

         <div class="mySlides fade">
            <img alt="이 달의 CGV 3월"
               src="../res/image/main/${item.imageslider4 }">
         </div>

         <div class="mySlides fade">
            <img alt="치즈 인 더 트랩"
               src="../res/image/main/${item.imageslider5 }">
         </div>

         <div class="mySlides fade">
            <img alt="노블레스"
               src="../res/image/main/${item.imageslider6 }">
         </div>

         <div class="mySlides fade">
            <img alt="아트하우스 아카데미 기획전"
               src="../res/image/main/${item.imageslider7 }">
         </div>

         <div class="mySlides fade">
            <img alt="지만갑 서프라이즈 포토티켓"
               src="../res/image/main/${item.imageslider8 }">
         </div>
		</c:forEach>
         <!-- Next and previous buttons -->
         <a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a class="next"
            onclick="plusSlides(1)">&#10095;</a>
      </div>
      <br>

      <!-- The dots/circles -->
      <div style="text-align: center">
         <span class="dot" onclick="currentSlide(1)"></span> <span class="dot"
            onclick="currentSlide(2)"></span> <span class="dot"
            onclick="currentSlide(3)"></span> <span class="dot"
            onclick="currentSlide(4)"></span> <span class="dot"
            onclick="currentSlide(5)"></span> <span class="dot"
            onclick="currentSlide(6)"></span> <span class="dot"
            onclick="currentSlide(7)"></span> <span class="dot"
            onclick="currentSlide(8)"></span>
      </div>

      <div class="moiveSelectionImage">
         <div class="leftLineImage">
            <img src="../res/image/main/horizontal-line.png">
         </div>
         <div class="centerMovieSel">
            <img src="../res/image/main/movieSelectionImage.png">
         </div>
         <div class="rightLineImage">
            <img src="../res/image/main/horizontal-line.png">
         </div>
      </div>

      <div class="videoDiv">

         <div class="moviePart">

            <video id="testVideo" width="713px" height="368px"
               controls="controls" preload="metadata" autoplay="autoplay" 
               class="video-js vjs-default-skin" data-setup="{}">
               <source src="../res/image/main/infinity_war.mp4" type="video/mp4">
               <source src="../res/image/main/infinity_war.ogg" type="video/ogg">
               <source src="../res/image/main/infinity_war.webm" type="video/webm">
            </video>
         </div>

         <div class="postPart">
            <img src="../res/image/main/movie_image.jpg">
         </div>
      </div>

      <div class="imageEventDiv">
         <div class="leftImageEvent">
            <img src="../res/image/main/horizontal-line.png">
         </div>

         <div class="centerImageEvent">
            <img src="../res/image/main/eventImage.png">
         </div>

         <div class="rightImageEvent">
            <img src="../res/image/main/horizontal-line.png">
         </div>
      </div>

      <div class="eventContentDiv">
         <ul>
         <c:forEach items="${list}" var="item">
            <li class="couple"><a
               href="/mvProject/helpCenter/notice_view.do?seq=27&pg=1&searchtext=&searchfield=title">
                  <img alt="커플저격"
                  src="../res/image/main/${item.event1 }">
            </a></li>

            <li class="cgvOfMarch"><a
               href="/mvProject/helpCenter/notice_view.do?seq=29&pg=1&searchtext=&searchfield=title">
                  <img alt="3월의 씨지비"
                  src="../res/image/main/${item.event2 }">
            </a></li>

            <li class="teenagerBrandFestival"><a
               href="/mvProject/helpCenter/notice_view.do?seq=25&pg=1&searchtext=일산점&searchfield=title">
                  <img alt="청소년 브랜드 페스티벌"
                  src="../res/image/main/${item.event3 }">
            </a></li>

            <li class="specialOfferImax"><a
               href="/mvProject/helpCenter/notice_view.do?seq=26&pg=1&searchtext=&searchfield=title">
                  <img alt="스페셜오퍼 아이맥스"
                  src="../res/image/main/${item.event4 }">
            </a></li>
            </c:forEach>
         </ul>
      </div>

      <div class="horizontalLine">
         <img src="../res/image/main/horizontal-line.png">

      </div>

      <div class="noticeDiv">
         <div class="leftNoticeDiv">
            <h3>공지사항</h3>
         </div>

         <div class="slider">
            <div>
            <c:forEach items="${list}" var="item">
               <p>
                 <a href="/mvProject/helpCenter/notice_view.do?seq=27&pg=1&searchtext=&searchfield=title">${item.notice1}</a>
               </p>

               <p>
                  <a href="/mvProject/helpCenter/notice_view.do?seq=25&pg=1&searchtext=&searchfield=title">${item.notice2 }</a>
               </p>

               <p>
                  <a href="/mvProject/helpCenter/notice_view.do?seq=26&pg=1&searchtext=&searchfield=title">${item.notice3 }</a>
               </p>

               <p>
                  <a href="/mvProject/helpCenter/notice_view.do?seq=29&pg=1&searchtext=&searchfield=title">${item.notice4 }</a>
               </p>

               <p>
                  <a href="/mvProject/helpCenter/notice_view.do?seq=24&pg=2&searchtext=&searchfield=title">${item.notice5 }</a>
               </p>

               <p>
                  <a href="/mvProject/helpCenter/notice_view.do?seq=28&pg=1&searchtext=&searchfield=title">${item.notice6 }</a>
               </p>
               </c:forEach>
            </div>
         </div>

         <div class="slider2">
            <div>
            <c:forEach items="${list}" var="item">
               <p>
                  ${item.notice1date }
               </p>
                  
               <p>
                 ${item.notice2date }
               </p>

               <p>
                  ${item.notice3date }
               </p>

               <p>
                  ${item.notice4date }
               </p>

               <p>
                  ${item.notice5date }
               </p>

               <p>
                  ${item.notice6date }
               </p>
               </c:forEach>
            </div>
         </div>
         
         
      </div>
   </div>
   <!-- contents div -->
</div>
<!-- wholepage div -->

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
     dots[slideIndex-1].className += " active";
     setTimeout(showSlides, 2000); //button 바뀌는것.
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
             setTimeout(carousel,  4000); // Change image every 4 seconds
   }
</script>