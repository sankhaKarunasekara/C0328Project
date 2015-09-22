package faceIt.game;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Teacher
 */
@WebServlet(description = "cheak the answer and give the results", urlPatterns = { "/Teacher1" })
public class Teacher1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Teacher1() {
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
		
		//int correctAnswer = 4;
		
		try{
			String ans = request.getParameter("userAnswer");

			int userAnswer = Integer.parseInt(ans);
			String correctAns = request.getParameter("correctAnswer");
			int correctAnswer = Integer.parseInt(correctAns);
			
			try {
				String catagory = request.getParameter("catagory");
				String userID = request.getParameter("userID");
				int noQ=getStatus(userID, catagory)[0];
				int noQc=getStatus(userID, catagory)[1];
						
				if(AnswerCheaker(userAnswer, correctAnswer)){
					UpadateStatus(userID, catagory, noQ+1, noQc+1);
					getServletContext().getRequestDispatcher("/game/Examiner/correct.jsp").forward(request, response);
				}else{
					getServletContext().getRequestDispatcher("/game/Examiner/wrong.jsp").forward(request, response);
					UpadateStatus(userID, catagory, noQ+1, noQc);
				}
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		
		}catch (Exception e) {
			out.print(e);
			//getServletContext().getRequestDispatcher("/game/Examiner/wrong.jsp").forward(request, response);
		}
	}
	
	protected boolean AnswerCheaker(int givenAns, int correctAns){
		
		if (givenAns==correctAns){
			return true;
		}else{
			return false;
		}
	}	
	
}
