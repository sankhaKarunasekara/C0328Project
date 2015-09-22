<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>overallStatus</title>
<style>
/* Load animation */
h1.main{
	font-weight: 500;
	font-family: 'Titillium Web', sans-serif;
	position: relative;  
	font-size: 25px;
	line-height: 40px;
	padding: 20px 0 15px 12px;
	color: #355681;
	
	box-shadow: 
		inset 0 0 0 1px rgba(53,86,129, 0.4), 
		inset 0 0 5px rgba(53,86,129, 0.5),
		inset -285px 0 35px white;
	border-radius: 10px 10px 10px 10px;
	background: #fff url(/images/bartoszkosowski.jpg) no-repeat center left;
}

@-webkit-keyframes 
load { 0% {
stroke-dashoffset:0
}
}
@-moz-keyframes 
load { 0% {
stroke-dashoffset:0
}
}
@keyframes 
load { 0% {
stroke-dashoffset:0
}
}

/* Container */

.progress {
  position: relative;
  display: inline-block;
  padding: 0;
  text-align: center;
}

/* Item */

.progress>li {
  display: inline-block;
  position: relative;
  text-align: center;
  color: #93A2AC;
  font-family: Lato;
  font-weight: 100;
  margin: 2rem;
}

.progress>li:before {
  content: attr(data-name);
  position: absolute;
  width: 100%;
  bottom: -2rem;
  font-weight: 400;
}

.progress>li:after {
  content: attr(data-percent);
  position: absolute;
  width: 100%;
  top: 3.7rem;
  left: 0;
  font-size: 2rem;
  text-align: center;
}

.progress svg {
  width: 10rem;
  height: 10rem;
}

.progress svg:nth-child(2) {
  position: absolute;
  left: 0;
  top: 0;
  transform: rotate(-90deg);
  -webkit-transform: rotate(-90deg);
  -moz-transform: rotate(-90deg);
  -ms-transform: rotate(-90deg);
}

.progress svg:nth-child(2) path {
  fill: none;
  stroke-width: 25;
  stroke-dasharray: 629;
  stroke: rgba(255, 255, 255, 0.9);
  -webkit-animation: load 10s;
  -moz-animation: load 10s;
  -o-animation: load 10s;
  animation: load 10s;
}
</style>
</head>

<body>
<%@ page import ="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
//User Details
			

String userID = (String)session.getAttribute("userid");

//put variable to count correct Answers
session.setAttribute("numOfCorrectAnswers",0);

String pwd = request.getParameter("pwd");


Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/faceItFinal","root","00365673255");
Statement st = con.createStatement();
Statement st1 = con.createStatement();
Statement st2 = con.createStatement();
Statement st3 = con.createStatement();
Statement st4 = con.createStatement();
Statement st5 = con.createStatement();

ResultSet rScience = st.executeQuery("select*from PROFILE_SCIENCE where userID='"+userID+"'");
ResultSet rHistory = st1.executeQuery("select*from PROFILE_HISTORY where userID='"+userID+"'");
ResultSet rK = st2.executeQuery("select*from PROFILE_GENERALKNOWLEDGE where userID='"+userID+"'");
ResultSet rB = st3.executeQuery("select*from PROFILE_BUDDHISM where userID='"+userID+"'");
ResultSet rL = st4.executeQuery("select*from PROFILE_LANGUAGES where userID='"+userID+"'");
ResultSet rM = st5.executeQuery("select*from PROFILE_MATHEMATICS where userID='"+userID+"'");

int questionsCorrectlyAnsweredInScience =0;
int allQuestionsAnsweredInScience =0;

int questionsCorrectlyAnsweredInHistory =0;
int allQuestionsAnsweredInHistory =0;

int questionsCorrectlyAnsweredInL =0;
int allQuestionsAnsweredInL =0;

int questionsCorrectlyAnsweredInM =0;
int allQuestionsAnsweredInM =0;

int questionsCorrectlyAnsweredInK =0;
int allQuestionsAnsweredInK =0;

int questionsCorrectlyAnsweredInB =0;
int allQuestionsAnsweredInB =0;


