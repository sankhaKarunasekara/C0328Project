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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7; IE=EmulateIE9">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" type="text/css" href="style.css" media="all" />
    <link rel="stylesheet" type="text/css" href="demo.css" media="all" />
  
<title>playerChooser</title>
	
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
	ResultSet rs = stmt.executeQuery("select userID from USERS");
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
				<h1><span>FaceIt</span>Welcome to FaceIt...</h1>
            </header>       

<form action="wheel/wheel.jsp" method="post">
<span class="custom-dropdown custom-dropdown--white">
    <select name="opponentUserID" class="custom-dropdown__select custom-dropdown__select--white">
	OpponentUserID:<select name="opponentUserID">	
	<%
	for (String user1 : allUsers) {
        out.println("<option value="+user1+">"+user1+"</option>");
    }
	%>
   </select>
</span>
	<input type="submit"/>
</form>

<form action="wheel/wheel.jsp" method="post">
	OpponentUserID:<select name="opponentUserID">	
	<%
	for (String user1 : avialablePlayers) {
        out.println("<option value="+user1+">"+user1+"</option>");
    }
	%>
	</select>
	
	<input type="submit"/>
</form>
		<div class="copyright">
  	Created by <a href="http://www.fwpolice.com">Group 11</a>   
	</div>    		 
</div>  


</body>
	
</html>