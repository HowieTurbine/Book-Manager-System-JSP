<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,java.sql.*,SRC.DataBase,SRC.Entity"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
div {
	min-width: 200px;
	width: 100%;
	height: 200px;
}
</style>
<script>
	function Search() {
		var frm = document.getElementById("AddInformation");
		frm.submit(); //Submit the form
		confirm("Successfully Submit!");

	}
</script>
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8"); //So that the data from form would also be encoded
	%>
	<div align="center">
		<h3>Search Book By Author</h3>
		<form id="AddInformation">

			<p>
				Author: <br> <input type="text" name="author" value="" />
			</p>
		</form>

			<p>
				<input type="button" value="Search" name="Search" onclick='Search()'>
				<input type="button" value="Cancel" name="Cancel">
			</p>
			<table border="0">
				<tr style="background-color: #33FFCC">
					<td>Name</td>
					<td>Author</td>
					<td>Number</td>
					<td>Price</td>
				</tr>
				<%
					String author = request.getParameter("author");
					DataBase db = new DataBase();
					List<Entity> list=db.searchByAuthor(author);
					int odd = 0;
					for (Entity tl : list) {
						if (odd == 0) {
				%>
				<tr style="background-color: #339933">
					<td><%=tl.getName()%></td>
					<td><%=tl.getAuthor()%></td>
					<td><%=tl.getNumber()%></td>
					<td><%=tl.getPrice()%></td>
				</tr>
				<%
					odd = 1;
						} else if (odd == 1) {
				%>
				<tr style="background-color: #33FF33">
					<td><%=tl.getName()%></td>
					<td><%=tl.getAuthor()%></td>
					<td><%=tl.getNumber()%></td>
					<td><%=tl.getPrice()%></td>
				</tr>
				<%
					odd = 0;
						}
					}
				%>
			</table>
	</div>

</body>
</html>