if(rHistory.next()){
	questionsCorrectlyAnsweredInHistory=rHistory.getInt(3);
	allQuestionsAnsweredInHistory=rHistory.getInt(2);

}


if(rScience.next()){
	questionsCorrectlyAnsweredInScience=rScience.getInt(3);
	allQuestionsAnsweredInScience=rScience.getInt(2);
}

if(rL.next()){
	questionsCorrectlyAnsweredInHistory=rL.getInt(3);
	allQuestionsAnsweredInHistory=rL.getInt(2);
}

if(rB.next()){
	questionsCorrectlyAnsweredInB=rL.getInt(3);
	allQuestionsAnsweredInB=rB.getInt(2);
}

if(rK.next()){
	questionsCorrectlyAnsweredInK=rK.getInt(3);
	allQuestionsAnsweredInK=rK.getInt(2);
}

if(rM.next()){
	questionsCorrectlyAnsweredInM=rM.getInt(3);
	allQuestionsAnsweredInM=rM.getInt(2);
}
%>

<%
//fuction to calculate the presentage
int cpM=0; 
int cpB =0;
int cpK =0;
int cpH = 0;
int cpL = 0;
int cpS = 0;

if(allQuestionsAnsweredInScience==0){
	
}else{
	cpS = (int)(questionsCorrectlyAnsweredInScience*100/allQuestionsAnsweredInScience);
}

if(allQuestionsAnsweredInM==0){
	
}else{
	 cpM = (int)(questionsCorrectlyAnsweredInM*100/allQuestionsAnsweredInM);
}

if(allQuestionsAnsweredInB==0){
	
}else{
	cpB = (int)((questionsCorrectlyAnsweredInB*100)/allQuestionsAnsweredInB);
}

if(allQuestionsAnsweredInK==0){
	
}else{
	cpK = (int)(questionsCorrectlyAnsweredInK*100/allQuestionsAnsweredInK);
}

if(allQuestionsAnsweredInHistory==0){
	
}else{
	cpH = (int)(questionsCorrectlyAnsweredInHistory*100/allQuestionsAnsweredInHistory);
}

if(allQuestionsAnsweredInL==0){
	
}else{
	cpL = (int)(questionsCorrectlyAnsweredInL*100/allQuestionsAnsweredInL);
}
%>


  <div class="css-script-center">
    <div class="css-script-clear"></div>
  </div><h1 align ="center" class="main">overall Game Statistics of <strong><%out.print(userID);%></strong></h1>
