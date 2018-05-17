<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value="../res/css/myPage/myMovielog.css" />"rel="stylesheet">


<!-- 바디를 전체감싸고있는 Wrapper -->

<div id="bodyWrapper">
   <!-- 네비부분 -->
   <div class="helpCenterIndexNavi">
      <div class="helpCenterIndexMenuDiv">
         <div class="helpCenterIndexImageDiv">
            <a href="/mvProject/main/index.do"> <img
               src="../res/image/main/homeImage.png">
            </a>
         </div>

         <div class="helpCenterIndexNaviSecondDiv">
            <a href="/mvProject/myPage/index.do">> My MoviePicker</a>
         </div>

         <div class="helpCenterIndexNaviThirdDiv">
            <a href="/mvProject/myPage/myMovielog.do">> My MovieLog</a>
         </div>
      </div>
   </div>

   <!-- 실질적인 컨텐츠부분 -->



      <!-- leftDiv+centerDiv를 포함하고있는 Wrapper -->
      <div class="bothDivWrapper">

         <!-- leftDiv -->
         <div class="leftDiv">
               <div class=left_1stBox>
                  <div class="firstBox_1stline">
                     <img src="../res/image/myPage/profileimage.png" class="firstline_profile">
                  </div>
                  <div class="firstline_username">${loginId}님</div>
                  <!-- <div>
                     <a href=#><img src="../res/image/myPage/modifyuserinfo.png" class="firstline_modifyProfile"></a>
                  </div> -->
               </div>

               <div class=left_2ndBox onclick="location.href='/mvProject/myPage/movieWishlist.do'">
                  <div class="firstBox_1stline">
                     <div class="firstline_wishNum">${wishlistCount}</div>
                     <div class="firstline_wishtext">위시리스트</div>
                  </div>
               </div>

               <div class=left_3rdBox onclick="location.href='/mvProject/myPage/myMovielog.do'">
                  <div class="firstBox_1stline">
                     <div class="firstline_movielogNum">${movielogCount}</div>
                     <div class="firstline_movieLogtext">내가 본 영화</div>
                  </div>
               </div>
         </div>
         <!-- centerDiv -->
         <div class="centerDiv">
         
               <!-- title -->
         <div class=movielog_title>
            내가 본 영화<span class=movieNum>&nbsp;&nbsp;&nbsp;(${movielogCount}건)</span>
         </div>
         
         <div class="movielog_bar"></div>
   
         <c:forEach items="${pagelist}" var="movielog"  varStatus="status">
               <!-- movie List -->
         <div class="movielog_wrapper"> 
         <div class=movielog_movieList>
            <div class="movielog_movieList_poster">
               <a href="/mvProject/movieDetail/movieDetail.do?seq=${getMovieInfoForMovielog[status.index].seq}" style="position: absolute;">
               <img src="../res/image/moviePoster/${movielog.movieName}.jpg" class=movieList_poster onERROR="this.src='../res/image/moviePoster/poster_preparing.jpg'">
               </a>
               <img src="../res/image/grade/agelim_${getMovieInfoForMovielog[status.index].movieagelimit}.png" class=grade_image onERROR="this.src='../res/image/moviePoster/onerror_age.png'">
            </div>
            <div class="movielog_grade">
            </div> 

            <div class="movielog_movieList_detail">
               <div class="movielog_movieList_detail_movieNameKr">${movielog.movieName}</div>
               <div class="movielog_movieList_detail_movieNameEn">${getMovieInfoForMovielog[status.index].movienameforeng}</div>
               <div class="movielog_movieList_detail_time">일시: ${movielog.ticketmovieDate}</div>
               <div class="movielog_movieList_detail_place">장소: ${movielog.ticketmovieBranch} ${movielog.ticketmovieScreen} </div>
            </div>
      </div>
      </div>
         <!-- bar -->
         <div class="movielog_bar"></div>      
      </c:forEach>
         
         <!-- paging -->

         <div class=movielog_paging>${movielogPaging.pagingHTML}</div>



      </div> <!-- centerDiv -->
      </div>
   </div>