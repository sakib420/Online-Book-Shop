<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Upload Information of Books</h2>
<form action="BookInfoOperation" method="post">  
<input type="text" name="bookname" value="Name..." onclick="this.value=''"/><br/>  
<input type="text" name="writername"  value="Writer..." onclick="this.value=''"/><br/>  
<input type="text" name="type"  value="Type..." onclick="this.value=''"/><br/>
<input type="text" name="price"  value="Price..." onclick="this.value=''"/><br/>   
<input type="submit" value="Submit"/>  
</form>
</body>
</html>