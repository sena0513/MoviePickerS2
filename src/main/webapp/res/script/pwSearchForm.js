
$(document).ready(function(){
   $("#id").keyup(function(){
		   if($("#id").val()!=""){
			    for(i=0; i<$("#id").val().length; i++){
			    	var ch = $("#id").val().charAt(i)
			    	if(!(ch>='0'&& ch<='9')&&!(ch>='a'&&ch<='z')||
			    	  ($("#id").val().length<4 ||$("#id").val().length>16)){
			    		 $("#idDiv").text("영문/숫자로 4~16자리(공백불가)"); 
			    	}else{$("#idDiv").text("")}
			    }
			 }else if($("#id").val()==""){
				 $("#idDiv").text("아이디를 입력하세요."); 
			 }
	})	
	$("#idcheckButton").click(function(){
        $.ajax({
            type : "POST",
            url : "/mvProject/member/pwSearch_idCheck.do",
            data : "id="+$('#id').val(),
            dataType : "text",
            success : function(data){
               if(data=="exist"){
                   location.href="/mvProject/member/pwSearch_userVerifyForm.do?id="+$('#id').val();
               }else if(data=="non_exist"){
                  alert("존재하지 않는 아이디 입니다. 아이디를 확인해 주세요.")
               }
            }
        });
	}) 
});
