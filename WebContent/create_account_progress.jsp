<%@page import="com.database.DatabaseOperations"%>
<%@page import="com.onlineshop.AccountInfo"%>
<%@page import="com.database.JDBC_Connect"%>
<%@page import="java.sql.Connection,java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!
	AccountInfo ai = new AccountInfo();
	DatabaseOperations dbOperation = new DatabaseOperations();%>

	<!-- Inserting account info into Database -->
	<%
		ai = (AccountInfo) request.getAttribute("Account_details");
		dbOperation.insertAccountDetails(ai);
		
	%>
	<p> Account Has been Created </p>
	<% response.sendRedirect("index.jsp"); %>
</body>
</html>