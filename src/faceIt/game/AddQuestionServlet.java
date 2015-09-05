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
 * Servlet implementation class AddQuestionServlet
 */
@WebServlet(description = "this servlet is used to add quesiton to the databases", urlPatterns = { "/AddQuestionServlet" })
public class AddQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddQuestionServlet() {
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
		
		String catagary = request.getParameter("catagary");
		String question = request.getParameter("question");
		String ans1 = request.getParameter("ans1");
		String ans2 = request.getParameter("ans2");
		String ans3 = request.getParameter("ans3");
		String ans4 = request.getParameter("ans4");
		String CorrectAnswer = request.getParameter("CorrectAnswer");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/faceItFinal","root","00365673255");
			Statement stmt = con.createStatement();
			int Idont = stmt.executeUpdate("insert into "+catagary+" (ans1,ans2,ans3,ans4,question,CorrectAnswer) values('"+ans1+"','"+ans2+"','"+ans3+"','"+ans4+"','"+question+"','"+CorrectAnswer+"')");
			ResultSet rs = stmt.executeQuery("select *from "+catagary+""); 
			while(rs.next()){
				out.println(rs.getString(1)+" \n"+rs.getString(2) + " \n"+rs.getString(3)+ " \n"+rs.getString(4)+ " \n"+rs.getInt(5)+ " \n"+rs.getString(6)+ " \n"+rs.getInt(7));
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
	}
}