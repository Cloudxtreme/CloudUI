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
