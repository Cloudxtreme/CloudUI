package com.ayu.UI;

import javax.servlet.ServletException; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 
import javax.servlet.http.HttpSession; 
import nl.captcha.Captcha;
/** * Servlet implementation class LoginServlet */ 
public class LoginServlet extends HttpServlet 
{ /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

/*public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException 
{ 
	doPost(request,response);
}*/
public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException 
{ 

	try 
	{ 
		HttpSession session = request.getSession(true);
		Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
		request.setCharacterEncoding("UTF-8");
		String answer = request.getParameter("answer");
		if (captcha.isCorrect(answer)) { 
		UserBean user = new UserBean();
		user.setUserName(request.getParameter("un"));
		user.setPassword(request.getParameter("pw"));
		user = UserDAO.login(user); 
		if (user.isValid()) 
		{ 
			session.setAttribute("currentSessionUser",user); 
			response.sendRedirect("userLogged.jsp"); 
			
		} 
		else{
			 
			request.getSession().invalidate();
			response.sendRedirect("invalidLogin.jsp"); //error page
		}
		}
		else
		{
			 
				 request.getSession().invalidate();
			     response.sendRedirect(request.getContextPath() + "/index.jsp");
		}
	} catch (Throwable theException)
	{ 
		System.out.println(theException);
	} 
}
}