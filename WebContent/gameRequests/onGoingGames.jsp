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
import ="java.util.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>onGoingGames</title>
</head>
<body>
<% 
String user = (String)session.getAttribute("userid");
%>
<% 
List<String> allUsers=new ArrayList();

try {
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/faceItFinal","root","00365673255");
	Statement stmt = con.createStatement();
	Statement stmt1 = con.createStatement();
	Statement stmt3 = con.createStatement();
	
	ResultSet ks = stmt1.executeQuery("SELECT player2 FROM ONLINEGAMES where player1='"+user+"' && activeUser='"+user+"'");
	ResultSet rs = stmt.executeQuery("select player1 from ONLINEGAMES where player2='"+user+"' && activeUser='"+user+"'");
	//ResultSet ds1 = stmt3.executeQuery("select "+user+" from ONLINEGAMES where activeUser='"+user+"'");
	
	 while (rs.next()) {      
	   allUsers.add(rs.getString(1)); 
	}
	 while (ks.next()) {      
		   allUsers.add(ks.getString(1)); 
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
	

<form action="../wheeel.jsp" method="post">
	OpponentUserID:<select name="opponentUserID">	
	<%
	for (String name : allUsers) {
        out.println("<option value="+name+">"+name+"</option>");
    }
	%>
	</select>
	<input type="submit" style="height: 38px; "/>
</form>
</body>
</html>