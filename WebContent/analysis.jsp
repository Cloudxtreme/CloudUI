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
final DefaultPieDataset pieDataset = new DefaultPieDataset();
pieDataset.setValue("DDOS Attacks", new Integer(1));
pieDataset.setValue("SQL Injection Attacks", new Integer(1));
pieDataset.setValue("XSS Attacks", new Integer(1));
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