<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript"
   src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="<c:url value="../res/css/myPage/myReservationStep1.css" />"
   rel="stylesheet">
   
<script>

function sendMoviecode(ticketmovieCode) {
   var jsticketmoviecode = ticketmovieCode;
   location.href="/mvProject/myPage/myReservationStep2.do?ticketmoviecode="+jsticketmoviecode;
};

</script>


<div class="bodyWrapper">

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
            <a href="/mvProject/myPage/myReservationStep1.do">> 나의 예매내역</a>
         </div>
      </div>
   </div>

   <div class="myReservationStep1_totalWrapper">

      <div class="myCgvProfileContentsDiv">
         <img src="../res/image/myPage/myCgvProfileRealBackGround.jpg"
            class="myCgvProfileContentsDivImg">
         <div class="myCgvProfileFirstContents">

            <div class="profileImageContents">
               <img src="../res/image/myPage/profileimage.png">
            </div>

            <div class="secondMyCgvProfileRealContents">
					<div class="profileNameDiv">
						<div class="firstNameDiv">
							<h2>${memberDTO.name }님</h2>
						</div>
						<div class="secondNameDiv">
							<h4>${memberDTO.id }</h4>
						</div>
						
					</div>

					<div class="profileGradeDiv">
						<h3>
							고객님은 <span>${memberDTO.grade }</span>입니다.
						</h3>
					</div>

				</div>
         </div>

         <div class="myCgvProfileSecondContents">
            <div class="myCgvCouponDiv">
               <div class="couponLabelDiv">
                  <img src="../res/image/myPage/mycoupon.png">
               </div>

               <div class="couponContentDiv">
                  <div class="movieTicketLabel">
                     <h4>영화관람권</h4>
                  </div>
                  <div class="movieTicketCount">${memberDTO.couponNumber }개</div>
               </div>
            </div>
            <div class="myCgvOnePointDiv">
               <div class="onePointLabelDiv">
                  <img src="../res/image/myPage/realMyPoint.png">
               </div>

               <div class="onePointContentsDiv">
                  <div class="possiblePoint">
                     <div class="possiblePointLabel">
                        <h4>CJ ONE 사용가능 포인트</h4>
                     </div>
                     <div class="possiblePointValue">
                        <h4>
                           <fmt:formatNumber pattern="#,###"
                              value="${memberDTO.memberPoint }" />
                           점
                        </h4>
                     </div>
                  </div>
                  <div class="vipCheckPoint">
                     <div class="vipCheckPointLabel">
                        <h4>VIP선정 포인트</h4>
                     </div>
                     <div class="vipCheckPointValue">
                        <h4>
                           <fmt:formatNumber pattern="#,###"
                              value="${memberDTO.gradePoint }" />
                           점
                        </h4>
                     </div>
                  </div>
               </div>
            </div>

         </div>

      </div>

      <div class="myReservationStep1_contentsWrapper">

         <!-- leftDiv -->
         <div class="leftDiv">
				<div class="mvHome">
					<span> <a href="/mvProject/myPage/index.do">MY HOME</a>
					</span>
				</div>
				<ul>
					<li class="myReservation"><a href="/mvProject/myPage/myReservationStep1.do">나의 예매내역</a></li>
					<li class="discountCoupon"><a href="/mvProject/myPage/movieticket.do">MY 영화관람권</a></li>
					<li class="mvPoint"><a href="/mvProject/myPage/mypoint.do">MY 포인트</a></li>
					<li class="clientInfo"><a href="/mvProject/myPage/index.do">회원 정보</a>
						<div class="inLineUlDivFirst">
							<ul>
								<li><a href="/mvProject/myPage/myInfoForm.do"> > 개인정보 변경</a></li>
								<li><a href="/mvProject/myPage/myInfoDelete.do"> > 회원탈퇴</a></li>
							</ul>
						</div></li>
					<li class="myInquiryList"><a
						href="/mvProject/myPage/myInquiryQnAList.do">나의 문의 내역</a></li>
					<li class="watchMovieList"><a href="/mvProject/myPage/myMovielog.do">내가 본 영화</a></li>
				</ul>
			</div>

         <!-- body div 내가 짤 부분 / 예매내역 -->
         <div class="myReservationStep1Wrapper">


            <!-- body 안에 있는 세개의 메뉴 -->
            <div class="firstDetailDiv">
               <div class="wishListDiv">
                  <div class="wishListImage">
                     <a href="#"> <img src="../res/image/myPage/heartImage.png">
                     </a>
                  </div>
                  <div class="wishListLabel">
                     <h4>위시리스트</h4>
                  </div>
                  <div class="wishListContents">
                     <ul>
                        <li>보고싶은 영화들을 미리</li>
                        <li>담아 두고 싶다면?</li>
                     </ul>
                  </div>
               </div>
               <div class="seeTheMovieDiv">
                  <div class="seeTheMovieImage">
                     <a href="#"> <img src="../res/image/myPage/movieImage.png">
                     </a>
                  </div>
                  <div class="seeTheMovieLabel">
                     <h4>내가 본 영화</h4>
                  </div>
                  <div class="seeTheMovieContents">
                     <ul>
                        <li>관람한 영화들을 한번에</li>
                        <li>모아 보고 싶다면?</li>
                     </ul>
                  </div>
               </div>
               <div class="watchMovieDiv">
                  <div class="watchMovieImage">
                     <a href="#"> <img src="../res/image/myPage/ticketImage.png">
                     </a>
                  </div>
                  <div class="watchMovieLabel">
                     <h4>예매내역</h4>
                  </div>
                  <div class="watchMovieContents">
                     <ul>
                        <li>내가 봤던 영화를</li>
                        <li>확인하고 싶다면?</li>
                     </ul>

                  </div>
               </div>
            </div>

