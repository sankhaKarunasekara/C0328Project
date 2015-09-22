<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	String user ="";
	String pwd="";
	String email="";
	String fName="";
	String lName="";
	String age1="";
	String age ="";
	try{
		user = request.getParameter("userID");
		session.putValue("userID",user);
		pwd = request.getParameter("password");
		email = request.getParameter("email");
		fName = request.getParameter("firstName");
		lName = request.getParameter("lastName");
		age1 = request.getParameter("BirthYear");
		int intAge = 2015 - Integer.parseInt(age1); 
		age = intAge+"";	
		
	}catch (Exception e){
		%>
		<jsp:forward page="index.html"/>
		<%
	}

	try{
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/faceItFinal","root","00365673255");

		Statement st = con.createStatement();
		ResultSet rs;
		System.out.println(user);
		int i = st.executeUpdate("insert into USERS values('"+fName+"','"+lName+"','"+user+"','"+email+"','"+pwd+"','"+age+"','10','100')");
		int b = st.executeUpdate("insert into PROFILE_BUDDHISM values('"+user+"','"+0+"','"+0+"')");
		int l = st.executeUpdate("insert into PROFILE_LANGUAGES values('"+user+"','"+0+"','"+0+"')");
		int m = st.executeUpdate("insert into PROFILE_MATHEMATICS values('"+user+"','"+0+"','"+0+"')");
		int s = st.executeUpdate("insert into PROFILE_SCIENCE values('"+user+"','"+0+"','"+0+"')");
		int h = st.executeUpdate("insert into PROFILE_HISTORY values('"+user+"','"+0+"','"+0+"')");
		int g = st.executeUpdate("insert into PROFILE_GENERALKNOWLEDGE values('"+user+"','"+0+"','"+0+"')");
		
		out.println("<h1>Registered</h1>");
		
	}catch(Exception e){
		e.printStackTrace();		
	}
%>

<a href="Login.html">Login</a> </br></br>
<a href="index.html">Home</a>

</body>
</html>