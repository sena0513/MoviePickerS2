    <%@ page language="java" import="java.util.*, java.security.*, java.io.*, java.net.*" %>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    <%!
    /**==============================================================
      Description        :  사용 함수 선언
    ==============================================================**/
     /**
     * nullcheck
     * @param str, Defaultvalue
     * @return
     */

     public static String nullcheck(String str,  String Defaultvalue ) throws Exception
     {
          String ReturnDefault = "" ;
          if (str == null)
          {
              ReturnDefault =  Defaultvalue ;
          }
          else if (str == "" )
         {
              ReturnDefault =  Defaultvalue ;
          }
          else
          {
                      ReturnDefault = str ;
          }
           return ReturnDefault ;
     }
     /**
     * BASE64 Encoder
     * @param str
     * @return
     */
    public static String base64Encode(String str)  throws java.io.IOException {
        sun.misc.BASE64Encoder encoder = new sun.misc.BASE64Encoder();
        byte[] strByte = str.getBytes();
        String result = encoder.encode(strByte);
        return result ;
    }

    /**
     * BASE64 Decoder
     * @param str
     * @return
     */
    public static String base64Decode(String str)  throws java.io.IOException {
        sun.misc.BASE64Decoder decoder = new sun.misc.BASE64Decoder();
        byte[] strByte = decoder.decodeBuffer(str);
        String result = new String(strByte);
        return result ;
    }
    %>
    <%
    /**==============================================================
      Description        : 캐릭터셋 정의
      EUC-KR: @ page contentType="text/html;charset=EUC-KR
      UTF-8: @ page contentType="text/html;charset=UTF-8
    ==============================================================**/
    %>
    <%@ page contentType="text/html;charset=UTF-8"%>
    <%
    /**==============================================================
      Description        :  사용자 샘플코드
    ==============================================================**/
    String charsetType = "UTF-8"; //EUC-KR 또는 UTF-8

    request.setCharacterEncoding(charsetType);
    response.setCharacterEncoding(charsetType);
    String  action     = nullcheck(request.getParameter("action"), "");
    if(action.equals("go")) {

        String sms_url = "";
        sms_url = "https://sslsms.cafe24.com/sms_sender.php"; // SMS 전송요청 URL
        String user_id = base64Encode("sming0503"); // SMS아이디
        String secure = base64Encode("344ad3a7775a8666742ebd198253fbcb");//인증키
        String msg = base64Encode(nullcheck(request.getParameter("msg"), "")); //랜덤값 인증번호
        String rphone = base64Encode(nullcheck(request.getParameter("rphone"), ""));//수신번호
        String sphone1 = base64Encode(nullcheck(request.getParameter("sphone1"), ""));//발신번호
        String sphone2 = base64Encode(nullcheck(request.getParameter("sphone2"), ""));
        String sphone3 = base64Encode(nullcheck(request.getParameter("sphone3"), ""));
        String rdate = base64Encode(nullcheck(request.getParameter("rdate"), ""));
        String rtime = base64Encode(nullcheck(request.getParameter("rtime"), ""));
        String mode = base64Encode("1");
        String subject = "";
        if(nullcheck(request.getParameter("smsType"), "").equals("L")) {
            subject = base64Encode(nullcheck(request.getParameter("subject"), ""));
        }
        String testflag = base64Encode(nullcheck(request.getParameter("testflag"), ""));
        String destination = base64Encode(nullcheck(request.getParameter("destination"), ""));
        String repeatFlag = base64Encode(nullcheck(request.getParameter("repeatFlag"), ""));
        String repeatNum = base64Encode(nullcheck(request.getParameter("repeatNum"), ""));
        String repeatTime = base64Encode(nullcheck(request.getParameter("repeatTime"), ""));
        String returnurl = nullcheck(request.getParameter("returnurl"), "");
        String nointeractive = nullcheck(request.getParameter("nointeractive"), "");
        String smsType = base64Encode(nullcheck(request.getParameter("smsType"), ""));

        String[] host_info = sms_url.split("/");
        String host = host_info[2];
        String path = "/" + host_info[3];
        int port = 80;
        // 데이터 맵핑 변수 정의
        String arrKey[]
            = new String[] {"user_id","secure","msg", "rphone","sphone1","sphone2","sphone3","rdate","rtime"
                        ,"mode","testflag","destination","repeatFlag","repeatNum", "repeatTime", "smsType", "subject"};
        String valKey[]= new String[arrKey.length] ;
        valKey[0] = user_id;
        valKey[1] = secure;
        valKey[2] = msg;
        valKey[3] = rphone;
        valKey[4] = sphone1;
        valKey[5] = sphone2;
        valKey[6] = sphone3;
        valKey[7] = rdate;
        valKey[8] = rtime;
        valKey[9] = mode;
        valKey[10] = testflag;
        valKey[11] = destination;
        valKey[12] = repeatFlag;
        valKey[13] = repeatNum;
        valKey[14] = repeatTime;
        valKey[15] = smsType;
        valKey[16] = subject;

        String boundary = "";
        Random rnd = new Random();
        String rndKey = Integer.toString(rnd.nextInt(32000));
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] bytData = rndKey.getBytes();
        md.update(bytData);
        byte[] digest = md.digest();
        for(int i =0;i<digest.length;i++)
        {
            boundary = boundary + Integer.toHexString(digest[i] & 0xFF);
        }
        boundary = "---------------------"+boundary.substring(0,11);

        // 본문 생성
        String data = "";
        String index = "";
        String value = "";
        for (int i=0;i<arrKey.length; i++)
        {
            index =  arrKey[i];
            value = valKey[i];
            data +="--"+boundary+"\r\n";
            data += "Content-Disposition: form-data; name=\""+index+"\"\r\n";
            data += "\r\n"+value+"\r\n";
            data +="--"+boundary+"\r\n";
        }

        //out.println(data);

        InetAddress addr = InetAddress.getByName(host);
        Socket socket = new Socket(host, port);
        // 헤더 전송
        BufferedWriter wr = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream(), charsetType));
        wr.write("POST "+path+" HTTP/1.0\r\n");
        wr.write("Content-Length: "+data.length()+"\r\n");
        wr.write("Content-type: multipart/form-data, boundary="+boundary+"\r\n");
        wr.write("\r\n");

        // 데이터 전송
        wr.write(data);
        wr.flush();

        // 결과값 얻기
        BufferedReader rd = new BufferedReader(new InputStreamReader(socket.getInputStream(),charsetType));
        String line;
        String alert = "";
        ArrayList tmpArr = new ArrayList();
        while ((line = rd.readLine()) != null) {
            tmpArr.add(line);
        }
        wr.close();
        rd.close();

        String tmpMsg = (String)tmpArr.get(tmpArr.size()-1);
        String[] rMsg = tmpMsg.split(",");
        String Result= rMsg[0]; //발송결과
        String Count= ""; //잔여건수
        if(rMsg.length>1) {Count= rMsg[1]; }

                        //발송결과 알림
        if(Result.equals("success")) {
            alert = "성공적으로 발송하였습니다.";
           /*  alert += " 잔여건수는 "+ Count+"건 입니다."; */
        }
        else if(Result.equals("reserved")) {
            alert = "성공적으로 예약되었습니다";
            alert += " 잔여건수는 "+ Count+"건 입니다.";
        }
        else if(Result.equals("3205")) {
            alert = "잘못된 번호형식입니다.";
        }
        else {
            alert = "[Error]"+Result;
        }



        if(nointeractive.equals("1") && !(Result.equals("Test Success!")) && !(Result.equals("success")) && !(Result.equals("reserved")) ) {
            out.println("<script>alert('" + alert + "')</script>");
        }
        else if(!(nointeractive.equals("1"))) {
            out.println("<script>alert('" + alert + "')</script>");
        }
  
    }
    %>
