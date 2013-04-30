<%@ page language="java" contentType="text/html; charset=windows-1256" pageEncoding="windows-1256" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256"> 
<title>Welcome To CloudUI</title>
</head> 
<body> 
<form action="LoginServlet" method="post">  
UserName: <input type="text" name="un"/><br> 
Password:&nbsp&nbsp <input type="password" name="pw"/><br/>
<img src="<c:url value="simpleCaptcha.png" />"><br />
Answer:&nbsp&nbsp&nbsp&nbsp&nbsp <input type="text" name="answer" /> 
<input type="submit" value="submit"> <br/>
</form> 
<a href="NewUser.jsp">New User Register</a>&nbsp&nbsp&nbsp<a href="ForgotPassword.jsp">Forgot Password</a>
</body> 
</html>