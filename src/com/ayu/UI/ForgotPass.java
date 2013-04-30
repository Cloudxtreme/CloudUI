package com.ayu.UI;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import nl.captcha.Captcha;

/**
 * Servlet implementation class ForgotPass
 */
@WebServlet("/ForgotPass")
public class ForgotPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	static Connection currentCon = null; 
	static ResultSet rs = null; 
	Statement stmt = null;
	boolean more;
    public ForgotPass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String forgotQuery= "select password from users where email='" + email + "'";
		HttpSession session = request.getSession(true);
		Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
		request.setCharacterEncoding("UTF-8");
		String answer = request.getParameter("answer");
		if (captcha.isCorrect(answer)) {
		currentCon = ConnectionManager.getConnection(); 
		try {
			stmt=currentCon.createStatement();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			request.getSession().invalidate();
			e1.printStackTrace();
		}
		try {
			rs = stmt.executeQuery(forgotQuery);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			request.getSession().invalidate();
			e.printStackTrace();
		}
		try {
			 more = rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			request.getSession().invalidate();
			e.printStackTrace();
		}
		if(more)
		{
			String password = null;
			try {
				password = rs.getString("password");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				request.getSession().invalidate();
				e.printStackTrace();
			}
			String msg="Your Requested password is"+" "+password+" "+"\n\nPlease use our services again";
			Forgot fo = new Forgot();
			fo.sendSSLMail(msg,email);
			request.getSession().invalidate();
			response.sendRedirect("index.jsp");
		}
		else
		{	
			request.getSession().invalidate();
			response.sendRedirect("invalidLogin.jsp");
		}
		}
		else
		{
			 request.getSession().invalidate();
		     response.sendRedirect(request.getContextPath() + "/ForgotPassword.jsp");
		}
		}
}
		
	


