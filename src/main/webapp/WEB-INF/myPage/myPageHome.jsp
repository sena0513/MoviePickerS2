<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link href="<c:url value="../res/css/myPage/myPageProfile.css" />"
	rel="stylesheet">

<script>
function popup(){
		
window.open("/mvProject/myPage/go_edit_page.do","","width=550,height=475,left=100,location=1")
}
</script>
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
				<a href="/mvProject/myPage/index.do">> My MoviePicker Home</a>
			</div>
		</div>
	</div>

	<!-- 실질적인 컨텐츠부분 -->

	<div class="moviePickerTotalWrapper">

		<div class="myCgvProfileContentsDiv">
			<img src="../res/image/myPage/myCgvProfileRealBackGround.jpg"
				class="myCgvProfileContentsDivImg">
			<div class="myCgvProfileFirstContents">

				<div class="profileImageContents">
					<c:choose>
                  <c:when test="${memberDTO.profileImage eq null}">
                     <img src="../res/image/myPage/profileimage.png">
                  </c:when>
                  <c:otherwise>
                     <img src="../res/image/profile/${memberDTO.profileImage }">
                  </c:otherwise>
               </c:choose>
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

		<!-- leftDiv+centerDiv를 포함하고있는 Wrapper -->
		<div class="bothDivWrapper">

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

			<!-- centerDiv -->
			<div class="centerDiv">
				<div class="firstDetailDiv">
					<div class="wishListDiv">
						<div class="wishListImage">
							<a href="/mvProject/myPage/movieWishlist.do"> <img src="../res/image/myPage/heartImage.png">
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
							<a href="/mvProject/myPage/myMovielog.do"> <img src="../res/image/myPage/movieImage.png">
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
							<a href="/mvProject/myPage/myReservationStep1.do"> <img src="../res/image/myPage/ticketImage.png">
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

				<div class="secondDetailDiv">
					<div class="myQnAWrapper">
						<div class="myQnARealLabel">
							<h4>MY Q&A</h4>
						</div>
						<div class="myQnACount">
							<h5>${QnaTotalA }건</h5>
						</div>
						<div class="myQnAPlusImage">
							<a href="/mvProject/myPage/myInquiryQnAList.do"> <img src="../res/image/myPage/plusImage.png">
							</a>
						</div>
					</div>
					<div class="myQnAContentsWrapper">
						<table frame="hsides" rules="rows">
							<c:forEach var="QnaDTO" items="${QnaList }">
							<tr>
								<td width="48px" align="center">${QnaDTO.type }</td>
								<td><a
                                    href="/mvProject/myPage/myInquiryQnAView.do?seq=${QnaDTO.seq }&pg=${pg}&searchtext=${searchtext}">${QnaDTO.title }</a></td>
								<td width="117px" align="center">${QnaDTO.situation }</td>
							</tr>
							</c:forEach>
						</table>
					</div>

				</div>
			</div>


		</div>


	</div>
</div>