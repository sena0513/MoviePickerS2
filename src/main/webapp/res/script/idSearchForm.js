$(document).ready(function(){
//keyup 유효성 검사	
		$("#name").keyup(function(){
			if($("#name").val()!=""){
				for(i=0; i<$("#name").val().length; i++){
			    	var ch = $("#name").val().charAt(i)
			    	if(!(ch>='a'&&ch<='z')||($("#name").val().length<2 ||$("#name").val().length>10)){
			    		 $("#nameDiv").text("영문으로 2~10자리(공백불가)"); 
			 			 $("#nameDiv").css("font-size","9pt");
						 $("#nameDiv").css("color","red");
						 $("#nameDiv").css("font-weight","bold");
			    	}else{$("#nameDiv").text("")}
			    }
			}else if($("#name").val()==""){
				 $("#nameDiv").text("이름을 입력하세요."); 
				 $("#nameDiv").css("font-size","9pt");
				 $("#nameDiv").css("color","red");
				 $("#nameDiv").css("font-weight","bold");
			}
		})
		$("#birth").keyup(function(){
			if($("#birth").val()!=""){
				for(i=0; i<$("#birth").val().length; i++){
			    	var ch = $("#birth").val().charAt(i)
			    	var ch2 = "`~!@#$%^&*()_+-=";
			    	if((ch==ch2)||(ch>='a'&&ch<='z')||($("#birth").val().length<8 ||$("#birth").val().length>8)){
			    		 $("#birthDiv").text("숫자로 8자리를 입력해 주세요."); 
			 			 $("#birthDiv").css("font-size","9pt");
						 $("#birthDiv").css("color","red");
						 $("#birthDiv").css("font-weight","bold");
			    	}else{$("#birthDiv").text("")}
			    }	
			}else if($("#birth").val()==""){
				 $("#birthDiv").text("생년월일을 입력하세요."); 
				 $("#birthDiv").css("font-size","9pt");
				 $("#birthDiv").css("color","red");
				 $("#birthDiv").css("font-weight","bold");
			}
		})
		$("#rphone").keyup(function(){
			if($("#rphone").val()!=""){
				for(i=0; i<$("#rphone").val().length; i++){
			    	var ch = $("#rphone").val().charAt(i)
			    	if(!(ch>='0'&&ch<='9')||($("#rphone").val().length<13 ||$("#rphone").val().length>13)){
			    		 $("#phoneDiv").text("-포함 숫자 13를 입력해주세요. ex>010-2769-8683"); 
			 			 $("#phoneDiv").css("font-size","9pt");
						 $("#phoneDiv").css("color","red");
						 $("#phoneDiv").css("font-weight","bold");
			    	}else{$("#phoneDiv").text("")}
			    }	
			}else if($("#rphone").val()==""){
				 $("#phoneDiv").text("핸드폰번호를 입력하세요."); 
				 $("#phoneDiv").css("font-size","9pt");
				 $("#phoneDiv").css("color","red");
				 $("#phoneDiv").css("font-weight","bold");
			}
		})
		
		$("#submitButton").click(function(){
			if($("#name").val()==""){
				$("#nameDiv").text("이름을 입력하세요."); 
				 $("#nameDiv").css("font-size","9pt");
				 $("#nameDiv").css("color","red");
				 $("#nameDiv").css("font-weight","bold");
			}else if($("#birth").val()==""){
				$("#birthDiv").text("생년월일을 입력하세요."); 
				 $("#birthDiv").css("font-size","9pt");
				 $("#birthDiv").css("color","red");
				 $("#birthDiv").css("font-weight","bold");
			}else if($("#rphone").val()==""){
				 $("#phoneDiv").text("핸드폰 번호를 입력하세요."); 
				 $("#phoneDiv").css("font-size","9pt");
				 $("#phoneDiv").css("color","red");
				 $("#phoneDiv").css("font-weight","bold");
			}else{
				$("#smsForm").submit();
			}
			    
		})	
	

});
