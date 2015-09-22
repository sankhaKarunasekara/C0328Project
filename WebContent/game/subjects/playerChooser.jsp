<%@page import="sun.security.x509.AVA"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.io.IOException"
import = "java.io.PrintWriter"
import ="javax.servlet.ServletException"
import ="javax.servlet.annotation.WebServlet"
import ="javax.servlet.http.HttpServlet"
import ="java.io.IOException"
import ="java.io.PrintWriter"
import ="java.sql.*"
import ="javax.sql.*"
import ="java.util.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7; IE=EmulateIE9">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" type="text/css" href="style.css" media="all" />
    <link rel="stylesheet" type="text/css" href="demo.css" media="all" />
  		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>playerChooser</title>
		<meta name="description" content="Simple Effects for Drop-Down Lists" />
		<meta name="keywords" content="drop-down, select, jquery, plugin, fallback, transition, transform, 3d, css3" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico"> 
		<link rel="stylesheet" type="text/css" href="css/style5.css" />
		<script src="js/modernizr.custom.63321.js"></script>
	
	<style type="text/css">
	
#containerButton {
    width: 700px;
    float:left;
    margin: auto;
}
#first {
    width: 270px;
    float: left;
    height: auto;
      
}
#second {
    width: 350px;
    float: left;
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
<body>
<% 
String user = (String)session.getAttribute("userid");

List<String> allUsers=new ArrayList();
List<String> avialablePlayers=new ArrayList();


try {
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/faceItFinal","root","00365673255");
	Statement stmt = con.createStatement();
	Statement stmt1 = con.createStatement();
	Statement stat2 = con.createStatement();
	Statement stat3 = con.createStatement();
	
	ResultSet ks = stmt1.executeQuery("SELECT COUNT(userID) FROM USERS");
	ResultSet rs = stmt.executeQuery("select userID from USERS where userID !='"+user+"'");
	ResultSet as = stat2.executeQuery("select player1 from ONLINEGAMES where activeUser='"+user+"'");
	ResultSet as2 = stat3.executeQuery("select player2 from ONLINEGAMES where activeUser='"+user+"'");
	
	 while (rs.next()) {      
	   allUsers.add(rs.getString("userID"));                                 
	}
	 
	 while (as.next()) {      
		 avialablePlayers.add(as.getString("player1"));                                 
	}
	 while (as2.next()) {      
		 avialablePlayers.add(as2.getString("player2"));                                 
	}
	 
	 con.close();
	 
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
                        <strong>Back to the freshdesignweb Article</strong>
                    </a>
                </span>
                <div class="clr"></div>
            </div><!--/ freshdesignweb top bar -->
			<header>
				<h1><span>FaceIt</span>Direct Challenge</h1>
				<h2><span><%out.print("you are: "+user); %></span></h2>
            	 </header>       

<div class="container1">
				
			<section class="main clearfix">
				<div class="fleft">
					<p></p>
				</div>
				<div class="fleft">
				<div id="containerButton" >
				<form action="../wheel/wheel.jsp" method="post">
					<div id="first">
						<select id="cd-dropdown" class="cd-select" onchange="this.form.submit()" name="opponentUserID">
							<option value="-1" selected>Select a Opponent</option>
							<%
							for (String user1 : allUsers) {	
        					out.println("<option value="+user1+" class=\"icon-chrome\">"+user1+"</option>");
    						}
							%>
						</select>
					</div>
					<br>
					<h1></h1>
					<div id="second">
						<div>
							<input type="button" id="submit-form" onclick="this.form.submit()"/>
							<label class="button" for="submit-form"><span>✓</span><strong>Direct Challenge</strong></label>
						</div>
					</div>
				</form>
				</div>
													
				</div>
			</section>
			<h3>you can directly challenge your friend who registered in faceIt using direct challenge option.</h3>
            	<h4>Have Fun..!</h4>
           
		</div><!-- /container -->
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.dropdown.js"></script>
		<script type="text/javascript">
			
			$( function() {
				
				$( '#cd-dropdown' ).dropdown( {
					gutter : 5,
					stack : false,
					slidingIn : 100
				} );

			});

		</script>

		<div class="copyright">
  	Created by <a href="http://www.fwpolice.com">Group 11</a>   
	</div>    		 
</div>  

</body>
	
</html>