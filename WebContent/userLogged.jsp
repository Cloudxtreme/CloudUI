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
 import="java.io.IOException"
 import="java.io.InputStream"
 import="javazoom.jl.decoder.JavaLayerException"
 import="com.gtranslate.Audio"
 import="com.gtranslate.Language"
  %> 
  <% UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
 if(currentUser==null){
	 
	 response.sendRedirect(request.getContextPath() + "/index.jsp");
	 
	 
 }
 else{%><div style="background-color:black;height: 42px;
position: relative;
top: -16px;"><p  style="text-shadow:20px 11px 0 rgba(0,0,0,0);font-weight:normal;font-style:italic;font-variant:small-caps;color:white;letter-spacing:1pt;word-spacing:2pt;font-size:17px;text-align:left;font-family:palatino linotype, palatino, serif;line-height:2;position: relative;">
 <%
 out.println("Welcome"+" " + currentUser.getFirstName() + " " + currentUser.getLastName());
 /*Audio audio = Audio.getInstance();
	InputStream sound = null;
	try {
		sound = audio.getAudio("Hello"+currentUser.getFirstName()+currentUser.getLastName(), Language.ENGLISH);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	try {
		audio.play(sound);
	} catch (JavaLayerException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}*/
 %></p></div>
 
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> <html> 
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=windows-1256"> 
 <title> Configuration Page </title>
 </head> 
 <style>
 .container1{
 height:auto;
 width:auto;
 border-bottom-style:groove;
 position:relative;
 top:-109px;
 }
 .form1{
 width: 539px;
position: relative;
right: 298px;
top: 16px;
border-right-style:groove;
 }
 .move{height:auto;
 width:auto;
 position: relative;
 left: -537px;
 top: 19px;
}
.footer{
width:auto;
height:52px;
background-color:black;}
table, td, th
{
border:1px solid black;
}
th
{
background-color:black;
color:white;
}
 </style>
 <body style="overflow-x:hidden;"> 
 <center>
 <p  style="font-weight:bold;text-decoration:underline;font-style:italic;font-variant:small-caps;color:#000000;letter-spacing:1pt;word-spacing:2pt;font-size:28px;text-align:left;font-family:palatino linotype, palatino, serif;line-height:2;position: relative; left: -1px;top:-60px;">This is the Configuration Page For Your IDS</p>
 <div class="container1">
  <div class="form1">
 <form action="InputParam" method="post">
 <p  style="text-shadow:20px 11px 0 rgba(0,0,0,0);font-weight:normal;font-style:italic;font-variant:small-caps;color:#000000;letter-spacing:1pt;word-spacing:2pt;font-size:17px;text-align:left;font-family:palatino linotype, palatino, serif;line-height:2;position: relative; left: 40px;top:5px;">Input Threshold Request Counts*<input type="text" name="count" placeholder="input integer like 1,2,3" size="30" /></p>
 <p  style="text-shadow:20px 11px 0 rgba(0,0,0,0);font-weight:normal;font-style:italic;font-variant:small-caps;color:#000000;letter-spacing:1pt;word-spacing:2pt;font-size:17px;text-align:left;font-family:palatino linotype, palatino, serif;line-height:2;position: relative; left: 40px;top:5px;">Input Threshold Time*<input type="text" name="time" placeholder="Input Integer/time in ms" size="30"/></p>
 <p  style="text-shadow:20px 11px 0 rgba(0,0,0,0);font-weight:normal;font-style:italic;font-variant:small-caps;color:#000000;letter-spacing:1pt;word-spacing:2pt;font-size:17px;text-align:left;font-family:palatino linotype, palatino, serif;line-height:2;position: relative; left: 40px;top:5px;">Range of IP address to block*<input type="text" name="range" placeholder="eg- input 192.168 for the whole range" size="30"/></p>
 <input style="width:150px;text-shadow:20px 11px 0 rgba(0,0,0,0);font-weight:normal;font-style:italic;font-variant:small-caps;color:#000000;letter-spacing:1pt;word-spacing:2pt;font-size:17px;text-align:center;font-family:palatino linotype, palatino, serif;line-height:2;position: relative; left:21px;top:-5px;" type="submit" value="Assign Values"/>
 </form>
 </div>
 </div>

 <br/>
 <br/>
 <div style="position: relative; top: -364px; left: 279px;">
 <h2 style="font-weight:bold;text-decoration:underline;font-style:italic;font-variant:small-caps;color:#000000;letter-spacing:1pt;word-spacing:2pt;font-size:24px;text-align:left;font-family:palatino linotype, palatino, serif;line-height:2;position: relative; left: 338px;top:-51px;"><b>Analysis Reporting</b></h2>
 <center><b><p  style="text-shadow:20px 11px 0 rgba(0,0,0,0);font-weight:normal;font-style:italic;font-variant:small-caps;color:#000000;letter-spacing:1pt;word-spacing:2pt;font-size:17px;text-align:left;font-family:palatino linotype, palatino, serif;line-height:2;position: relative; left:334;top:-26px;"><a href="analysis.jsp">Analysis Charts Of Attack Patterns</a></p></b></center>
 <center><b><p  style="text-shadow:20px 11px 0 rgba(0,0,0,0);font-weight:normal;font-style:italic;font-variant:small-caps;color:#000000;letter-spacing:1pt;word-spacing:2pt;font-size:17px;text-align:left;font-family:palatino linotype, palatino, serif;line-height:2;position: relative; left: 328px;top:5px;"><a href="geolocation.jsp">Geo-location Of Cities from where attacks Originated</a></p></b></center>
 </div>
 <div style="position: relative;top: -300px;">
 <h2 style="font-weight:bold;text-decoration:underline;font-style:italic;font-variant:small-caps;color:#000000;letter-spacing:1pt;word-spacing:2pt;font-size:28px;text-align:left;font-family:palatino linotype, palatino, serif;line-height:2;position: relative; left: 11px;"><b>Below Are The List Of Blocked Ip Addresses</b></h2>
 
  <h2 style="font-weight:bold;text-decoration:underline;font-style:italic;font-variant:small-caps;color:#000000;letter-spacing:1pt;word-spacing:2pt;font-size:20px;text-align:left;font-family:palatino linotype, palatino, serif;line-height:2;position: relative; left: 9px;"><b>DDOS Attackers Blocked IP Addresses</b></h2>
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
	           <tr>
	            <th>IP address</th>
	            <th>Time of attack</th>
	            <th>Type of attack</th>
	            <th>Remove</th>
	            </tr>
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
 <br/><input style="width:150px;text-shadow:20px 11px 0 rgba(0,0,0,0);font-weight:normal;font-style:italic;font-variant:small-caps;color:#000000;letter-spacing:1pt;word-spacing:2pt;font-size:17px;text-align:center;font-family:palatino linotype, palatino, serif;line-height:2;position: relative; left:auto;top:auto;" type="submit" value="Remove"/>
 </form>
 <div style="border-top-style:groove;">
 <h2 style="font-weight:bold;text-decoration:underline;font-style:italic;font-variant:small-caps;color:#000000;letter-spacing:1pt;word-spacing:2pt;font-size:20px;text-align:left;font-family:palatino linotype, palatino, serif;line-height:2;position: relative; left: 9px;"><b>Injection Attackers Captured Ip Addresses</b></h2></div>
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
	      <tr>
	            <th>IP address</th>
	            <th>Time of attack</th>
	            <th>Type of attack</th>
	            <th>Remove</th>
	            </tr>
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
 <br/><input style="width:150px;text-shadow:20px 11px 0 rgba(0,0,0,0);font-weight:normal;font-style:italic;font-variant:small-caps;color:#000000;letter-spacing:1pt;word-spacing:2pt;font-size:17px;text-align:center;font-family:palatino linotype, palatino, serif;line-height:2;position: relative; left:auto;top:auto;" type="submit" value="Remove"/>
 </form>
 </div>
 <div class="move">
 <form action="${pageContext.request.contextPath}/Logout" method="post">
 <input style="width:150px;text-shadow:20px 11px 0 rgba(0,0,0,0);font-weight:normal;font-style:italic;font-variant:small-caps;color:#000000;letter-spacing:1pt;word-spacing:2pt;font-size:17px;text-align:center;font-family:palatino linotype, palatino, serif;line-height:2;position: relative; left:21px;top:-5px;" type="submit" value="Logout" name="log"/>
</form>
</div>
 </center> 
 <div class="footer">
 <p style="text-shadow:20px 11px 0 rgba(0,0,0,0);font-weight:normal;font-style:italic;font-variant:small-caps;color:white;letter-spacing:1pt;word-spacing:2pt;font-size:17px;text-align:left;font-family:palatino linotype, palatino, serif;line-height:2;position: absolute;right:15px;">Project by- Ayushman Dutta,Kumar Gaurav,Avinash R</p>
 </div>
 </body>
 </html>
 <%} %>