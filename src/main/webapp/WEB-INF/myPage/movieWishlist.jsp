<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="<c:url value="../res/css/myPage/movieWishlist.css" />"rel="stylesheet">


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
            <a href="/mvProject/myPage/movieWishlist.do">> My Movie WishList</a>
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
         
         <div class=wishlist_title>
            위시리스트<span class=wishlistNum>&nbsp;&nbsp;&nbsp;(${wishlistCount}건)</span>
         </div>
         <div class="movielog_bar"></div>
         
      <div class=movieBox_wrapper>
      <c:forEach items="${pagelist}" var="movielog"  varStatus="status">
      <div class="movieBox">
            <div class="movieBox_poster">
               <img src="../res/image/movies/agelim_${getMovieInfoForWishlist[status.index].movieagelimit}.png" class="poster_grade" style="position: absolute;" onERROR="this.src='../res/image/moviePoster/onerror_age.png'">
                  <a href="/mvProject/movieDetail/movieDetail.do?seq=${getMovieInfoForWishlist[status.index].seq}">
               <img src="../res/image/moviePoster/${getMovieInfoForWishlist[status.index].movienameforkr}.jpg" class="posterImage" onERROR="this.src='../res/image/moviePoster/poster_preparing.jpg'">
                  </a>            
            </div>

         <div class="movieBox_movieNm">${getMovieInfoForWishlist[status.index].movienameforkr}</div>
            
         <div class="movieBox_openDate">${getMovieInfoForWishlist[status.index].moviedate} 개봉</div>
         
         <div class="movieBox_heart"><img src="../res/image/movies/grey_heart.png" class="grey_heart"></div>
         <div class="movie_likeit"><fmt:formatNumber value="${getHeartInfoForWishlist[status.index].heart}" pattern="#,###"/></div>
      </div>
      </c:forEach>         
         </div>
         
         <!-- paging -->

         <div class=wishlist_paging>${wishlistPaging.pagingHTML}</div>

      </div> <!-- centerDiv -->
      </div>
   </div>