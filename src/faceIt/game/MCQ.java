package faceIt.game;

import java.io.IOException;

import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.sql.*;
import java.util.*;
/**
 * Servlet implementation class MCG
 */
@WebServlet(name = "MCQ", description = "this provide mcq question form a catagary according to the wheel", urlPatterns = { "/MCQservlet" })
public class MCQ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MCQ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String catagaryNumber = request.getParameter("catagoryNumber");
		int catogaryNo = Integer.parseInt(catagaryNumber);
		
		//generate random number to randomly choose question
		//int randomNumber = (int) (Math.random()*10%5);
		int randomNumber = 1;
		String tableName = toCatagary(catogaryNo);
		out.println("print the tableName: "+tableName);
		
		//opening connection to the mySql database and get Questions
		try {
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/faceItFinal","root","00365673255");
			Statement stmt = con.createStatement();
			
			ResultSet rs = stmt.executeQuery("select *from "+tableName+" where questionID ='"+ randomNumber+"'");
			
			//gathring questions answers
			if(rs.next()){
				String ans1 = rs.getString(1);
				String ans2 = rs.getString(2);
				String ans3 = rs.getString(3);
				String ans4 = rs.getString(4);
				int questionID = rs.getInt(5);
				String question = rs.getString(6);
				int CorrectAnswer = rs.getInt(8);
				 
				request.setAttribute("ans1",ans1);
				request.setAttribute("ans2",ans2);
				request.setAttribute("ans3",ans3);
				request.setAttribute("ans4",ans4);
				request.setAttribute("qestionID",questionID);
				request.setAttribute("question", question);
				request.setAttribute("CorrectAnswer",CorrectAnswer);
				
				getServletContext().getRequestDispatcher("/game/game.jsp").forward(request, response);
			    con.close();
			}
				
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			out.print("class not Found");
			e.printStackTrace();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.print(e);
			e.printStackTrace();
		}
	}
	
	//to determind which subject to select
	public static String toCatagary(int number){
		switch(number){
		case 5: return "SCIENCE";
		case 4: return "MATHEMATICS";
		case 1: return "GENERALKNOWLEDGE";
		case 3: return "LANGUAGES";
		case 2: return "HISTORY";
		case 0: return "BUDDHISM";
		default: return "wrong INDEX";
		}
	}
}
