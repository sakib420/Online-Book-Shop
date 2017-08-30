<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.database.DatabaseOperations"%>
<%@page import="com.onlineshop.BookInfo"%>
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
AccountInfo ai=new AccountInfo();
%>

<%
  ai = (AccountInfo) session.getAttribute("userDetails");
  String  name=ai.getName();

%>
<%   if(name.equals("admin"))
{%>
<a href="admin.jsp">Home</a>
<%}
else
{
%>
<a  href="afterlogin.jsp">Home</a>      

<%} %>

<a  href="books.jsp" >Book</a>
<a  href="logout.jsp" >Log out</a>
<%!BookInfo bi;%>

<%
	//ai = (AccountInfo) session.getAttribute("userDetails");
	//String email = ai.getEmail();
	JDBC_Connect connect = new JDBC_Connect();
	Connection conn = connect.getConnection();
	DatabaseOperations operations = new DatabaseOperations();
	ArrayList<BookInfo> book = new ArrayList<BookInfo>();
	book=operations.getBookDetails(conn);
	
	//ai = //operations.getAccountDetails(conn, email);
%>
<%

Iterator <BookInfo> itr = book.iterator();
int i=1;
for(BookInfo bi:book){ 
	
    //System.out.println(b.id+" "+b.name+" "+b.author+" "+b.publisher+" "+b.quantity);
    
%>
          <h2> Book's Information</h2>
<p> Book Name: <B> <%=bi.getBookname() %> </B> Writer: <B><%=bi.getWritername() %></B></p>
<p> Type: <B> <%=bi.getType() %> </B> Price: <B><%=bi.getPrice() %></B></p>

 <!--  <form name="form1" action="UserBookOperation" method="post"> -->
 <!--   <input type="hidden" name="select" />  --> 
<!--<input type="submit" name="select" value="<% bi.getBookname(); %>" onClick="submit(this.value)"/>

</form>  -->
<!--  <form name="frm" method="post" action="UserBookOperation">
<input type="hidden" name="select" />
<input type="submit" name="bt" value="gi" onclick="{document.frm.select.value=this.value;document.frm.submit();}" />
</form>  -->

<% if(!(name.equals("admin"))) 
{
%>
<form method="post" action="UserBookOperation">
<input type="hidden" name="select" value="<%= bi.getBookname() %>" />
<input type="submit" value="Buy" onclick="submit()"/>
</form>

<p id="demo"></p>
<%} %>
<% 
i++;
}
%>
<script type="javascript">

function submit() {
  document.getElementById('demo').innerHTML = "The Book has been successfully added to user account"
}

</script>
</body>
</html>