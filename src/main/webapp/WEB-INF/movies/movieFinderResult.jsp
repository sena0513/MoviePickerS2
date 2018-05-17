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

<link href="<c:url value="../res/css/movies/movieFinderResult.css" />" rel="stylesheet">

<!-- 제작년도 슬라이드부분 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>

<div id=form>

	<script type="text/javascript">
		$(document).ready(
				function() {
					function makefunc(targetpage) {
						return function() {
							$("#page").attr("action", targetpage);
							$("#page").submit();
						};
					}
					;
					$(".boxoffice_moviePoster").click(
							makefunc("/mvProject/movieDetail/movieDetail.do"));
					
					 $("#slider-range").slider({
				            range: true,
				            min: 1950,
				            max: 2030,
				            values: ["${year_start}", "${year_end}"],
				            slide: function(event, ui) {
				               $("#year_start").val(ui.values[0]);
				               $("#year_end").val(ui.values[1]);
				            }
				         });
				         $("#year_start").val($("#slider-range").slider("values", 0));
				         $("#year_end").val($("#slider-range").slider("values", 1));
				});
	</script>

<div id=wrapper>

	<div class="bodyWrapper">
		<!-- 네비부분 -->
		<div class="helpCenterIndexNavi">
			<div class="helpCenterIndexMenuDiv">
				<div class="helpCenterIndexImageDiv">
					<a href="/mvProject/main/index.do">
					<img src="../res/image/main/homeImage.png">
					</a>
				</div>

				<div class="helpCenterIndexNaviSecondDiv">
					<a href="/mvProject/movieChart/movieChart.do">> 영화</a>
				</div>

				<div class="helpCenterIndexNaviThirdDiv">
					<a href="/mvProject/movieFinder/movieFinderIndex.do">> 무비파인더</a>
				</div>
			</div>
		</div>
		
		<div class="contents">
				<div class="sect-common">
					<form action="/mvProject/movieFinder/movieFinderResult.do"
						method="get">
						<div class="sect-finder">
							<div class="section-f">
								<h3>
									<img
										src="../res/image/movies/movieFinderbar.png" >
								</h3>
							</div>
							<div class="section-f">
								<table>
									<th>영화검색</th>
									<td><select title="영화검색 목록" id="searchfield" name="searchfield">
											<option value="movienameforkr"
												<c:if test="${'movienameforkr'==searchfield }"> selected</c:if>>영화제목</option>
											<option value="movieactor"
												<c:if test="${'movieactor'==searchfield }"> selected</c:if>>주연배우</option>
											<option value="moviemaker"
												<c:if test="${'moviemaker'==searchfield }"> selected</c:if>>감독</option>
									</select> 
									<c:choose>
										<c:when test="${searchtext eq '검색한 키워드가 없습니다.' }">
											<input type="text" placeholder="키워드를 입력해주세요." id="searchtext" name="searchtext" minlength="2" maxlength="20"	>
										</c:when>
										<c:otherwise>
											<input type="text" placeholder="키워드를 입력해주세요." id="searchtext" name="searchtext" minlength="2" maxlength="20"	value="${searchtext }">
										</c:otherwise>
									</c:choose>
									
									</td>
								</table>
							</div>
							<div class="section-f">
								<table>
									<th>장르</th>
									<td>
										<ul>
											<li class="collage"><input type="checkbox" id="all_genre" <c:if test="${fn:contains(genre, '가족, 공포/호러, 드라마, SF, 멜로/로맨스, 코미디, 애니메이션, 느와르, 다큐멘터리, 미스터리, 범죄, 스릴러, 시대극, 액션, 어드벤처, 전쟁, 재난, 환타지, 모험')}"> checked</c:if>><label for="all_genre">전체</label></li>
											<li><input type="checkbox" id="genre1" name="genre" value="가족" <c:if test="${fn:contains(genre, '가족')}"> checked</c:if>><label for="genre1">가족</label></li>
											<li><input type="checkbox" id="genre2" name="genre" value="공포/호러" <c:if test="${fn:contains(genre, '공포/호러')}"> checked</c:if>><label for="genre2">공포/호러</label></li>
											<li><input type="checkbox" id="genre3" name="genre" value="드라마" <c:if test="${fn:contains(genre, '드라마')}"> checked</c:if>><label for="genre3">드라마</label></li>
											<li><input type="checkbox" id="genre4" name="genre" value="SF" <c:if test="${fn:contains(genre, 'SF')}"> checked</c:if>><label for="genre4">SF</label></li>
											<li><input type="checkbox" id="genre5" name="genre" value="멜로/로맨스" <c:if test="${fn:contains(genre, '멜로/로맨스')}"> checked</c:if>><label for="genre5">멜로/로맨스</label></li>
											<li><input type="checkbox" id="genre6" name="genre" value="코미디" <c:if test="${fn:contains(genre, '코미디')}"> checked</c:if>><label for="genre6">코미디</label></li>
											<li><input type="checkbox" id="genre7" name="genre" value="애니메이션" <c:if test="${fn:contains(genre, '애니메이션')}"> checked</c:if>><label for="genre7">애니메이션</label></li>
											<li><input type="checkbox" id="genre8" name="genre" value="느와르" <c:if test="${fn:contains(genre, '느와르')}"> checked</c:if>><label for="genre8">느와르</label></li>
											<li><input type="checkbox" id="genre9" name="genre" value="다큐멘터리" <c:if test="${fn:contains(genre, '다큐멘터리')}"> checked</c:if>><label for="genre9">다큐멘터리</label></li>
											<li><input type="checkbox" id="genre10" name="genre" value="미스터리" <c:if test="${fn:contains(genre, '미스터리')}"> checked</c:if>><label for="genre10">미스터리</label></li>
											<li><input type="checkbox" id="genre11" name="genre" value="범죄" <c:if test="${fn:contains(genre, '범죄')}"> checked</c:if>><label for="genre11">범죄</label></li>
											<li><input type="checkbox" id="genre12" name="genre" value="스릴러" <c:if test="${fn:contains(genre, '스릴러')}"> checked</c:if>><label for="genre12">스릴러</label></li>
											<li><input type="checkbox" id="genre13" name="genre" value="시대극" <c:if test="${fn:contains(genre, '시대극')}"> checked</c:if>><label for="genre13">시대극/사극</label></li>
											<li><input type="checkbox" id="genre14" name="genre" value="액션" <c:if test="${fn:contains(genre, '액션')}"> checked</c:if>><label for="genre14">액션</label></li>
											<li><input type="checkbox" id="genre15" name="genre" value="어드벤처" <c:if test="${fn:contains(genre, '어드벤처')}"> checked</c:if>><label for="genre15">어드벤처</label></li>
											<li><input type="checkbox" id="genre16" name="genre" value="전쟁" <c:if test="${fn:contains(genre, '전쟁')}"> checked</c:if>><label for="genre16">전쟁</label></li>
											<li><input type="checkbox" id="genre17" name="genre" value="재난" <c:if test="${fn:contains(genre, '재난')}"> checked</c:if>><label for="genre17">재난</label></li>
											<li><input type="checkbox" id="genre18" name="genre" value="환타지" <c:if test="${fn:contains(genre, '환타지')}"> checked</c:if>><label for="genre18">환타지</label></li>
											<li><input type="checkbox" id="genre19" name="genre" value="모험" <c:if test="${fn:contains(genre, '모험')}"> checked</c:if>><label for="genre19">모험</label></li> 
										</ul>
									</td>
								</table>
							</div>

							<div class="section-f">
								<table>
									<th>제작국가</th>
									<td>
										<ul>
											<li><input type="checkbox" id="all_nation" <c:if test="${fn:contains(nation, '한국, 미국, 일본, 중국, 영국, 인도')}"> checked</c:if>><label for="all_nation">전체</label></li>
											<li><input type="checkbox" id="nation1" name="nation" value="한국" <c:if test="${fn:contains(nation, '한국')}"> checked</c:if>><label for="nation1">한국</label></li>
											<li><input type="checkbox" id="nation2" name="nation" value="미국" <c:if test="${fn:contains(nation, '미국')}"> checked</c:if>><label for="nation2">미국</label></li>
											<li><input type="checkbox" id="nation3" name="nation" value="일본" <c:if test="${fn:contains(nation, '일본')}"> checked</c:if>><label for="nation3">일본</label></li>
											<li><input type="checkbox" id="nation4" name="nation" value="중국" <c:if test="${fn:contains(nation, '중국')}"> checked</c:if>><label for="nation4">중국</label></li>
											<li><input type="checkbox" id="nation5" name="nation" value="영국" <c:if test="${fn:contains(nation, '영국')}"> checked</c:if>><label for="nation5">영국</label></li>
											<li><input type="checkbox" id="nation6" name="nation" value="인도" <c:if test="${fn:contains(nation, '인도')}"> checked</c:if>><label for="nation6">인도</label></li>
										</ul>
									</td>
								</table>
							</div>

							<div class="section-f">
								<table>
									<th>관람등급</th>
									<td>
										<ul>
											<li><input type="checkbox" id="all_ageLimit" <c:if test="${fn:contains(ageLimit, '전체관람가, 12세관람가, 15세관람가, 청소년관람불가, 미정')}"> checked</c:if>><label for="all_ageLimit">전체</label></li>
											<li><input type="checkbox" id="ageLimit1" name="ageLimit" value="all" <c:if test="${fn:contains(ageLimit, '전체관람가')}"> checked</c:if>><label for="ageLimit1">전체관람가</label></li>
											<li><input type="checkbox" id="ageLimit2" name="ageLimit" value="12" <c:if test="${fn:contains(ageLimit, '12세관람가')}"> checked</c:if>><label for="ageLimit2">12세관람가</label></li>
											<li><input type="checkbox" id="ageLimit3" name="ageLimit" value="15" <c:if test="${fn:contains(ageLimit, '15세관람가')}"> checked</c:if>><label for="ageLimit3">15세관람가</label></li>
											<li><input type="checkbox" id="ageLimit4" name="ageLimit" value="chungbul" <c:if test="${fn:contains(ageLimit, '청소년관람불가')}"> checked</c:if>><label for="ageLimit4">청소년관람불가</label></li>
											<li><input type="checkbox" id="ageLimit5" name="ageLimit" value="mijeong" <c:if test="${fn:contains(ageLimit, '미정')}"> checked</c:if>><label for="ageLimit5">미정</label></li>
										</ul>
									</td>
								</table>
								<script type="text/javascript">
								/* 장르 전체 선택 / 해제 */
								$("#all_genre").click(function() {
									if ($("#all_genre").prop("checked")) {
										$("input[name=genre]").prop("checked", true);
									} else {
										$("input[name=genre]").prop("checked", false);
									}
								})

								$("input[name=genre]").click(function() {
									if ($("input[name=genre]:checked").length == 19) {
										$("#all_genre").prop("checked", true);
									} else {
										$("#all_genre").prop("checked", false);
									}
								})

								/* 제작국가 전체 선택 / 해제 */
								$("#all_nation").click(function() {
									if ($("#all_nation").prop("checked")) {
										$("input[name=nation]").prop("checked", true);
									} else {
										$("input[name=nation]").prop("checked", false);
									}
								})

								$("input[name=nation]").click(function() {
									if ($("input[name=nation]:checked").length == 7) {
										$("#all_nation").prop("checked", true);
									} else {
										$("#all_nation").prop("checked", false);
									}
								})

								/* 관람등급 전체 선택 / 해제 */
								$("#all_ageLimit").click(function() {
									if ($("#all_ageLimit").prop("checked")) {
										$("input[name=ageLimit]").prop("checked", true);
									} else {
										$("input[name=ageLimit]").prop("checked", false);
									}
								})

								$("input[name=ageLimit]").click(function() {
									if ($("input[name=ageLimit]:checked").length == 5) {
										$("#all_ageLimit").prop("checked", true);
									} else {
										$("#all_ageLimit").prop("checked", false);
									}
								})
								</script>
							</div>
						
							<div class="section-f">
								<table>
									<th>제작년도</th>
									<td>
										<div id="slider-range"></div>
										<c:choose>
											<c:when test="${year_start eq null }">
												<input type="text" maxlength="4" id="year_start" name="year_start" value="1960" size="2">
											</c:when>
											<c:otherwise>
												<input type="text" maxlength="4" id="year_start" name="year_start" value="${year_start }" size="2">
											</c:otherwise>
										</c:choose> - 
										<c:choose>
											<c:when test="${year_end eq null }">
												<input type="text" maxlength="4" id="year_end" name="year_end" value="2020" size="2" readonly="readonly">
											</c:when>
											<c:otherwise>
												<input type="text" maxlength="4" id="year_end" name="year_end" value="${year_end }" size="2" readonly="readonly">
											</c:otherwise>
										</c:choose>년
									</td>
								</table>
							</div>
							<div class="secion-f" align="center">
								<input type="submit" value="검색" id="btn_submit">
								<input type="reset" value="초기화" id="btn_reset" onclick="location.href='/mvProject/movieFinder/movieFinderIndex.do'">
							</div>
						</div>
						<!--sect-finder-->
						<script>
						var genre= "";
						$("input:checkbox[name='genre']").each(function() {
						    if ($(this).attr("checked")) {
						        if (genre !== "") genre += ",";
						        genre += $(this).val();
						    }
						});
				
						var nation= "";
						$("input:checkbox[name='nation']").each(function() {
						    if ($(this).attr("checked")) {
						        if (nation !== "") nation += ",";
						        nation += $(this).val();
						    }
						});
						
						var ageLimit= "";
						$("input:checkbox[name='ageLimit']").each(function() {
						    if ($(this).attr("checked")) {
						        if (ageLimit !== "") ageLimit += ",";
						        ageLimit += $(this).val();
						    }
						});
						
					
						</script>
					</form>
				</div>
				<!--sect-common-->

				<form id="search_resultList">
					<!-- ------------------ 검색 조건 ------------------------ -->
					<h3 class="sub">
						<img
							src="http://img.cgv.co.kr/R2014/images/title/h3_search_results.gif"
							alt="CGV TOP100"> 
							<span style="display:">아래의 선택조건에  해당하는 영화가 총 ${MovieTotalA } 건 검색되었습니다.</span>
					</h3>
					<div class="search_result_textbox">
						<div class="spec">
							
							<div class="spec_Left_Div">
								<ul>
									<li>키워드</li>
									<li>장르</li>
									<li>제작국가</li>
									<li>관람등급</li>
									<li>제작년도</li>
								</ul>
							</div>
							
							
							<div class="spec_Right_Div">
								<ul>
									<li>${searchtext }</li>									
									<li>
									<c:choose>
										<c:when test="${genre eq '가족, 공포/호러, 드라마, SF, 멜로/로맨스, 코미디, 애니메이션, 느와르, 다큐멘터리, 미스터리, 범죄, 스릴러, 시대극, 액션, 어드벤처, 전쟁, 재난, 환타지, 모험' }">
											전체
										</c:when>
										<c:otherwise>
											${genre}
										</c:otherwise>
									</c:choose>
									</li>
									<li>
										<c:choose>
											<c:when test="${nation eq '한국, 미국, 일본, 중국, 영국, 인도' }">
												전체
											</c:when>
											<c:otherwise>
												${nation}
											</c:otherwise>
										</c:choose>
									</li>
									<li>
										<c:choose>
											<c:when test="${ageLimit eq '전체관람가, 12세관람가, 15세관람가, 청소년관람불가, 미정' }">
												전체
											</c:when>
											<c:otherwise>
												${ageLimit }
											</c:otherwise>
										</c:choose>
									</li>
									<li>${year_start }년 ~ ${year_end }년</li>
								</ul>
							
							</div>
						</div>
					</div>
					<!-- search_result_textbox -->

					<!-- 검색된 영화 나오는 곳 -->
					<div id="MovieSet1">
								<c:choose>
								<c:when test="${fn:length(finderList) ne 0}">
								<c:forEach items="${finderList}" var="MovieplatformDTO" varStatus="status">
								<div id="movieN">
									<div class="box-image">
										<div class="thumb-image">
											<img
												src="../res/image/movieImage/agelim_${MovieplatformDTO.movieagelimit}.png"
												class="boxoffice_agelim"
												onERROR="this.src='../res/image/moviePoster/onerror_age.png'">
											<a 	href="/mvProject/movieDetail/movieDetail.do?seq=${MovieplatformDTO.seq}">
												<img src="../res/image/moviePoster/${MovieplatformDTO.moviepostimg}"
												class="boxoffice_moviePoster"
												onERROR="this.src='../res/image/moviePoster/poster_preparing.jpg'">
											</a>
										</div>
									</div>

									<div class="boxoffice_movieNm">${MovieplatformDTO.movienameforkr}</div>
									<input type=hidden value="${MovieplatformDTO.movienameforkr}" name="movienameforkr">
									<fmt:parseDate var="parsedDate" value="${MovieplatformDTO.moviedate}" pattern="yyyy-MM-dd HH:mm:ss"/>
									<div class="boxoffice_openDate"><fmt:formatDate value="${parsedDate}" pattern="yyyy.MM.dd"/> 개봉</div>
									<div class="boxoffice_heart">
										<img src="../res/image/movieImage/grey_heart.png" class="grey_heart">
									</div>
									<div class="movie_likeit">
										<fmt:formatNumber value="${arrMoviePointDTO[status.index].heart}" pattern="#,###" />
									</div>
									<!-- <div class="buyTicket_icon">
										<button style="width: 70px; height: 30px;">
											<img src="../res/image/movieImage/ticketingBtn2.png"
												class="ticketIcon">
										</button>
									</div> -->
								</div>
								</c:forEach>
								</c:when>
								
								<c:otherwise>								
									검색 조건에 해당하는 결과가 없습니다.									
								</c:otherwise>
								</c:choose>
							
					</div>
					<div class="movieSelectPaging">
						${movieFinderPaging.pagingHTML }
					</div>

					
					<div class="ad02">
						<img src="../res/image/movieImage/ad02.jpg" class="adimg02">
					</div>

					<div class="ad03">
						<img src="../res/image/movieImage/ad03.jpg" class="adimg03">
					</div>
				</form>
				<!--  검색 결과 폼  -->

			</div>
		</div>	
	</div>
</div>