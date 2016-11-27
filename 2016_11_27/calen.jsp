<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.IOException" %>
<%@ page import = "javax.xml.parsers.DocumentBuilder" %>
<%@ page import = "javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import = "javax.xml.parsers.ParserConfigurationException" %>
<%@ page import = "org.w3c.dom.Document" %>
<%@ page import = "org.w3c.dom.NodeList" %>
<%@ page import = "org.xml.sax.SAXException" %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>날씨</title>
 
           <body onload="showmethe()">
           <%
    String Weathtoday= new String(); 
      String Weathtomorrow= new String();
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
         factory.setIgnoringElementContentWhitespace(true);
        DocumentBuilder builder = factory.newDocumentBuilder();
         Document document = builder.parse("http://www.kma.go.kr/wid/queryDFS.jsp?gridx=37&gridy=126");
         if(document != null){
         NodeList list = document.getElementsByTagName("data");
          Weathtoday=list.item(0).getChildNodes().item(15).getTextContent();
          Weathtomorrow=list.item(8).getChildNodes().item(15).getTextContent();      
   }

   %>
    <input type="hidden" id="year">
    <input type="hidden" id="month">
    <input type="hidden" id="today">
    <input type="hidden" id="t">
    <div id="show"></div>





    <script>
 var t = '<%=Weathtoday%>';
 var t_t = '<%=Weathtomorrow%>';
 
 var today = new Date();           // 오늘거 받아온뎌
 var year = today.getFullYear();   // 년도
 var month = today.getMonth();     // 달
 var today_date = today.getDate();
 
 var tt = document.getElementById("today").value=today_date;
 var tm = document.getElementById("today").value=today_date+1;
 


 document.getElementById("year").value = year;  // 이 녀석을 셋팅해준다. ( 이 친구들이 달력의 년도와 달 정보를 담는 변수 정도로 생각 하면 됭 ~ )
 document.getElementById("month").value = month+1; // 이 녀석을 셋팅해준다.
 document.getElementById("today").value = today_date;
 function prev() { // 전달
  var yy = document.getElementById("year").value;
  var mm = document.getElementById("month").value;
  mm--;
  if(mm <= 0){
   mm = 12;
   yy--;
  }
  document.getElementById("year").value = yy;
     document.getElementById("month").value = mm;
     showmethe();
 }

 function next() { // 다음달
  var yy = document.getElementById("year").value;
  var mm = document.getElementById("month").value;
  mm++;
  if(mm > 12){
   mm = 1;
   yy++;
  }
  document.getElementById("year").value = yy;
     document.getElementById("month").value = mm;
     showmethe();

 }
 function show_right(date) {
     var anni = parent.anniversary;
     var app = parent.appointment;
     var study = parent.study;
     var diary = parent.diary;
     var money = parent.money;
     anni.location = "anni.jsp";
     app.location = "appo.jsp";
     study.location = "study.jsp";
     diary.location = "diary.jsp";
     money.location = "money.jsp";
 }

 function showmethe(){ // 다 로드되고 바로 시작되는 함수
  var yy = document.getElementById("year").value;  // 년도와 달을 불러온다
  var mm = document.getElementById("month").value;
 
 
  
  var show = document.getElementById("show"); // 나중에 출력할 곳 div태그

  var sum = "<table height='500px' border='1px' align='center' width='700px'>";
   sum += "<tr>";
   sum += "<td colspan='7' align='center'>";
   sum += "<a href='#' onclick='prev()'><<</a>&nbsp;&nbsp;&nbsp;";
   sum += yy + "년 "+mm + "월";
   sum += "&nbsp;&nbsp;&nbsp;<a href='#' onclick='next()'>>></a>";
   sum += "</td>";
   sum += "</tr>";
   sum += "<tr>";
   sum += "<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>";
   sum += "</tr>";

   sum += "<tr>";
 
   var w = new Date(yy,mm-1,1).getDay(); // 이번달 1일이 무슨요일인지 보거 일요일(0)~토요일(0) 까지 알아서 공백을 채워준뎌
   for( var i = 0 ; i < w ; i++){
    sum += "<td>&nbsp;</td>"
   }

   var m = [31,28,31,30,31,30,31,31,30,31,30,31]; // 월의 마지막 날짜를 배열에 넣는다.
   m[1] = (yy%400==0 || yy%4==0 && yy%100!=0) ? 29 : 28;
   
  
   var circle = "<font color='red' size='1'>●</font><font color='yellow' size='1'>●</font>" +
            "<font color='green' size='1'>●</font><font color='lightblue' size='1'>●</font>" +
            "<font color='gray' size='1'>●</font><br/>"
          
   for (i = 1 ; i <= m[mm - 1]; i++) {    // 월마지막달 배열 중 이번달 꺼 빼서 요일에 맞게 알아서 넣음 ... !!!
      
    if( new Date(yy,mm-1,i).getDay() == 0){  //일요일부분 
        if(i==tt){
           sum += "<td align='center' style='color:red; onclick='show_right(" + i + ")'>" + circle + i +"<br />"+ t + "</td>";
           }
           else if(i==tm) {
           sum += "<td align='center' style='color:red; onclick='show_right(" + i + ")'>" + circle + i +"<br />"+t_t + "</td>";
        }
           else{
       
        sum += "<td align='center' style='color:red;' onclick='show_right(" + i + ")'>" + circle + i + "</td>";
           }}else if(new Date(yy,mm-1,i).getDay() == 6){ //토요일부분
        if(i==tt){
              sum += "<td align='center' style='color:blue; onclick='show_right(" + i + ")'>" + circle + i +"<br />"+ t + "</td>";
              }
              else if(i==tm) {
              sum += "<td align='center' style='color:blue; onclick='show_right(" + i + ")'>" + circle + i +"<br />"+t_t + "</td>";
           }
              else{
        sum += "<td align='center' style='color:blue;' onclick='show_right(" + i + ")'>" + circle + i + "</td>";
    }}
    else{ //평일
     if(i==tt){
       sum += "<td align='center' onclick='show_right(" + i + ")'>" + circle + i +"<br />"+ t + "</td>";
       }
       else if(i==tm) {
       sum += "<td align='center' onclick='show_right(" + i + ")'>" + circle + i +"<br />"+t_t+ "</td>";
    }
       else{
          sum += "<td align='center' onclick='show_right(" + i + ")'>" + circle + i + "</td>";
       }
     }
  
    if(new Date(yy,mm-1,i).getDay() == 6){  // 토요일이면 행 바꿔주고
     sum += "</tr>";
     if(i != m[mm-1]){ // 달마지막과 i 값을 비교하여 같지 않다면 새로운 행을 시작한다.
      sum += "<tr>"
     }
    }
   }
   w = new Date(yy,mm,1).getDay(); // 다음달 1일의 요일 정보를 찾아온다
   if(w != 0){
    for(var i = w ; i <= 6 ; i++){ // 다음달 1일이 시작하는 요일 부터 토요일까지 테이블에 빈칸을 넣어준다.
     sum += "<td>&nbsp;</td>";
    }
   }
   sum += "</tr>"


   sum += "</table>";

  show.innerHTML = sum;
 }
    </script>
    
</body>
</html>
               
                   
</head>