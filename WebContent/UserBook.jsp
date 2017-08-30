<%@page import="com.onlineshop.AccountInfo"%>
<%@page import="com.database.JDBC_Connect"%>
<%@page import="java.sql.Connection,java.sql.PreparedStatement"%>
<%@page import="com.database.DatabaseOperations"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<p> Book has been updated </p>
<%! 
AccountInfo ai;
String book_name,user_name;
DatabaseOperations dbOperation = new DatabaseOperations();
%>
<%

book_name = (String) request.getAttribute("Book_name");
ai = (AccountInfo) session.getAttribute("userDetails");
user_name = ai.getName();
dbOperation.insertBookToUser(user_name,book_name);

%>
<p>Book:  <%= book_name %> has been added to the account; Account Name: <%= user_name %></p>
</body>
</html>