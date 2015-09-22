<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="HeadingSets/HeadingSets/css/style.css" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link id="themecss" rel="stylesheet" type="text/css" href="//www.shieldui.com/shared/components/latest/css/light-bootstrap-gradient/all.min.css" />
    <script type="text/javascript" src="//www.shieldui.com/shared/components/latest/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="//www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
	<link rel="stylesheet" type="text/css" href="style.css" media="all" />
    <link rel="stylesheet" type="text/css" href="demo.css" media="all" />
    
<style>

    body {  background: #F5F5F5; }
.container { width: 950px; text-align: center; margin: auto; hight:600;}
.copyright { margin-top: 50px; font-size: 12px; text-transform: uppercase; }
.copyright a { text-decoration: none; padding: 5px;background: #c0392b; color: #FFFFFF; }
.copyright a:hover { background: transparent; color: #c0392b; }

.button {
  display: inline-block;
  height: 50px;
  line-height: 50px;
  padding-right: 30px;
  padding-left: 70px;
  position: relative;
  background-color:rgb(41,127,184);
  color:rgb(255,255,255);
  text-decoration: none;
  text-transform: uppercase;
  letter-spacing: 1px;
  margin-bottom: 15px;
  
  
  border-radius: 5px;
  -moz-border-radius: 5px;
  -webkit-border-radius: 5px;
  text-shadow:0px 1px 0px rgba(0,0,0,0.5);
-ms-filter:"progid:DXImageTransform.Microsoft.dropshadow(OffX=0,OffY=1,Color=#ff123852,Positive=true)";zoom:1;
filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=0,OffY=1,Color=#ff123852,Positive=true);

  -moz-box-shadow:0px 2px 2px rgba(0,0,0,0.2);
  -webkit-box-shadow:0px 2px 2px rgba(0,0,0,0.2);
  box-shadow:0px 2px 2px rgba(0,0,0,0.2);
  -ms-filter:"progid:DXImageTransform.Microsoft.dropshadow(OffX=0,OffY=2,Color=#33000000,Positive=true)";
filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=0,OffY=2,Color=#33000000,Positive=true);
}

.button span {
  position: absolute;
  left: 0;
  width: 50px;
  background-color:rgba(0,0,0,0.5);
  
  -webkit-border-top-left-radius: 5px;
	-webkit-border-bottom-left-radius: 5px;
	-moz-border-radius-topleft: 5px;
-moz-border-radius-bottomleft: 5px;
border-top-left-radius: 5px;
border-bottom-left-radius: 5px;
border-right: 1px solid  rgba(0,0,0,0.15);
}

.button:hover span, .button.active span {
  background-color:rgb(0,102,26);
  border-right: 1px solid  rgba(0,0,0,0.3);
}

.button:active {
  margin-top: 2px;
  margin-bottom: 13px;

  -moz-box-shadow:0px 1px 0px rgba(255,255,255,0.5);
-webkit-box-shadow:0px 1px 0px rgba(255,255,255,0.5);
box-shadow:0px 1px 0px rgba(255,255,255,0.5);
-ms-filter:"progid:DXImageTransform.Microsoft.dropshadow(OffX=0,OffY=1,Color=#ccffffff,Positive=true)";
filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=0,OffY=1,Color=#ccffffff,Positive=true);
}

.button.orange {
  background: #FF7F00;
}

.button.purple {
  background: #8e44ad;
}

.button.turquoise {
  background: #1abc9c;
}

h1.main{
	margin: 1em 6em 2em 1.5em;
	font-weight: 500;
	font-family: 'Titillium Web', sans-serif;
	position: relative;  
	font-size: 25px;
	line-height: 40px;
	padding: 20px 0 15px 12px;
	color: #355681;
	
	box-shadow: 
		inset 0 0 0 1px rgba(53,86,129, 0.4), 
		inset 0 0 5px rgba(53,86,129, 0.5),
		inset -285px 0 35px white;
	border-radius: 10px 10px 10px 10px;
	background: #fff url(/images/bartoszkosowski.jpg) no-repeat center left;
}


#header {
    width: 100%;
    height: auto;
    
}

#container {
    width: 1000px;
    background-color: #ffcc33;
 	box-shadow: 
		inset 0 0 0 1px rgba(53,86,129, 0.4), 
		inset 0 0 5px rgba(53,86,129, 0.5),
		inset -285px 0 35px white;
	border-radius: 0 10px 0 10px;
    margin: auto;
}
#first {
    width: 600px;
    float: left;
    height: auto;
      
}
#second {
    width: 400px;
    float: left;
    height: auto;
    
}
#clear {
    clear: both;
}
</style>