<!--------------------------------- 내가 짤 부분입니다!!!!!! --------------------------------------------------->
           <div class="myReservationReal_BodyWrapper">
					<div class="myReservation1_Head">
						<div class="myReservationTitle">
							<span>MY 예매내역</span>
						</div>
						<div class="totalReserv">
							<span>${ticketList.size()} 건</span>
						</div>
						<div class="plusIconImg">
							<img src="../res/image/myPage/plusImage.png">
						</div>
					</div>
					<div class="myReservation1_Body">
					<c:choose>
							<c:when test="${empty ticketList }">
								<span>예매내역이 존재하지 않습니다</span>
							</c:when>
							<c:when test="${!empty ticketList}">
								<c:forEach var="ticketList" items="${ticketList}">
									<div class="oneMovieWrapper">
										<div class="movieCodeWrapper">
											<div class="movieCodeLable">
												<span>예매번호</span>
											</div>
												<div class="movieCode">
													<span>${ticketList.ticketmoviecode}</span>
												</div>
											<form id="sendToStep2">
												<input type="hidden" name="ticketmovieCode" value="${ticketList.ticketmoviecode}">
											</form>
											
										</div>
										<div class="moviePoster">
											<img src="../res/image/moviePoster/${ticketList.ticketmovieposter}">
										</div>
										<div class="movieInfoSection">
											<div class="movieName">
												<span><a href="javascript:sendMoviecode('${ticketList.ticketmoviecode}');">
												${ticketList.ticketmoviename }</a></span>
											</div>
											
											<div class="movieDetailInfoWrapper">
												<div class="fisrtRow_InfoWrapper">
													<div class="movieBranchWrapper">
														<div class="movieBranchLabel">
															<span>관람극장 </span>
														</div>
														<div class="movieBranch">
															<span>${ticketList.ticketmoviebranch}</span>
														</div>
													</div>
													<div class="moviePeopleWrapper">
														<div class="moviePeopleLabel">
															<span>좌석 </span>
														</div>
														<div class="moviePeople">
															<span>${ticketList.ticketmoviepeople}명</span>
														</div>
													</div>
												</div>
												<div class="secondRow_InfoWrapper">
													<div class="movieDateWrapper">
														<div class="movieDateLabel">
															<span>관람일자 </span>
														</div>
														<div class="movieDate">
															<span>${ticketList.ticketmoviedate}</span>
														</div>
													</div>
													<div class="moviePriceWrapper">
														<div class="moviePriceLabel">
															<span>결제금액 </span>
														</div>
														<div class="moviePrice">
															<span>${ticketList.ticketmovieprice}원</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:when>
						</c:choose>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>