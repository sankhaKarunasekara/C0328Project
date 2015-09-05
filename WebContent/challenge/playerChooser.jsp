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
<title>playerChooser</title>
</head>
<body>
<% 
List<String> allUsers=new ArrayList();

try {
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/faceItFinal","root","00365673255");
	Statement stmt = con.createStatement();
	Statement stmt1 = con.createStatement();
	
	ResultSet ks = stmt1.executeQuery("SELECT COUNT(userID) FROM USERS");
	ResultSet rs = stmt.executeQuery("select userID from USERS");
	
	 while (rs.next()) {      
	   allUsers.add(rs.getString("userID"));                                 
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
	for (String user : allUsers) {
        out.println("<option value="+user+">"+user+"</option>");
    }
	%>
	</select>
	<input type="submit"/>
</form>
</body>
	
</html>