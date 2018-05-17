<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page
	import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.Map"%>

<%@page import="java.util.Collection"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.util.JSONBuilder"%>
<%@page import="net.sf.json.JSONArray"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>


<meta name="viewport" content="width=device-width, initial-scale=1">


<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.min.js"></script>




<link href="<c:url value="../res/css/movies/reviewDetail.css" />"
	rel="stylesheet">

<div class="reviewWrapper">

	<!-- ------------Bar : review -------------------------- -->

	<div class="movieDetail_bar">
		<div class="bar_yellow"></div>
		<div class="bar_black1">&nbsp;&nbsp;실관람객 평점</div>
		<div class="bar_black2">관람일 포함 7일 이내 관람평을 남기시면 CJ ONE 20P가
			적립됩니다.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
		<div class="bar_black3">
			<input type="button" value="평점작성" class="writeGradeButton"> <input
				type="button" value="내 평점" class="myGradeButton"
				name="myGradeButton"
				onclick="location.href='/mvProject/moviePoint/myreview.do'">
		</div>
	</div>

	<!-- ------------Golden egg & Point Chart -------------- -->
	<div id=moviePoint_chart>

		<div class="moviePoint_body">
			<div class="moviePoint_body_left">

				<div class="moviePoint_body_left_header">&emsp;CGV 실제 관람 고객
					평가로 선정된 지수입니다.</div>

				<div class="body_left_bottom">
					<div class="body_left_bottom_1">
						<img src="../res/image/movies/egg.png" class="egg_image">
					</div>
					<div class="body_left_bottom_2">
						<div class="body_left_bottom_2_text">
						<fmt:formatNumber  value="${moviePointDTO.point}" pattern="##"/>%</div>
					</div>
					<div class="body_left_bottom_3">
						<span class="body_left_bottom_3_text1">${moviePointDTO.watchpeople}</span>
						<span class="body_left_bottom_3_text2">명의 </span> <br> <span
							class="body_left_bottom_3_text3">CGV실관람객이 평가해주셨습니다.</span>
					</div>
				</div>

			</div>
			<!-- moviePoint_body_left -->

			<div class="moviePoint_graph">
				<canvas id="myChart"></canvas>
				<script type="text/javascript">
               var director = '<c:out value="${moviePointDTO.charmdirector}"/>';
               var story = '<c:out value="${moviePointDTO.charmstory}"/>';
               var visual = '<c:out value="${moviePointDTO.charmvisual}"/>';
               var actor = '<c:out value="${moviePointDTO.charmactor}"/>';
               var ost = '<c:out value="${moviePointDTO.charmost}"/>';
               var ctx = document.getElementById('myChart').getContext('2d');
               var chart = new Chart(ctx, { 
                   // The type of chart we want to create
                   type: 'radar',
               
                   // The data for our dataset
                   data: {
                       labels: ["감독연출", "스토리", "영상미", "배우연기", "OST"],
                       datasets: [{
                           label: "매력포인트",
                           backgroundColor: 'rgba(179, 181, 198, 0.2)',
                           borderColor: 'rgba(179, 181, 198, 1)',                                              
                           data: [director, 
                        	   story, 
                        	   visual,
                        	   actor, 
                        	   ost],
                       }]
                   },
               
                   // Configuration options go here
                   options: {
                	   scale: {
                           ticks: {
                             beginAtZero: true,
                             min: 0,
                             max: 100,
                             stepSize: 20
                           }
                         }
                   }
               });
            </script>
			</div>

		</div>

	</div>

	<!-- 여기부터 리뷰 복붙해서 적용해야 하는 부분!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->

	<!-- ------------User's reviews ---------------------------*/ -->



	<!-- 여기까지 리뷰 복붙해서 적용해야 하는 부분!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<div id=moviePoint_reviews>
		<!-- review Container -->


	</div>
	<!-- moviePoint_reviews(forEach) -->
	<div class="moviePoint_review_navigator_wrapper">
		<div class="moviePoint_review_navigator">
			<%-- ${reviewPaging.pagingHTML } --%>
		</div>
	</div>
	<form name='frmPopup'
		action="/mvProject/movieDetail/movieWriteGrade2.do" method="post">
		<input type="hidden" id=movieseq name="mv_seq" value="${mv_seq }">
		<input type="hidden" id=moviename name="Movienameforkr"
			value="${Movienameforkr }">
	</form>
	<form name='modifyfrmPopup'
		action="/mvProject/movieDetail/modifyreview.do" method="post">
		<input type="hidden" id=movieseq name="mv_seq" value="${mv_seq }">
		<input type="hidden" id=moviename name="Movienameforkr"
			value="${Movienameforkr }">
	</form>
	<form name='removereview'
		action="/mvProject/movieDetail/removereview.do" method="post">
		<input type="hidden" id=movieseq name="mv_seq" value="${mv_seq }">
		<input type="hidden" id=moviename name="movienameforkr"
			value="${Movienameforkr }">
	</form>
	<form name='reportreview'
		action="/mvProject/movieDetail/reportreview.do" method="post">
		<input type="hidden" value="" id=reportid name=id> <input
			type="hidden" id=movieseq name="mv_seq" value="${mv_seq }"> <input
			type="hidden" id=moviename name="movienameforkr"
			value="${Movienameforkr }">
	</form>



