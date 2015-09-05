<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import= "java.util.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
        var colors = ["#3501CB","#F80120","#FEF200"];
        var restaraunts = ["Geography","Science","History"];

        //var colors = ["#B8D430", "#3AB745", "#029990", "#3501CB",
                 //"#2E2C75", "#673A7E", "#CC0071", "#F80120",
                 //"#F35B20", "#FB9A00", "#FFCC00", "#FEF200"];

        var startAngle = 0;
        var arc = 2*Math.PI / 3;
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

            for(var i = 0; i < 3; i++) {
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

        function stopRotateWheel() {
        clearTimeout(spinTimeout);
        var degrees = startAngle * 180 / Math.PI + 90;
        var arcd = arc * 180 / Math.PI;
        var index = Math.floor((360 - degrees % 360) / arcd);
        ctx.save();
        ctx.font = 'bold 30px Helvetica, Arial';
        var text = restaraunts[index]
        
        if(text=="History"){
            HistoryQ();
        }else if(text=="Geography"){
            GeographyQ();
        }else if(text=="Science"){
            ScienceQ();
        }else{}

        ctx.fillText(text, 250 - ctx.measureText(text).width / 2, 250 + 10);
        ctx.restore();
     
        }

        function easeOut(t, b, c, d) {
        var ts = (t/=d)*t;
        var tc = ts*t;
        return b+c*(tc + -3*ts + 3*t);
        }

        function HistoryQ() {
           <%//request.setAttribute("catagory",1); %>
   			<%//request.getRequestDispatcher("/MCQservlet").forward(request, response);%>
   		 document.location.href='history.jsp';
   			 
        }
        
        function ScienceQ() {
           
   			<%//request.setAttribute("catagory",0); %>
   			<%//request.getRequestDispatcher("/MCQservlet").forward(request, response);%>
   		 document.location.href='science.jsp';
 
        }
        function GeographyQ() {
   			<%//request.setAttribute("catagory",2); %>
   			<%//request.getRequestDispatcher("/MCQservlet").forward(request, response);%>
            document.location.href='mathematices.jsp';
   			
        }

        drawRouletteWheel();

</script>
</head>
<body>

<% String o = (String)session.getAttribute("opponentUserID");%>
<% String user = (String) session.getAttribute("userid");%>

<h2>This is a game Between, <%out.print(user); %> and <%out.print(o); %>..</h2>

<form> 
<input type="button" value="spin" onclick="spin();" style="float:left;" />
<canvas id="canvas" width="500" height="500"></canvas>
</form>

</body>

</html>