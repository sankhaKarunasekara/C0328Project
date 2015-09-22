<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
String opponentUserID = (String) session.getAttribute("opponentUserID");
%>
<%String o = opponentUserID; %>
<%String user = (String) session.getAttribute("userid"); %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7; IE=EmulateIE9">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" type="text/css" href="style.css" media="all" />
    <link rel="stylesheet" type="text/css" href="demo.css" media="all" />
    <title>Welcome to faceIt...</title>

<script type="text/javascript">
function sleep(milliseconds) {
	  var start = new Date().getTime();
	  for (var i = 0; i < 1e7; i++) {
	    if ((new Date().getTime() - start) > milliseconds){
	      break;
	    }
	  }
	}
</script>    
    
<script>
var colors = ["#3501CB","#F80120","#CC0071","#3AB745","#673A7E","#FEF200"];
var restaraunts = ["General Knowledge","Science","History", "Mathematics","Languages", "Buddhism"];
var startAngle = 0;
var arc = Math.PI / 3;
var spinTimeout = null;

var spinArcStart = 10;
var spinTime = 0;
var spinTimeTotal = 0;

var ctx;

function drawRouletteWheel() {
var canvas = document.getElementById("canvas");
if (canvas.getContext) {
    var outsideRadius = 200;
    var textRadius = 160;
    var insideRadius = 125;

    ctx = canvas.getContext("2d");
    ctx.clearRect(0,0,500,500);


    ctx.strokeStyle = "black";
    ctx.lineWidth = 2;

    ctx.font = 'bold 12px Helvetica, Arial';

    for(var i = 0; i < 6; i++) {
    var angle = startAngle + i * arc;
    ctx.fillStyle = colors[i];

    ctx.beginPath();
    ctx.arc(250, 250, outsideRadius, angle, angle + arc, false);
    ctx.arc(250, 250, insideRadius, angle + arc, angle, true);
    ctx.stroke();
    ctx.fill();

    ctx.save();
    ctx.shadowOffsetX = -1;
    ctx.shadowOffsetY = -1;
    ctx.shadowBlur    = 0;
    ctx.shadowColor   = "rgb(220,220,220)";
    ctx.fillStyle = "black";
    ctx.translate(250 + Math.cos(angle + arc / 2) * textRadius, 
                    250 + Math.sin(angle + arc / 2) * textRadius);
    ctx.rotate(angle + arc / 2 + Math.PI / 2);
    var text = restaraunts[i];
    ctx.fillText(text, -ctx.measureText(text).width / 2, 0);
    ctx.restore();
    } 

    //Arrow
    ctx.fillStyle = "black";
    ctx.beginPath();
    ctx.moveTo(250 - 4, 250 - (outsideRadius + 5));
    ctx.lineTo(250 + 4, 250 - (outsideRadius + 5));
    ctx.lineTo(250 + 4, 250 - (outsideRadius - 5));
    ctx.lineTo(250 + 9, 250 - (outsideRadius - 5));
    ctx.lineTo(250 + 0, 250 - (outsideRadius - 13));
    ctx.lineTo(250 - 9, 250 - (outsideRadius - 5));
    ctx.lineTo(250 - 4, 250 - (outsideRadius - 5));
    ctx.lineTo(250 - 4, 250 - (outsideRadius + 5));
    ctx.fill();
}
}

function spin() {
spinAngleStart = Math.random() * 10 + 10;
spinTime = 0;
spinTimeTotal = Math.random() * 3 + 4 * 1000;
rotateWheel();
}

function spin2() {
	spinAngleStart = Math.random() * 10 + 10;
	spinTime = 0;
	spinTimeTotal = Math.random() * 30000 + 4 * 1000;
	rotateWheel2();
}


function rotateWheel() {
spinTime += 30;
if(spinTime >= spinTimeTotal) {
    stopRotateWheel();
    return;
}

var spinAngle = spinAngleStart - easeOut(spinTime, 0, spinAngleStart, spinTimeTotal);
startAngle += (spinAngle * Math.PI / 180);
drawRouletteWheel();
spinTimeout = setTimeout('rotateWheel()', 30);
}