<script type="text/javascript">
$(document).ready(function(){
   $("#userInputVerificationcode").keyup(function(){
      if($("#userInputVerificationcode").val()==""){
          $("##verificationcodeDiv").text("인증번호를 입력하세요."); 

      }else if($("#userInputVerificationcode").val()!=""){
         for(i=0; i<$("#userInputVerificationcode").val().length; i++){
             var ch = $("#userInputVerificationcode").val().charAt(i)
             if(!(ch>='0'&&ch<='9')||($("#userInputVerificationcode").val().length<2 ||$("#userInputVerificationcode").val().length>6)){
                 $("#verificationcodeDiv").text("숫자 2~6자리(공백불가)"); 
             }else{$("#verificationcodeDiv").text("")}
          }
      }
   })
   $("#ok_button").click(function(){
      if($("#msg").val()==$("#userInputVerificationcode").val()){
          $("#verificationForm").submit();
     }else if($("#msg").val()!=$("#userInputVerificationcode").val()){
      alert("번호를 확인 후 다시 입력해주세요.");
     }else{
      alert("인증해 실패했습니다. 다시 이용해주세요.");
      }  
      
      var userInputVerificationcode = document.getElementById("userInputVerificationcode").value;
      var isPHONE = /^[0-9]+$/;
       if (!isPHONE.test(userInputVerificationcode)) {
          alert("인증번호에 부적절한 값이 들어갔습니다.");
          $("#userInputVerificationcode").val("");
          $("#userInputVerificationcode").focus();
          return false;
       } 
   });
})
</script>    
    




