package faceIt.game;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Teacher
 */
@WebServlet(description = "cheak the answer and give the results", urlPatterns = { "/Teacher" })
public class Teacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Teacher() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("what the hell");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String ans = request.getParameter("userAnswer");
		int userAnswer = Integer.parseInt(ans);
		
		String correctAns = request.getParameter("correctAnswer");
		int correctAnswer = Integer.parseInt(correctAns);
		//int correctAnswer = 4;
		
		
		if(AnswerCheaker(userAnswer, correctAnswer)){
			getServletContext().getRequestDispatcher("/game/correct.jsp").forward(request, response);
		}else{
			getServletContext().getRequestDispatcher("/game/wrong.jsp").forward(request, response);
		}
		/*
		//current time
		long timeNow = System.currentTimeMillis();
		
		//time after 3 seconds
		long timeNext = timeNow + (4009);
		while(1==1){
			long currentTime = System.currentTimeMillis();
			
			if(currentTime>timeNext){
				out.println("<h1>Anaswer is CORRECT</h1>");
				break;
			}
		}
		
		*/
		//getServletContext().getRequestDispatcher("/game/game.jsp").forward(request, response);
	}
	
	protected boolean AnswerCheaker(int givenAns, int correctAns){
		
		if (givenAns==correctAns){
			return true;
		}else{
			return false;
		}
	}	
}
