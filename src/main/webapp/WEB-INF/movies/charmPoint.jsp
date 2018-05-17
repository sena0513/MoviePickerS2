<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript"
   src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="<c:url value="/res/css/movies/charmPoint.css" />" rel="stylesheet">
<div id="bodyWrapper">
   <div class="charmPointTotalDiv">
      <div class="charmPointSubjectDiv">
         <h2>매력포인트</h2>
      </div>
      <!--히든값 들 -->
      <input type="hidden" value="${Movienameforkr}" id="movienameforkr">
      <input type="hidden" value="${mv_seq}" id="mv_seq">
      <input type="hidden" value="${page}" id="page">
      <input type="hidden" value="${charmpoint}" id="charmpoint">
      <div class="charmPointContentsDiv">
         <div class="charmPointContentSubjectDiv">
            <h4>이 영화의 매력포인트를 선택해주세요. 중복선택이 가능합니다.</h4>
         </div>
         
         <div class="charmPointCheckBoxDiv">
            <div class="checkBox1">
               <input type="checkbox" id="directorCheckBox" name="director" value="100">
                   <label for="directorCheckBox">감독연출</label>
             </div>   
             
             <div class="checkBox2">
                <input type="checkbox" id="storyCheckBox" name="story" value="100">
                   <label for="storyCheckBox">스토리</label>
             </div>
             
             <div class="checkBox3">   
                <input type="checkbox" id="visualCheckBox" name="charmvisual" value="100">
                   <label for="pictureCheckBox">영상미</label>
             </div>   
             
             <div class="checkBox4">   
                <input type="checkbox" id="actorCheckBox" name="actor" value="100">
                   <label for="actorCheckBox">배우연기</label>   
             </div>
             
             <div class="checkBox5">
                <input type="checkbox" id="ostCheckBox" name="ost" value="100">
                   <label for="ostrCheckBox">O.S.T</label>         
            </div>   
         </div>
         
         <div class="checkBoxConfirmButton">
            <button id="getCheckedAll" type="button">확인
            </button>
         </div>
      </div>
   </div>
</div>
<script>
	
	$("#getCheckedAll").click(function() {
			if ($('input:checkbox[id="directorCheckBox"]').is(":checked")){
				var charmdirector = $('input:checkbox[id="directorCheckBox"]').val();
			}else{var charmdirector=0;}
			if($('input:checkbox[id="storyCheckBox"]').is(":checked")){
				var charmstory = $('input:checkbox[id="storyCheckBox"]').val();
			}else{var charmstory=0;}
			if($('input:checkbox[id="visualCheckBox"]').is(":checked")){
				var charmvisual = $('input:checkbox[id="visualCheckBox"]').val();	
			}else{var charmvisual=0;}
			if($('input:checkbox[id="actorCheckBox"]').is(":checked")){
				var charmactor = $('input:checkbox[id="actorCheckBox"]').val();	
			}else{var charmactor=0;}
			if($('input:checkbox[id="ostCheckBox"]').is(":checked")){
				var charmost = $('input:checkbox[id="ostCheckBox"]').val();	
			}else{var charmost=0;}
			
			location.href="/mvProject/moviePoint/charmPointregit.do?mv_seq="+$('#mv_seq').val()+
			"&movienameforkr="+$('#movienameforkr').val()+
			"&page="+$('#page').val()+"&charmdirector="+charmdirector+"&charmstory="+charmstory+"&charmvisual="+charmvisual+
			"&charmactor="+charmactor+"&charmost="+charmost;
	});
			if($('#charmpoint').val() == 1){				
			opener.location.href='/mvProject/moviePoint/moviePoint.do?mv_seq='+$('#mv_seq').val()+
			'&movienameforkr='+$('#movienameforkr').val()+
			'&page='+$('#page').val(); 
			window.close();
			}
	
	
	
</script>