</div>
<!-- contents div -->

<script type="text/javascript">
window.onload = function () {
	
	var mv_seq = '<c:out value="${mv_seq}"/>';
	var page = 1;
	
	var allData = { "mv_seq": mv_seq, "page": page};
	
     var reviewFunc = function(allData){ 
    	  $.ajax({
             type : "POST",
             url : "/mvProject/movieDetail/reviewpaging.do",
             data: allData, 
            dataType : "json",           
            success : function(result) {
            	
            	var response = result.list;
            	var paging = result.reviewPaging;
            	
            	if(response.length == 0){
            		$("#moviePoint_reviews").html("");
            		$(".moviePoint_review_navigator_wrapper").html("");
            	}else{
            		$("#moviePoint_reviews").empty();
            		$.each(response, function(index, item){ 
            			
              				
            			$("#moviePoint_reviews").append(
            					"<div class=moviePoint_review_box>"+            				      
            			        "<div class=moviePoint_reviewDetail>"+
            			           "<div class=moviePoint_eggOrFry_N_profileImg>"+
            			              "<img src=../res/image/movies/egg.png class=egg_stamp>"+
            			              "<img src=../res/image/movies/profile_manage.png class=profile>"+
            			           "</div>"+
            			        
            			           "<div class=moviePoint_reviewerID>"+
            			           item.id+            			   
            			           "</div>"+
            			           
            			           "<div class=moviePoint_reviewer_Comment><pre>"+
            			              item.reviewcontents+
            			           "</pre></div>"+
            			           
            			      "<div class=moviePoint_dateAndLikeit>"+
            			           
            			           "<div class=moviePoint_reviewer_enrollDate>"+
            			           item.reviewdate+
            			           "</div>"+
            			           
            			           "</div>"+
            			           
            			        "</div>"+
            			       
            			        "<div class='dropdownreview'>"+
                                "<input type='button' onclick=myFunction('myDropdown"+item.id+"') class='dropbtnreview'"+
                                " style='border: 0; outline: 0;'>"+
                                   "<div id='myDropdown"+item.id+"' class='dropdown-contentreview"+item.id+" dropdown-contentreview'>");
            				if(item.id == result.loginId){
                           	$(".dropdown-contentreview"+item.id).append(
                           "<div><input type='button' value='평점수정' onclick=modifyFunction() class='gradeModifyButton'></div>"+
                           "<div><input type='button' value='평점삭제' onclick='removeFunction()' class='gradeDeleteButton' ></div>");
                            }else{
                            	$(".dropdown-contentreview"+item.id).append(
                        	   "<div><input type='button' value='스포신고' onclick=reportFunction('"+item.id+"') class='gradeModifyButton'></div>"+
                               "<div><input type='button' value='욕설신고' onclick=reportFunction('"+item.id+"') class='gradeDeleteButton'></div>");
                            }
                            $(".dropbtnreview").append(
                                "</div>"+                      
                              "</div>"
            			        
            			      );
              			
            		});
            		
            		
            		//페이징 처리
                	$(".moviePoint_review_navigator").empty();
         	        
         	        if(paging.startPage > paging.pageBlock){            //첫번째 블럭이 아니면

         	        	$(".moviePoint_review_navigator").append("<a href='#' onclick='return false;' class=\"goBackPage\">"+' [이전] '+"</a>");        //뒤로가기버튼 활성화

         	        }

         	        	
         	        for(var i = paging.startPage ; i <= paging.endPage ; i++){        //시작페이지부터 종료페이지까지 반복문

         	        	$(".moviePoint_review_navigator").append("<a href='#' onclick='return false;' class=\"goPage\" data-page=\""+i+"\">["+ i +"]</a>"); //버튼 활성화
         	        	

         	        }

         	        if(paging.endPage < paging.totalP){            //전체페이지블럭수가 현재블럭수보다 작을때

         	        	$(".moviePoint_review_navigator").append("<a href='#' onclick='return false;' class=\"goNextPage\">"+' [다음] '+"</a>");         //다음페이지버튼 활성화

         	        }

            	}
            
            }
 	});
   }
     reviewFunc(allData);
}
</script>

