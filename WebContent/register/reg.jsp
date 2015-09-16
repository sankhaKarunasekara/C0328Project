<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
String user = request.getParameter("userID");
session.putValue("userID",user);
String pwd = request.getParameter("password");
String email = request.getParameter("email");
String fName = request.getParameter("firstName");
String lName = request.getParameter("lastName");
String age1 = request.getParameter("BirthYear");
int intAge = 2015 - Integer.parseInt(age1); 
String age = intAge+"";

Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/faceItFinal","root","00365673255");

Statement st = con.createStatement();
ResultSet rs;
System.out.println(user);
int i = st.executeUpdate("insert into USERS values('"+fName+"','"+lName+"','"+user+"','"+email+"','"+pwd+"','"+age+"')");
out.println("<h1>Registered</h1>");

%>
<a href="Login.html">Login</a> </br></br>
<a href="index.html">Home</a>

</body>
</html>