<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Games</title>

</head>
<body>
			<%String user = (String)session.getAttribute("catagory"); %>
			<%out.print(user); %>
				<h2>${question}</h2>
				<h2>${questionID}</h2>
				<form action="Teacher" method ="post">
				<input type="radio" value="1" name="userAnswer"/>${ans1}<br>
				<input type="radio" value="2" name="userAnswer"/>${ans2}<br>
				<input type="radio" value="3" name ="userAnswer"/>${ans3}<br>
				<input type="radio" value="4" name="userAnswer"/>${ans4}${CorrectAnswer}<br>
				<input type="hidden" name="correctAnswer" value="${CorrectAnswer}"/><br/>
				<input type="submit"/>
				</form>
</body>
</html>