<script>

var reviewFunc = function(allData){ 
	  $.ajax({
       type : "POST",
       url : "/mvProject/movieDetail/reviewpaging.do",
       data: allData, 
      dataType : "json",           
      success : function(result) {
    	
      	var response = result.list;
      	var paging = result.reviewPaging;
      	
      	if(response.length == 0){
      		
      		$("#moviePoint_reviews").html("");
      		$(".moviePoint_review_navigator_wrapper").html("");
      	}else{           
      			$("#moviePoint_reviews").empty();
      		$.each(response, function(index, item){
      			
      			$("#moviePoint_reviews").append(
      					"<div class=moviePoint_review_box>"+            				      
      			        "<div class=moviePoint_reviewDetail>"+
      			           "<div class=moviePoint_eggOrFry_N_profileImg>"+
      			              "<img src=../res/image/movies/egg.png class=egg_stamp>"+
      			              "<img src=../res/image/movies/profileImg.png class=profile>"+
      			           "</div>"+
      			        
      			           "<div class=moviePoint_reviewerID>"+item.id+
      			           
      			           "</div>"+
      			           
      			           "<div class=moviePoint_reviewer_Comment><pre>"+
      			              item.reviewcontents+
      			           "</pre></div>"+
      			           
      			      "<div class=moviePoint_dateAndLikeit>"+
      			           
      			           "<div class=moviePoint_reviewer_enrollDate>"+
      			           item.reviewdate+
      			           "</div>"+
      			           
      			           
      			           "</div>"+
      			           
      			        "</div>"+
      			        
      			        
      			      "<div class='dropdownreview'>"+
                      "<input type='button' onclick=myFunction('myDropdown"+item.id+"') class='dropbtnreview'"+
                      " style='border: 0; outline: 0;'>"+
                         "<div id='myDropdown"+item.id+"' class='dropdown-contentreview"+item.id+" dropdown-contentreview'>");
  				if(item.id == result.loginId){
                 	$(".dropdown-contentreview"+item.id).append(
                 "<div><input type='button' value='평점수정' onclick=modifyFunction() class='gradeModifyButton'></div>"+
                 "<div><input type='button' value='평점삭제' onclick='removeFunction()' class='gradeDeleteButton'></div>");
                  }else{
                  	$(".dropdown-contentreview"+item.id).append(
              	   "<div><input type='button' value='스포신고' onclick=reportFunction('"+item.id+"') class='gradeModifyButton'></div>"+
                   "<div><input type='button' value='욕설신고' onclick=reportFunction('"+item.id+"') class='gradeDeleteButton'></div>");
                  }
                  $(".dropbtnreview").append(
                      "</div>"+                      
                    "</div>"
  			      );
      		
      		});      
      		//페이징 처리
          	$(".moviePoint_review_navigator").empty();
   	        if(paging.startPage > paging.pageBlock){            //첫번째 블럭이 아니면
   	        	$(".moviePoint_review_navigator").append("<a href='#' onclick='return false;' class=\"goBackPage\">"+' <이전] '+"</a>");        //뒤로가기버튼 활성화
   	        }
   	        for(var i = paging.startPage ; i <= paging.endPage ; i++){        //시작페이지부터 종료페이지까지 반복문
   	        	                            //현재페이지가 반복중인 페이지와 같다면
	$(".moviePoint_review_navigator").append("<a href='#' onclick='return false;' class=\"goPage\" data-page=\""+i+"\">["+ i +"]</a>"); //버튼 활성화
   	        }
   	        if(paging.endPage < paging.totalP){            //전체페이지블럭수가 현재블럭수보다 작을때
   	        	$(".moviePoint_review_navigator").append("<a href='#' onclick='return false;' class=\"goNextPage\"> "+'[다음]'+" </a>");         //다음페이지버튼 활성화
   	        }
      	}
      }
});
}
//뒷페이지로 가기 버튼 이벤트

