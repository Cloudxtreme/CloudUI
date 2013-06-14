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
public class UserDAO { 
	static Connection currentCon = null; 
	static ResultSet rs = null; 
	public static UserBean login(UserBean bean) 
	{ //preparing some objects for connection 
		PreparedStatement stmt = null; 
		String username = bean.getUsername(); 
		String password = bean.getPassword(); 
		// "System.out.println" prints in the console; Normally used to trace the process 
		//System.out.println("Your user name is " + username); 
		//System.out.println("Your password is " + password); 
		//System.out.println("Query: "+searchQuery); 
		try { //connect to DB 
			currentCon = ConnectionManager.getConnection(); 
			stmt = currentCon.prepareStatement("select * from users where username=? and password=?");
			stmt.setString(1, username);
			stmt.setString(2, password);
			rs = stmt.executeQuery();
			boolean more = rs.next(); // if user does not exist set the isValid variable to false
			if (!more)
			{ 
				//System.out.println("Sorry, you are not a registered user! Please sign up first"); 
				bean.setValid(false); 
			} //if user exists set the isValid variable to true else 
			if (more) 
			{ 
				String firstName = rs.getString("FirstName"); 
				String lastName = rs.getString("LastName");
				//System.out.println("Welcome " + firstName); 
				bean.setFirstName(firstName); 
				bean.setLastName(lastName); 
				bean.setValid(true); } 
			} catch 
			(Exception ex) 
			{ System.out.println("Log In failed: An Exception has occurred! " + ex);
			} //some exception handling finally
		{ 
			if (rs != null) 
		{
				try { 
					rs.close();
					}
				catch (Exception e) {}
		rs = null; } 
		if (stmt != null) 
		{
			try {
				stmt.close();
		
			} 
			catch (Exception e) {} 
		
			stmt = null; 
			} 
		if (currentCon != null)
		{ try 
		{ currentCon.close();
		} catch (Exception e) { } 
		currentCon = null; } } 
		return bean; } 
	}
	
