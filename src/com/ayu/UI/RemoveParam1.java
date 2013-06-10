package com.ayu.UI;

import java.io.IOException;
import java.net.UnknownHostException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;
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

/**
 * Servlet implementation class RemoveParam1
 */
@WebServlet("/RemoveParam1")
public class RemoveParam1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveParam1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("rem");
		if(id!=null){
		MongoClient mongoClient = null;
		 try {
				mongoClient = new MongoClient();
			} catch (UnknownHostException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		 DB db = mongoClient.getDB( "test1" );
		 DBCollection coll;
		 coll = db.getCollection("test1");
		 BasicDBObject document = new BasicDBObject();
		 document.put("Date", id);
		 coll.remove(document);
		 System.out.println("Removed");
		 mongoClient.close();
		 response.sendRedirect("userLogged.jsp");
		}
		else
		{
			response.sendRedirect("userLogged.jsp");
		}
		
	
	}

}
