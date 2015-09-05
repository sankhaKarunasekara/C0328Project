<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>loginjsp</title>
</head>
<body>
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

if(rs.next()){
	out.println("Name: "+rs.getString(1)+" "+rs.getString(2)+"<br>");
	out.println("userID: "+rs.getString(3)+"<br>");
	out.println("email: "+rs.getString(4)+"<br>");
	//out.println("email: "+rs.getString(5)+"<br>");
	out.println("age: "+rs.getString(6)+"<br>");
	
	if(rs.getString(5).equals(pwd)==true){
		out.println("<h1>welcome " +userID+ "</h1>");
		out.println("<p><a href= \"index.html\">Home</a></p>");
		out.println("<p><a href= \"game/game.html\">Solo Game</a></p>");
		out.println("<p><a href= \"AddQuestion.html\">Add Question</a></p>");
		out.println("<p><a href= \"challenge/playerChooser.jsp\">Challenge</a></p>");
		out.println("<p><a href= \"gameRequests/onGoingGames.jsp\">Friends_Challenges</a></p>");		
	}else{
		out.println("<h2>Invalid password try again</h2>");
	}
}else{
	out.println("<h2>Invalid UserName Try Again</h2>");	
}
%>
</body>
</html>