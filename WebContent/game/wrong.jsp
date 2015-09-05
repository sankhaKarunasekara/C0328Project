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
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WrongAnswer</title>
</head>
<body>
<h2>Answer is Wrong!</h2>
<%String user = (String)session.getAttribute("userid"); %>
<%out.print(user); %>
<% String number =(String)session.getAttribute("numOfCorrectAnswers");%>
<%
String opp =(String)session.getAttribute("opponentUserID");
//out.println("<h1>"+opp+"</h1>");
 int numberInt = Integer.parseInt(number); 

%>
<% out.println(user+" you answered "+numberInt+" questions correctly..\n");%>

<% try {
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/faceItFinal","root","00365673255");
	Statement stmt = con.createStatement();
	Statement stmt2 = con.createStatement();

	// String user = (String)session.getAttribute("userid");
	//out.println("Oposite Player: "+ opp);
	//try to figure out there was a game between these sameTwoPlayers
		//int Idont = stmt.executeUpdate("insert into ONLINEGAMES (player1,player2,player1Points) values('"+user+"','"+oppositePlayer+"','"+newPoints+"')");
		
	
	ResultSet metualGames = stmt.executeQuery("select *from ONLINEGAMES where player1 ='"+user+"' && player2 ='"+opp+"'");
	ResultSet metualGames2 = stmt2.executeQuery("select *from ONLINEGAMES where player2 ='"+user+"' && player1 ='"+opp+"'");
	
	//identifining which user is corrent user 
	if(metualGames.next()){
			String currentUser = "player1";
			int player1Points = metualGames.getInt(5);
			int currentPoints = player1Points +numberInt;
			String newPoints = currentPoints +"";
			int gameID = metualGames.getInt(1);
			String player1 = metualGames.getString(2);
			String player2 = metualGames.getString(3);
			int timer = metualGames.getInt(4);
		//	int player1Points = metualGames.getInt(4);
			int player2Points = metualGames.getInt(6);
			String activeUser = metualGames.getString(7);
			out.println("<h3>you are the player 01<h3>");
			
			
			//int Idont = stmt.executeUpdate("insert into ONLINEGAMES (player1,player2,pointsPlayer2,timer) values('"+user+"','"+opp+"','"+newPoints+"','"+0+"')");
			int Idont2 = stmt.executeUpdate("UPDATE ONLINEGAMES SET pointsPlayer1 ='"+currentPoints+"' where gameID ='"+gameID+"'");
			out.println("setting the points for player1");
			
			int Idont3 = stmt.executeUpdate("UPDATE ONLINEGAMES SET activeUser ='"+player2+"' where gameID ='"+gameID+"'");
			out.println("setting the active user as player1");
			
			out.println("<h4>"+player1+ "you Scored total Points: "+currentPoints+"</h4>");
			out.println("<h4>"+player2+ "Scored total Points: "+player2Points+"</h4>");
			out.println("<p><a href= \"index.html\">Home</a></p>");
			
	}else if(metualGames2.next()){
			String currentUser = "player2";
			int gameID = metualGames2.getInt(1);
			int player1Points = metualGames2.getInt(5);
			int currentPoints = player1Points +numberInt;
			String newPoints = currentPoints +"";
			
			String player1 = metualGames2.getString(2);
			String player2 = metualGames2.getString(3);
			int timer = metualGames2.getInt(4);
		//	int player1Points = metualGames.getInt(4);
			int player2Points = metualGames2.getInt(6);
			String activeUser = metualGames2.getString(7);
			
			out.println("<h3>you are the player 02</h3>");
			
			//int Idont = stmt.executeUpdate("insert into ONLINEGAMES (player2,player1,pointsPlayer2) values('"+user+"','"+opp+"','"+newPoints+"')");
			int Idont2 = stmt.executeUpdate("UPDATE ONLINEGAMES SET pointsPlayer2 ='"+currentPoints+"' where gameID ='"+gameID+"'");
			//out.println("setting the points for player2");
			
			int Idont3 = stmt.executeUpdate("UPDATE ONLINEGAMES SET activeUser ='"+player1+"' where gameID ='"+gameID+"'");
			//out.println("setting the active user as player2");
			out.println("<h3>"+player2+ "you Scored total Points: "+currentPoints+"</h3>");
			out.println("<h3>"+player1+ "Scored total Points: "+player1Points+"</h3>");
			out.println("<p><a href= \"index.html\">Home</a></p>");
			
		}else{
			int currentPoints =numberInt;
			String newPoints = currentPoints +"";
			//out.println("you are inside the else");
			int Idont = stmt.executeUpdate("insert into ONLINEGAMES (player1,player2,pointsPlayer1,timer,activeUser) values('"+user+"','"+opp+"','"+newPoints+"','"+0+"','"+opp+"')");
			out.println("<h3>you Started the game.. now it's opponents chance.</h3>");
			out.println("<p><a href= \"index.html\">Home</a></p>");
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

</body>
</html>