<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>​

<link href="<c:url value="../res/css/helpCenter/helpCenter-QnA-view.css" />"
	rel="stylesheet">

<fmt:parseDate var="parsedDate" value="${qnaBoardDTO.logtime}"
	pattern="yyyy-MM-dd HH:mm:ss" />

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
	               <a href="/mvProject/helpCenter/Qna_list.do">> 자주찾는 질문</a>
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
					<h2 class="title">자주찾는 질문</h2>
					<p class="subTitle">회원님들께서 가장 자주하시는 질문을 모았습니다.</p>
					<p class="subTitle">궁금하신 내용에 대해 검색해보세요.</p>
				</div>
				<!-- customer_top -->

				<div class="board_view_area">
					<table frame="hsides" rules="rows">
						<thead>
							<tr>
								<td width="720px">${qnaBoardDTO.title }</td>
								<td width="160px"><fmt:formatDate value="${parsedDate}"
										pattern="yyyy.MM.dd" /></td>
								<td width="60px">${qnaBoardDTO.viewcount }</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="3">
									<div class="view_area">
										<pre>${qnaBoardDTO.contents}</pre>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- board_view_area -->

				<div class="customer_btn">
					<input type="button" value="목록으로"
						onclick="location.href='/mvProject/helpCenter/Qna_list.do?pg=${pg}&searchtext=${searchtext}'">
				</div>
				<!-- customer_btn -->

				<div class="boardView_List">
					<c:forEach var="qnaPreNextList" items="${qnaPreNextList }">
						<ul class="pre_list">
							<li class="stit">이전글 ▲</li>
							<li class="name">
							<c:choose>
							<c:when test="${qnaPreNextList.prev_seq == 0}">
								<a href="#" class="txt">&lt;${qnaPreNextList.prev_title }&gt;</a>
							</c:when>
							<c:otherwise>
								<a href="/mvProject/helpCenter/Qna_view.do?seq=${qnaPreNextList.prev_seq }&pg=${pg}&searchtext=${searchtext}" class="txt">&lt;${qnaPreNextList.prev_title }&gt;</a>
							</c:otherwise>
							</c:choose>							
							</li><li class="check_writ_area">등록일&nbsp;<span class="check_num">${qnaPreNextList.prev_logtime }</span></li>
						</ul>

						<ul class="next_list">
							<li class="stit">다음글 ▼</li>
							<li class="name">
							<c:choose>
							<c:when test="${qnaPreNextList.next_seq == 0 }">
							<a href="#" class="txt">&lt;${qnaPreNextList.next_title }&gt;</a>
							</c:when>
							<c:otherwise>
							<a href="/mvProject/helpCenter/Qna_view.do?seq=${qnaPreNextList.next_seq }&pg=${pg}&searchtext=${searchtext}" class="txt">&lt;${qnaPreNextList.next_title }&gt;</a>
							</c:otherwise>
							</c:choose>
							</li>
							<li class="check_writ_area">등록일&nbsp;<span class="check_num">${qnaPreNextList.next_logtime }</span></li>
						</ul>
					</c:forEach>
				</div>
				<!-- boardView_List -->
			</div>
			<!-- col-detail -->

		</div>

	</div>
</div>

