<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link href="<c:url value="../res/css/helpCenter/helpCenter-notice-view.css" />"
	rel="stylesheet">

<fmt:parseDate var="parsedDate" value="${noticeBoardDTO.logtime}" pattern="yyyy-MM-dd HH:mm:ss"/>

<div id=wrapper>

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
	               <a href="/mvProject/helpCenter/index.do">> 고객센터</a>
	            </div>
	
	            <div class="helpCenterIndexNaviThirdDiv">
	               <a href="/mvProject/helpCenter/notice_list.do">> 공지/뉴스</a>
	            </div>
			</div>
		</div>
		
		<div class="content">

						<!--  왼쪽 메뉴 클릭 부분 -->
						<div class="col-aside">
							<div class="side_menu">
								<ul>
									<li><a href="/mvProject/helpCenter/index.do">고객센터 메인</a></li>
									<li><a href="/mvProject/helpCenter/Qna_list.do">자주찾는 질문</a></li>
									<li><a href="/mvProject/helpCenter/notice_list.do">공지/뉴스</a></li>
									<li><a href="/mvProject/helpCenter/Qna_emailForm.do">일대일 문의</a></li>
								</ul>
							</div>
							<!-- side_menu -->
						</div>
						<!-- col-aside -->

						<div class="col-detail">
					<div class="customer_top">
                        <h2 class="title">공지/뉴스</h2>
                        <p class="subTitle">Movie Picker의 주요한 이슈 및 여러가지 소식을 확인하실 수 있습니다.</p>
                     </div>
							<!-- customer_top -->

							<div class="board_view_area">
								<table frame="hsides" rules="rows">
									<thead>
										<tr>
											<td width="720px">${noticeBoardDTO.title }</td>
											<td width="160px"><fmt:formatDate value="${parsedDate}" pattern="yyyy.MM.dd"/></td>
											<td width="60px">${noticeBoardDTO.viewcount }</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="3">
												<div class="view_area">
												<pre>${noticeBoardDTO.contents}</pre>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- board_view_area -->

							<div class="customer_btn">
								<input type="button" value="목록으로" onclick="location.href='/mvProject/helpCenter/notice_list.do?pg=${pg}'">
							</div>
							<!-- customer_btn -->

							<div class="boardView_List">
								<c:forEach var="noticePreNextList" items="${noticePreNextList }">
								<ul class="pre_list">
									<li class="stit">이전글 ▲</li>
									<li class="name">
									<c:choose>
										<c:when test="${noticePreNextList.prev_seq == 0 }">
											<a href="#" class="txt">&lt;${noticePreNextList.prev_title }&gt;</a>
										</c:when>
										<c:otherwise>
										<a href="/mvProject/helpCenter/notice_view.do?seq=${noticePreNextList.prev_seq }&pg=${pg}" class="txt">&lt;${noticePreNextList.prev_title }&gt;</a>
										</c:otherwise>
									</c:choose>
									</li>
									<li class="check_writ_area">등록일&nbsp;<span class="check_num">${noticePreNextList.prev_logtime }</span></li>
								</ul>

								<ul class="next_list">
									<li class="stit">다음글 ▼</li>
									<li class="name">
									<c:choose>
										<c:when test="${noticePreNextList.next_seq == 0 }">
											<a href="#" class="txt">&lt;${noticePreNextList.next_title }&gt;</a>
										</c:when>
										<c:otherwise>
										<a href="/mvProject/helpCenter/notice_view.do?seq=${noticePreNextList.next_seq }&pg=${pg}" class="txt">&lt;${noticePreNextList.next_title }&gt;</a>
										</c:otherwise>
									</c:choose>
									</li>
									<li class="check_writ_area">등록일&nbsp;<span class="check_num">${noticePreNextList.next_logtime }</span></li>
								</ul>
							</c:forEach>
							</div>
							<!-- boardView_List -->
						</div>
						<!-- col-detail -->

					</div>
					
	</div>
</div>