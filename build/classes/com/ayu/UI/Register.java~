package com.ayu.UI;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import nl.captcha.Captcha;

import java.sql.*;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Connection currentCon = null; 
	static int rs ;
	Statement stmt = null;
	String FirstName;
	String LastName;
	String Phone;
	String Email;
	String Password;
	String UserName;
	String RePass;
	String dob;
	String gender;
	String address;
	String state;
	String country;
	String pin;
	String insertQuery; 
	/**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FirstName = request.getParameter("first");
		LastName = request.getParameter("last");
		Phone = request.getParameter("phone");
		Email = request.getParameter("email");
		UserName = request.getParameter("user");
		Password = request.getParameter("pass");
		RePass = request.getParameter("cpass");
		dob = request.getParameter("bday");
		gender = request.getParameter("gen");
		address = request.getParameter("addr");
		state = request.getParameter("state");
		country = request.getParameter("coun");
		pin = request.getParameter("pin");
		insertQuery = "insert into users values('" + FirstName + "','" + LastName + "','" + UserName + "','" + Password + "','" + Phone + "','" + Email + "','" + dob + "','" + gender + "','" + address + "','" + state + "','" + country + "','" + pin + "')";
		
		try { //connect to DB 
			HttpSession session = request.getSession(true);
			Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
			request.setCharacterEncoding("UTF-8");
			String answer = request.getParameter("answer");
			if (captcha.isCorrect(answer)){
				if(Password.equals(RePass))
				{
					currentCon = ConnectionManager.getConnection(); 
					stmt=currentCon.createStatement();
					rs = stmt.executeUpdate(insertQuery);
					stmt.close();
					if (currentCon != null)
					{
						currentCon.close();
			
					}
					request.getSession().invalidate();
					response.sendRedirect("index.jsp");
				}
				else
				{
					request.getSession().invalidate();
					response.sendRedirect("NewUser.jsp");
				}
			}
			else
			{
				request.getSession().invalidate();
				response.sendRedirect("NewUser.jsp");
			}
			
		}catch(SQLException e){System.out.println(e);}
		
		
		
	}

}
