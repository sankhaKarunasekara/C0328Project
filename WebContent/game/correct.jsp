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

<title>correct</title>
</head>
<body>
<h2>Answer is correct!</h2>
<%String user1 = (String)session.getAttribute("userid"); %>
<%//update the database %>
<%out.print(user1); %>
<%String user = (String)session.getAttribute("userid"); %>
<%out.print(user); %>

<%
//updating number of correct Answers
int numOfCorrectAnswers =Integer.parseInt((String)session.getAttribute("numOfCorrectAnswers"));
String number1 = (numOfCorrectAnswers +1)+"";
session.setAttribute("numOfCorrectAnswers", number1);
String number =(String)session.getAttribute("numOfCorrectAnswers");
out.print(number);
%>

<form action="./wheelAfterCorrect.jsp">
    <input type="submit" value="CONTINUE">
</form>

</body>
</html>