<link href="<c:url value="../res/css/member/smssend.css" />" rel="stylesheet">


   <form method="post" id="verificationForm"  name="smsForm" action="/mvProject/member/idSearchResult.do">

      <div id="bodyWrapper">
         <div class="idSearchNavi">
            <div class="idSearchMenuDiv">
               <div class="iDimageDiv">
                  <a href="/mvProject/main/index.do">
                  <img src="../res/image/main/homeImage.png">
                  </a>
               </div>
               
               <div class="idSearchNaviSecondDiv">
                   <a href="/mvProject/main/loginForm.do">> 회원 서비스</a>
               </div>
               
               <div class="idSearchNaviThirdDiv">
                   <a href="/mvProject/main/loginForm.do">> 로그인</a>
               </div>
               
               <div class="idSearchNaviFourthDiv">
                  <a href="/mvProject/member/idSearchForm.do">> 아이디 찾기</a>
               </div>
         </div>   
      </div>   
         
         <div class="idSearchWrapper">
         
         <div class="searchIdTitle">
            <h1>아이디 찾기</h1>
            <p>고객님의 핸드폰으로 전송받은 인증번호를 아래 Text에 입력해 주세요. </p>
            <p>본인인증 시 제공되는 정보는 해당 인증기관에서 직접 수집 하며, 인증 이외의 용도로 이용 또는 저장하지 않습니다.</p>
         </div>
         
         <div class="searchIdContent">
         <input type="hidden" name="name" value="${name}" id="name">
         <input type="hidden" name="birth" value="${birth}" id="birth">
         <input type="hidden" name="rphone" value="${rphone}" id="rphone">
         <input type="hidden" name="msg" value="${msg}" id="msg">
             
            
            <div class="nameDiv">
               <div class="inputNameDiv"><input type="text" name="userInputVerificationcode" id="userInputVerificationcode" maxlength="6">
               <div id=verificationcodeDiv></div>
               </div> 
            </div>
            
            
            <div class="bottomButtonMenu">
               <div class="buttonMenuDiv">
                  <input type="button" value="확인" style="width:140px; height:50px; font-size:25px; float: left ;margin-left:-25px;
                   background-color: #282828;
                     color: white;
                      border-radius: 8px;
                      outline: none;
                      font-weight: bold" id="ok_button">
                  <input type="button" value="취소" style="width:140px; height:50px; font-size:25px;  background-color: #282828;
                  float: left; argin-left: 40px; margin-left: 40px;
                     color: white; border-radius: 8px; outline: none; font-weight: bold"
                  onclick="window.location.href='/mvProject/main/index.do'">
               </div>
            </div>
         </div>
         </div>
      </div>
   </form>
   


                