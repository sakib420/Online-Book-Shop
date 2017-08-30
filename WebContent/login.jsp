<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
<h2>Log in</h2>
<form action="LoginOperation" method="post">  
<input type="text" name="name" value="UserName..." onclick="this.value=''"/><br/>  
  
<input type="password" name="password"  value="Password..." onclick="this.value=''"/><br/>
 
<input type="submit" value="Login"/>  
</form>
<% String isPassOK = (String) request.getAttribute("isPassOK");
   if (isPassOK!=null && isPassOK.equals("No")) {
%>
<p> Invalid UserName or Password </p>
<% } %>

	
</body>
</html>