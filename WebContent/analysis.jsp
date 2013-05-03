<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page
    import="java.awt.*" 
    import="com.ayu.UI.UserBean"
    import="java.awt.event.*" 
    import="javax.swing.*"
    import="org.jfree.chart.*"
    import="org.jfree.chart.plot.*"
	import="org.jfree.data.*"
	import="org.jfree.data.general.*"
	import="org.jfree.util.Rotation"
	import="org.jfree.ui.*"
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
 else{%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Analysis Page</title>
</head>
<body>
<%

MongoClient mongoClient = null;
try {
		mongoClient = new MongoClient();
	} catch (UnknownHostException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
MongoClient mongoClient1 = null;
try {
		mongoClient1 = new MongoClient();
	} catch (UnknownHostException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
DB db = mongoClient.getDB( "test" );
DBCollection coll;
coll = db.getCollection("test");
int ddos = coll.find().count();
DB db1 = mongoClient1.getDB( "test1" );
DBCollection coll1;
coll1 = db1.getCollection("test1");
float injection = coll1.find().count();
injection/=2;
final DefaultPieDataset pieDataset = new DefaultPieDataset();
pieDataset.setValue("DDOS Attacks", new Integer(ddos));
pieDataset.setValue("SQL Injection Attacks", new Float(injection));
pieDataset.setValue("XSS Attacks", new Float(injection));
final JFreeChart chart = ChartFactory.createPieChart3D(
        "Pie Chart 3D Analysis View",  // chart title
        pieDataset,                   // data
        true,                   // include legend
        true,
        false
    );
chart.setBackgroundPaint(Color.yellow);
final PiePlot3D plot = (PiePlot3D) chart.getPlot();
plot.setStartAngle(270);
plot.setDirection(Rotation.ANTICLOCKWISE);
plot.setForegroundAlpha(0.60f);
ChartFrame frame1=new ChartFrame("Attacks Analysis",chart);
frame1.setVisible(true);
frame1.setSize(300,300);
response.sendRedirect("userLogged.jsp");

%>

</body>
</html>
<% }%>