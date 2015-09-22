<%@ page language="java" contentType="text/html; charset=UTF-8"
import ="java.io.IOException"
import = "java.io.PrintWriter"
import ="javax.servlet.ServletException"
import ="javax.servlet.annotation.WebServlet"
import ="javax.servlet.http.HttpServlet"
import ="java.io.IOException"
import ="java.io.PrintWriter"
import ="java.sql.*"
import ="javax.sql.*"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WrongAnswer</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7; IE=EmulateIE9">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" type="text/css" href="style.css" media="all" />
    <link rel="stylesheet" type="text/css" href="demo.css" media="all" />
  		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<meta name="description" content="Simple Effects for Drop-Down Lists" />
		<meta name="keywords" content="drop-down, select, jquery, plugin, fallback, transition, transform, 3d, css3" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico"> 
		<link rel="stylesheet" type="text/css" href="css/style5.css" />
		<script src="js/modernizr.custom.63321.js"></script>
	
	<style type="text/css">
	
#containerButton {
    width: 800px;
    float:left;
    margin: auto;
}
#first {
    width: 100px;
    float: none;
    height: auto;
      
}
#second {
    width: 700px;
    float: none;
    height: auto;    
}
#clear {
    clear: both;
}
	
	</style>
	
    <style type="text/css">
    
