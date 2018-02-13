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
	function addNewItem() {
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
		<h3>Add a new book</h3>
		<form id="AddInformation">
			<p>
				Book Name: <br> <input type="text" name="name" value="" />
			</p>
			<p>
				Author: <br> <input type="text" name="author" value="" />
			</p>
			<p>
				Price: <br> <input type="text" name="price" value="" />
			</p>
			<p>
				Number: <br> <input type="text" name="number" value="" />
			</p>
			<p>
				<input type="button" value="OK" name="OK" onclick='addNewItem()'>
				<input type="button" value="Cancel" name="Cancel">

				<%
					String name = request.getParameter("name");
					String author = request.getParameter("author");
					String price = request.getParameter("price");
					String number = request.getParameter("number");
					double price1 = 0;
					int number1 = 0;
					if (price != null)
						price1 = Double.parseDouble(request.getParameter("price"));
					if (number != null)
						number1 = Integer.parseInt(request.getParameter("number"));
					if (name != null && author != null && price != null && number != null) {
						DataBase db = new DataBase();
						db.addEntity(name, author, price1, number1);
					}
				%>
			</p>
		</form>
	</div>

</body>
</html>