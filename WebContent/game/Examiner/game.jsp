<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
String opponentUserID = request.getParameter("opponentUserID");
session.putValue("opponentUserID", opponentUserID);

%>
<%String o = opponentUserID; %>
<%String user = (String) session.getAttribute("userid"); %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7; IE=EmulateIE9">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" type="text/css" href="style.css" media="all" />
    <link rel="stylesheet" type="text/css" href="demo.css" media="all" />
    <title>Welcome to faceIt...</title>
    
    <style type="text/css">
    
    body { text-align: center; padding: 40px; background: #F5F5F5; }
.container { width: 500px; text-align: center; margin: auto;}
.copyright { margin-top: 50px; font-size: 12px; text-transform: uppercase; }
.copyright a { text-decoration: none; padding: 5px;background: #c0392b; color: #FFFFFF; }
.copyright a:hover { background: transparent; color: #c0392b; }

.button {
  display: inline-block;
  height: 50px;
  line-height: 50px;
  padding-right: 30px;
  padding-left: 70px;
  position: relative;
  background-color:rgb(41,127,184);
  color:rgb(255,255,255);
  text-decoration: none;
  text-transform: uppercase;
  letter-spacing: 1px;
  margin-bottom: 15px;
  
  
  border-radius: 5px;
  -moz-border-radius: 5px;
  -webkit-border-radius: 5px;
  text-shadow:0px 1px 0px rgba(0,0,0,0.5);
-ms-filter:"progid:DXImageTransform.Microsoft.dropshadow(OffX=0,OffY=1,Color=#ff123852,Positive=true)";zoom:1;
filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=0,OffY=1,Color=#ff123852,Positive=true);

  -moz-box-shadow:0px 2px 2px rgba(0,0,0,0.2);
  -webkit-box-shadow:0px 2px 2px rgba(0,0,0,0.2);
  box-shadow:0px 2px 2px rgba(0,0,0,0.2);
  -ms-filter:"progid:DXImageTransform.Microsoft.dropshadow(OffX=0,OffY=2,Color=#33000000,Positive=true)";
filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=0,OffY=2,Color=#33000000,Positive=true);
}

.button span {
  position: absolute;
  left: 0;
  width: 50px;
  background-color:rgba(0,0,0,0.5);
  
  -webkit-border-top-left-radius: 5px;
	-webkit-border-bottom-left-radius: 5px;
	-moz-border-radius-topleft: 5px;
-moz-border-radius-bottomleft: 5px;
border-top-left-radius: 5px;
border-bottom-left-radius: 5px;
border-right: 1px solid  rgba(0,0,0,0.15);
}

.button:hover span, .button.active span {
  background-color:rgb(0,102,26);
  border-right: 1px solid  rgba(0,0,0,0.3);
}

.button:active {
  margin-top: 2px;
  margin-bottom: 13px;

  -moz-box-shadow:0px 1px 0px rgba(255,255,255,0.5);
-webkit-box-shadow:0px 1px 0px rgba(255,255,255,0.5);
box-shadow:0px 1px 0px rgba(255,255,255,0.5);
-ms-filter:"progid:DXImageTransform.Microsoft.dropshadow(OffX=0,OffY=1,Color=#ccffffff,Positive=true)";
filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=0,OffY=1,Color=#ccffffff,Positive=true);
}

.button.orange {
  background: #FF7F00;
}

.button.purple {
  background: #8e44ad;
}

.button.turquoise {
  background: #1abc9c;
}
    
    
    
    
    </style>
</head>
<body onload="spin2()">

<div class="container">
			<!-- freshdesignweb top bar -->
            <div class="freshdesignweb-top">
                <a href="http://www.freshdesignweb.com" target="_blank">Home</a>
                <span class="right">
                    <a href="http://www.freshdesignweb.com/beautiful-registration-form-with-html5-and-css3.html">
                        <strong>Back to the freshdesignweb Article</strong>
                    </a>
                </span>
                <div class="clr"></div>
            </div><!--/ freshdesignweb top bar -->
			<header>
				<h1><span>FaceIt</span>Welcome to FaceIt...</h1>
            </header>       
	<h2>This is a game Between, <%out.print(user); %> and <%out.print(o); %>..</h2>
	
<%@ page import ="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
String userID = request.getParameter("userID");
session.putValue("userid", userID);
//put variable to count correct Answers
int numOfCorrectAnswer = 0;
String numOfCorrectAnswers = numOfCorrectAnswer +"";
session.putValue("numOfCorrectAnswers", numOfCorrectAnswers);

String pwd = request.getParameter("pwd");

Class.forName("com.mysql.jdbc.Driver");

java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/faceItFinal","root","00365673255");
Statement st = con.createStatement();

ResultSet rs = st.executeQuery("select*from USERS where userID='"+userID+"'");
%>

<h1 class="main">${question}</h1>				
<div id="container">
<div id="first">

<form action="Teacher" method ="post" id="form1">
<div>

<input type="radio" name="userAnswer" value="1" id="radio1" class="radio" onclick="this.form.submit()" />
<label for="radio1">${ans1}</label>
</div>

<div>
<input type="radio" name="userAnswer" value="2" id="radio2" class="radio" onclick="this.form.submit()"/>
<label for="radio2">${ans2}</label>
</div>
<div>
<input type="radio" name="userAnswer" value="3" id="radio3" class="radio" onclick="this.form.submit()"/>
<label for="radio3">${ans3}</label>
</div>

<div>
<input type="radio" name="userAnswer" value="4" id="radio4" class="radio" onclick="this.form.submit()"/>
<label for="radio4">${ans4}</label>

</div>
<input type="hidden" name="correctAnswer" value="${CorrectAnswer}"/><br/>
<input type="hidden" name="catagory" value="${catagory}"/><br/>
<input type="hidden" name="userID" value="<%out.println(userID);%>"/><br/>

<input type="submit"/>
</form>
${catagory}
<%out.println(userID);%>
</div>

<div id="second">
<div align="left">
</div>
<div id="clear"></div>

</div>
</div>









<%

if(rs.next()){
	out.println("Name: "+rs.getString(1)+" "+rs.getString(2)+"<br>");
	out.println("userID: "+rs.getString(3)+"<br>");
	out.println("email: "+rs.getString(4)+"<br>");
	//out.println("email: "+rs.getString(5)+"<br>");
	out.println("age: "+rs.getString(6)+"<br>");
}
	/*
	if(rs.getString(5).equals(pwd)==true){
		out.println("<h1>welcome " +userID+ "</h1>");
		out.println("<p><a href= \"index.html\">Home</a></p>");
		out.println("<p><a href= \"game/game.html\">Solo Game</a></p>");
		out.println("<p><a href= \"AddQuestion.html\">Add Question</a></p>");
		out.println("<p><a href= \"challenge/playerChooser.jsp\">Challenge</a></p>");
		out.println("<p><a href= \"gameRequests/onGoingGames.jsp\">Friends_Challenges</a></p>");	
	}
	*/
%>						
		<div class="copyright">
  	Created by <a href="http://www.fwpolice.com">Group 11</a>   
	</div>    		 
</div>      


</body>
</html>