$('body').on('click' , '.goBackPage', function() {
	
	var mv_seq = '<c:out value="${mv_seq}"/>';
	var page = Number(paging.startPage) - 1;
	var allData = { "mv_seq": mv_seq, "page": page};
	reviewFunc(allData);
});

$('body').on('click' , '.goPage', function() {
	
	var mv_seq = '<c:out value="${mv_seq}"/>';
	var page = $(this).attr("data-page");
	var allData = { "mv_seq": mv_seq, "page": page};
	reviewFunc(allData);
});

$('body').on('click' , '.goNextPage', function() {
	
	
	var mv_seq = '<c:out value="${mv_seq}"/>';
	var page = Number(paging.endPage) + 1;
	var allData = { "mv_seq": mv_seq, "page": page};
	reviewFunc(allData);
       
});
</script>
<c:if test="${empty loginId }">
	<script type="text/javascript">
var mv_seq = '<c:out value="${mv_seq}"/>'
	$('.writeGradeButton').click(function(){
		if(confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?") ==true){
			location.href="/mvProject/main/loginForm.do?returnURL=movieDetail&mv_seq="+mv_seq+"";
		}else{
			return;
		}
	});
	
var mv_seq = '<c:out value="${mv_seq}"/>'
	$('.myGradeButton').click(function(){
		if(confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?") ==true){
			location.href="/mvProject/main/loginForm.do?returnURL=movieDetail&mv_seq="+mv_seq+"";
		}else{
			return;
		}
	});