function rotateWheel2() {
	spinTime += 30;
	if(spinTime >= spinTimeTotal) {
//	    stopRotateWheel();
	    return;
	}

	var spinAngle = spinAngleStart - easeOut(spinTime, 0, spinAngleStart, spinTimeTotal);
	startAngle += (spinAngle * Math.PI / 180);
	drawRouletteWheel();
	spinTimeout = setTimeout('rotateWheel()', 30);
}


function stopRotateWheel() {
clearTimeout(spinTimeout);
var degrees = startAngle * 180 / Math.PI + 90;
var arcd = arc * 180 / Math.PI;
var index = Math.floor((360 - degrees % 360) / arcd);
ctx.save();
ctx.font = 'bold 30px Helvetica, Arial';
var text = restaraunts[index]

ctx.fillText(text, 250 - ctx.measureText(text).width / 2, 250 + 10);
ctx.restore();
	
	//to wait 2 seconds before go through to the fuctions
	setTimeout(function(){
        if(text=="History"){
            HistoryQ();
        }else if(text=="Languages"){
        	LanguagesQ();
        }else if(text=="Science"){
            ScienceQ();
        }else if(text=="Mathematics"){
        	MathsQ();
        }else if(text=="General Knowledge"){
        	GeneralQ();
        }else if(text=="Buddhism"){
        	BuddhismQ();     
        }else{}
	}, 2000);
}     
        

        function easeOut(t, b, c, d) {
        var ts = (t/=d)*t;
        var tc = ts*t;
        return b+c*(tc + -3*ts + 3*t);
        }

        function HistoryQ() {
           <%//request.setAttribute("catagory",1); %>
   			<%//request.getRequestDispatcher("/MCQservlet").forward(request, response);%>
   			document.location.href='game/subjects/history.jsp';
   			 
        }
        
        function ScienceQ() {
   			<%//request.setAttribute("catagory",0); %>
   			<%//request.getRequestDispatcher("/MCQservlet").forward(request, response);%>
   			document.location.href='game/subjects/science.jsp';
        }
        
        function LanguagesQ() {
   			<%//request.setAttribute("catagory",2); %>
   			<%//request.getRequestDispatcher("/MCQservlet").forward(request, response);%>
   			document.location.href='game/subjects/languages.jsp';   			
        }
        
        function MathsQ() {
   			<%//request.setAttribute("catagory",2); %>
   			<%//request.getRequestDispatcher("/MCQservlet").forward(request, response);%>
   		
   			document.location.href='game/subjects/mathematics.jsp';
        }
        
        function BuddhismQ() {
   			<%//request.setAttribute("catagory",2); %>
   			<%//request.getRequestDispatcher("/MCQservlet").forward(request, response);%>
   			
   			document.location.href='game/subjects/buddhism.jsp';
        }
        
        function GeneralQ() {
   			<%//request.setAttribute("catagory",2); %>
   			<%//request.getRequestDispatcher("/MCQservlet").forward(request, response);%>
   			document.location.href='game/subjects/generalKnowledge.jsp';
        }
        
        drawRouletteWheel();
</script>
    
    
    <style type="text/css">
    
    body { text-align: center; padding: 40px; background: #F5F5F5; }
.container { width: 500px; text-align: center; margin: auto;}
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
    
    
    
    
    </style>
</head>
<body onload="spin2()">

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
    			<h3><span>This is a game Between, <%out.print(user); %> and <%out.print(o); %>..</span></h3>
	
            </header>       
	<form> 
		<div align="center">
		<input type="button" onclick="spin()" id="spin-button"/>
			<label class="button purple" for="spin-button"><span>✓</span><strong>STOP SPINING</strong></label>
		</div>
		<canvas id="canvas" width="500" height="500" onload=""></canvas>
	</form>
	
	
	
<%@ page import ="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
//put variable to count correct Answers
/*
int numOfCorrectAnswer = Integer.parseInt(((String)session.getAttribute("numOfCorrectAnswer")))+1;
String numOfCorrectAnswers = numOfCorrectAnswer +"";
session.putValue("numOfCorrectAnswers", numOfCorrectAnswers);
*/
%>						
		<div class="copyright">
  	Created by <a href="http://www.fwpolice.com">Group 11</a>   
	</div>    		 
</div>      


</body>
</html>