package com.ayu.UI;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InputParam
 */
@WebServlet("/InputParam")
public class InputParam extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Connection currentCon = null; 
	static int rs ;
	Statement stmt = null;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InputParam() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String time = request.getParameter("time");
		String count= request.getParameter("count");
		String iprange = request.getParameter("range");
		int tim = Integer.parseInt(time);
		int coun = Integer.parseInt(count);
		String insertQuery = "update initials set time = '" + tim + "',count= '" + coun + "',iprange = '" + iprange + "' where id=1";
		currentCon = ConnectionManager.getConnection(); 
		try {
			stmt=currentCon.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			rs = stmt.executeUpdate(insertQuery);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (currentCon != null)
		{
			try {
				currentCon.close();
				response.sendRedirect("userLogged.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}
}
