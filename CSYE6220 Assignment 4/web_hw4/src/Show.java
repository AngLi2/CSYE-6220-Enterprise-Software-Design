
import java.io.IOException;
import java.io.InputStream;
import java.io.Writer;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;


/**
 * Servlet implementation class Show
 */
@WebServlet("/Show")
public class Show extends HttpServlet {
	static int num;
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Show() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String q = request.getParameter("q");
		String fq = request.getParameter("fq");
		String begin_date = request.getParameter("begin_date");
		String end_date = request.getParameter("end_date");
//		String fl = request.getParameter("fl");
//		String hl = request.getParameter("hl");
//		String pages = request.getParameter("page");
//		String facet_field = request.getParameter("facet_field");
//		String facet_filter = request.getParameter("facet_filter");
		String url = "https://api.nytimes.com/svc/search/v2/articlesearch.json";
		String apikey = "b3fc608906b6430cb5173b6757e769f3";
		String keyword = "";
		if (null != q && q != "")
			keyword += "&q=" + q;
		if (null != fq && fq != "")
			keyword += "&fq=" + fq;
		if (null != begin_date && begin_date != "")
			keyword += "&begin_date=" + begin_date;
		if (null != end_date && end_date != "")
			keyword += "&end_date=" + end_date;
		url = url + "?" + "api-key=" + apikey +keyword;
//		if (null != fl && fl != "")
//			url += "&fl=" + fl;
//		if (null != hl && hl != "")
//			url += "&hl=" + hl;
//		if (null != pages && pages != "")
//			url += "&page=" + pages;
//		if (null != facet_field && facet_field != "")
//			url += "&facet_field=" + facet_field;
//		if (null != facet_filter && facet_filter != "")
//			url += "&facet_filter=" + facet_filter;
		CloseableHttpClient httpClient = HttpClientBuilder.create().build();
		HttpResponse httpresponse = httpClient.execute((HttpUriRequest) new HttpGet(url));
		InputStream content = httpresponse.getEntity().getContent();
		String json = IOUtils.toString(content, "UTF-8");
		Writer out = response.getWriter();
		JsonParser parser = new JsonParser();
		JsonObject obj = (JsonObject) parser.parse(json);
		String status = obj.get("status").toString();;
		if(status.equals("\"OK\"")) {
			JsonObject subresponse = obj.get("response").getAsJsonObject();
//			JsonObject submeta = subresponse.get("meta").getAsJsonObject();
			System.out.println(subresponse);
			JsonArray array = subresponse.get("docs").getAsJsonArray();
			if(array.size()>0) {
				String urls="";
				out.append("<h1>Results Are Shown As Following:<h1>");
				for (int i = 0; i < array.size(); i++) {
					JsonObject subObject = array.get(i).getAsJsonObject();
//					out.append("<h2>" + "web_url=" + subObject.get("web_url") + "</h2>");
					out.append("<h2><a href="+subObject.get("web_url")+">"+subObject.get("snippet")+"</a></h2>");
					urls+=(subObject.get("web_url")+" & ");
				}
				
				final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
				final String DB_URL = "jdbc:mysql://localhost:3306/nyt_searcher";
				final String USER = "root";
				final String PASS = "root";

				Connection conn = null;
				Statement stmt = null;
				try {
					//Register JDBC driver
					Class.forName(JDBC_DRIVER);

					//Open a connection
					System.out.println("Connecting to a selected database...");
					conn = DriverManager.getConnection(DB_URL, USER, PASS);
					System.out.println("Connected database successfully...");

					//Execute a query
					System.out.println("Inserting records into the table...");
					stmt = conn.createStatement();

					String sql = "INSERT INTO search_history VALUES ('"+(num++)+"','"+keyword+"', '"+urls+"')";
					stmt.executeUpdate(sql);
					System.out.println("Inserted records into the table...");
					out.append("<h1>Data has stored into database</h1>");
				} catch (SQLException se) {
					se.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					
					try {
						if (stmt != null)
							conn.close();
					} catch (SQLException se) {
					}
					try {
						if (conn != null)
							conn.close();
					} catch (SQLException se) {
						se.printStackTrace();
					} 
				} 
			}else {
				out.append("<h1>Sorry, we have not found any related data</h1>");
			}
		}else {
			out.append("<h1>Illegal Input Parameters</h1>");
		}
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
