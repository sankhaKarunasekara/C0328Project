<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>listOfGames</title>
</head>
<body>

<%@ page import ="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%

String userid = request.getParameter("usr");

Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/faceIt","root","00365673255");

Statement st = con.createStatement();

ResultSet rs = st.executeQuery("select*from onlineGames where userid='"+userid+"'");

while(rs.next()){
	out.println(rs.getString(2));
}
%>

</body>
</html>