<!--  Container  -->
<ul class="progress">
  <!--  Item  -->
  <li data-name="History Skill" data-percent="<%out.print(cpH+"%");%>"> <svg viewBox="-10 -10 220 220">
    <g fill="none" stroke-width="4" transform="translate(100,100)">
      <path d="M 0,-100 A 100,100 0 0,1 86.6,-50" stroke="url(#cl1)"/>
      <path d="M 86.6,-50 A 100,100 0 0,1 86.6,50" stroke="url(#cl2)"/>
      <path d="M 86.6,50 A 100,100 0 0,1 0,100" stroke="url(#cl3)"/>
      <path d="M 0,100 A 100,100 0 0,1 -86.6,50" stroke="url(#cl4)"/>
      <path d="M -86.6,50 A 100,100 0 0,1 -86.6,-50" stroke="url(#cl5)"/>
      <path d="M -86.6,-50 A 100,100 0 0,1 0,-100" stroke="url(#cl6)"/>
    </g>
    </svg> <svg viewBox="-10 -10 220 220">
    <path d="M200,100 C200,44.771525 155.228475,0 100,0 C44.771525,0 0,44.771525 0,100 C0,155.228475 44.771525,200 100,200 C155.228475,200 200,155.228475 200,100 Z" stroke-dashoffset="<%out.print((int)cpH*630/100);%>"></path>
    </svg> </li>
  <!--  Item  -->
  <li data-name="Mathematics Skill" data-percent="<%out.print(cpM+"%");%>"> <svg viewBox="-10 -10 220 220">
    <g fill="none" stroke-width="4" transform="translate(100,100)">
      <path d="M 0,-100 A 100,100 0 0,1 86.6,-50" stroke="url(#cl1)"/>
      <path d="M 86.6,-50 A 100,100 0 0,1 86.6,50" stroke="url(#cl2)"/>
      <path d="M 86.6,50 A 100,100 0 0,1 0,100" stroke="url(#cl3)"/>
      <path d="M 0,100 A 100,100 0 0,1 -86.6,50" stroke="url(#cl4)"/>
      <path d="M -86.6,50 A 100,100 0 0,1 -86.6,-50" stroke="url(#cl5)"/>
      <path d="M -86.6,-50 A 100,100 0 0,1 0,-100" stroke="url(#cl6)"/>
    </g>
    </svg> <svg viewBox="-10 -10 220 220">
    <path d="M200,100 C200,44.771525 155.228475,0 100,0 C44.771525,0 0,44.771525 0,100 C0,155.228475 44.771525,200 100,200 C155.228475,200 200,155.228475 200,100 Z" stroke-dashoffset="<%out.print((int)cpM*630/100);%>"></path>
    </svg> </li>
  <!--  Item  -->
  <li data-name="Language Skill" data-percent="<%out.print(cpL+"%");%>"> <svg viewBox="-10 -10 220 220">
    <g fill="none" stroke-width="12" transform="translate(100,100)">
      <path d="M 0,-100 A 100,100 0 0,1 86.6,-50" stroke="url(#cl1)"/>
      <path d="M 86.6,-50 A 100,100 0 0,1 86.6,50" stroke="url(#cl2)"/>
      <path d="M 86.6,50 A 100,100 0 0,1 0,100" stroke="url(#cl3)"/>
      <path d="M 0,100 A 100,100 0 0,1 -86.6,50" stroke="url(#cl4)"/>
      <path d="M -86.6,50 A 100,100 0 0,1 -86.6,-50" stroke="url(#cl5)"/>
      <path d="M -86.6,-50 A 100,100 0 0,1 0,-100" stroke="url(#cl6)"/>
    </g>
    </svg> <svg viewBox="-10 -10 220 220">
    <path d="M200,100 C200,44.771525 155.228475,0 100,0 C44.771525,0 0,44.771525 0,100 C0,155.228475 44.771525,200 100,200 C155.228475,200 200,155.228475 200,100 Z" stroke-dashoffset="<%out.print((int)cpL*630/100);%>"></path>
    </svg> </li>
  <!--  Item  -->
  <li data-name="Buddhism Skill" data-percent="<%out.print(cpB/4+"%");%>"> <svg viewBox="-10 -10 220 220">
    <g fill="none" stroke-width="9" transform="translate(100,100)">
      <path d="M 0,-100 A 100,100 0 0,1 86.6,-50" stroke="url(#cl1)"/>
      <path d="M 86.6,-50 A 100,100 0 0,1 86.6,50" stroke="url(#cl2)"/>
      <path d="M 86.6,50 A 100,100 0 0,1 0,100" stroke="url(#cl3)"/>
      <path d="M 0,100 A 100,100 0 0,1 -86.6,50" stroke="url(#cl4)"/>
      <path d="M -86.6,50 A 100,100 0 0,1 -86.6,-50" stroke="url(#cl5)"/>
      <path d="M -86.6,-50 A 100,100 0 0,1 0,-100" stroke="url(#cl6)"/>
    </g>
    </svg> <svg viewBox="-10 -10 220 220">
    <path d="M200,100 C200,44.771525 155.228475,0 100,0 C44.771525,0 0,44.771525 0,100 C0,155.228475 44.771525,200 100,200 C155.228475,200 200,155.228475 200,100 Z" stroke-dashoffset="<%out.print((int)cpB*630/(100*4));%>"></path>
    </svg> </li>
  <!--  Item  -->
  <li data-name="General Knowledge Skill" data-percent="<%out.print(cpK+"%");%>"> <svg viewBox="-10 -10 220 220">
    <g fill="none" stroke-width="6" transform="translate(100,100)">
      <path d="M 0,-100 A 100,100 0 0,1 86.6,-50" stroke="url(#cl1)"/>
      <path d="M 86.6,-50 A 100,100 0 0,1 86.6,50" stroke="url(#cl2)"/>
      <path d="M 86.6,50 A 100,100 0 0,1 0,100" stroke="url(#cl3)"/>
      <path d="M 0,100 A 100,100 0 0,1 -86.6,50" stroke="url(#cl4)"/>
      <path d="M -86.6,50 A 100,100 0 0,1 -86.6,-50" stroke="url(#cl5)"/>
      <path d="M -86.6,-50 A 100,100 0 0,1 0,-100" stroke="url(#cl6)"/>
    </g>
    </svg> <svg viewBox="-10 -10 220 220">
    <path d="M200,100 C200,44.771525 155.228475,0 100,0 C44.771525,0 0,44.771525 0,100 C0,155.228475 44.771525,200 100,200 C155.228475,200 200,155.228475 200,100 Z" stroke-dashoffset="<%out.print((int)cpK*630/100);%>"></path>
    </svg> </li>
  <!--  Item  -->
  <li data-name="Science Skills" data-percent="<%out.print(cpS+"%");%>"> <svg viewBox="-10 -10 220 220">
    <g fill="none" stroke-width="6" transform="translate(100,100)">
      <path d="M 0,-100 A 100,100 0 0,1 86.6,-50" stroke="url(#cl1)"/>
      <path d="M 86.6,-50 A 100,100 0 0,1 86.6,50" stroke="url(#cl2)"/>
      <path d="M 86.6,50 A 100,100 0 0,1 0,100" stroke="url(#cl3)"/>
      <path d="M 0,100 A 100,100 0 0,1 -86.6,50" stroke="url(#cl4)"/>
      <path d="M -86.6,50 A 100,100 0 0,1 -86.6,-50" stroke="url(#cl5)"/>
      <path d="M -86.6,-50 A 100,100 0 0,1 0,-100" stroke="url(#cl6)"/>
    </g>
    </svg> <svg viewBox="-10 -10 220 220">
    <path d="M200,100 C200,44.771525 155.228475,0 100,0 C44.771525,0 0,44.771525 0,100 C0,155.228475 44.771525,200 100,200 C155.228475,200 200,155.228475 200,100 Z" stroke-dashoffset="<%out.print((int)cpS*630/100);%>"></path>
    </svg> </li>
