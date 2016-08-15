package vn.rta.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.rta.common.util.SimpleCrypto;

/**
 * Servlet implementation class Encrypt
 */
public class Encrypt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Encrypt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean uiMode = request.getParameter("ui")!=null && request.getParameter("ui").equals("1");
		String keyseed = request.getParameter("key");
		String text = request.getParameter("text");
		
		String res = "";
		if ((keyseed==null || keyseed.equals("")) && (text==null || text.equals(""))) {
			res = "EMPTY VALUES";
		} else {
			try {
				res = SimpleCrypto.encrypt(keyseed, text);
			} catch (Exception e) {
				res = "EXCEPTION DURING decrypt process";  
				e.printStackTrace();
			}
		}
		if (uiMode) {
			response.sendRedirect("index.jsp?encrResult="+res);
		} else {
			PrintWriter pw = response.getWriter();
			response.setContentType("text/html");
			pw.println("<html><body>");  
			pw.println(res);
			pw.println("</body></html>");  
			pw.close();
		}
	}

}