<style type="text/css">


label {
  width: 500px;
  border-radius: 3px;
  border: 1px solid #D1D3D4;
  background-color: #355681;
  	
	box-shadow: 
		inset 0 0 0 1px rgba(53,86,129, 0.4), 
		inset 0 0 5px rgba(53,86,129, 0.5),
		inset -285px 0 35px white;
	border-radius: 10px 10px 10px 10px;
	background: #fff url(/images/bartoszkosowski.jpg) no-repeat center left;
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
	background-color: #4DCB6D;
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

<script type="text/javascript">

	
    jQuery(function ($) {
    	
        var timer = null,
            startTime = null,
            progress = $("#progress").shieldProgressBar({
                min: 0,
                max: 30,
                value: 30,
                layout: "circular",
                layoutOptions: {
                    circular: {
                        width: 40,
                        borderWidth: 0,
                        color: "#1E98E4"
                    }
                },
                text: {
                    enabled: true,
                    template: '<span style="font-size:20px;">{0:n1}</span> seconds'
                },
                reversed: true
            }).swidget();
        
        $("#start").shieldButton({
            events: {
                click: function () {
                    clearInterval(timer);
                    startTime = Date.now();
                    timer = setInterval(updateProgress, 100);
                }
            }
        });
        
        (function($) {
            $(document).ready(function() {
                clearInterval(timer);
                startTime = Date.now();
                timer = setInterval(updateProgress, 100);
            
            });
        })(jQuery);
        
        
        $("#stop").shieldButton({
            events: {
                click: function () {
                    clearInterval(timer);
                }
            }
        });
        function updateProgress() {
            var remaining = 30 - (Date.now() - startTime) / 1000;
            progress.value(remaining);
            if (remaining <= 0) {
                clearInterval(timer);
                form1.submit();
            }
        }
    });
</script>

<title>Games</title>

</head>
<body>
<div class="container">
			<!-- freshdesignweb top bar -->
            <div class="freshdesignweb-top">
                <a href="http://www.freshdesignweb.com" target="_blank">Home</a>
                <span class="right">
                    <a href="http://www.freshdesignweb.com/beautiful-registration-form-with-html5-and-css3.html">
                        <strong>Back to the freshdesignweb Article</strong>
                    </a>
                </span>
                <div class="clr"></div>
            </div><!--/ freshdesignweb top bar -->
			<header>
				<h1><span>FaceIt</span>Welcome to FaceIt...</h1>
            </header>       
            
            				
		<div id="header">
					<h1 class="main">${question}</h1>				
		</div>
<div id="container">
    <div id="first">
    
<form action="Teacher" method ="post" id="form1">
<div>

<input  style="position: absolute; left: -9999px; width: 1px; height: 1px;" type="radio" name="userAnswer" value="1" id="radio1" class="radio" onclick="this.form.submit()" />
<label for="radio1">${ans1}</label>
</div>

<div>
<input  style="position: absolute; left: -9999px; width: 1px; height: 1px;" type="radio" name="userAnswer" value="2" id="radio2" class="radio" onclick="this.form.submit()"/>
<label for="radio2">${ans2}</label>
</div>
<div>
<input  style="position: absolute; left: -9999px; width: 1px; height: 1px;" type="radio" name="userAnswer" value="3" id="radio3" class="radio" onclick="this.form.submit()"/>
<label for="radio3">${ans3}</label>
</div>

<div>
<input  style="position: absolute; left: -9999px; width: 1px; height: 1px;" type="radio" name="userAnswer" value="4" id="radio4" class="radio" onclick="this.form.submit()"/>
<label for="radio4">${ans4}</label>

</div>
<input type="hidden" name="correctAnswer" value="${CorrectAnswer}"/><br/>
</form>
</div>

	<div id="second">
    <div align="left">
    <div class="container">
        <div id="progress" style="width: 210px; height: 210px; margin-bottom: 10px; margin-top: 20px; background-color: #F5F5F5"></div>
        <!--  button id="start">Start Timer</button>
        <button id="stop">Stop Timer</button>-->
    </div>
    </div>
    <div id="clear"></div>
    
</div>
</div> 
		<div class="copyright">
  			Created by <a href="http://www.fwpolice.com">Group 11</a>   
		</div> 
</div>
				<%//String user = (String)session.getAttribute("userid"); %>
				<%//out.print(user); %>
   		 
</body>
</html>