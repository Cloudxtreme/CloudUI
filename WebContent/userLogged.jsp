<%@ page language="java" 
contentType="text/html; 
charset=windows-1256"
 pageEncoding="windows-1256" 
 import="com.ayu.UI.UserBean"
 import="com.mongodb.BasicDBObject"
 import="com.mongodb.DB"
 import="com.mongodb.DBCollection"
 import="com.mongodb.DBCursor"
 import="com.mongodb.MongoClient"
 import="java.net.UnknownHostException"
  %> 
  <% UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
 if(currentUser==null){
	 
	 response.sendRedirect(request.getContextPath() + "/index.jsp");
	 
	 
 }
 else{%><%out.println("Welcome"+" " + currentUser.getFirstName() + " " + currentUser.getLastName());%>
 
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> <html> 
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=windows-1256"> 
 <title> Configuration Page </title>
 </head> <body> <center>
 <form action="${pageContext.request.contextPath}/Logout" method="post">
    <input type="submit" value="Logout" />
</form>

 
 <p>This is the Configuration Page For Your IDS</p>
 <form action="InputParam" method="post">
 Input Threshold Request Counts:<input type="text" name="count" placeholder="input integer like 1,2,3" /><br/><br/>
 Input Threshold Time:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="time" placeholder="Input Integer like 1,2,3"/><br/><br/>
 Range of IP address to block:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="range" placeholder="eg- input 192.168 for the whole range"/><br/><br/>
 <input type="submit" value="Assign Values"/>
 </form>
 <h2><b>Below Are The List Of Blocked Ip Addresses</b></h2>
 <center><b><a href="analysis.jsp">Analysis Charts Of Attack Patterns</a></b><br/><br/></center>
 <center><b><a href="geolocation.jsp">Geo-location Of Cities from where attacks Originated</a></b><br/><br/></center>
 <form action="RemoveParam" method="post">
 <%
 MongoClient mongoClient = null;
 try {
		mongoClient = new MongoClient();
	} catch (UnknownHostException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
 DB db = mongoClient.getDB( "test" );
 DBCollection coll;
 coll = db.getCollection("test");
 DBCursor cursor = coll.find();
 DBCursor cur = coll.find();
 DBCursor curs = coll.find();

 try {
	   while(cursor.hasNext() && cur.hasNext() && curs.hasNext()) {
	       String Ip=(String)cursor.next().get("Ip-Address");
	       String date =(String)cur.next().get("Date");
	       String type = (String) curs.next().get("Attack-Type");
	      %> <table border="">
	      		<tr><td><%out.println(Ip); %></td><td><%out.println(date); %></td><td><%out.println(type); %></td><td>Remove:<input type="checkbox" name="rem" value="<%=date%>"/></td></tr>
	      	</table>
	       
	   <%}
	   
	} finally {
	   //mongoClient.dropDatabase("test");
	   cursor.close();
	   cur.close();
	   curs.close();
	   mongoClient.close();
	}
 %>
 <br/><input type="submit" value="Remove"/>
 </form>
  <form action="RemoveParam1" method="post">
 <%
 MongoClient mongoClient1 = null;
 try {
		mongoClient1 = new MongoClient();
	} catch (UnknownHostException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
 DB db1 = mongoClient1.getDB( "test1" );
 DBCollection coll1;
 coll1 = db1.getCollection("test1");
 DBCursor cursor1 = coll1.find();
 DBCursor cur1 = coll1.find();
 DBCursor curs1 = coll1.find();

 try {
	   while(cursor1.hasNext() && cur1.hasNext() && curs1.hasNext()) {
	       String Ip1=(String)cursor1.next().get("Ip-Address");
	       String date1 =(String)cur1.next().get("Date");
	       String type1 = (String)curs1.next().get("Attack-Type");
	      %> <table border="">
	      		<tr><td><%out.println(Ip1); %></td><td><%out.println(date1); %></td><td><%out.println(type1); %></td><td>Remove:<input type="checkbox" name="rem" value="<%=date1%>"/></td></tr>
	      	</table>
	       
	   <%}
	   
	} finally {
	   //mongoClient.dropDatabase("test");
	   cursor1.close();
	   cur1.close();
	   curs1.close();
	   mongoClient1.close();
	}
 %>
 <br/><input type="submit" value="Remove"/>
 </form>
 </center> 
 </body>
 </html>
 <%} %>