<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
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

          <a href="afterlogin.jsp">Home</a>
          <a  href="books.jsp" >Book</a>
		  <a  href="logout.jsp" >Log out</a>
        
<%!

AccountInfo ai;
ArrayList<String> books = new ArrayList<String>();

%>

<%
	ai = (AccountInfo) session.getAttribute("userDetails");
	String email = ai.getName();
	JDBC_Connect connect = new JDBC_Connect();
	Connection conn = connect.getConnection();
	DatabaseOperations operations = new DatabaseOperations();
	//ai = //operations.getAccountDetails(conn, email);
	books = operations.getAccountDetails(conn, email);
%>
<h2>User Information</h2>
<p> Name: <B> <%= ai.getName() %> </B> Email: <B><%= ai.getEmail() %></B> Phone:<B><%=ai.getPhone()%></B></p>
<h2>Book's Information: These books has been purchased by this user:</h2>
<%
Iterator<String> it = books.iterator();
for(String s: books)
{ %>
	<p> Book Name: <%= s %></p>
	
<% }


%>
</body>
</html>