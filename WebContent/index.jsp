<%@ page language="java" contentType="text/html; charset=windows-1256" pageEncoding="windows-1256" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256"> 
<title>Welcome To CloudUI</title>
<style>
.formimage{
position:relative;
top:6px;}
.formad{
width:294px;
height:22px;}
.myform{
width:304px;
position:absolute;
bottom:10px;
right:79px;}
.image{
width:1198px;
height:482px;
border-bottom-style:solid;
border-width:2px;
background-image:url("nupur.png");
margin-top:-199px;
}
.left{
height:345px;
width:796px;
border-right-style:solid;
border-width:3px;
}
ul
{
list-style-type: none;
padding: 0px;
margin: 0px;
}
ul li
{
background-image: url(images.jpg);
background-repeat: no-repeat;
background-position: 0px 5px;
padding-left: 14px;
}
</style>
</head> 
<body> 
<div class="image">
</div>
<div class="left">
<h1 style="text-shadow:20px 11px 0 rgba(0,0,0,0.2);font-weight:bold;text-decoration:underline;font-style:italic;font-variant:small-caps;color:#000000;letter-spacing:1pt;word-spacing:2pt;font-size:48px;text-align:left;font-family:palatino linotype, palatino, serif;line-height:2;position: relative; left: 267px;">Cloud IDS</h1>
<ul>
<li><p  style="text-shadow:20px 11px 0 rgba(0,0,0,0);font-weight:normal;font-style:italic;font-variant:small-caps;color:#000000;letter-spacing:1pt;word-spacing:2pt;font-size:17px;text-align:left;font-family:palatino linotype, palatino, serif;line-height:2;position: relative; left: 40px;top:5px;">An Application Level IDS To Protect Against DDOS,XSS and SQL Injection Attacks</p></li>
<li><p  style="text-shadow:20px 11px 0 rgba(0,0,0,0);font-weight:normal;font-style:italic;font-variant:small-caps;color:#000000;letter-spacing:1pt;word-spacing:2pt;font-size:17px;text-align:left;font-family:palatino linotype, palatino, serif;line-height:2;position: relative; left: 40px;top:5px;">Also Provides Geo-location/graph based analysis along with Snap-Shots Of Attacker </p></li>
</ul>
</div>
<div class="myform">
<form action="LoginServlet" method="post">  
<label style="font-style:italic;font-weight:bold;font-variant:small-caps;color:#000000;letter-spacing:1pt;word-spacing:2pt;text-align:left;font-family:palatino linotype, palatino, serif;">UserName:<input type="text" name="un" class="formad"/></label> 
<label style="font-style:italic;font-weight:bold;font-variant:small-caps;color:#000000;letter-spacing:1pt;word-spacing:2pt;text-align:left;font-family:palatino linotype, palatino, serif;">Password:<input type="password" name="pw" class="formad"/></label>
<div class="formimage">
<img src="<c:url value="simpleCaptcha.png" />">
</div>
<br/>
<label style="font-style:italic;font-weight:bold;font-variant:small-caps;color:#000000;letter-spacing:1pt;word-spacing:2pt;text-align:left;font-family:palatino linotype, palatino, serif;">Answer:<input type="text" name="answer" class="formad" /> </label>
<input type="image" src="Untitled.png" alt="Submit" width="80" height="70" value="submit">
</form> 
<a style="font-style:italic;font-weight:bold;font-variant:small-caps;color:blue;word-spacing:2pt;text-align:left;font-family:palatino linotype, palatino, serif;" href="NewUser.jsp">New User Register</a>
&nbsp<a style="font-style:italic;font-weight:bold;font-variant:small-caps;color:blue;word-spacing:2pt;text-align:left;font-family:palatino linotype, palatino, serif;" href="ForgotPassword.jsp">Forgot Password</a>
</div>
</body> 
</html>