</ul>
<!--  Defining Angle Gradient Colors  --> 
<svg width="0" height="0">
<defs>
  <linearGradient id="cl1" gradientUnits="objectBoundingBox" x1="0" y1="0" x2="1" y2="1">
    <stop stop-color="#618099"/>
    <stop offset="100%" stop-color="#8e6677"/>
  </linearGradient>
  <linearGradient id="cl2" gradientUnits="objectBoundingBox" x1="0" y1="0" x2="0" y2="1">
    <stop stop-color="#8e6677"/>
    <stop offset="100%" stop-color="#9b5e67"/>
  </linearGradient>
  <linearGradient id="cl3" gradientUnits="objectBoundingBox" x1="1" y1="0" x2="0" y2="1">
    <stop stop-color="#9b5e67"/>
    <stop offset="100%" stop-color="#9c787a"/>
  </linearGradient>
  <linearGradient id="cl4" gradientUnits="objectBoundingBox" x1="1" y1="1" x2="0" y2="0">
    <stop stop-color="#9c787a"/>
    <stop offset="100%" stop-color="#817a94"/>
  </linearGradient>
  <linearGradient id="cl5" gradientUnits="objectBoundingBox" x1="0" y1="1" x2="0" y2="0">
    <stop stop-color="#817a94"/>
    <stop offset="100%" stop-color="#498a98"/>
  </linearGradient>
  <linearGradient id="cl6" gradientUnits="objectBoundingBox" x1="0" y1="1" x2="1" y2="0">
    <stop stop-color="#498a98"/>
    <stop offset="100%" stop-color="#618099"/>
  </linearGradient>
</defs>
</svg>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-46156385-1', 'cssscript.com');
  ga('send', 'pageview');

</script>
</body>
</html>
