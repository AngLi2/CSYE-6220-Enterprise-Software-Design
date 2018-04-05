
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SecondPage
 */
@WebServlet("/SecondPage")
public class SecondPage extends HttpServlet {
	private static final String FIRSTPAGE = "/hw2_2/FirstPage.html";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SecondPage() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String directName = "" + request.getHeader("referer");
		if (directName.indexOf(FIRSTPAGE) != -1)
			response.getWriter().append("<h1>You have Entered the second page!</h1>");
		else
			response.sendRedirect(FIRSTPAGE);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}