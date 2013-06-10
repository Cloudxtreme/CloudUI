package com.ayu.UI;

import java.sql.*;
/*
 * @Author
 * Ayushman Dutta
 * Email ayushman999@gmail.com
 * CopyRight Ayushman Dutta,2013
 *  This file is part of CloudUI.
    CloudUI is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    CloudUI is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with CloudUI.  If not, see <http://www.gnu.org/licenses/>.
 * 
 */
public class ConnectionManager
{ 
	static Connection con; 
	static String url; 
	public static Connection getConnection() 
	{ 
		try 
		{ 
			String username="root";
			String password="root";
			String url = "jdbc:mysql://localhost:3306/db"; // assuming "DataSource" is your DataSource name 
			Class.forName("com.mysql.jdbc.Driver"); 
			try { 
				con = DriverManager.getConnection(url,username,password); // assuming your SQL Server's username is "username" // and password is "password"
				} 
				catch (SQLException ex) { ex.printStackTrace(); } 
		} catch(ClassNotFoundException e){ System.out.println(e); }
		return con;
	}
}
			