body { text-align: center; padding: 40px; background: #F5F5F5; }
.container { width: 700px; text-align: center; margin: auto;}
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
filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=0,OffY=1,Color=#B45F04,Positive=true);
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

.button.white {
  background: #0000FF;
}  
.button.green {
  background: #64FE2E;
} 
.button.red {
  background: #FA5858;
} 

    </style>
</head>
<body>
<h2>Answer is Wrong!</h2>
<%String user = (String)session.getAttribute("userid"); %>
<%out.print(user); %>

<% 
String number ="";
int numberOfQuestionsCorrectlyAnsweredInThisSession = 0;

try{
	 number =(String)session.getAttribute("numOfCorrectAnswers");	
	 out.print("this is the Number of CorrectAnswers: "+number);
} catch (Exception e){
	number = 0 +"";
}
%>
<%
String opp =(String)session.getAttribute("opponentUserID");
//out.println("<h1>"+opp+"</h1>");
 int numberInt = Integer.parseInt(number); 
 numberOfQuestionsCorrectlyAnsweredInThisSession = numberInt;
 
 int totalNumberOfQuestionsCorrectlyAnsweredByUser= 0;
 
 int totalNumberOfQuestionsCorrectlyAnsweredByOpponent= 0;
 
%>
<% out.println(user+" you answered "+numberInt+" questions correctly..\n");%>

<% 
String finalcurrentUser =""; 
String finalOpponentUser="";

boolean newGame= false;
try {
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/faceItFinal","root","00365673255");
	Statement stmt = con.createStatement();
	Statement stmt2 = con.createStatement();

	
	ResultSet metualGames = stmt.executeQuery("select *from ONLINEGAMES where player1 ='"+user+"' && player2 ='"+opp+"'");
	ResultSet metualGames2 = stmt2.executeQuery("select *from ONLINEGAMES where player2 ='"+user+"' && player1 ='"+opp+"'");
	
	//identifining which user is corrent user 
	//user is player1
	if(metualGames.next()){
			String currentUser = "player1";
			finalcurrentUser ="player1";
			finalOpponentUser ="player2";
			
			int player1Points = metualGames.getInt(5);
			int currentPoints = player1Points +numberInt;
			
			totalNumberOfQuestionsCorrectlyAnsweredByUser = currentPoints;
			
			String newPoints = currentPoints +"";
			int gameID = metualGames.getInt(1);
			String player1 = metualGames.getString(2);
			String player2 = metualGames.getString(3);
			int timer = metualGames.getInt(4);
		//	int player1Points = metualGames.getInt(4);
			int player2Points = metualGames.getInt(6);
			
			totalNumberOfQuestionsCorrectlyAnsweredByOpponent= player2Points;
			 
			String activeUser = metualGames.getString(7);
			//out.println("<h3>you are the player 01<h3>");
			
			
			//int Idont = stmt.executeUpdate("insert into ONLINEGAMES (player1,player2,pointsPlayer2,timer) values('"+user+"','"+opp+"','"+newPoints+"','"+0+"')");
			int Idont2 = stmt.executeUpdate("UPDATE ONLINEGAMES SET pointsPlayer1 ='"+currentPoints+"' where gameID ='"+gameID+"'");
			//out.println("setting the points for player1");
			
			int Idont3 = stmt.executeUpdate("UPDATE ONLINEGAMES SET activeUser ='"+player2+"' where gameID ='"+gameID+"'");
			//out.println("setting the active user as player1");
			
			//out.println("<h4>"+player1+ "you Scored total Points: "+currentPoints+"</h4>");
			//out.println("<h4>"+player2+ "Scored total Points: "+player2Points+"</h4>");
			//out.println("<p><a href= \"index.html\">Home</a></p>");
			
	}else if(metualGames2.next()){
			String currentUser = "player2";
			
			//this is for the printing
			finalcurrentUser = "player2";
			finalOpponentUser ="player1";
					
			int gameID = metualGames2.getInt(1);
			int player1Points = metualGames2.getInt(5);
		
			totalNumberOfQuestionsCorrectlyAnsweredByOpponent = player1Points;

			
			String player1 = metualGames2.getString(2);
			String player2 = metualGames2.getString(3);
			int timer = metualGames2.getInt(4);
		//	int player1Points = metualGames.getInt(4);
			int player2Points = metualGames2.getInt(6);
			String activeUser = metualGames2.getString(7);
			
			int currentPoints = player2Points +numberInt;
			
			String newPoints = currentPoints +"";
			totalNumberOfQuestionsCorrectlyAnsweredByUser = currentPoints;
			totalNumberOfQuestionsCorrectlyAnsweredByOpponent =player1Points;
			
			out.println("<h3>you are the player 02</h3>");
			
			//int Idont = stmt.executeUpdate("insert into ONLINEGAMES (player2,player1,pointsPlayer2) values('"+user+"','"+opp+"','"+newPoints+"')");
			int Idont2 = stmt.executeUpdate("UPDATE ONLINEGAMES SET pointsPlayer2 ='"+currentPoints+"' where gameID ='"+gameID+"'");
			//out.println("setting the points for player2");
			
			int Idont3 = stmt.executeUpdate("UPDATE ONLINEGAMES SET activeUser ='"+player1+"' where gameID ='"+gameID+"'");
			//out.println("setting the active user as player2");
			//out.println("<h3>"+player2+ "you Scored total Points: "+currentPoints+"</h3>");
			//out.println("<h3>"+player1+ "Scored total Points: "+player1Points+"</h3>");
			out.println("<p><a href= \"index.html\">Home</a></p>");
			
		}else{
			//if game is a new Game
			finalcurrentUser ="player1";
			finalOpponentUser ="player2";
			
			int currentPoints =numberInt;
			String newPoints = currentPoints +"";
			totalNumberOfQuestionsCorrectlyAnsweredByUser = currentPoints;
			//out.println("you are inside the else");
			int Idont = stmt.executeUpdate("insert into ONLINEGAMES (player1,player2,pointsPlayer1,timer,activeUser) values('"+user+"','"+opp+"','"+newPoints+"','"+0+"','"+opp+"')");
			newGame= true;
	}

		
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	out.print("class not Found");
	e.printStackTrace();
	
} catch (SQLException e) {
	// TODO Auto-generated catch block
	out.print(e);
	e.printStackTrace();
}
%>


	<div class="container">
			<!-- freshdesignweb top bar -->
            <div class="freshdesignweb-top">
                <a href="http://www.freshdesignweb.com" target="_blank">Home</a>
                <span class="right">
                    <a href="http://www.freshdesignweb.com/beautiful-registration-form-with-html5-and-css3.html">
                        <strong>Back to Home</strong>
                    </a>
                </span>
                <div class="clr"></div>
            </div><!--/ freshdesignweb top bar -->
			<header>
				<h1><span>FaceIt</span></h1>
				
				<h1> <%out.print(user); %> your answer is <strong>INCORRECT</strong></h1>
				<h2><span>you earned points.. </span></h2>
				<h2><span>you answered <strong><%out.print(numberOfQuestionsCorrectlyAnsweredInThisSession); %></strong> in this session..</span></h2>
            	 
            </header> 
            
            <h1>your Score : <span><strong> <%out.print(totalNumberOfQuestionsCorrectlyAnsweredByUser); %></strong> </span></h1>      
			
            <h1>Opponent Score : <span><strong> <%out.print(totalNumberOfQuestionsCorrectlyAnsweredByOpponent); %></strong> </span></h1>      
			<%if(newGame==true){
			out.println("<h3>you Started the game.. now it's opponents chance.</h3>");
			}
 %>
			<br>
<div class="container1">
				
			<section class="main clearfix">
				<div class="fleft">
				</div>
				<div class="fleft">
				<div id="containerButton" >
				<form action="./login/reLogin.jsp" method="post">
						<div id="second">
						<div align="center">
							<input type="submit" id="submit-form" onclick="this.form.submit()" style="position: absolute; left: -9999px"/>
							<label class="button red" for="submit-form"><span>--!!</span><strong>Start New Game</strong></label>
						</div>
					</div>
				</form>
				
				</div>
													
				</div>
			</section>
			<h3>go for next Question</h3>
            	<h4>Have Fun..!</h4>
           
		</div><!-- /container -->
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.dropdown.js"></script>
		<div class="copyright">
  	Created by <a href="http://www.fwpolice.com">Group 11</a>   
	</div>    		 
</div>  


<%
	String catagory=(String)session.getAttribute("catagory");
	
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/faceItFinal","root","00365673255");

	Statement stmt1 = con.createStatement();
	ResultSet rs = stmt1.executeQuery("select *from PROFILE_"+catagory+" where userID='"+user+"'");
	
	int noQ=0;
	int noQc=0;
if(rs.next()){
	noQ = rs.getInt(2);
	noQc = rs.getInt(3);
	
	int noQ_new = noQ+1;
	int noQc_new= noQc;
	Statement stmt = con.createStatement();
	int Idont = stmt.executeUpdate("update PROFILE_"+catagory+" SET noOfQuestions='"+noQ_new+"',noOfCorrecltyAns='"+noQc_new+"' WHERE userID='"+user+"'");
	con.close();
}
%>
</body>
</html>