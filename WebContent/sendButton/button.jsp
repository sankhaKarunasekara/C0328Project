<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"> 
    function changeText(submitId){
        var submit = document.getElementById(submitId);
        submit.value = 'Loading...';
        return false;
    };
</script>
</head>
<body>
<form method="get" action="">
    <label for="textinput">Text:</label> 
    <input type="text" value="" name="textinput" id="textinput" /> 
    <input type="submit" id="submitbutton" value="Search" onclick="return changeText('submitbutton');" /> 
</form>

</body>
</html>