</script>
</c:if>
<c:if test="${not empty loginId }">
<script type="text/javascript">
$('.writeGradeButton').click(function(){
	$.ajax({
        type : "GET",
        url : "/mvProject/moviePoint/reviewcheck.do",
        data :{"Movienameforkr" : $('#moviename').attr('value'),
              "mv_seq" : $('#movieseq').attr('value')},
        dataType : "json",
        success : function(reviewcheck) {/* 
           alert(JSON.stringify(list)); */
           if(reviewcheck.reviewcheck.length > 0){
        	   if (confirm("리뷰작성을 이미 하셨습니다 수정하시겠습니까?")) {
        		   var popupX = (window.screen.width / 2) - (650 / 2);
  	        		// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

  	        		var popupY= (window.screen.height /2) - (500 / 2);
  	        		// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
  	        		
  	        		var popUrl = "/mvProject/moviePoint/modifyreview.do";
  	        		var popOption ='status=no, resizable=no, scrollbars=no ,width=650, height=500, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY;
  	        		window.open(popUrl,"리뷰수정",popOption);
  	        		
  	        		var modifyfrmPopup= document.modifyfrmPopup;
  	        		modifyfrmPopup.target = '리뷰수정'; //window,open()의 두번째 인수와 같아야 하며 필수다.  
  	        		modifyfrmPopup.submit();
                }else {return}
           }else{
        	   $.ajax({
       	        type : "GET",
       	        url : "/mvProject/moviePoint/movieWriteGrade.do",
       	        data :{"Movienameforkr" : $('#moviename').attr('value'),
       	              "mv_seq" : $('#movieseq').attr('value')},
       	        dataType : "json",
       	        success : function(moviecheck) {/* 
       	           alert(JSON.stringify(list)); */
       	           if(moviecheck.moviecheck.length > 0){
       	        	   var popupX = (window.screen.width / 2) - (675 / 2);
       	        		// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

       	        		var popupY= (window.screen.height /2) - (450 / 2);
       	        		// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
       	        		
       	        		var popUrl = "/mvProject/moviePoint/movieWriteGrade2.do";
       	        		var popOption ='status=no, resizable=no, scrollbars=no ,width=675, height=450, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY;
       	        		window.open(popUrl,"리뷰작성",popOption);
       	        		
       	        		var frmPop= document.frmPopup;
       	        	    frmPop.target = '리뷰작성'; //window,open()의 두번째 인수와 같아야 하며 필수다.  
       	        	    frmPop.submit();
       	           }else{
       	        	  alert("해당영화에 대한 본 이력이 없습니다.");
       	        	  location.href="/mvProject/myPage/index.do";
       	           }
       	           /* $.each(data.regionInfo, function(index, item) {
       	              
       	           } */
       	        }
       	     });
           }
        }
     });
});
function modifyFunction(){
	var popupX = (window.screen.width / 2) - (650 / 2);
	// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
	
	var popupY= (window.screen.height /2) - (500 / 2);
	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	
	var popUrl = "/mvProject/moviePoint/modifyreview.do";
	var popOption ='status=no, resizable=no, scrollbars=no ,width=650, height=500, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY;
	window.open(popUrl,"리뷰수정",popOption);
	
	var modifyfrmPopup= document.modifyfrmPopup;
	modifyfrmPopup.target = '리뷰수정'; //window,open()의 두번째 인수와 같아야 하며 필수다.  
	modifyfrmPopup.submit();
}
function removeFunction(){
	 if (confirm("작성한 리뷰를 삭제 하시겠습니까?")) {
		 var remove= document.removereview;
		 remove.submit();
	 }else{
		 return;
	 }
	
}
function reportFunction(id){
	 if (confirm("해당 리뷰를 신고 하시겠습니까?")) {
		 $('#reportid').attr('value',id);
		 var report= document.reportreview;
		 report.submit();
	 }else{
		 return;
	 }
	
}
</script>
</c:if>
<script>
 function myFunction(aa) {
	          document.getElementById(aa).classList.toggle("show");
};
	   
	      // Close the dropdown menu if the user clicks outside of it
	       window.onclick = function(event) {
	        if (!event.target.matches('.dropbtnreview')) {
	   
	          var dropdowns = document.getElementsByClassName("dropdown-contentreview");
	          var i;
	          for (i = 0; i < dropdowns.length; i++) {
	            var openDropdown = dropdowns[i];
	            if (openDropdown.classList.contains('show')) {
	              openDropdown.classList.remove('show');
	            };
	          };
	        };
	      }; 

</script>

