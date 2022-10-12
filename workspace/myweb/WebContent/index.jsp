<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>index.jsp</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <!-- 사용자 정의 스타일과 자바스크립트 -->
  <!-- 주의사항 : CSS와 JS는 각 웹브라우저에서 쿠키삭제하고 확인할것 -->
  <!-- layout.css import-->
  <link rel="stylesheet" href="./css/layout.css">
   <style>
    #clock{ width:500px; height:310px; line-height:310px; color: #FFBA00; font-weight:bold; font-size:30px; position: relative; margin: 0 auto;}
  </style> 
  <script>
    function showtime(){
        const d=new Date();

        let today="";
        today += d.getFullYear() + ".";  //2022.

        if(d.getMonth()+1<10){
            today += "0";
        }//if end
        today += d.getMonth()+1 + ".";  //2022.08

        if(d.getDate()<10) {
            today += "0";
        }//if end            
        today += d.getDate();           //2022.08.10

        switch(d.getDay()){
            case 0 : today+=" (일) "; break;
            case 1 : today+=" (월) "; break;
            case 2 : today+=" (화) "; break;
            case 3 : today+=" (수) "; break;
            case 4 : today+=" (목) "; break;
            case 5 : today+=" (금) "; break;
            case 6 : today+=" (토) "; break;                
        }//switch end


        if(d.getHours()<12){
            today += " AM ";
        }else{
            today += " PM ";                //2022.08.10 (수) PM
        }//if end

        if(d.getHours()<13){
            today += d.getHours() + ":";
        }else{
            today += d.getHours()-12 + ":"; //2022.08.10 (수) PM 4:
        }//if end

        if(d.getMinutes()<10){
            today+="0";    
        }//if end
        today+=d.getMinutes() + ":";        //2022.08.10 (수) PM 4:55:

        if(d.getSeconds()<10){
            today+="0";    
        }//if end
        today+=d.getSeconds();              //2022.08.10 (수) PM 4::55:19

        document.getElementById("clock").innerText=today;

        timer=setTimeout(showtime, 1000); //1초후에 showtime함수를 호출
    }//showtime() end


    let timer; //전역변수

    function killtime(){
        clearTimeout(timer); //시간해제
    }//killtime() end
</script> 
</head>

<body onunload="killtime()">
<!-- 메인 카테고리 시작 -->
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">HOME</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="./bbs/bbsList.jsp">게시판</a></li>
        <li><a href="./notice/noticeList.jsp">공지사항</a></li>
        <li><a href="./member/loginForm.jsp">로그인</a></li>
        <li><a href="./pds/pdsList.jsp">포토갤러리</a></li>
        <li><a href="./mail/mailForm.jsp">메일보내기</a></li>
      </ul>
    </div>
  </div>
</nav><!-- 메인카테고리 끝-->

<!-- First Container 시작-->
<div class="container-fluid bg-1 text-center">
  <img src="./images/muu.gif" style="display:inline" alt="muu" width="25%">
</div><!-- First Container 끝-->

<!-- Contents 시작 -->
<div class="container-fluid bg-3 text-center">    
  <div class="row">
    <div class="col-xs-12">
    	<!-- 본문시작 -->
    		<!-- 디지털시계 -->
            <div id="clock"><script>showtime();</script></div>
    	<!-- 본문끝 -->
    </div><!-- col 끝 -->
  </div><!-- row 끝 -->
</div><!-- Contents 끝 -->

<!-- Footer -->
<footer class="container-fluid bg-4 text-center">
    Copyright &copy; 2022 MYWEB
</footer>

</body>
</html>
    