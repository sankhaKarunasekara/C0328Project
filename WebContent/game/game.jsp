<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">

form {
	margin: 20px 0;
}

div {
	clear: both;
	margin: 0 10px;
}

label {
  width: 500px;
  border-radius: 3px;
  border: 1px solid #D1D3D4
}

/* hide input */
input.radio:empty {
	margin-left: -999px;
}

/* style label */
input.radio:empty ~ label {
	position: relative;
	float: left;
	line-height: 2.5em;
	text-indent: 3.25em;
	margin-top: 1em;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

input.radio:empty ~ label:before {
	position: absolute;
	display: block;
	top: 0;
	bottom: 0;
	left: 0;
	content: '';
	width: 2.5em;
	background: #D1D3D4;
	border-radius: 3px 0 0 3px;
}

/* toggle hover */
input.radio:hover:not(:checked) ~ label:before {
	content:'\2714';
	text-indent: .9em;
	color: #C2C2C2;
}

input.radio:hover:not(:checked) ~ label {
	color: #888;
}

/* toggle on */
input.radio:checked ~ label:before {
	content:'\2714';
	text-indent: .9em;
	color: #9CE2AE;
	background-color: #4DCB6D;
}

input.radio:checked ~ label {
	color: #777;
}

/* radio focus */
input.radio:focus ~ label:before {
	box-shadow: 0 0 0 3px #999;
}

</style>

<script type="text/javascript">
function sleep(milliseconds) {
	  var start = new Date().getTime();
	  for (var i = 0; i < 1e7; i++) {
	    if ((new Date().getTime() - start) > milliseconds){
	      break;
	    }
	  }
	  form1.submit();
	}
</script>



<title>Games</title>

</head>
<body>
			<%String user = (String)session.getAttribute("userid"); %>
			<%out.print(user); %>
				<h2>${question}</h2>
				<h2>${questionID}</h2>

<form action="Teacher" method ="post" id="form1">
<div>
<input type="radio" name="userAnswer" value="1" id="radio1" class="radio" onclick="this.form.submit()" />
<label for="radio1">${ans1}</label>
</div>
<div>
<input type="radio" name="userAnswer" value="2" id="radio2" class="radio" onclick="this.form.submit()"/>
<label for="radio2">${ans2}</label>
</div>
<div>
<input type="radio" name="userAnswer" value="3" id="radio3" class="radio" onclick="this.form.submit()"/>
<label for="radio3">${ans3}</label>
</div>

<div>
<input type="radio" name="userAnswer" value="4" id="radio4" class="radio" onclick="this.form.submit()"/>
<label for="radio4">${ans4}</label>

</div>
<input type="hidden" name="correctAnswer" value="${CorrectAnswer}"/><br/>
<input type="submit"/>
</form>

</body>
</html>